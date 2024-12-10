; z80dasm 1.1.6
; command line: ../src/z80dasm -g0 -l --sym-comments --sym-input=test_cases/symbol_comment_default.sym -o symbol_comment_default.generated.asm ./test_cases/symbol_comment_default.bin

	org 00000h

; this example calls the wait_342ms subroutine;
; then it halts!
start:
	call wait_342ms
	halt
;
; wait 342 milliseconds
; this needs a Z80 running at 2.5Mhz to work!
wait_342ms:
	push bc
	ld bc,start
; inner loop
wait_342ms_inner:
	djnz wait_342ms_inner
	dec c
	jr nz,wait_342ms_inner
	pop bc
	ret
