; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_fd_cb_00_90.asm undoc_fd_cb_00_90.bin

	org 00000h

	defb 0fdh,0cbh,000h,090h ;res 2,(iy+000h) & ld b,(iy+000h)
	nop
	nop
	nop
	nop
