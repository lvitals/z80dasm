; z80dasm 1.2.0
; command line: /Users/leandro/workspaces/MSX/z80dasm/build/z80dasm -vvv -g0 -l -o /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_fd_cb_00_01.asm /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_fd_cb_00_01.bin

	org 00000h

	defb 0fdh,0cbh,000h,001h ;rlc (iy+000h) & ld c,(iy+000h)
	nop
	nop
	nop
	nop
