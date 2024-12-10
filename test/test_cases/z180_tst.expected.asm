; z80dasm 1.1.6
; command line: ../src/z80dasm -g0 --z180 -o test_cases/z180_tst.expected.asm test_cases/z180_tst.bin

	org 00000h

	tst 000h
	tstio 000h
	tst b
	tst d
	tst h
	tst (hl)
	tst c
	tst e
	tst l
	tst a
