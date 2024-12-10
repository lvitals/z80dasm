/* Copyright (C) 2007-2019 Tomaz Solc                                      */

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
#include <stdarg.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>

#include "symtab.h"
#include "config.h"
#include "col.h"

int a_address = 0;
int a_labels = 0;
int a_source = 0;
int a_undoc = 0;
int a_org = 0x0100;
int a_zilog = 0;
int a_z180 = 0;

int a_verbosity = 0;

char *a_output = NULL;
char *a_input = NULL;

char *a_symoutput = NULL;
char *a_syminput = NULL;
enum symbol_order_t a_symbol_order = symbol_order_default;
int a_symcomments = 0;

char *a_blockfile = NULL;

int msg(int level, const char *format, ...)
{
	va_list ap;
	int r=0;

	va_start(ap, format);
	if(a_verbosity>=level) {
		r=vfprintf(stderr, format, ap);
	}
	va_end(ap);

	return r;
}

void version()
{
	printf("%s, Z80 assembly language generating disassembler %s\n", 
							PACKAGE, VERSION);
	printf("Copyright (C) 1994-2007 Jan Panteltje <panteltje@yahoo.com>\n");
	printf("Copyright (C) 2007-2019 Tomaz Solc <tomaz.solc@tablix.org>\n\n");
	printf("This is free software. You may redistribute copies of it under the terms of\n");
	printf("the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.\n");
	printf("There is NO WARRANTY, to the extent permitted by law.\n");
	exit(0);
}

void syntax() 
{
	printf("%s, Z80 assembly language generating disassembler %s\n", 
							PACKAGE, VERSION);
	printf("Usage: [options] file\n\n");

	printf("  -a  --address         Print the memory address of each assembly line in a\n");
	printf("                        comment\n");
	printf("  -l  --labels          Create labels for jump instructions\n");
	printf("  -g  --origin=ORG      Specify the starting address of the code (default 0x100)\n");
	printf("  -t  --source          Print the corresponding binary data in hex and ASCII\n");
	printf("                        for each assembly line in a comment.\n");
	printf("  -u  --undoc           Insert undocumented instructions directly into the\n");
	printf("                        disassembly instead of in the comments.\n");
	printf("  -1  --z180		Disassemble instructions supported by the Z180\n");
	printf("                        processor.\n");

	printf("  -s  --sym-output=FILE Write symbol information into FILE\n");
	printf("  -S  --sym-input=FILE  Read symbol information from FILE\n");
	printf("  -r  --sym-order=SORT  Sort symbols before writing symbol file\n");
	printf("                        (SORT can be default, frequency)\n");
	printf("  -c  --sym-comments    Transfer symbol comments in the symbol information file\n");
	printf("                        to the output.\n");
	printf("  -b  --block-def=FILE  Read information about code and data blocks from FILE\n");
	printf("  -o  --output=FILE     Print output to FILE instead of standard output\n");
	printf("  -h  --help            Display this help text and exit\n");
	printf("  -v 			Increase verbosity\n");
	printf("  -V  --version         Display version information and exit\n");
	printf("  -z  --zilog           Use original Zilog syntax for relative jumps\n");
	printf("\n");
	printf("  --tab-width=N         Tab width in characters to use when aligning output\n");
	printf("                        into columns (default is 8)\n");
	printf("  --tab-stops=S1,S2,... Comma separated list of tab stops to use.\n");
	printf("                        (default is 0,1,4,5,7)");
	printf("\nBug reports to <%s>\n", PACKAGE_BUGREPORT);
	exit(0);
}

static void str2int(char *s, int *n)
{
	int r;

	r=sscanf(s, "%i", n);
	if(r != 1) {
		fprintf(stderr, "Error: %s not an integer\n", s);
		exit(1);
	}
}

static void parse_align_stops(char *s)
{
	int n, v, prev;
	char* tok;

	prev = -1;

	for(n = 0; n < NUM_TAB_STOPS; n++) {
		tok = strtok(s, ",");
		s = NULL;

		if(tok == NULL) {
			break;
		}

		str2int(tok, &v);

		if(v < 0) {
			fprintf(stderr, "Error: Tab stop not greater than 0: "
					"%d\n", v);
			exit(1);
		}

		if(v <= prev) {
			fprintf(stderr, "Error: Tab stop not greater than the "
					"previous one: %d\n", v);
			exit(1);
		}

		a_tab_stops[n] = v;
		prev = v;
	}
};

void cmdline(int argc, char **argv)
{
	const struct option longopts[] = {
		{ "address", no_argument, NULL, 'a' },
		{ "labels", no_argument, NULL, 'l' },
		{ "origin", required_argument, NULL, 'g'},
		{ "reduced", no_argument, NULL, 'r' },
		{ "source", no_argument, NULL, 't' },
		{ "undoc", no_argument, NULL, 'u' },
		{ "z180", no_argument, NULL, '1' },
		{ "sym-output", required_argument, NULL, 's' },
		{ "sym-input", required_argument, NULL, 'S' },
		{ "sym-order", required_argument, NULL, 'r' },
		{ "sym-comments", no_argument, NULL, 'c' },
		{ "block-def", required_argument, NULL, 'b' },
		{ "output", required_argument, NULL, 'o' },
		{ "help", no_argument, NULL, 'h' },
		{ "version", no_argument, NULL, 'v' },
		{ "zilog", no_argument, NULL, 'z' },
		{ "tab-stops", required_argument, NULL, 'A'},
		{ "tab-width", required_argument, NULL, 'T'},
		{ NULL, 0, NULL, 0 }
	};
	const char opts[] = "alg:tu1S:s:r:o:hVvzb:c";
	int c;

	while((c=getopt_long(argc, argv, opts, longopts, NULL))!=-1) {
		switch(c) {
			case 'a': a_address=1;
				  break;
			case 'l': a_labels=1;
			 	  break;
			case 'g': str2int(optarg, &a_org);
				  if(a_org < 0) {
					fprintf(stderr, "Error: origin can't "
							"be negative: %d\n",
							a_org);
					exit(1);
				  }
				  break;
			case 't': a_source=1;
				  break;
			case 'u': a_undoc=1;
				  break;
			case '1': a_z180 = 1;
			case 's': a_symoutput=optarg;
				  break;
			case 'S': a_syminput=optarg;
				  break;
			case 'r':
				  if(!strcmp(optarg, "frequency")) {
					a_symbol_order = symbol_order_frequency;
				  } else if(!strcmp(optarg, "default")) {
					a_symbol_order = symbol_order_default;
				  } else {
					fprintf(stderr, "Error: %s is not a valid "
							"symbol order\n",
							optarg);
					exit(1);
				  }
				  break;
			case 'c': a_symcomments=1;
				  break;
			case 'b': a_blockfile=optarg;
				  break;
			case 'z': a_zilog=1;
				  break;
			case 'o': a_output=optarg;
				  break;
			case 'V': version();
				  break;
			case 'v': a_verbosity++;
				  break;
			case 'h': syntax();
				  break;
			case 'A': parse_align_stops(optarg);
				  break;
			case 'T': str2int(optarg, &a_tab_width);
				  if(a_tab_width < 1) {
					fprintf(stderr, "Error: Tab width not "
							"greater than 0: %d\n",
							a_tab_width);
					exit(1);
				  }
				  break;
			default:  exit(1);
				  break;
		}
	}

	if(optind<argc-1) {
		fprintf(stderr, "Warning: Only one input file supported\n");
	}

	if(optind<argc) {
		a_input=argv[optind];
	}
}
