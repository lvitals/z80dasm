; z80dasm 1.2.0
; command line: /Users/leandro/workspaces/MSX/z80dasm/build/z80dasm -vvv -g0 -l -o /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_dd_ad.asm /Users/leandro/workspaces/MSX/z80dasm/test/test_cases/undoc_dd_ad.bin

	org 00000h

	defb 0ddh,0adh ;xor ixl
	nop
	nop
	nop
	nop
