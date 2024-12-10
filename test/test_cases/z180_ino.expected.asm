; z80dasm 1.1.6
; command line: ../src/z80dasm --z180 -o test_cases/z180_ino.expected.asm test_cases/z180_ino.bin

	org 00000h

	ino b, (0x00)
	ino d, (0x00)
	ino h, (0x00)
	defb 0edh
	jr nc,l000ch
l000ch:
	ino c, (0x00)
	ino e, (0x00)
	ino l, (0x00)
	ino a, (0x00)
