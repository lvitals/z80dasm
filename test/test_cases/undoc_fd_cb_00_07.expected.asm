; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_fd_cb_00_07.asm undoc_fd_cb_00_07.bin

	org 00000h

	defb 0fdh,0cbh,000h,007h ;rlc (iy+000h) & ld a,(iy+000h)
	nop
	nop
	nop
	nop
