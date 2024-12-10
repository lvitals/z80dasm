; z80dasm 1.1.3
; command line: ../src/z80dasm -g0 -l -at -o firstlastblocks.generated.asm -b ./firstlastblocks.blocks ./firstlastblocks.bin

	org 00000h
test_pointers_last:	equ 0x0009

l0000h:
	nop			;0000	00		.
	nop			;0001	00		.

; BLOCK 'test_bytedata' (start 0x0002 end 0x0006)
test_bytedata_first:
	defb 000h		;0002	00		.
	defb 000h		;0003	00		.
	defb 000h		;0004	00		.
test_bytedata_last:
	defb 000h		;0005	00		.

; BLOCK 'test_pointers' (start 0x0006 end 0x000a)
test_pointers_first:
	defw test_pointers_last	;0006	09 00		. .
	defw l0000h		;0008	00 00		. .
	nop			;000a	00		.
	nop			;000b	00		.
	nop			;000c	00		.
	nop			;000d	00		.
	nop			;000e	00		.
	nop			;000f	00		.
