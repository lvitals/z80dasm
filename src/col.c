/* Copyright (C) 2023 Tomaz Solc                                           */

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
#include <stdarg.h>
#include <assert.h>

#include "col.h"

/* Columns are: 0 labels
 *              1 disassembly
 *              2 address
 *              3 binary in hex
 *              4 binary in ASCII */

/* current column */
static int cur = 0;
static int nch = 0;
static FILE *stream = NULL;

int a_tab_width = 8;
int a_tab_stops[NUM_TAB_STOPS] = {0, 1, 4, 5, 7};

void col_init(FILE *stream_)
{
	stream = stream_;
	cur = 0;
	nch = 0;
}

static void col_set_align_tabs(int n)
{
	int i;
	int d;
	int tab;

	assert(n < NUM_TAB_STOPS);

	tab = a_tab_stops[n]*a_tab_width;
	d = (tab-nch-1)/a_tab_width + 1;

	if(d < 1) {
		d = 1;
	}

	for(i = 0; i < d; i++) {
		fprintf(stream, "\t");
	}

	nch = tab;
}

/* set current column */
void col_set(int n)
{
	/* called col_set before col_init? */
	assert(stream != NULL);

	/* trying to set a column that is before the current one? */
	assert(n > cur);

	col_set_align_tabs(n);

	cur = n;
}

/* print something into the current column */
int col_print(const char* fmt, ...)
{
	va_list ap;
	int r;

	/* called col_print before col_init? */
	assert(stream != NULL);

	va_start(ap, fmt);
	r = vfprintf(stream, fmt, ap);
	va_end(ap);

	nch += r;

	return r;
}

/* start new row */
void col_new_row(void)
{
	cur = 0;
	nch = 0;
	fprintf(stream, "\n");
}
