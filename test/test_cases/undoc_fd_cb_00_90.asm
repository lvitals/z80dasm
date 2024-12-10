; z80dasm 1.2.0
; command line: /Users/leandro/workspaces/MSX/z80dasm/build/z80dasm -vvv -g0 -l -o /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_fd_cb_00_90.asm /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_fd_cb_00_90.bin

	org 00000h

	defb 0fdh,0cbh,000h,090h ;res 2,(iy+000h) & ld b,(iy+000h)
	nop
	nop
	nop
	nop
