/* Modified by Tomaz Solc <tomaz.solc@tablix.org>, June 2017 */

#include "dz80.h"

const char *rarg[]={"b","c","d","e","h","l","(hl)","a"};

/********opcodes for z80 **********/
const struct comm comtab[]={
/*00*/{"nop","vv",1,0,0},
/*01*/{"ld bc,","vv",3,2,0},
/*02*/{"ld (bc),a","vv",1,0,0},
/*03*/{"inc bc","vv",1,0,0},
/*04*/{"inc b","vv",1,0,0},
/*05*/{"dec b","vv",1,0,0},
/*06*/{"ld b,","vv",2,1,0},
/*07*/{"rlca","vv",1,0,0},
/*08*/{"ex af,af'","vv",1,0,1},
/*09*/{"add hl,bc","vv",1,0,0},
/*0a*/{"ld a,(bc)","vv",1,0,0},
/*0b*/{"dec bc","vv",1,0,0},
/*0c*/{"inc c","vv",1,0,0},
/*0d*/{"dec c","vv",1,0,0},
/*0e*/{"ld c,","vv",2,1,0},
/*0f*/{"rrca","vv",1,0,0},
/*10*/{"djnz ","vv",2,3,1},
/*11*/{"ld de,","vv",3,2,0},
/*12*/{"ld (de),a","vv",1,0,0},
/*13*/{"inc de","vv",1,0,0},
/*14*/{"inc d","vv",1,0,0},
/*15*/{"dec d","vv",1,0,0},
/*16*/{"ld d,","vv",2,1,0},
/*17*/{"rla","vv",1,0,0},
/*18*/{"jr ","vv",2,3,1},
/*19*/{"add hl,de","vv",1,0,0},
/*1a*/{"ld a,(de)","vv",1,0,0},
/*1b*/{"dec de","vv",1,0,0},
/*1c*/{"inc e","vv",1,0,0},
/*1d*/{"dec e","vv",1,0,0},
/*1e*/{"ld e,","vv",2,1,0},
/*1f*/{"rra","vv",1,0,0},
/*20*/{"jr nz,","vv",2,3,1},
/*21*/{"ld hl,","vv",3,2,0},
/*22*/{"ld (","),hl",3,12,0},
/*23*/{"inc hl","vv",1,0,0},
/*24*/{"inc h","vv",1,0,0},
/*25*/{"dec h","vv",1,0,0},
/*26*/{"ld h,","vv",2,1,0},
/*27*/{"daa","vv",1,0,0},
/*28*/{"jr z,","vv",2,3,1},
/*29*/{"add hl,hl","vv",1,0,0},
/*2a*/{"ld hl,(",")",3,12,0},
/*2b*/{"dec hl","vv",1,0,0},
/*2c*/{"inc l","vv",1,0,0},
/*2d*/{"dec l","vv",1,0,0},
/*2e*/{"ld l,","vv",2,1,0},
/*2f*/{"cpl","vv",1,0,0},
/*30*/{"jr nc,","vv",2,3,1},
/*31*/{"ld sp,","vv",3,2,0},
/*32*/{"ld (","),a",3,12,0},
/*33*/{"inc sp","vv",1,0,0},
/*34*/{"inc (hl)","vv",1,0,0},
/*35*/{"dec (hl)","vv",1,0,0},
/*36*/{"ld (hl),","vv",2,1,0},
/*37*/{"scf","vv",1,0,0},
/*38*/{"jr c,","vv",2,3,1},
/*39*/{"add hl,sp","vv",1,0,0},
/*3a*/{"ld a,(",")",3,12,0},
/*3b*/{"dec sp","vv",1,0,0},
/*3c*/{"inc a","vv",1,0,0},
/*3d*/{"dec a","vv",1,0,0},
/*3e*/{"ld a,","vv",2,1,0},
/*3f*/{"ccf","vv",1,0,0},
/*40*/{"ld b,b","vv",1,0,0},
/*41*/{"ld b,c","vv",1,0,0},
/*42*/{"ld b,d","vv",1,0,0},
/*43*/{"ld b,e","vv",1,0,0},
/*44*/{"ld b,h","vv",1,0,0},
/*45*/{"ld b,l","vv",1,0,0},
/*46*/{"ld b,(hl)","vv",1,0,0},
/*47*/{"ld b,a","vv",1,0,0},
/*48*/{"ld c,b","vv",1,0,0},
/*49*/{"ld c,c","vv",1,0,0},
/*4a*/{"ld c,d","vv",1,0,0},
/*4b*/{"ld c,e","vv",1,0,0},
/*4c*/{"ld c,h","vv",1,0,0},
/*4d*/{"ld c,l","vv",1,0,0},
/*4e*/{"ld c,(hl)","vv",1,0,0},
/*4f*/{"ld c,a","vv",1,0,0},
/*50*/{"ld d,b","vv",1,0,0},
/*51*/{"ld d,c","vv",1,0,0},
/*52*/{"ld d,d","vv",1,0,0},
/*53*/{"ld d,e","vv",1,0,0},
/*54*/{"ld d,h","vv",1,0,0},
/*55*/{"ld d,l","vv",1,0,0},
/*56*/{"ld d,(hl)","vv",1,0,0},
/*57*/{"ld d,a","vv",1,0,0},
/*58*/{"ld e,b","vv",1,0,0},
/*59*/{"ld e,c","vv",1,0,0},
/*5a*/{"ld e,d","vv",1,0,0},
/*5b*/{"ld e,e","vv",1,0,0},
/*5c*/{"ld e,h","vv",1,0,0},
/*5d*/{"ld e,l","vv",1,0,0},
/*5e*/{"ld e,(hl)","vv",1,0,0},
/*5f*/{"ld e,a","vv",1,0,0},
/*60*/{"ld h,b","vv",1,0,0},
/*61*/{"ld h,c","vv",1,0,0},
/*62*/{"ld h,d","vv",1,0,0},
/*63*/{"ld h,e","vv",1,0,0},
/*64*/{"ld h,h","vv",1,0,0},
/*65*/{"ld h,l","vv",1,0,0},
/*66*/{"ld h,(hl)","vv",1,0,0},
/*67*/{"ld h,a","vv",1,0,0},
/*68*/{"ld l,b","vv",1,0,0},
/*69*/{"ld l,c","vv",1,0,0},
/*6a*/{"ld l,d","vv",1,0,0},
/*6b*/{"ld l,e","vv",1,0,0},
/*6c*/{"ld l,h","vv",1,0,0},
/*6d*/{"ld l,l","vv",1,0,0},
/*6e*/{"ld l,(hl)","vv",1,0,0},
/*6f*/{"ld l,a","vv",1,0,0},
/*70*/{"ld (hl),b","vv",1,0,0},
/*71*/{"ld (hl),c","vv",1,0,0},
/*72*/{"ld (hl),d","vv",1,0,0},
/*73*/{"ld (hl),e","vv",1,0,0},
/*74*/{"ld (hl),h","vv",1,0,0},
/*75*/{"ld (hl),l","vv",1,0,0},
/*76*/{"halt","vv",1,0,0},
/*77*/{"ld (hl),a","vv",1,0,0},
/*78*/{"ld a,b","vv",1,0,0},
/*79*/{"ld a,c","vv",1,0,0},
/*7a*/{"ld a,d","vv",1,0,0},
/*7b*/{"ld a,e","vv",1,0,0},
/*7c*/{"ld a,h","vv",1,0,0},
/*7d*/{"ld a,l","vv",1,0,0},
/*7e*/{"ld a,(hl)","vv",1,0,0},
/*7f*/{"ld a,a","vv",1,0,0},
/*80*/{"add a,b","vv",1,0,0},
/*81*/{"add a,c","vv",1,0,0},
/*82*/{"add a,d","vv",1,0,0},
/*83*/{"add a,e","vv",1,0,0},
/*84*/{"add a,h","vv",1,0,0},
/*85*/{"add a,l","vv",1,0,0},
/*86*/{"add a,(hl)","vv",1,0,0},
/*87*/{"add a,a","vv",1,0,0},
/*88*/{"adc a,b","vv",1,0,0},
/*89*/{"adc a,c","vv",1,0,0},
/*8a*/{"adc a,d","vv",1,0,0},
/*8b*/{"adc a,e","vv",1,0,0},
/*8c*/{"adc a,h","vv",1,0,0},
/*8d*/{"adc a,l","vv",1,0,0},
/*8e*/{"adc a,(hl)","vv",1,0,0},
/*8f*/{"adc a,a","vv",1,0,0},
/*90*/{"sub b","vv",1,0,0},
/*91*/{"sub c","vv",1,0,0},
/*92*/{"sub d","vv",1,0,0},
/*93*/{"sub e","vv",1,0,0},
/*94*/{"sub h","vv",1,0,0},
/*95*/{"sub l","vv",1,0,0},
/*96*/{"sub (hl)","vv",1,0,0},
/*97*/{"sub a","vv",1,0,0},
/*98*/{"sbc a,b","vv",1,0,0},
/*99*/{"sbc a,c","vv",1,0,0},
/*9a*/{"sbc a,d","vv",1,0,0},
/*9b*/{"sbc a,e","vv",1,0,0},
/*9c*/{"sbc a,h","vv",1,0,0},
/*9d*/{"sbc a,l","vv",1,0,0},
/*9e*/{"sbc a,(hl)","vv",1,0,0},
/*9f*/{"sbc a,a","vv",1,0,0},
/*a0*/{"and b","vv",1,0,0},
/*a1*/{"and c","vv",1,0,0},
/*a2*/{"and d","vv",1,0,0},
/*a3*/{"and e","vv",1,0,0},
/*a4*/{"and h","vv",1,0,0},
/*a5*/{"and l","vv",1,0,0},
/*a6*/{"and (hl)","vv",1,0,0},
/*a7*/{"and a","vv",1,0,0},
/*a8*/{"xor b","vv",1,0,0},
/*a9*/{"xor c","vv",1,0,0},
/*aa*/{"xor d","vv",1,0,0},
/*ab*/{"xor e","vv",1,0,0},
/*ac*/{"xor h","vv",1,0,0},
/*ad*/{"xor l","vv",1,0,0},
/*ae*/{"xor (hl)","vv",1,0,0},
/*af*/{"xor a","vv",1,0,0},
/*b0*/{"or b","vv",1,0,0},
/*b1*/{"or c","vv",1,0,0},
/*b2*/{"or d","vv",1,0,0},
/*b3*/{"or e","vv",1,0,0},
/*b4*/{"or h","vv",1,0,0},
/*b5*/{"or l","vv",1,0,0},
/*b6*/{"or (hl)","vv",1,0,0},
/*b7*/{"or a","vv",1,0,0},
/*b8*/{"cp b","vv",1,0,0},
/*b9*/{"cp c","vv",1,0,0},
/*ba*/{"cp d","vv",1,0,0},
/*bb*/{"cp e","vv",1,0,0},
/*bc*/{"cp h","vv",1,0,0},
/*bd*/{"cp l","vv",1,0,0},
/*be*/{"cp (hl)","vv",1,0,0},
/*bf*/{"cp a","vv",1,0,0},
/*c0*/{"ret nz","vv",1,0,0},
/*c1*/{"pop bc","vv",1,0,0},
/*c2*/{"jp nz,","vv",3,2,0},
/*c3*/{"jp ","vv",3,2,0},
/*c4*/{"call nz,","vv",3,2,0},
/*c5*/{"push bc","vv",1,0,0},
/*c6*/{"add a,","vv",2,1,0},
/*c7*/{"rst 0","vv",1,0,0},
/*c8*/{"ret z","vv",1,0,0},
/*c9*/{"ret","vv",1,0,0},
/*ca*/{"jp z,","vv",3,2,0},
/*cb*/{"qs","vv",99,88,77},
/*cc*/{"call z,","vv",3,2,0},
/*cd*/{"call ","vv",3,2,0},
/*ce*/{"adc a,","vv",2,1,0},
/*cf*/{"rst 8","vv",1,0,0},
/*d0*/{"ret nc","vv",1,0,0},
/*d1*/{"pop de","vv",1,0,0},
/*d2*/{"jp nc,","vv",3,2,0},
/*d3*/{"out (","),a",2,11,0},
/*d4*/{"call nc,","vv",3,2,0},
/*d5*/{"push de","vv",1,0,0},
/*d6*/{"sub ","vv",2,1,0},
/*d7*/{"rst 10h","vv",1,0,0},
/*d8*/{"ret c","vv",1,0,0},
/*d9*/{"exx","vv",1,0,0},
/*da*/{"jp c,","vv",3,2,0},
/*db*/{"in a,(",")",2,11,0},
/*dc*/{"call c,","vv",3,2,0},
/*dd*/{"qs","vv",99,88,77},
/*de*/{"sbc a,","vv",2,1,0},
/*df*/{"rst 18h","vv",1,0,0},
/*e0*/{"ret po","vv",1,0,0},
/*e1*/{"pop hl","vv",1,0,0},
/*e2*/{"jp po,","vv",3,2,0},
/*e3*/{"ex (sp),hl","vv",1,0,0},
/*e4*/{"call po,","vv",3,2,0},
/*e5*/{"push hl","vv",1,0,0},
/*e6*/{"and ","vv",2,1,0},
/*e7*/{"rst 20h","vv",1,0,0},
/*e8*/{"ret pe","vv",1,0,0},
/*e9*/{"jp (hl)","vv",1,0,0},
/*ea*/{"jp pe,","vv",3,2,0},
/*eb*/{"ex de,hl","vv",1,0,0},
/*ec*/{"call pe,","vv",3,2,0},
/*ed*/{"qs","vv",99,88,77},
/*ee*/{"xor ","vv",2,1,0},
/*ef*/{"rst 28h","vv",1,0,0},
/*f0*/{"ret p","vv",1,0,0},
/*f1*/{"pop af","vv",1,0,0},
/*f2*/{"jp p,","vv",3,2,0},
/*f3*/{"di","vv",1,0,0},
/*f4*/{"call p,","vv",3,2,0},
/*f5*/{"push af","vv",1,0,0},
/*f6*/{"or ","vv",2,1,0},
/*f7*/{"rst 30h","vv",1,0,0},
/*f8*/{"ret m","vv",1,0,0},
/*f9*/{"ld sp,hl","vv",1,0,0},
/*fa*/{"jp m,","vv",3,2,0},
/*fb*/{"ei","vv",1,0,0},
/*fc*/{"call m,","vv",3,2,0},
/*fd*/{"qs","vv",99,88,77},
/*fe*/{"cp ","vv",2,1,0},
/*ff*/{"rst 38h","vv",1,0,0},
	};

const char *ed40[]={
/*40*/"in b,(c)",
/*41*/"out (c),b",
/*42*/"sbc hl,bc",
/*43*/"ld (%s),bc",
/*44*/"neg",
/*45*/"retn",
/*46*/"im 0",
/*47*/"ld i,a",
/*48*/"in c,(c)",
/*49*/"out (c),c",
/*4a*/"adc hl,bc",
/*4b*/"ld bc,(%s)",
/*4c*/"00",
/*4d*/"reti",
/*4e*/"00",
/*4f*/"ld r,a",
};

const char *ed50[]={
/*50*/"in d,(c)",
/*51*/"out (c),d",
/*52*/"sbc hl,de",
/*53*/"ld (%s),de",
/*54*/"00",
/*55*/"00",
/*56*/"im 1",
/*57*/"ld a,i",
/*58*/"in e,(c)",
/*59*/"out (c),e",
/*5a*/"adc hl,de",
/*5b*/"ld de,(%s)",
/*5c*/"00",
/*5d*/"00",
/*5e*/"im 2",
/*5f*/"ld a,r",
};

const char *ed60[]={
/*60*/"in h,(c)",
/*61*/"out (c),h",
/*62*/"sbc hl,hl",
/*63*/"00",
/*64*/"00",
/*65*/"00",
/*66*/"00",
/*67*/"rrd",
/*68*/"in l,(c)",
/*69*/"out (c),l",
/*6a*/"adc hl,hl",
/*6b*/"00",
/*6c*/"00",
/*6d*/"00",
/*6e*/"00",
/*6f*/"rld",
};

const char *ed70[]={
/*70*/"in f,(c)",
/*71*/"out (c),0",
/*72*/"sbc hl,sp",
/*73*/"ld (%s),sp",
/*74*/"00",
/*75*/"00",
/*76*/"00",
/*77*/"00",
/*78*/"in a,(c)",
/*79*/"out (c),a",
/*7a*/"adc hl,sp",
/*7b*/"ld sp,(%s)",
/*7c*/"00",
/*7d*/"00",
/*7e*/"00",
/*7f*/"00",
};

const char *eda0[]={
/*a0*/"ldi",
/*a1*/"cpi",
/*a2*/"ini",
/*a3*/"outi",
/*a4*/"00",
/*a5*/"00",
/*a6*/"00",
/*a7*/"00",
/*a8*/"ldd",
/*a9*/"cpd",
/*aa*/"ind",
/*ab*/"outd",
/*ac*/"00",
/*ad*/"00",
/*ae*/"00",
/*af*/"00",
};

const char *edb0[]={
/*b0*/"ldir",
/*b1*/"cpir",
/*b2*/"inir",
/*b3*/"otir",
/*b4*/"00",
/*b5*/"00",
/*b6*/"00",
/*b7*/"00",
/*b8*/"lddr",
/*b9*/"cpdr",
/*ba*/"indr",
/*bb*/"otdr",
/*bc*/"00",
/*bd*/"00",
/*be*/"00",
/*bf*/"00",
};

const char *ddfd[]={
/*00*/"00",
/*01*/"00",
/*02*/"00",
/*03*/"00",
/*04*/"00",
/*05*/"00",
/*06*/"00",
/*07*/"00",
/*08*/"00",
/*09*/"00",
/*0a*/"00",
/*0b*/"00",
/*0c*/"00",
/*0d*/"00",
/*0e*/"00",
/*0f*/"00",
/*10*/"00",
/*11*/"00",
/*12*/"00",
/*13*/"00",
/*14*/"00",
/*15*/"00",
/*16*/"00",
/*17*/"00",
/*18*/"00",
/*19*/"00",
/*1a*/"00",
/*1b*/"00",
/*1c*/"00",
/*1d*/"00",
/*1e*/"00",
/*1f*/"00",
/*20*/"00",
/*21*/"00",
/*22*/"00",
/*23*/"00",
/*24*/"inc %sh",
/*25*/"dec %sh",
/*26*/"00",
/*27*/"00",
/*28*/"00",
/*29*/"00",
/*2a*/"00",
/*2b*/"00",
/*2c*/"inc %sl",
/*2d*/"dec %sl",
/*2e*/"00",
/*2f*/"00",
/*30*/"00",
/*31*/"00",
/*32*/"00",
/*33*/"00",
/*34*/"00",
/*35*/"00",
/*36*/"00",
/*37*/"00",
/*38*/"00",
/*39*/"00",
/*3a*/"00",
/*3b*/"00",
/*3c*/"00",
/*3d*/"00",
/*3e*/"00",
/*3f*/"00",
/*40*/"00",
/*41*/"00",
/*42*/"00",
/*43*/"00",
/*44*/"ld b,%sh",
/*45*/"ld b,%sl",
/*46*/"00",
/*47*/"00",
/*48*/"00",
/*49*/"00",
/*4a*/"00",
/*4b*/"00",
/*4c*/"ld c,%sh",
/*4d*/"ld c,%sl",
/*4e*/"00",
/*4f*/"00",
/*50*/"00",
/*51*/"00",
/*52*/"00",
/*53*/"00",
/*54*/"ld d,%sh",
/*55*/"ld d,%sl",
/*56*/"00",
/*57*/"00",
/*58*/"00",
/*59*/"00",
/*5a*/"00",
/*5b*/"00",
/*5c*/"ld e,%sh",
/*5d*/"ld e,%sl",
/*5e*/"00",
/*5f*/"00",
/*60*/"ld %sh,b",
/*61*/"ld %sh,c",
/*62*/"ld %sh,d",
/*63*/"ld %sh,e",
/*64*/"00",
/*65*/"00",
/*66*/"00",
/*67*/"ld %sh,a",
/*68*/"ld %sl,b",
/*69*/"ld %sl,c",
/*6a*/"ld %sl,d",
/*6b*/"ld %sl,e",
/*6c*/"00",
/*6d*/"00",
/*6e*/"00",
/*6f*/"ld %sl,a",
/*70*/"00",
/*71*/"00",
/*72*/"00",
/*73*/"00",
/*74*/"00",
/*75*/"00",
/*76*/"00",
/*77*/"00",
/*78*/"00",
/*79*/"00",
/*7a*/"00",
/*7b*/"00",
/*7c*/"ld a,%sh",
/*7d*/"ld a,%sl",
/*7e*/"00",
/*7f*/"00",
/*80*/"00",
/*81*/"00",
/*82*/"00",
/*83*/"00",
/*84*/"add a,%sh",
/*85*/"add a,%sl",
/*86*/"00",
/*87*/"00",
/*88*/"00",
/*89*/"00",
/*8a*/"00",
/*8b*/"00",
/*8c*/"adc a,%sh",
/*8d*/"adc a,%sl",
/*8e*/"00",
/*8f*/"00",
/*90*/"00",
/*91*/"00",
/*92*/"00",
/*93*/"00",
/*94*/"sub %sh",
/*95*/"sub %sl",
/*96*/"00",
/*97*/"00",
/*98*/"00",
/*99*/"00",
/*9a*/"00",
/*9b*/"00",
/*9c*/"sbc a,%sh",
/*9d*/"sbc a,%sl",
/*9e*/"00",
/*9f*/"00",
/*a0*/"00",
/*a1*/"00",
/*a2*/"00",
/*a3*/"00",
/*a4*/"and %sh",
/*a5*/"and %sl",
/*a6*/"00",
/*a7*/"00",
/*a8*/"00",
/*a9*/"00",
/*aa*/"00",
/*ab*/"00",
/*ac*/"xor %sh",
/*ad*/"xor %sl",
/*ae*/"00",
/*af*/"00",
/*b0*/"00",
/*b1*/"00",
/*b2*/"00",
/*b3*/"00",
/*b4*/"or %sh",
/*b5*/"or %sl",
/*b6*/"00",
/*b7*/"00",
/*b8*/"00",
/*b9*/"00",
/*ba*/"00",
/*bb*/"00",
/*bc*/"cp %sh",
/*bd*/"cp %sl",
/*be*/"00",
/*bf*/"00",
/*c0*/"00",
/*c1*/"00",
/*c2*/"00",
/*c3*/"00",
/*c4*/"00",
/*c5*/"00",
/*c6*/"00",
/*c7*/"00",
/*c8*/"00",
/*c9*/"00",
/*ca*/"00",
/*cb*/"00",
/*cc*/"00",
/*cd*/"00",
/*ce*/"00",
/*cf*/"00",
/*d0*/"00",
/*d1*/"00",
/*d2*/"00",
/*d3*/"00",
/*d4*/"00",
/*d5*/"00",
/*d6*/"00",
/*d7*/"00",
/*d8*/"00",
/*d9*/"00",
/*da*/"00",
/*db*/"00",
/*dc*/"00",
/*dd*/"00",
/*de*/"00",
/*df*/"00",
/*e0*/"00",
/*e1*/"00",
/*e2*/"00",
/*e3*/"00",
/*e4*/"00",
/*e5*/"00",
/*e6*/"00",
/*e7*/"00",
/*e8*/"00",
/*e9*/"00",
/*ea*/"00",
/*eb*/"00",
/*ec*/"00",
/*ed*/"00",
/*ee*/"00",
/*ef*/"00",
/*f0*/"00",
/*f1*/"00",
/*f2*/"00",
/*f3*/"00",
/*f4*/"00",
/*f5*/"00",
/*f6*/"00",
/*f7*/"00",
/*f8*/"00",
/*f9*/"00",
/*fa*/"00",
/*fb*/"00",
/*fc*/"00",
/*fd*/"00",
/*fe*/"00",
/*ff*/"00"
};
