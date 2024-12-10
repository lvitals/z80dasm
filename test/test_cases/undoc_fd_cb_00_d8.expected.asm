; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_fd_cb_00_d8.asm undoc_fd_cb_00_d8.bin

	org 00000h

	defb 0fdh,0cbh,000h,0d8h ;set 3,(iy+000h) & ld b,(iy+000h)
	nop
	nop
	nop
	nop
