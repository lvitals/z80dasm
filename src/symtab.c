/* Copyright (C) 2007-2018 Tomaz Solc                                      */

/* This program is free software; you can redistribute it and/or modify    */
/* it under the terms of the GNU General Public License as published by    */
/* the Free Software Foundation; either version 2 of the License, or       */
/* (at your option) any later version.                                     */

/* This program is distributed in the hope that it will be useful,         */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of          */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           */
/* GNU General Public License for more details.                            */

/* You should have received a copy of the GNU General Public License       */
/* along with this program; if not, write to the Free Software             */
/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "dz80.h"
#include "col.h"

struct symbol *symbols=NULL;

/* TODO: This symbol table implementation in slow. */

void symbol_remove(struct symbol *symb)
{
	struct reference *ref,*refn;

	msg(2, "Debug: removing symbol '%s' with value 0x%04x\n", 
						symb->name, symb->val);

	ref=symb->ref;
	while(ref!=NULL) {
		refn=ref->next;
		free(ref);
		ref=refn;
	}

	free(symb->name);
	free(symb->comment);

	if(symb->prev!=NULL) {
		symb->prev->next=symb->next;
	} else {
		symbols=symb->next;
	}

	if(symb->next!=NULL) {
		symb->next->prev=symb->prev;
	}

	free(symb);
}

/* Find a symbol by its exact value. */
struct symbol *symbol_find(int val)
{
	return symbol_find_next(val, NULL);
}

struct symbol *symbol_find_next(int val, struct symbol *cur)
{
	if(cur==NULL) {
		cur=symbols;
	} else {
		cur=cur->next;
	}

	while(cur!=NULL) {
		if(cur->val == val) {
			return cur;
		}
		cur=cur->next;
	}

	return NULL;
}

/* Find a symbol by name. Returns NULL if not found. */
static struct symbol *symbol_find_name(const char *name)
{
	struct symbol *cur = symbols;

	while(cur != NULL) {
		if(!strcmp(cur->name, name)) {
			return cur;
		}
		cur = cur->next;
	}

	return NULL;
}

int symbol_compare(struct symbol *a, struct symbol *b)
{
	if(a->val > b->val) {
		return 1;
	} else if(a->val < b->val) {
		return -1;
	}

	if(a->weight > b->weight) {
		return 1;
	} else if(a->weight < b->weight) {
		return -1;
	}

	return 0;
}

/* Helper function for symbol_new(). It finds a place where the new 
 * symbol will be inserted into the linked list */
void symbol_find_place(struct symbol *new, 
				struct symbol **prev, struct symbol **next)
{
	struct symbol *cur;

	*prev=NULL;
	cur=symbols;
	while(cur!=NULL) {
		*next=cur;
		if(symbol_compare(cur, new) > 0) {
			return;
		}
		*prev=cur;
		cur=cur->next;
	}

	*next=NULL;
	return;
}

struct symbol *symbol_find_inrange(int val, int range)
{
	struct symbol *cur;

	cur=symbols;
	while(cur!=NULL) {
		if(val<=cur->val && (val+range)>cur->val) {
			return cur;			
		}
		cur=cur->next;
	}

	return NULL;
}

/* Find a symbol by value, also considering its range.
 *
 * The symbol returned might be offset from val by up to symbol->range. */
struct symbol *symbol_find_range(int val)
{
	struct symbol *cur;

	cur=symbols;
	while(cur!=NULL) {
		if(cur->val<=val && (cur->val+cur->range)>val) {
			return cur;			
		}
		cur=cur->next;
	}

	return NULL;
}

/* We store symbols in a linked list. Two symbols can point to the same
 * address, but two symbols cannot share the same name. */

struct symbol *symbol_new(char *name, int val, char *comment, int weight, int included)
{
	struct symbol *prev, *next;
	struct symbol *dest;

	/* This might be slow - we're traversing the whole linked list for each
	 * new symbol. But computers are fast nowadays, and just how many
	 * symbols can a 64k program have? */
	dest = symbol_find_name(name);
	if(dest != NULL) {
		if(dest->val != val) {
			msg(0, "Warning: not redefining symbol '%s' "
				"(existing value 0x%04x, new value 0x%04x).\n",
				name, dest->val, val);
		}
		return NULL;
	}

	msg(2, "Debug: defining new symbol '%s' with value 0x%04x\n", 
							name, val);

	dest=calloc(1, sizeof(*dest));
	if(dest==NULL) return NULL;

	if (comment != NULL) {
		dest->comment=strdup(comment);
	}
	dest->name=strdup(name);
	dest->val=val;
	dest->weight=weight;

	dest->automatic=0;
	dest->range=1;
	dest->included=included;
	dest->label=0;

	symbol_find_place(dest, &prev, &next);

	dest->prev=prev;
	dest->next=next;

	if(next!=NULL) {
		next->prev=dest;
	}
	if(prev!=NULL) {
		prev->next=dest;
	} else {
		symbols=dest;
	}

	dest->ref=NULL;

	return dest;
}

struct symbol *symbol_newref(int val, int addr, enum referencetype type)
{
	struct symbol *dest;
	struct reference *r;

	/* strlen("sub_0000h")+1 = 10 */
	char name[10];

	dest=symbol_find(val);

	if(dest==NULL) {
		if(type==cldest) {
			sprintf(name, "sub_%04xh", val);
		} else {
			sprintf(name, "l%04xh", val);
		}

		dest=symbol_new(name, val, NULL, 50, 0);

		dest->automatic=1;
	}

	r=calloc(1, sizeof(*r));

	r->addr=addr;
	r->type=type;

	r->next=dest->ref;
	dest->ref=r;

	return dest;
}

int symbol_setlabel(int val, int range)
{
	struct symbol *dest;

	dest=symbol_find(val);
	if(dest==NULL) return 1;

	dest->range=range;
	dest->label=1;

	return 0;
}

void symbol_remove_nonlabels()
{
	struct symbol *symb,*symbn;

	symb=symbols;
	while(symb!=NULL) {
		symbn=symb->next;

		if((!symb->label) && symb->automatic) {
			symbol_remove(symb);
		}

		symb=symbn;
	}
}

int symbol_export_nonlabels()
{
	struct symbol *cur;

	cur=symbols;
	while(cur!=NULL) {
		if((!cur->label) && cur->ref != NULL) {
			if (cur->comment != NULL) {
				FP("%s", cur->comment);
			}
			FP("%s:", cur->name);
			CS(1);
			FP("equ 0x%04x", cur->val);
			NL();
		}
		cur=cur->next;
	}

	return 0;
}

/* Converts linked list of symbols to an array of pointers. Array should be
 * freed by the caller. */
static int symbol_to_array(struct symbol ***symbol_array, int *symbol_num)
{
	struct symbol *cur = symbols;
	int n;

	(*symbol_num) = 0;
	while(cur != NULL) {
		(*symbol_num)++;
		cur = cur->next;
	}

	(*symbol_array) = calloc((*symbol_num), sizeof(**symbol_array));

	cur = symbols;
	n = 0;
	while(cur != NULL) {
		(*symbol_array)[n] = cur;
		cur = cur->next;
		n++;
	}

	return 0;
}

static int symbol_export_array(struct symbol **symbol_array, int symbol_num)
{
	struct symbol *cur;
	struct reference *r;
	int n;

	FP("; Symbol file");
	NL();
	NL();

	symbol_export_includes();

	NL();

	for(n = 0; n < symbol_num; n++) {
		cur = symbol_array[n];

		if(cur->included) {
			continue;
		}

		if(cur->comment!=NULL) {
			FP("%s", cur->comment);
		}

		FP("%s:", cur->name);
		CS(1);
		FP("equ 0x%04x", cur->val);
		NL();

		FP("; Used at following locations:");
		NL();

		r=cur->ref;
		while(r!=NULL) {
			FP("; 0x%04x", r->addr);
			CS(1);
			switch(r->type) {
				case undef:
					FP("(unknown)");
					break;
				case jpdest:	
					FP("(jp destination)");
					break;
				case jrdest:	
					FP("(jr destination)");
					break;
				case djdest:	
					FP("(djnz destination)");
					break;
				case cldest: 
					FP("(call destination)");
					break;
				case vrbyte: 
					FP("(byte load pointer)");
					break; 
				case vrword: 
					FP("(word load pointer)");
					break;
				case cstadd: 
					FP("(immediate value)");
					break;
				case cstdfw: 
					FP("(defw directive)");
					break;
			}
			NL();
			r=r->next;
		}
		NL();
	}

	return 0;
}

static int symbol_get_ref_num(const struct symbol *s)
{
	const struct reference *r = s->ref;
	int n = 0;

	while(r != NULL) {
		n++;
		r = r->next;
	}

	return n;
}

static int cmp_usage_freq(const void *a, const void *b)
{
	const struct symbol *as = *((const struct symbol **) a);
	const struct symbol *bs = *((const struct symbol **) b);

	int an = symbol_get_ref_num(as);
	int bn = symbol_get_ref_num(bs);

	return bn - an;
}

int symbol_export(enum symbol_order_t order)
{
	struct symbol **symbol_array;
	int symbol_num;
	int rv;

	symbol_to_array(&symbol_array, &symbol_num);

	switch(order) {
		case symbol_order_default:
			break;
		case symbol_order_frequency:
			qsort(symbol_array, symbol_num, sizeof(*symbol_array),
					cmp_usage_freq);
			break;
	}

	rv = symbol_export_array(symbol_array, symbol_num);

	free(symbol_array);

	return rv;
}
