; z80dasm 1.1.3
; command line: ../src/z80dasm -g0 -l -at -o overlapblocks.generated.asm -b ./overlapblocks.blocks ./overlapblocks.bin

	org 00000h


; BLOCK 'test_code' (start 0x0000 end 0x0008)
test_code_start:
	nop			;0000	00		.
	nop			;0001	00		.

; BLOCK 'test_pointers' (start 0x0002 end 0x0006)
test_pointers_start:
	defw test_code_start	;0002	00 00		. .
	defw test_code_start	;0004	00 00		. .
test_pointers_end:
	nop			;0006	00		.
	nop			;0007	00		.
test_code_end:

; BLOCK 'test_bytedata' (start 0x0008 end 0x000a)
test_bytedata_start:
	defb 000h		;0008	00		.
	defb 000h		;0009	00		.
test_bytedata_end:
	nop			;000a	00		.
	nop			;000b	00		.
	nop			;000c	00		.
	nop			;000d	00		.
	nop			;000e	00		.
	nop			;000f	00		.
