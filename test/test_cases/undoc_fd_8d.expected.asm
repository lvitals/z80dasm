; z80dasm 1.1.2
; command line: ../src/z80dasm -vvv -g0 -l -o undoc_fd_8d.asm undoc_fd_8d.bin

	org 00000h

	defb 0fdh,08dh ;adc a,iyl
	nop
	nop
	nop
	nop
