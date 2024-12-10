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

enum blocktype {
	code,
	bytedata,
	worddata,
	pointers
};

/* The kind of label to generate at start or end of a block. */
enum labeltype {
	/* Don't generate any label. */
	LABEL_NONE,

	/* Make a label at the first or last byte in block. */
	LABEL_FIRST_LAST,

	/* Make a label at the first or one after the last byte in block */
	LABEL_START_END
};

struct block {
	char *name;

	int start;	/* first byte in this block */
	int end;	/* last byte in this block plus 1 */

	/* The kind of label to generate at the start of this block */
	enum labeltype start_label;

	/* The kind of label to generate at the end of this block */
	enum labeltype end_label;

	enum blocktype type;

	struct block *prev;
	struct block *next;
};

extern struct block *blocks;

int block_init(int start, int end);

struct block *block_new(char *name, int start, int end, enum blocktype type,
			enum labeltype start_label, enum labeltype end_label);

int block_load_file(char *filename);
int block_load_line(char *line, char **name, 
				int *start, int *end, enum blocktype *type,
				enum labeltype *start_label,
				enum labeltype *end_label);
