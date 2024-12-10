; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_dd_bd.asm undoc_dd_bd.bin

	org 00000h

	defb 0ddh,0bdh ;cp ixl
	nop
	nop
	nop
	nop
