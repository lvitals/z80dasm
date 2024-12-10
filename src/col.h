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

#define FP col_print
#define NL col_new_row
#define CS col_set

#define NUM_TAB_STOPS 5

void col_init(FILE *stream_);
void col_set(int n);
int col_print(const char* fmt, ...);
void col_new_row(void);

extern int a_tab_width;
extern int a_tab_stops[NUM_TAB_STOPS];
