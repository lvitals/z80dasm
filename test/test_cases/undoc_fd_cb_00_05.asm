; z80dasm 1.2.0
; command line: /Users/leandro/workspaces/MSX/z80dasm/build/z80dasm -vvv -g0 -l -o /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_fd_cb_00_05.asm /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_fd_cb_00_05.bin

	org 00000h

	defb 0fdh,0cbh,000h,005h ;rlc (iy+000h) & ld l,(iy+000h)
	nop
	nop
	nop
	nop
