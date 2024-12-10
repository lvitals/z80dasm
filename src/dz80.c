/* 
dz80_2 is registered Copyright (C) 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2007 <Jan Panteltje>
email: panteltje@yahoo.com

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

/* Modified by Tomaz Solc <tomaz.solc@tablix.org>, June 2017 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

#include "dz80.h"
#include "blocks.h"
#include "config.h"
#include "utils.h"
#include "col.h"

#define T_SIZE	6

/* Might be self-modifying code. */
int f_smc = 0;

/* 8080 incompatible code */
int f_z80 = 0;

FILE *f1=NULL, *f2=NULL, *f3=NULL;

/* program counter */
unsigned int pc=0;
int pass=0;

/* buffer holding binary data from the file to be decoded */
int t[T_SIZE];

/* bytes remaining in the current block */
int shiftin_cnt;

/* current block */
struct block *shiftin_blk;

void shiftin()
{
	int n;

	for(n=0; n<(T_SIZE-1); n++) {
		t[n]=t[n+1];
	}

	if(shiftin_cnt>0) {
		t[T_SIZE-1]=getc(f1);
		if(t[T_SIZE-1]==EOF) {
			msg(0, "Error: Unexpected end of file. "
						"File changed while reading.");
			t[T_SIZE-1]=-1;
		}

		shiftin_cnt--;
	} else {	
		t[T_SIZE-1]=-1;
	}
}

/* Converts a 16-bit binary value into either a hex constant or a symbol name.
 * skip is the offset from t where the value is read. Resulting string is
 * stored in str.
 *
 * Returns:
 * 	-1	Not enough data available
 * 	0	Constant
 * 	1	Symbol 		*/
int ckrange(int skip, char *str) 
{
	int val, off;
	struct symbol *symb;

	if(t[skip+0]==-1 || t[skip+1]==-1) {
		/* not enough data in file */
		return -1;
	}
	val=t[skip+0]+256*t[skip+1];

	if(pass==1 || pass==2 || (!a_labels)) {
		/* on first two passes don't bother printing labels (or if
		 * labels are disabled) */
		sprintf(str,"0%04xh",val);
		return 0;
	}

	/* not in area covered by file being disassembled */

	/* NOTE: such symbols should already be 
	 * removed by symbol_remove_nonlabels() */
/*
	if((val<start) || (val>end)) {
		sprintf(str,"0%04xh",val);
		return 0;
	}
*/
	symb=symbol_find(val);
	if(symb!=NULL) {
		/* exact match */
		sprintf(str,"%s", symb->name);
		return 1;
	}

	symb=symbol_find_range(val);
	if(symb!=NULL) {
		f_smc=1;
		off=val-symb->val;
		sprintf(str,"%s+%d", symb->name, off);
		return 1;
	}

	/* no label found */
	sprintf(str, "0%04xh", val);

	return 0;
}

/* Returns:
 * 	-1	Not enough data available
 * 	0	Constant
 * 	1	Symbol 		*/
int ckrange_rel(int skip, int pc, char *str) 
{
	int val;
	struct symbol *symb=NULL;

	if(t[skip]==-1) return -1;

	if(a_labels) {
		if(t[skip]<128) {
			val=pc+2+t[skip];
		} else {
			val=pc+2+t[skip]-256;
		}

		symb=symbol_find(val & 0xffff);
	}

	if(a_labels && symb!=NULL) {
		/* print a label */
		sprintf(str, "%s", symb->name);
		return 1;
	} else {
		if(a_zilog) {
			/* old Zilog za.com */
			if(t[1]<128) {
				sprintf(str,"%d",t[1]+2);
			} else { 
				sprintf(str,"%d",t[1]+2-256);
			}
		} else {
			/* zasm by Günter Woigk and
			 * z80asm */
			if(t[1]<128) {
				sprintf(str,"$%+d",t[1]+2);
			} else {
				sprintf(str,"$%+d",t[1]+2-256);
			}
		}
		return 0;
	}
}

/* Outputs n bytes as a defb line. Used for invalid/unknown instructions, etc.
 * If n == -1, then outputs bytes until the end of block.
 *
 * Returns number of bytes used. */
int defb(int n)
{
	int i;
	FP("defb");
	for(i=0;t[i]!=-1&&(n==-1||i<n);i++) FP("%c0%02xh", i?',':' ', t[i]);
	return i;
}

void before_undoc(int n)
{
	if(!a_undoc) {
		defb(n);
		FP(" ;");
	}
}

/* Returns number of bytes used */
int diz80()
{
const char *stri;
char stro[80];
int a,r,i;
char bstr[MAX_LINE_LEN];
char rstr[MAX_LINE_LEN];
const char **ed40_x, **ed50_x, **ed60_x, **ed70_x;

/* indent all instructions*/
CS(1);

if(t[0] == 0xcb) {
	a=t[1];
	if(a==-1) {
		return defb(-1);
	}
	if(a < 8)				FP("rlc ");
	else if((a >= 0x08) && (a < 0x10))	FP("rrc ");
	else if((a >= 0x10) && (a < 0x18))	FP("rl ");
	else if((a >= 0x18) && (a < 0x20))	FP("rr ");
	else if((a >= 0x20) && (a < 0x28))	FP("sla ");
	else if((a >= 0x28) && (a < 0x30))	FP("sra ");
	/* undocumented instruction SLI (shift left with 1 insertion) */
	else if((a >= 0x30) && (a < 0x38)) {
		before_undoc(2);
		FP("sli ");
	}
	else if((a >= 0x38) && (a < 0x40))	FP("srl ");
	else if((a >= 0x40) && (a < 0x80))	FP("bit %d,",(a-0x40)/8);
	else if((a >= 0x80) && (a < 0xc0))	FP("res %d,",(a-0x80)/8);
	else if(a >= 0xc0)			FP("set %d,",(a-0xc0)/8);
	FP("%s",rarg[a%8]);
	f_z80=1;
	return(2);
} else if(t[0] == 0xed) {
	a=t[1];
	if(a==-1) {
		return defb(-1);
	}

	if(a_z180) {
		ed40_x = ed40_z180;
		ed50_x = ed50_z180;
		ed60_x = ed60_z180;
		ed70_x = ed70_z180;
	} else {
		ed40_x = ed40;
		ed50_x = ed50;
		ed60_x = ed60;
		ed70_x = ed70;
	}
/*
if((a>=0x40)&&(a<0x50)&&(ed40[a-0x40][0]!='0'))FP("%s",ed40[a-0x40]);
else if((a>=0x50)&&(a<0x60)&&(ed50[a-0x50][0]!='0'))FP("%s",ed50[a-0x50]);
else if((a>=0x60)&&(a<0x70)&&(ed60[a-0x60][0]!='0'))FP("%s",ed60[a-0x60]);
else if((a>=0x70)&&(a<0x80)&&(ed70[a-0x70][0]!='0'))FP("%s",ed70[a-0x70]);
else if((a>=0xa0)&&(a<0xb0)&&(eda0[a-0xa0][0]!='0'))FP("%s",eda0[a-0xa0]);
else if((a>=0xb0)&&(a<0xc0)&&(edb0[a-0xb0][0]!='0'))FP("%s",edb0[a-0xb0]);
*/
	if((a>=0x40)&&(a<0x50)&&(ed40_x[a-0x40][0]!='0')) i=0;
	else if((a>=0x50)&&(a<0x60)&&(ed50_x[a-0x50][0]!='0')) i=1;
	else if((a>=0x60)&&(a<0x70)&&(ed60_x[a-0x60][0]!='0')) i=2;
	else if((a>=0x70)&&(a<0x80)&&(ed70_x[a-0x70][0]!='0')) i=3;
	else if((a>=0xa0)&&(a<0xb0)&&(eda0[a-0xa0][0]!='0')) i=4;
	else if((a>=0xb0)&&(a<0xc0)&&(edb0[a-0xb0][0]!='0')) i=5;
	else if(a_z180&&(edio_z180[a&0x07][0]!='0')&&((a&0xc0)==0)) i=6;
	else if(a_z180&&(a>=0x80)&&(a<0x90)&&(ed80_z180[a-0x80][0]!='0')) i=7;
	else if(a_z180&&(a>=0x90)&&(a<0xa0)&&(ed90_z180[a-0x90][0]!='0')) i=8;
	else {
		defb(1);
		FP(" ;next byte illegal after ed");
		return(1);
	}
	f_z80=1;
	switch(i) {
		case 0:
			strcpy(rstr,ed40_x[a-0x40]);
			break;
		case 1:
			strcpy(rstr,ed50_x[a-0x50]);
			break;
		case 2:
			strcpy(rstr,ed60_x[a-0x60]);
			break;
		case 3: if(a < 0x72) {
				before_undoc(2);
			}
			strcpy(rstr,ed70_x[a-0x70]);
			break;
		case 4: strcpy(rstr,eda0[a-0xa0]);
			break;
		case 5: strcpy(rstr,edb0[a-0xb0]);
			break;
		case 6:
			strcpy(rstr,edio_z180[a&0x07]);
			break;
		case 7:
			strcpy(rstr,ed80_z180[a-0x80]);
			break;
		case 8:
			strcpy(rstr,ed90_z180[a-0x90]);
			break;
	}

/*if arg not in prog range it is a constant*/
	if(i==6) {
		r=(a & 0x38) >>3;
		strcpy(stro,rarg[r]);

		if((a&0x06) == 0) {
			/* in0 g, (m)
			 * out0 (m), g */

			if(r==6) {
				/* value for (hl) is invalid */
				defb(1);
				return 1;
			}

			r = t[2];
			if(r==-1) {
				return defb(-1);
			} else {
				if (a&1){
					FP(rstr,r,stro);
				}else{
					FP(rstr,stro,r);
				}
				return(3);
			}
		} else if((a&0x06) == 4) {
			/* tst g */
			FP(rstr,stro);
			return(2);
		} else {
			/* should never be reached */
			defb(1);
			return(1);
		}
	} else {
		switch(a) {
			case 0x43:
			case 0x4b:
			case 0x53:
			case 0x5b:
			case 0x73:
			case 0x7b:
				/* ld (mn),ww
				 * ld ww,(mn) */
				r=ckrange(2,bstr);
				if(r==-1) {
					return defb(-1);
				}

				FP(rstr,bstr);
				return(4);

			case 0x64:
			case 0x74:
				/* tst m
				 * tstio m */
				r = t[2];
				if(r==-1) {
					return defb(-1);
				}
				FP(rstr,r);
				return(3);

			default:
				FP("%s",rstr);
				return(2);
		}
	}
} else if((t[0] == 0xdd) || (t[0] == 0xfd)) {
	if(t[0]==0xfd) {
		stri = "iy";
	} else {
		stri = "ix";
	}
	if(t[1]==-1) {
		return defb(-1);
	}
	r=ckrange(2,bstr);
	f_z80=1;

	if(ddfd[t[1]][0]!='0') {
		before_undoc(2);
		FP(ddfd[t[1]],stri);
		return(2);
	}
	switch(t[1])
		{
		case 0x09:
			FP("add %s,bc",stri);
			return(2);
			break;
		case 0x19:
			FP("add %s,de",stri);
			return(2);
			break;
		case 0x21:
			if(r==-1) {
				return defb(-1);
			}
			FP("ld %s,%s",stri,bstr);
			return(4);
			break;
		case 0x22:
			if(r==-1) {
				return defb(-1);
			}
			FP("ld (%s),%s",bstr,stri);
			return(4);
			break;
		case 0x23:
			FP("inc %s",stri);
			return(2);
		case 0x26:
			if(t[2]==-1) {
				return defb(-1);
			}
			before_undoc(3);
			FP("ld %sh,0%02xh",stri,t[2]);
			return(3);
			break;
		case 0x29:
			FP("add %s,%s",stri,stri);
			return(2);
			break;
		case 0x2a:
			if(r==-1) {
				return defb(-1);
			}
			FP("ld %s,(%s)",stri,bstr);
			return(4);
			break;
		case 0x2b:
			FP("dec %s",stri);
			return(2);
			break;
		case 0x2e:
			if(t[2]==-1) {
				return defb(-1);
			}
			before_undoc(3);
			FP("ld %sl,0%02xh",stri,t[2]);
			return(3);
			break;
		case 0x39:
			FP("add %s,sp",stri);
			return(2);
			break;
		case 0x64:
			before_undoc(2);
			FP("ld %sh,%sh",stri,stri);
			return(2);
			break;
		case 0x65:
			before_undoc(2);
			FP("ld %sh,%sl",stri,stri);
			return(2);
			break;
		case 0x6c:
			before_undoc(2);
			FP("ld %sl,%sh",stri,stri);
			return(2);
			break;
		case 0x6d:
			before_undoc(2);
			FP("ld %sl,%sl",stri,stri);
			return(2);
			break;
		case 0xe1:
			FP("pop %s",stri);
			return(2);
			break;
		case 0xe3:
			FP("ex (sp),%s",stri);
			return(2);
			break;
		case 0xe5:
			FP("push %s",stri);
			return(2);
			break;
		case 0xe9:
			FP("jp (%s)",stri);
			return(2);
			break;
		case 0xf9:
			FP("ld sp,%s",stri);
			return(2);
			break;
		} /* end switch */
	/* now it must be an instruction of type (ix+dd) or (iy+dd) */

	if((t[2]==-1)||(t[3]==-1)) {
		return defb(-1);
	}

	if(t[2] < 128) {
		sprintf(stro,"(%s+0%02xh)",stri,t[2]);
		/* stro is: (ix+dd) or (iy+dd) */
	} else {
		sprintf(stro,"(%s-0%02xh)",stri,256 - t[2]); 
	}

	if(t[1]==0xcb)
		{
		a = t[3] & 0x07;
		if(a != 0x06) {
			before_undoc(4);
		}
		switch(t[3] & 0xf8)
			{
			case 0x00:
				FP("rlc ");
				break;
			case 0x08:
				FP("rrc ");
				break;
			case 0x10:
				FP("rl ");
				break;
			case 0x18:
				FP("rr ");
				break;
			case 0x20:
				FP("sla ");
				break;
			case 0x28:
				FP("sra ");
				break;
			case 0x30:
				FP("sli ");
				break;
			case 0x38:
				FP("srl ");
				break;
			case 0x40:
				FP("bit 0,");
				break;
			case 0x48:
				FP("bit 1,");
				break;
			case 0x50:
				FP("bit 2,");
				break;
			case 0x58:
				FP("bit 3,");
				break;
			case 0x60:
				FP("bit 4,");
				break;
			case 0x68:
				FP("bit 5,");
				break;
			case 0x70:
				FP("bit 6,");
				break;
			case 0x78:
				FP("bit 7,");
				break;
			case 0x80:
				FP("res 0,");
				break;
			case 0x88:
				FP("res 1,");
				break;
			case 0x90:
				FP("res 2,");
				break;
			case 0x98:
				FP("res 3,");
				break;
			case 0xa0:
				FP("res 4,");
				break;
			case 0xa8:
				FP("res 5,");
				break;
			case 0xb0:
				FP("res 6,");
				break;
			case 0xb8:
				FP("res 7,");
				break;
			case 0xc0:
				FP("set 0,");
				break;
			case 0xc8:
				FP("set 1,");
				break;
			case 0xd0:
				FP("set 2,");
				break;
			case 0xd8:
				FP("set 3,");
				break;
			case 0xe0:
				FP("set 4,");
				break;
			case 0xe8:
				FP("set 5,");
				break;
			case 0xf0:
				FP("set 6,");
				break;
			case 0xf8:
				FP("set 7,");
				break;
			}/*end switch t[3]*/
		FP("%s",stro);
		switch(a) {
			case 0x00:
				FP(" & ld b,%s",stro);
				break;
			case 0x01:
				FP(" & ld c,%s",stro);
				break;
			case 0x02:
				FP(" & ld d,%s",stro);
				break;
			case 0x03:
				FP(" & ld e,%s",stro);
				break;
			case 0x04:
				FP(" & ld h,%s",stro);
				break;
			case 0x05:
				FP(" & ld l,%s",stro);
				break;
			case 0x06:
				break;
			case 0x07:
				FP(" & ld a,%s",stro);
				break;
		}
		return(4);
		}/*end dd cb or fd cb*/
	else switch(t[1])
		{
		case 0x34:
			FP("inc %s",stro);
			break;
		case 0x35:
			FP("dec %s",stro);
			break;
		case 0x36:
			FP("ld %s,0%02xh",stro,t[3]);
			return(4);
			break;
		case 0x46:
			FP("ld b,%s",stro);
			break;
		case 0x4e:
			FP("ld c,%s",stro);
			break;
		case 0x56:
			FP("ld d,%s",stro);
			break;
		case 0x5e:
			FP("ld e,%s",stro);
			break;
		case 0x66:
			FP("ld h,%s",stro);
			break;
		case 0x6e:
			FP("ld l,%s",stro);
			break;
		case 0x70:
			FP("ld %s,b",stro);
			break;
		case 0x71:
			FP("ld %s,c",stro);
			break;
		case 0x72:
			FP("ld %s,d",stro);
			break;
		case 0x73:
			FP("ld %s,e",stro);
			break;
		case 0x74:
			FP("ld %s,h",stro);
			break;
		case 0x75:
			FP("ld %s,l",stro);
			break;
		case 0x77:
			FP("ld %s,a",stro);
			break;
		case 0x7e:
			FP("ld a,%s",stro);
			break;
		case 0x86:
			FP("add a,%s",stro);
			break;
		case 0x8e:
			FP("adc a,%s",stro);
			break;
		case 0x96:
			FP("sub %s",stro);
			break;
		case 0x9e:
			FP("sbc a,%s",stro);
			break;
		case 0xa6:
			FP("and %s",stro);
			break;
		case 0xae:
			FP("xor %s",stro);
			break;
		case 0xb6:
			FP("or %s",stro);
			break;
		case 0xbe:
			FP("cp %s",stro);
			break;
		default:
			defb(3);
			FP(" ;illegal sequence");
			return(3);
		}/*end switch t[1]*/
	return(3);
	}/*end 0xdd and 0xfd group*/
r=ckrange(1,bstr);
switch(comtab[t[0]].type)
	{
	case 0:
		FP("%s",comtab[t[0]].com1);
		break;
	case 1:
		if(t[1]==-1) {
			return defb(-1);
		}
		FP("%s",comtab[t[0]].com1);
		FP("0%02xh",t[1]);
		break;
	case 2:
		if(r==-1) {
			return defb(-1);
		}
		FP("%s",comtab[t[0]].com1);
		FP("%s",bstr);
		break;
	case 3:
		if(t[1]==-1) {
			return defb(-1);
		}
		FP("%s",comtab[t[0]].com1);
		if(comtab[t[0]].bytes == 2) {
			/*jr and djnz instr. are 2 bytes type 3*/

			/* don't need to check return value because we checked
			 * t[1] above */
			ckrange_rel(1,pc,rstr);
			FP("%s",rstr);
			
		} else {
			FP("0%02xh",t[1]);/*not jr*/
		}
		break;
	case 11:
		if(t[1]==-1) {
			return defb(-1);
		}
		FP("%s",comtab[t[0]].com1);
		FP("0%02xh%s",t[1],comtab[t[0]].com2);
		break;
	case 12:
		if(r==-1) {
			return defb(-1);
		}
		FP("%s",comtab[t[0]].com1);
		FP("%s%s",bstr,comtab[t[0]].com2);
		break;
	}
a=comtab[t[0]].bytes;
if(comtab[t[0]].proc==1) {
	f_z80=1;
}
return(a);
}

int diz80_bytedata()
{
	CS(1);
	FP("defb 0%02xh", t[0]);
	return 1;
}

int diz80_worddata()
{
	if(t[1]==-1) {
		return diz80_bytedata();
	}

	CS(1);
	FP("defw 0%04xh", t[0]+256*t[1]);
	return 2;
}

int diz80_pointers()
{
	char bstr[MAX_LINE_LEN];

	if(t[1]==-1) {
		return diz80_bytedata();
	}

	ckrange(0, bstr);
	CS(1);
	FP("defw %s", bstr);

	if(pass == 1 && a_labels) {
		symbol_newref(t[0]+256*t[1], pc, cstdfw);
	}

	return 2;
}

int diz80_code()
{
	int r;

	r=diz80();

	if(pass == 1 && a_labels && r>0) {
		tosymtab(t,pc);
	}

	return r;
}

int disassemble()
{
	if(t[0]==-1) {
		/*end of file*/
		return(0);
	}

	switch(shiftin_blk->type) {
		case code:	return diz80_code();
		case bytedata:	return diz80_bytedata();
		case worddata:	return diz80_worddata();
		case pointers:	return diz80_pointers();
	}

	/* should never be reached!
	 * (but for some reason gcc wants a return here) */

	return 0;
}

void blk_reset()
{
	shiftin_blk=blocks;
	shiftin_cnt=shiftin_blk->end - shiftin_blk->start;

	fseek(f1, 0, SEEK_SET);
}

int blk_iterate()
{
	msg(2, "Disassembled block %s (0x%04x - 0x%04x)\n", shiftin_blk->name,
				shiftin_blk->start, shiftin_blk->end);

	shiftin_blk=shiftin_blk->next;
	if(shiftin_blk==NULL) return 0;

	shiftin_cnt=shiftin_blk->end - shiftin_blk->start;

	if(shiftin_blk->start != pc) {
		msg(2, "Debug: shiftin_blk->start == 0x%04x\n", 
							shiftin_blk->start);
		msg(2, "Debug: pc                 == 0x%04x\n", pc);
	}

	return 1;
}

int main(int argc, char *argv[])
{
	FILE *pass1, *pass2;

	struct symbol *symb;
	int r,i,pci,sf;

	unsigned int start,end;

	cmdline(argc, argv);

	if(a_input) {
		f1=fopen(a_input, "rb");
		if(f1==NULL) {
			msg(0, "Error: Cannot open %s: %s\n", 
						a_input, strerror(errno));
			exit(1);
		}
	} else {
		msg(0, "Error: No input file specified\n");
		exit(1);
	}

	if(a_syminput) {
		r=symbol_load_file(a_syminput, 0);
		if(r) {
			exit(1);
		}
	}

	if(a_symoutput) {
		f2=fopen(a_symoutput, "w");
		if(f2==NULL) {
			msg(0, "Error: Cannot create %s: %s\n",
						a_symoutput, strerror(errno));
			exit(1);
		}
	}

	if(a_output==NULL) {
		f3=stdout;
	} else {
		f3=fopen(a_output, "w");
		if(f3==NULL) {
			msg(0, "Error: Cannot create %s: %s\n",
						a_output, strerror(errno));
			exit(1);
		}
	}

	start=a_org;

	end=a_org+file_len(a_input);

	if(end==start) {
		msg(0, "Error: Empty input file\n");
		exit(1);
	}

	if(end>0x10000) {
		msg(0, "Error: Binary data outside 16-bit address space\n");
		exit(1);
	}

	msg(1, "Disassembling binary data at 0x%04x - 0x%04x\n", start, end);

	block_init(start, end);

	if(a_blockfile) {
		r=block_load_file(a_blockfile);
		if(r) {
			exit(1);
		}
	}

	/* Temporary files to redirect pass1 and pass2 output.
	 *
	 * This is just a dirty hack to remove a lot of console output on
	 * first two passes by diz80() */
	pass1=tmpfile();
	if(pass1==NULL) {
		msg(0, "Error: Cannot create temporary file: %s\n",
						strerror(errno));
		exit(1);
	}
	pass2=tmpfile();
	if(pass2==NULL) {
		msg(0, "Error: Cannot create temporary file: %s\n",
						strerror(errno));
		exit(1);
	}

	/**************************pass 1*******************************/
	/*In pass 1 addresses are calculated, arguments are stored in table*/
	msg(1, "Starting pass 1\n");

	pass=1;
	col_init(pass1);

	pc=start;
	blk_reset();
	do {
		for(i=0;i<T_SIZE;i++) shiftin();

		while(1) {
			pci=disassemble();
			if(pci==0) break;

			CS(2);
			FP(";%04x",pc);
			NL();

			for(i=0;i<pci;i++) shiftin();
			pc+=pci;
		}
	} while(blk_iterate());

	/******************************pass 2******************************/
	/*
	In pass 2 a check is made if all arguments stored in the table 
	that are within code area range correspond to instruction addresses.
	If they do not correspond, they must be changed to the instruction 
	address

	just before that + offset (could be self modifiing code)
	*/
	msg(1, "Starting pass 2\n");

	pass=2;
	col_init(pass2);

	pc=start;
	blk_reset();
	do {
		for(i=0;i<T_SIZE;i++) shiftin();

		while(1) {
			pci=disassemble();
			if(pci==0) break;

			if(a_labels) {
				symbol_setlabel(pc,pci);
			}
			NL();

			for(i=0;i<pci;i++) shiftin();
			pc+=pci;
		}
	} while(blk_iterate());

	/* remove symbols from the symbol table that: 
	 * 	1) were added automatically
	 * 	2) are not labels */
	if(a_labels) {
		symbol_remove_nonlabels();
	}

	if(f2) {
		col_init(f2);
		msg(2, "Writing symbol file\n");
		symbol_export(a_symbol_order);
		fclose(f2);
	}
	/***************************pass 3*********************************/
	/*
	In pass 3 the instruction length is again calculated, the instruction
	start addresses are calculated, these are looked up in the table to see if
	they correspond to any argument, if they correspond a label is printed
	before the instruction, made of lxxx where xxx is the hex address of the
	instruction.
	*/
	msg(1, "Starting pass 3\n");
	msg(2, "Writing assembly file\n");

	pass=3;
	col_init(f3);

	pc=start;
	blk_reset();

	FP("; %s", PACKAGE_STRING);
	NL();
	FP("; command line:");
	for(i=0;i<argc;i++) FP(" %s", argv[i]);
	NL();
	NL();
	CS(1);
	FP("org 0%04xh",pc);
	NL();

	/* Print required definitions for symbols that are not labels into the 
	 * assembly file so that it assembles even when symbol file is not
	 * included */
	symbol_export_nonlabels();

	NL();

	/* Ugly but simplest way do get rid of double label prints at
	 * block boundaries */
	sf=1;

	do {
		for(i=0;i<T_SIZE;i++) shiftin();

		while(1) {
			/* print a label, if one exists at this address */
			if(a_labels && sf) {
				symb=NULL;
				while(1) {
					symb=symbol_find_next(pc, symb);
					if(symb==NULL) break;

					if(symb->comment!=NULL) {
						FP("%s", symb->comment);
					}
					FP("%s:",symb->name);
					NL();
				}
			}
			sf=1;
	
			/* print assembly instruction */
			pci=disassemble();
			if(pci==0) break;
	
			/* current address */
			if(a_address||a_source) {
				CS(2);
				FP(";%04x",pc);
			}

			if(a_source) {
				/* binary in hex... */
				CS(3);
				for(i=0;i<pci;i++) {
					if(i) {
						FP(" ");
					}
					FP("%02x",t[i]);
				}
				/* ...and ASCII */
				CS(4);
				for(i=0;i<pci;i++) {
					if(i) {
						FP(" ");
					}
					if((t[i] >= 32) && (t[i] < 127)) {
						FP("%c",t[i]);
					} else {
						FP(".");
					}
				}
			}/*end if a_source*/
			NL();

			for(i=0;i<pci;i++) shiftin();
			pc+=pci;
		}
		sf=0;
	} while(blk_iterate());

	fclose(f1);

	if(a_zilog) {
		NL();
		CS(1);
		FP("end");
		NL();
	}

	if(f_z80) {
		msg(0, "Warning: Code might not be 8080 compatible!\n");
	}
	if(f_smc) {
		msg(0, "Warning: Self modifying code detected!\n");
	}
	if(a_output) {
		fclose(f3);
	}
	exit(0);
}/*end main*/
