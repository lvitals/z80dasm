; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_dd_cb_00_01.asm undoc_dd_cb_00_01.bin

	org 00000h

	defb 0ddh,0cbh,000h,001h ;rlc (ix+000h) & ld c,(ix+000h)
	nop
	nop
	nop
	nop
