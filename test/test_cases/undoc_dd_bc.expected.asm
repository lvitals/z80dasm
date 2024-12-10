; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_dd_bc.asm undoc_dd_bc.bin

	org 00000h

	defb 0ddh,0bch ;cp ixh
	nop
	nop
	nop
	nop
