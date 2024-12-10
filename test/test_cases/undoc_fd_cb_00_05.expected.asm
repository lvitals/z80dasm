; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_fd_cb_00_05.asm undoc_fd_cb_00_05.bin

	org 00000h

	defb 0fdh,0cbh,000h,005h ;rlc (iy+000h) & ld l,(iy+000h)
	nop
	nop
	nop
	nop
