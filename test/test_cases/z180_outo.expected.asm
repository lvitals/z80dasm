; z80dasm 1.1.6
; command line: ../src/z80dasm --z180 -o test_cases/z180_outo.expected.asm test_cases/z180_outo.bin

	org 00000h

l0000h:
	outo (0x00), b
	outo (0x00), d
	outo (0x00), h
	defb 0edh
	ld sp,l0000h
	outo (0x00), c
	outo (0x00), e
	outo (0x00), l
	outo (0x00), a
