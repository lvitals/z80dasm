; z80dasm 1.2.0
; command line: /Users/leandro/workspaces/MSX/z80dasm/build/z80dasm -vvv -g0 -l -o /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_dd_cb_00_a0.asm /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_dd_cb_00_a0.bin

	org 00000h

	defb 0ddh,0cbh,000h,0a0h ;res 4,(ix+000h) & ld b,(ix+000h)
	nop
	nop
	nop
	nop
