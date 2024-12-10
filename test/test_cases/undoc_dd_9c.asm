; z80dasm 1.2.0
; command line: /Users/leandro/workspaces/MSX/z80dasm/build/z80dasm -vvv -g0 -l -o /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_dd_9c.asm /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_dd_9c.bin

	org 00000h

	defb 0ddh,09ch ;sbc a,ixh
	nop
	nop
	nop
	nop
