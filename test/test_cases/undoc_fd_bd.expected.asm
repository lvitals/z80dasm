; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_fd_bd.asm undoc_fd_bd.bin

	org 00000h

	defb 0fdh,0bdh ;cp iyl
	nop
	nop
	nop
	nop
