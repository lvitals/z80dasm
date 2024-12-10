; z80dasm 1.1.5
; command line: ../src/z80dasm -g0 -l -S blockstartredefined.sym -o blockstartredefined.generated.asm -b ./blockstartredefined.blocks ./blockstartredefined.bin

	org 00000h

block0_start:
	defb 000h
block0_end:
	nop
