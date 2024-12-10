; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_dd_cb_00_e8.asm undoc_dd_cb_00_e8.bin

	org 00000h

	defb 0ddh,0cbh,000h,0e8h ;set 5,(ix+000h) & ld b,(ix+000h)
	nop
	nop
	nop
	nop
