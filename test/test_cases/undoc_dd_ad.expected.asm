; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_dd_ad.asm undoc_dd_ad.bin

	org 00000h

	defb 0ddh,0adh ;xor ixl
	nop
	nop
	nop
	nop
