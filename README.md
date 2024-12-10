# z80dasm


## Introduction

z80dasm is a disassembler for the Zilog Z80 microprocessor and compatibles. It
can be used to reverse engineer programs and operating systems for 1980's
microcomputers using this processor architecture (for example Sinclair ZX81,
Spectrum and many others). It was developed to produce the [Galaksija ROM
disassembly][1]. Recently support for Z180 instructions has been added as well.

Generated assembly code can be assembled back to binary with a number of Z80
assemblers. Compatibility with [z80asm][2] was thoroughly tested. Any
disassembly by z80dasm is perfectly reversible with z80asm. Other reportedly
compatible assemblers include zasm by Günter Woigk and the original Zilog
assembler.

z80dasm has several features that can improve the readability of generated
assembly code. It can guess locations of labels in the code from jumps and
similar instructions. You can supply it with a symbol file and z80dasm will use
label names from there instead of automatically generated ones. If you define
code and data sections for a binary z80dasm can also use this information to
produce a nicer disassembly.

A lot of attention has been devoted to handling of unusual Z80 machine code.
z80dasm correctly handles undocumented instructions, illegal sequences and
partial opcodes.


## History

The core of z80dasm is based largely on [dz80 3.0][3], a Z80 disassembler
written by Jan Panteltje. Compared to dz80, z80dasm fixes multiple bugs and
adds several new features. It also has a more UNIX-like command line interface.
For a detailed list of changes compared to dz80, see NEWS file included in the
source.


## Dependencies

z80dasm does not depend on any external library. Building requires GNU Make and
a C compiler.

Building the development version from the git repository also requires
GNU Autotools.

In theory z80dasm will build and run on any sufficiently UNIX-like operating
system. It is developed and tested on Debian GNU/Linux. An outdated binary
build for Microsoft Windows also exists.

## Installation

1.  **Project Configuration:**
    
    ```
    cmake -S . -B build
    ```
    
    This command configures the project, generating the necessary files in the `build` directory.
    
2.  **Build the project:**
    
    ```
    cmake --build build
    ```
    
    This command compiles the source code in the `build` directory.
    
3.  **Tests:**
    
    ```
    ctest --test-dir build
    ```
    
    Runs the defined tests to verify if the build was successful.
    
4.  **Stress Test:**
    
    ```
    cmake --build build --target stress_test
    ```
    
    If the project has a "stress\_test" target, this command runs the stress test.
    
5.  **Installation:**
    
    ```
    sudo cmake --install build
    ```
    
    Installs the executable and auxiliary files (like manuals) to the appropriate directories (`/usr/local/bin` for the binary and `/usr/local/share/man/man1` for the manual).


## Usage

To convert a binary file `foo.bin` (like a ROM dump, for example) to assembly
and write the output to `foo.asm`, run:

    $ z80dasm -l -g 0x200 -o foo.asm foo.bin

The `-l` option enables automatic generation of labels in the assembly.

The `-g 0x200` option tells the disassembler that the binary code in `foo.bin`
is present at the address 0x200 (hex) in the CPU's memory address space.

For a full list of options and  more details, see z80dasm(1) man page or run
z80dasm with the `--help` option.


## License

Copyright (C) 1994-2007 Jan Panteltje <panteltje@yahoo.com>

Copyright (C) 2007-2023 Tomaz Solc <tomaz.solc@tablix.org>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
