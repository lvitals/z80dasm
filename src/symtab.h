/* Copyright (C) 2007-2012 Tomaz Solc                                      */

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

enum referencetype {	
	undef,
	jpdest, /* used as a destination for a long jump */
	jrdest, /* used as destination for a short jump */
	djdest, /* used in a djnz instruction */
	cldest, /* used as a call address */
	vrbyte, /* used as an address for 8bit load */
	vrword, /* used as an address for 16bit load */
	cstadd,	/* used as a 16bit immediate value */
	cstdfw  /* used in a defw directive */
};

enum symbol_order_t {
	symbol_order_default,
	symbol_order_frequency
};

struct symbol {
	char *name;
	int automatic;

	int val;

	/* 1 if symbol is a label (i.e. is aligned with instructions) */
	int label;

	/* Any comment that should be printed out before symbol definition */
	char *comment;

	/* When printing symbol definitions for symbols that have the same
	 * value, put those with higher weight at the bottom. */
	int weight;

	/* Length of the data structure the symbol refers to. This is used to
	 * produce values with an offset in the disassembly for example like
	 * ld hl,(symbol+1).
	 *
	 * By default, symbols will have range=1. Automatically generated
	 * labels get range=length of next instruction. For example, this
	 * makes jumps into a middle of a instruction (a known optimization
	 * technique) show up with the correct label and a byte offset. */
	int range;

	/* 1 if symbol is defined in a symbol file included by an "include" 
	 * directive */
	int included;

	struct reference *ref;

	struct symbol *prev;
	struct symbol *next;
};

struct reference {
	int addr;
	enum referencetype type;

	struct reference *next;
};

/* Maximum number of top level include directives */
#define MAX_INCLUDE_TOP		128

/* Maximum number of nested include directives */
#define MAX_INCLUDE_LEVEL	128

/* Maximum number of lines for a single symbol */
#define MAX_COMMENT_LINES_PER_SYMBOL	256

extern struct symbol *symbols;

struct symbol *symbol_find(int addr);
struct symbol *symbol_find_next(int val, struct symbol *cur);
struct symbol *symbol_find_range(int val);

struct symbol *symbol_new(char *name, int val, char *comment, int weight, int included);
struct symbol *symbol_newref(int addr, int ref, enum referencetype type);
int symbol_setlabel(int val, int range);

void symbol_remove_nonlabels();

int symbol_export(enum symbol_order_t order);
int symbol_export_nonlabels();
void symbol_export_includes();

int symbol_load_file(char *filename, int level);
int symbol_load_line(char *line, char **name, int *val, int level);
