; z80dasm 1.1.4
; command line: ../src/z80dasm -g0 -l -at -o basicblocks.generated.asm -b ./basicblocks.blocks ./basicblocks.bin

	org 00000h

	push de			;0000	d5		.
	dec d			;0001	15		.
	ld (de),a		;0002	12		.
	ld h,a			;0003	67		g
	ld (hl),e		;0004	73		s
	ld c,d			;0005	4a		J
	ld bc,0567ch		;0006	01 7c 56	. | V
	add hl,hl		;0009	29		)
	ld (bc),a		;000a	02		.
	ld a,e			;000b	7b		{
	ret			;000c	c9		.
	add a,h			;000d	84		.
	or e			;000e	b3		.
	xor c			;000f	a9		.
	push hl			;0010	e5		.
	ld (hl),a		;0011	77		w
	ld d,c			;0012	51		Q
	inc d			;0013	14		.
	ld (bc),a		;0014	02		.
	sub 090h		;0015	d6 90		. .
	ld e,06dh		;0017	1e 6d		. m
	inc d			;0019	14		.
	defb 0ddh,0feh,0c8h ;illegal sequence	;001a	dd fe c8	. . .
	jp (hl)			;001d	e9		.
	adc a,c			;001e	89		.
	call z,0ffaeh		;001f	cc ae ff	. . .
	ld sp,hl		;0022	f9		.
	and l			;0023	a5		.
	dec d			;0024	15		.
	rst 0			;0025	c7		.
	inc sp			;0026	33		3
	ret p			;0027	f0		.
	dec c			;0028	0d		.
	ld h,d			;0029	62		b
	ret m			;002a	f8		.
	ld hl,(09de8h)		;002b	2a e8 9d	* . .
	ld e,h			;002e	5c		\
	ld e,d			;002f	5a		Z
	ret m			;0030	f8		.
	pop de			;0031	d1		.
	and e			;0032	a3		.
	ld (bc),a		;0033	02		.
	ld (hl),a		;0034	77		w
	rst 10h			;0035	d7		.
	call p,0edd8h		;0036	f4 d8 ed	. . .
	add a,d			;0039	82		.
	ld a,e			;003a	7b		{
	adc a,a			;003b	8f		.
	ld b,b			;003c	40		@
	jr c,$-68		;003d	38 ba		8 .
	ld c,06bh		;003f	0e 6b		. k
	ld (bc),a		;0041	02		.
	push af			;0042	f5		.
	jr nz,l00a0h		;0043	20 5b		  [
	dec c			;0045	0d		.
	ld c,d			;0046	4a		J
	and e			;0047	a3		.
	ld b,a			;0048	47		G
	ret nz			;0049	c0		.
	otdr			;004a	ed bb		. .
	ld a,(0f244h)		;004c	3a 44 f2	: D .
	ld e,l			;004f	5d		]
	in a,(0dch)		;0050	db dc		. .
	nop			;0052	00		.
	dec a			;0053	3d		=
	call p,0c3cbh		;0054	f4 cb c3	. . .
	ld e,(hl)		;0057	5e		^
	ld e,b			;0058	58		X
	ld (hl),d		;0059	72		r
	ld h,h			;005a	64		d
	or d			;005b	b2		.
	push bc			;005c	c5		.
	sbc a,h			;005d	9c		.
	ld b,c			;005e	41		A
	ld b,l			;005f	45		E
	rst 38h			;0060	ff		.
	rrca			;0061	0f		.
	rst 30h			;0062	f7		.
	ret nc			;0063	d0		.
	pop bc			;0064	c1		.
	ld b,b			;0065	40		@
	ex af,af'		;0066	08		.
	in a,(072h)		;0067	db 72		. r
	in a,(021h)		;0069	db 21		. !
l006bh:
	push de			;006b	d5		.
	ret z			;006c	c8		.
	rst 20h			;006d	e7		.
	dec l			;006e	2d		-
	ld l,e			;006f	6b		k
	jr z,$+115		;0070	28 71		( q
	ld l,d			;0072	6a		j
	add a,05fh		;0073	c6 5f		. _
	sbc a,d			;0075	9a		.
	xor a			;0076	af		.
	sbc a,l			;0077	9d		.
	ld l,0d6h		;0078	2e d6		. .
	jp (hl)			;007a	e9		.
	ld l,0e4h		;007b	2e e4		. .
	ld d,a			;007d	57		W
	ret p			;007e	f0		.
	ld e,04fh		;007f	1e 4f		. O
	ld c,e			;0081	4b		K
	ld h,e			;0082	63		c
	adc a,l			;0083	8d		.
l0084h:
	sbc a,e			;0084	9b		.
	ld d,(hl)		;0085	56		V
	dec c			;0086	0d		.
	ld d,e			;0087	53		S
	ld sp,hl		;0088	f9		.
	ld sp,hl		;0089	f9		.
	jr z,l006bh		;008a	28 df		( .
	inc hl			;008c	23		#
	ld d,d			;008d	52		R
	jp 0f49eh		;008e	c3 9e f4	. . .
	or l			;0091	b5		.
	adc a,08dh		;0092	ce 8d		. .
	rst 10h			;0094	d7		.
	or l			;0095	b5		.
	xor a			;0096	af		.
	cp c			;0097	b9		.
	ret			;0098	c9		.
	or 02bh			;0099	f6 2b		. +
	jp nc,0e3c2h		;009b	d2 c2 e3	. . .
	push af			;009e	f5		.
	dec c			;009f	0d		.
l00a0h:
	adc a,0e1h		;00a0	ce e1		. .
	ld b,(hl)		;00a2	46		F
	ld (hl),b		;00a3	70		p
	in a,(0adh)		;00a4	db ad		. .
	dec c			;00a6	0d		.
	jp m,0cab3h		;00a7	fa b3 ca	. . .
	cp e			;00aa	bb		.
l00abh:
	cp d			;00ab	ba		.
	dec d			;00ac	15		.
	add hl,hl		;00ad	29		)
	sbc a,h			;00ae	9c		.
	jp c,04a62h		;00af	da 62 4a	. b J
	ld d,a			;00b2	57		W
	ld h,d			;00b3	62		b
	and e			;00b4	a3		.
	push hl			;00b5	e5		.
	cp e			;00b6	bb		.
	cp (hl)			;00b7	be		.
	sbc a,l			;00b8	9d		.
	dec a			;00b9	3d		=
	add a,h			;00ba	84		.
	inc de			;00bb	13		.
	dec bc			;00bc	0b		.
	push hl			;00bd	e5		.
	cp a			;00be	bf		.
	ld bc,0c473h		;00bf	01 73 c4	. s .
	add a,d			;00c2	82		.
	ld a,b			;00c3	78		x
	ld e,(hl)		;00c4	5e		^
	djnz $-111		;00c5	10 8f		. .
	or (hl)			;00c7	b6		.
	jr l00abh		;00c8	18 e1		. .
	ld (hl),l		;00ca	75		u
	inc bc			;00cb	03		.
	ret c			;00cc	d8		.
	xor c			;00cd	a9		.
	inc e			;00ce	1c		.
	sub b			;00cf	90		.
	ld sp,0b43ah		;00d0	31 3a b4	1 : .
	inc de			;00d3	13		.
	ld h,c			;00d4	61		a
	or a			;00d5	b7		.
	ld h,a			;00d6	67		g
	and (hl)		;00d7	a6		.
	dec de			;00d8	1b		.
	or l			;00d9	b5		.
	bit 6,(hl)		;00da	cb 76		. v
	cp c			;00dc	b9		.
	dec e			;00dd	1d		.
	ld d,(hl)		;00de	56		V
	and h			;00df	a4		.
	ret z			;00e0	c8		.
	or h			;00e1	b4		.
	jr nc,l014ch		;00e2	30 68		0 h
	inc b			;00e4	04		.
	ld a,(de)		;00e5	1a		.
	ld h,0aeh		;00e6	26 ae		& .
	ld (hl),c		;00e8	71		q
	jp pe,0c653h		;00e9	ea 53 c6	. S .
	ld (hl),a		;00ec	77		w
	or l			;00ed	b5		.
	ld e,a			;00ee	5f		_
	rrca			;00ef	0f		.
	xor 0b7h		;00f0	ee b7		. .
	jp 03d22h		;00f2	c3 22 3d	. " =
	adc a,h			;00f5	8c		.
	jr nz,l0084h		;00f6	20 8c		  .
	sub b			;00f8	90		.
	jp po,09575h		;00f9	e2 75 95	. u .
	ccf			;00fc	3f		?
	ld c,0f3h		;00fd	0e f3		. .
	xor e			;00ff	ab		.

; BLOCK 'test_bytedata' (start 0x0100 end 0x0200)
test_bytedata_start:
	defb 078h		;0100	78		x
	defb 02ch		;0101	2c		,
	defb 058h		;0102	58		X
	defb 0b3h		;0103	b3		.
	defb 00ch		;0104	0c		.
	defb 087h		;0105	87		.
	defb 07dh		;0106	7d		}
	defb 03bh		;0107	3b		;
	defb 0fdh		;0108	fd		.
	defb 0fah		;0109	fa		.
	defb 0bdh		;010a	bd		.
	defb 047h		;010b	47		G
	defb 028h		;010c	28		(
	defb 0cbh		;010d	cb		.
	defb 00ch		;010e	0c		.
	defb 0e3h		;010f	e3		.
	defb 0bfh		;0110	bf		.
	defb 04eh		;0111	4e		N
	defb 05ah		;0112	5a		Z
	defb 031h		;0113	31		1
	defb 01fh		;0114	1f		.
	defb 00ch		;0115	0c		.
	defb 055h		;0116	55		U
	defb 0f4h		;0117	f4		.
	defb 090h		;0118	90		.
	defb 063h		;0119	63		c
	defb 02ch		;011a	2c		,
	defb 0e5h		;011b	e5		.
	defb 05bh		;011c	5b		[
	defb 077h		;011d	77		w
	defb 017h		;011e	17		.
	defb 0e5h		;011f	e5		.
	defb 0dch		;0120	dc		.
	defb 00ah		;0121	0a		.
	defb 0b1h		;0122	b1		.
	defb 0e8h		;0123	e8		.
	defb 0f2h		;0124	f2		.
	defb 0bbh		;0125	bb		.
	defb 0c5h		;0126	c5		.
	defb 0bah		;0127	ba		.
	defb 025h		;0128	25		%
	defb 0bah		;0129	ba		.
	defb 05dh		;012a	5d		]
	defb 04ch		;012b	4c		L
	defb 021h		;012c	21		!
	defb 081h		;012d	81		.
	defb 000h		;012e	00		.
	defb 060h		;012f	60		`
	defb 04fh		;0130	4f		O
	defb 01ah		;0131	1a		.
	defb 0a7h		;0132	a7		.
	defb 0e9h		;0133	e9		.
	defb 0afh		;0134	af		.
	defb 082h		;0135	82		.
	defb 0a2h		;0136	a2		.
l0137h:
	defb 065h		;0137	65		e
	defb 08bh		;0138	8b		.
	defb 0ebh		;0139	eb		.
	defb 020h		;013a	20		 
	defb 0d9h		;013b	d9		.
	defb 03fh		;013c	3f		?
	defb 0bfh		;013d	bf		.
	defb 0eeh		;013e	ee		.
	defb 062h		;013f	62		b
	defb 063h		;0140	63		c
	defb 0ffh		;0141	ff		.
	defb 0d7h		;0142	d7		.
	defb 071h		;0143	71		q
	defb 029h		;0144	29		)
	defb 0bch		;0145	bc		.
	defb 040h		;0146	40		@
	defb 03bh		;0147	3b		;
	defb 047h		;0148	47		G
	defb 0b2h		;0149	b2		.
	defb 0d4h		;014a	d4		.
	defb 060h		;014b	60		`
l014ch:
	defb 02fh		;014c	2f		/
	defb 0d5h		;014d	d5		.
	defb 074h		;014e	74		t
	defb 010h		;014f	10		.
	defb 06bh		;0150	6b		k
	defb 074h		;0151	74		t
	defb 020h		;0152	20		 
	defb 08dh		;0153	8d		.
	defb 0f1h		;0154	f1		.
	defb 035h		;0155	35		5
	defb 0b0h		;0156	b0		.
	defb 0d1h		;0157	d1		.
	defb 094h		;0158	94		.
	defb 01ch		;0159	1c		.
	defb 028h		;015a	28		(
	defb 07eh		;015b	7e		~
	defb 079h		;015c	79		y
	defb 0abh		;015d	ab		.
	defb 019h		;015e	19		.
	defb 015h		;015f	15		.
	defb 058h		;0160	58		X
	defb 002h		;0161	02		.
	defb 016h		;0162	16		.
	defb 060h		;0163	60		`
	defb 044h		;0164	44		D
	defb 003h		;0165	03		.
	defb 0efh		;0166	ef		.
	defb 0a4h		;0167	a4		.
	defb 09fh		;0168	9f		.
	defb 0cbh		;0169	cb		.
	defb 039h		;016a	39		9
	defb 06ch		;016b	6c		l
	defb 0b5h		;016c	b5		.
	defb 0bdh		;016d	bd		.
	defb 02fh		;016e	2f		/
	defb 09fh		;016f	9f		.
	defb 02ah		;0170	2a		*
	defb 026h		;0171	26		&
	defb 06ah		;0172	6a		j
	defb 03ah		;0173	3a		:
	defb 01eh		;0174	1e		.
	defb 08eh		;0175	8e		.
	defb 01bh		;0176	1b		.
	defb 0ach		;0177	ac		.
	defb 03eh		;0178	3e		>
	defb 013h		;0179	13		.
	defb 069h		;017a	69		i
sub_017bh:
	defb 0c1h		;017b	c1		.
	defb 0e1h		;017c	e1		.
	defb 0e4h		;017d	e4		.
	defb 0a6h		;017e	a6		.
	defb 0b2h		;017f	b2		.
	defb 025h		;0180	25		%
	defb 019h		;0181	19		.
	defb 062h		;0182	62		b
	defb 0d8h		;0183	d8		.
	defb 0eah		;0184	ea		.
	defb 070h		;0185	70		p
	defb 02fh		;0186	2f		/
	defb 087h		;0187	87		.
	defb 0fah		;0188	fa		.
	defb 0e1h		;0189	e1		.
	defb 095h		;018a	95		.
	defb 0cah		;018b	ca		.
	defb 083h		;018c	83		.
	defb 02bh		;018d	2b		+
	defb 087h		;018e	87		.
	defb 084h		;018f	84		.
	defb 063h		;0190	63		c
	defb 063h		;0191	63		c
	defb 0dch		;0192	dc		.
	defb 08fh		;0193	8f		.
	defb 0fah		;0194	fa		.
	defb 01ah		;0195	1a		.
	defb 0f2h		;0196	f2		.
	defb 046h		;0197	46		F
	defb 03eh		;0198	3e		>
	defb 024h		;0199	24		$
	defb 005h		;019a	05		.
	defb 058h		;019b	58		X
	defb 01fh		;019c	1f		.
	defb 0c5h		;019d	c5		.
	defb 0f8h		;019e	f8		.
	defb 0a7h		;019f	a7		.
	defb 01dh		;01a0	1d		.
	defb 089h		;01a1	89		.
	defb 0f9h		;01a2	f9		.
	defb 0b1h		;01a3	b1		.
	defb 067h		;01a4	67		g
	defb 076h		;01a5	76		v
	defb 0cbh		;01a6	cb		.
	defb 06ah		;01a7	6a		j
	defb 069h		;01a8	69		i
	defb 00ah		;01a9	0a		.
	defb 021h		;01aa	21		!
	defb 0abh		;01ab	ab		.
	defb 074h		;01ac	74		t
	defb 05bh		;01ad	5b		[
	defb 025h		;01ae	25		%
	defb 0dfh		;01af	df		.
	defb 074h		;01b0	74		t
	defb 0c5h		;01b1	c5		.
	defb 0bah		;01b2	ba		.
	defb 0ach		;01b3	ac		.
	defb 01fh		;01b4	1f		.
	defb 006h		;01b5	06		.
	defb 034h		;01b6	34		4
	defb 017h		;01b7	17		.
	defb 0d0h		;01b8	d0		.
	defb 056h		;01b9	56		V
	defb 09eh		;01ba	9e		.
	defb 011h		;01bb	11		.
	defb 0c3h		;01bc	c3		.
	defb 074h		;01bd	74		t
	defb 07fh		;01be	7f		.
	defb 026h		;01bf	26		&
	defb 0b3h		;01c0	b3		.
	defb 042h		;01c1	42		B
	defb 0bdh		;01c2	bd		.
	defb 099h		;01c3	99		.
	defb 056h		;01c4	56		V
	defb 075h		;01c5	75		u
	defb 037h		;01c6	37		7
	defb 0dfh		;01c7	df		.
	defb 0bdh		;01c8	bd		.
	defb 0d0h		;01c9	d0		.
	defb 0e4h		;01ca	e4		.
	defb 023h		;01cb	23		#
	defb 03dh		;01cc	3d		=
	defb 0feh		;01cd	fe		.
	defb 014h		;01ce	14		.
	defb 042h		;01cf	42		B
	defb 0afh		;01d0	af		.
	defb 073h		;01d1	73		s
	defb 0c4h		;01d2	c4		.
	defb 0f3h		;01d3	f3		.
	defb 03eh		;01d4	3e		>
	defb 091h		;01d5	91		.
	defb 086h		;01d6	86		.
	defb 0bch		;01d7	bc		.
	defb 0cbh		;01d8	cb		.
	defb 035h		;01d9	35		5
	defb 0deh		;01da	de		.
	defb 075h		;01db	75		u
	defb 067h		;01dc	67		g
	defb 05eh		;01dd	5e		^
	defb 0bdh		;01de	bd		.
	defb 0e4h		;01df	e4		.
	defb 0f3h		;01e0	f3		.
	defb 0beh		;01e1	be		.
	defb 01bh		;01e2	1b		.
	defb 05fh		;01e3	5f		_
	defb 063h		;01e4	63		c
	defb 036h		;01e5	36		6
	defb 0eah		;01e6	ea		.
	defb 030h		;01e7	30		0
	defb 0cfh		;01e8	cf		.
	defb 046h		;01e9	46		F
	defb 02dh		;01ea	2d		-
	defb 090h		;01eb	90		.
	defb 065h		;01ec	65		e
	defb 0dch		;01ed	dc		.
	defb 099h		;01ee	99		.
	defb 09fh		;01ef	9f		.
	defb 0a7h		;01f0	a7		.
	defb 00ch		;01f1	0c		.
	defb 094h		;01f2	94		.
	defb 009h		;01f3	09		.
	defb 0bbh		;01f4	bb		.
	defb 0a9h		;01f5	a9		.
	defb 036h		;01f6	36		6
	defb 064h		;01f7	64		d
	defb 007h		;01f8	07		.
	defb 017h		;01f9	17		.
	defb 086h		;01fa	86		.
	defb 0e1h		;01fb	e1		.
	defb 0c8h		;01fc	c8		.
	defb 09fh		;01fd	9f		.
	defb 066h		;01fe	66		f
	defb 0a4h		;01ff	a4		.
test_bytedata_end:

; BLOCK 'test_worddata' (start 0x0200 end 0x0300)
test_worddata_start:
	defw 0d75eh		;0200	5e d7		^ .
	defw 0ea28h		;0202	28 ea		( .
	defw 02645h		;0204	45 26		E &
	defw 0923eh		;0206	3e 92		> .
	defw 00c5ah		;0208	5a 0c		Z .
	defw 0ebc6h		;020a	c6 eb		. .
	defw 0e318h		;020c	18 e3		. .
	defw 03cefh		;020e	ef 3c		. <
	defw 0903fh		;0210	3f 90		? .
	defw 0b9c7h		;0212	c7 b9		. .
	defw 01347h		;0214	47 13		G .
	defw 00e84h		;0216	84 0e		. .
	defw 08fdeh		;0218	de 8f		. .
	defw 01a6dh		;021a	6d 1a		m .
	defw 0e96dh		;021c	6d e9		m .
	defw 0d182h		;021e	82 d1		. .
	defw 0d017h		;0220	17 d0		. .
	defw 09a5ch		;0222	5c 9a		\ .
	defw 02a89h		;0224	89 2a		. *
	defw 096e6h		;0226	e6 96		. .
	defw 05b16h		;0228	16 5b		. [
	defw 00606h		;022a	06 06		. .
	defw 0d361h		;022c	61 d3		a .
	defw 08e00h		;022e	00 8e		. .
	defw 0d1d9h		;0230	d9 d1		. .
	defw 0e839h		;0232	39 e8		9 .
	defw 093adh		;0234	ad 93		. .
	defw 06113h		;0236	13 61		. a
	defw 08f80h		;0238	80 8f		. .
	defw 00b74h		;023a	74 0b		t .
	defw 0c69eh		;023c	9e c6		. .
	defw 09342h		;023e	42 93		B .
	defw 067d7h		;0240	d7 67		. g
	defw 05953h		;0242	53 59		S Y
	defw 05299h		;0244	99 52		. R
	defw 02b37h		;0246	37 2b		7 +
	defw 0c5bah		;0248	ba c5		. .
	defw 0dd73h		;024a	73 dd		s .
	defw 00416h		;024c	16 04		. .
	defw 09cfdh		;024e	fd 9c		. .
	defw 0dd43h		;0250	43 dd		C .
	defw 0c606h		;0252	06 c6		. .
	defw 0ad38h		;0254	38 ad		8 .
	defw 03b94h		;0256	94 3b		. ;
	defw 074fbh		;0258	fb 74		. t
	defw 0c433h		;025a	33 c4		3 .
	defw 0baf8h		;025c	f8 ba		. .
	defw 08ef2h		;025e	f2 8e		. .
	defw 01066h		;0260	66 10		f .
	defw 07c19h		;0262	19 7c		. |
	defw 0140fh		;0264	0f 14		. .
	defw 06a17h		;0266	17 6a		. j
	defw 0963bh		;0268	3b 96		; .
	defw 0e1adh		;026a	ad e1		. .
	defw 083d2h		;026c	d2 83		. .
	defw 01a1fh		;026e	1f 1a		. .
	defw 0e07ch		;0270	7c e0		| .
	defw 00a34h		;0272	34 0a		4 .
	defw 0a5dah		;0274	da a5		. .
	defw 0af58h		;0276	58 af		X .
	defw 09574h		;0278	74 95		t .
	defw 0ede6h		;027a	e6 ed		. .
	defw 0bb69h		;027c	69 bb		i .
	defw 0816dh		;027e	6d 81		m .
	defw 08d9bh		;0280	9b 8d		. .
	defw 0ec48h		;0282	48 ec		H .
	defw 0d651h		;0284	51 d6		Q .
	defw 050cah		;0286	ca 50		. P
	defw 04984h		;0288	84 49		. I
	defw 0fad6h		;028a	d6 fa		. .
	defw 0d945h		;028c	45 d9		E .
	defw 08f09h		;028e	09 8f		. .
	defw 0be3ah		;0290	3a be		: .
	defw 03f1ch		;0292	1c 3f		. ?
	defw 0b110h		;0294	10 b1		. .
	defw 04174h		;0296	74 41		t A
	defw 06be1h		;0298	e1 6b		. k
	defw 09960h		;029a	60 99		` .
	defw 07b72h		;029c	72 7b		r {
	defw 03627h		;029e	27 36		' 6
	defw 04be2h		;02a0	e2 4b		. K
	defw 0e968h		;02a2	68 e9		h .
	defw 0e3ddh		;02a4	dd e3		. .
	defw 062ach		;02a6	ac 62		. b
	defw 03b2fh		;02a8	2f 3b		/ ;
	defw 0dee1h		;02aa	e1 de		. .
	defw 0935eh		;02ac	5e 93		^ .
	defw 04731h		;02ae	31 47		1 G
	defw 0c115h		;02b0	15 c1		. .
	defw 013a7h		;02b2	a7 13		. .
	defw 06d75h		;02b4	75 6d		u m
	defw 0b882h		;02b6	82 b8		. .
	defw 0fa22h		;02b8	22 fa		" .
	defw 050bfh		;02ba	bf 50		. P
	defw 084a7h		;02bc	a7 84		. .
	defw 041dfh		;02be	df 41		. A
	defw 05b34h		;02c0	34 5b		4 [
	defw 0d62fh		;02c2	2f d6		/ .
	defw 061adh		;02c4	ad 61		. a
	defw 02f35h		;02c6	35 2f		5 /
	defw 062f3h		;02c8	f3 62		. b
	defw 00a5ah		;02ca	5a 0a		Z .
	defw 0b0a0h		;02cc	a0 b0		. .
	defw 00d86h		;02ce	86 0d		. .
	defw 0f6d4h		;02d0	d4 f6		. .
	defw 0a95ch		;02d2	5c a9		\ .
	defw 04323h		;02d4	23 43		# C
	defw 0f606h		;02d6	06 f6		. .
	defw 0b308h		;02d8	08 b3		. .
	defw 08d9dh		;02da	9d 8d		. .
	defw 0e864h		;02dc	64 e8		d .
	defw 0e8d7h		;02de	d7 e8		. .
	defw 0f8beh		;02e0	be f8		. .
	defw 0aefbh		;02e2	fb ae		. .
	defw 07fedh		;02e4	ed 7f		. .
	defw 0dc31h		;02e6	31 dc		1 .
	defw 0097ch		;02e8	7c 09		| .
	defw 0676dh		;02ea	6d 67		m g
	defw 04d24h		;02ec	24 4d		$ M
	defw 0ad8ch		;02ee	8c ad		. .
	defw 0d89eh		;02f0	9e d8		. .
	defw 0159ah		;02f2	9a 15		. .
	defw 0555ah		;02f4	5a 55		Z U
	defw 09c80h		;02f6	80 9c		. .
	defw 0b721h		;02f8	21 b7		! .
	defw 037f1h		;02fa	f1 37		. 7
	defw 0226bh		;02fc	6b 22		k "
	defw 04972h		;02fe	72 49		r I
test_worddata_end:

; BLOCK 'test_code' (start 0x0300 end 0x0500)
test_code_start:
	djnz l0306h		;0300	10 04		. .
	ld a,h			;0302	7c		|
	inc bc			;0303	03		.
	and l			;0304	a5		.
	inc b			;0305	04		.
l0306h:
	ld e,004h		;0306	1e 04		. .
	nop			;0308	00		.
	ld (bc),a		;0309	02		.
	nop			;030a	00		.
	inc bc			;030b	03		.
	nop			;030c	00		.
	ld bc,test_pointers_end	;030d	01 10 04	. . .
	ld h,c			;0310	61		a
	dec sp			;0311	3b		;
	in a,(0dbh)		;0312	db db		. .
	cp 013h			;0314	fe 13		. .
	dec hl			;0316	2b		+
	rst 10h			;0317	d7		.
	ret z			;0318	c8		.
	sbc a,(hl)		;0319	9e		.
	inc c			;031a	0c		.
	ld (hl),b		;031b	70		p
	adc a,a			;031c	8f		.
	sbc a,h			;031d	9c		.
	ld h,l			;031e	65		e
	sub 01dh		;031f	d6 1d		. .
	jp pe,l0ce7h		;0321	ea e7 0c	. . .
	inc de			;0324	13		.
	ld (hl),e		;0325	73		s
	ret pe			;0326	e8		.
	ld d,b			;0327	50		P
	xor b			;0328	a8		.
	adc a,c			;0329	89		.
	ld e,c			;032a	59		Y
	adc a,a			;032b	8f		.
	ret nz			;032c	c0		.
	ld c,e			;032d	4b		K
	rst 0			;032e	c7		.
	cp e			;032f	bb		.
	inc d			;0330	14		.
	ld d,h			;0331	54		T
	cpl			;0332	2f		/
	xor l			;0333	ad		.
	xor e			;0334	ab		.
	add a,h			;0335	84		.
	cp (hl)			;0336	be		.
	ld hl,(0d8f3h)		;0337	2a f3 d8	* . .
	ld a,(bc)		;033a	0a		.
	xor c			;033b	a9		.
	ld a,h			;033c	7c		|
	ld b,d			;033d	42		B
	ld l,l			;033e	6d		m
	or d			;033f	b2		.
	ld d,h			;0340	54		T
	ld e,d			;0341	5a		Z
	ld a,a			;0342	7f		.
	jp nz,0442bh		;0343	c2 2b 44	. + D
	ex af,af'		;0346	08		.
	rst 10h			;0347	d7		.
	or d			;0348	b2		.
	add a,e			;0349	83		.
	jp pe,08f86h		;034a	ea 86 8f	. . .
	ld d,e			;034d	53		S
	ld h,c			;034e	61		a
	and c			;034f	a1		.
	inc b			;0350	04		.
	jp po,058dbh		;0351	e2 db 58	. . X
	ld l,l			;0354	6d		m
	pop hl			;0355	e1		.
	sbc a,(hl)		;0356	9e		.
	call z,09ea5h		;0357	cc a5 9e	. . .
	and h			;035a	a4		.
	ld a,(de)		;035b	1a		.
	ld e,h			;035c	5c		\
	ld (hl),h		;035d	74		t
	and b			;035e	a0		.
	ld (hl),d		;035f	72		r
	xor a			;0360	af		.
	inc a			;0361	3c		<
	ld e,d			;0362	5a		Z
	adc a,l			;0363	8d		.
	adc a,006h		;0364	ce 06		. .
	or 00dh			;0366	f6 0d		. .
	adc a,a			;0368	8f		.
	sbc a,h			;0369	9c		.
	ld a,(de)		;036a	1a		.
	ld a,(0a2a6h)		;036b	3a a6 a2	: . .
	ld a,a			;036e	7f		.
	inc hl			;036f	23		#
	and l			;0370	a5		.
	inc de			;0371	13		.
	rst 0			;0372	c7		.
	jp 0b3d2h		;0373	c3 d2 b3	. . .
	sub c			;0376	91		.
	ld d,d			;0377	52		R
	ld b,0f1h		;0378	06 f1		. .
	ld hl,(0d753h)		;037a	2a 53 d7	* S .
	ld e,c			;037d	59		Y
	jp (hl)			;037e	e9		.
	djnz l03f8h		;037f	10 77		. w
	xor d			;0381	aa		.
	add a,a			;0382	87		.
	cp (hl)			;0383	be		.
	add a,e			;0384	83		.
	pop bc			;0385	c1		.
	call nz,0bce0h		;0386	c4 e0 bc	. . .
	exx			;0389	d9		.
	ld d,l			;038a	55		U
	adc a,d			;038b	8a		.
	add a,c			;038c	81		.
	ld (hl),e		;038d	73		s
	and l			;038e	a5		.
	ei			;038f	fb		.
	ld c,d			;0390	4a		J
	call nc,01d57h		;0391	d4 57 1d	. W .
	ld e,025h		;0394	1e 25		. %
	ret po			;0396	e0		.
	djnz $-5		;0397	10 f9		. .
	rst 38h			;0399	ff		.
	ld c,d			;039a	4a		J
	inc bc			;039b	03		.
	dec b			;039c	05		.
	sub c			;039d	91		.
	ld a,094h		;039e	3e 94		> .
	ld b,b			;03a0	40		@
	rst 38h			;03a1	ff		.
	ld d,d			;03a2	52		R
	adc a,087h		;03a3	ce 87		. .
	dec bc			;03a5	0b		.
	ld d,e			;03a6	53		S
	push bc			;03a7	c5		.
	jp 09c23h		;03a8	c3 23 9c	. # .
	xor (hl)		;03ab	ae		.
	ret pe			;03ac	e8		.
	dec hl			;03ad	2b		+
	sbc a,(hl)		;03ae	9e		.
	defb 0edh ;next byte illegal after ed	;03af	ed		.
	nop			;03b0	00		.
	ld c,l			;03b1	4d		M
	call m,09e8ch		;03b2	fc 8c 9e	. . .
	sub l			;03b5	95		.
	inc e			;03b6	1c		.
	add hl,de		;03b7	19		.
	out (0ebh),a		;03b8	d3 eb		. .
	jp po,0e63ch		;03ba	e2 3c e6	. < .
	ld a,a			;03bd	7f		.
	ld l,d			;03be	6a		j
	sbc a,a			;03bf	9f		.
	ld l,e			;03c0	6b		k
	dec e			;03c1	1d		.
	sbc a,h			;03c2	9c		.
	and a			;03c3	a7		.
	or h			;03c4	b4		.
	ld a,(hl)		;03c5	7e		~
	xor l			;03c6	ad		.
	ld (hl),e		;03c7	73		s
	dec sp			;03c8	3b		;
	ld (hl),h		;03c9	74		t
	xor e			;03ca	ab		.
	ld (hl),d		;03cb	72		r
	adc a,d			;03cc	8a		.
	dec d			;03cd	15		.
	ld (hl),c		;03ce	71		q
	jp p,0dc1bh		;03cf	f2 1b dc	. . .
	ld (hl),a		;03d2	77		w
	call 03db5h		;03d3	cd b5 3d	. . =
	ld b,h			;03d6	44		D
	ld e,02bh		;03d7	1e 2b		. +
	cp a			;03d9	bf		.
	inc (hl)		;03da	34		4
	or a			;03db	b7		.
	jp po,0dc47h		;03dc	e2 47 dc	. G .
	ld (de),a		;03df	12		.
	xor d			;03e0	aa		.
	adc a,a			;03e1	8f		.
	rst 28h			;03e2	ef		.
	jp z,0778bh		;03e3	ca 8b 77	. . w
	ld h,a			;03e6	67		g
	ret c			;03e7	d8		.
	pop hl			;03e8	e1		.
	jr nz,l043bh		;03e9	20 50		  P
	add a,b			;03eb	80		.
	ret po			;03ec	e0		.
	ld h,c			;03ed	61		a
	sbc a,09fh		;03ee	de 9f		. .
	ld e,0c7h		;03f0	1e c7		. .
	inc c			;03f2	0c		.
	inc a			;03f3	3c		<
	call pe,0d40dh		;03f4	ec 0d d4	. . .
	and d			;03f7	a2		.
l03f8h:
	in a,(0f7h)		;03f8	db f7		. .
	pop hl			;03fa	e1		.
	adc a,a			;03fb	8f		.
	ld c,e			;03fc	4b		K
	ld c,h			;03fd	4c		L
	cp 081h			;03fe	fe 81		. .

; BLOCK 'test_pointers' (start 0x0400 end 0x0410)
test_pointers_start:
	defw 02439h		;0400	39 24		9 $
	defw 096f4h		;0402	f4 96		. .
	defw 066bdh		;0404	bd 66		. f
	defw 0f38ah		;0406	8a f3		. .
	defw 080b2h		;0408	b2 80		. .
	defw 0c52eh		;040a	2e c5		. .
	defw 0c791h		;040c	91 c7		. .
	defw 0ffe7h		;040e	e7 ff		. .
test_pointers_end:
	call z,05a78h		;0410	cc 78 5a	. x Z
	jp p,035f6h		;0413	f2 f6 35	. . 5
	ld a,(02eb6h)		;0416	3a b6 2e	: . .
	defb 0fdh,0bdh ;cp iyl	;0419	fd bd		. .
	rla			;041b	17		.
	rst 18h			;041c	df		.
	ld b,e			;041d	43		C
	sub e			;041e	93		.
	and 014h		;041f	e6 14		. .
	sub h			;0421	94		.
	jp pe,l0982h		;0422	ea 82 09	. . .
	ld l,c			;0425	69		i
	jp po,024d8h		;0426	e2 d8 24	. . $
	call c,053a5h		;0429	dc a5 53	. . S
	ld c,h			;042c	4c		L
	inc hl			;042d	23		#
	inc b			;042e	04		.
	rst 10h			;042f	d7		.
	dec c			;0430	0d		.
	xor b			;0431	a8		.
	pop af			;0432	f1		.
	or e			;0433	b3		.
	rst 8			;0434	cf		.
	jp m,0def8h		;0435	fa f8 de	. . .
	inc b			;0438	04		.
	sbc a,0e7h		;0439	de e7		. .
l043bh:
	ld a,(hl)		;043b	7e		~
	out (04dh),a		;043c	d3 4d		. M
	add hl,hl		;043e	29		)
	and a			;043f	a7		.
	rst 38h			;0440	ff		.
	sub (hl)		;0441	96		.
	dec a			;0442	3d		=
	ld h,e			;0443	63		c
	cp a			;0444	bf		.
	jr c,l04bbh		;0445	38 74		8 t
	exx			;0447	d9		.
	ret pe			;0448	e8		.
	di			;0449	f3		.
	ld e,013h		;044a	1e 13		. .
	ld c,d			;044c	4a		J
	ld d,h			;044d	54		T
	sbc a,c			;044e	99		.
	and l			;044f	a5		.
	call z,0930bh		;0450	cc 0b 93	. . .
	add a,e			;0453	83		.
	sub h			;0454	94		.
	ld d,01dh		;0455	16 1d		. .
	ld c,l			;0457	4d		M
	ret c			;0458	d8		.
	add hl,sp		;0459	39		9
	ld a,a			;045a	7f		.
	cp l			;045b	bd		.
	ld h,d			;045c	62		b
	jr c,l04a5h		;045d	38 46		8 F
	sbc a,(hl)		;045f	9e		.
	ld h,e			;0460	63		c
	ld (hl),a		;0461	77		w
	adc a,e			;0462	8b		.
	or c			;0463	b1		.
	ld a,l			;0464	7d		}
	dec de			;0465	1b		.
	add a,e			;0466	83		.
	ld b,021h		;0467	06 21		. !
	jp 0de85h		;0469	c3 85 de	. . .
	call p,04410h		;046c	f4 10 44	. . D
	rst 20h			;046f	e7		.
	nop			;0470	00		.
	ex af,af'		;0471	08		.
	ld h,l			;0472	65		e
	dec b			;0473	05		.
	rla			;0474	17		.
	or l			;0475	b5		.
	adc a,b			;0476	88		.
	sub 0ffh		;0477	d6 ff		. .
	xor h			;0479	ac		.
	inc b			;047a	04		.
	ex de,hl		;047b	eb		.
	or b			;047c	b0		.
	ei			;047d	fb		.
	cp h			;047e	bc		.
	ld d,a			;047f	57		W
	ld h,a			;0480	67		g
	sub a			;0481	97		.
	ret z			;0482	c8		.
	daa			;0483	27		'
	ld c,00ch		;0484	0e 0c		. .
	inc a			;0486	3c		<
	ei			;0487	fb		.
	or c			;0488	b1		.
	ld a,h			;0489	7c		|
	ld c,d			;048a	4a		J
	ld h,010h		;048b	26 10		& .
	add a,(hl)		;048d	86		.
	ld b,b			;048e	40		@
	ret c			;048f	d8		.
	in a,(055h)		;0490	db 55		. U
	ld c,l			;0492	4d		M
	cp l			;0493	bd		.
	sub e			;0494	93		.
	or (hl)			;0495	b6		.
	ld c,a			;0496	4f		O
	push hl			;0497	e5		.
	sub l			;0498	95		.
	rst 0			;0499	c7		.
	dec h			;049a	25		%
	ld b,(hl)		;049b	46		F
	add a,023h		;049c	c6 23		. #
	ld (hl),c		;049e	71		q
	ld l,e			;049f	6b		k
	halt			;04a0	76		v
	ld sp,hl		;04a1	f9		.
	xor (hl)		;04a2	ae		.
	ld a,(de)		;04a3	1a		.
	ld sp,hl		;04a4	f9		.
l04a5h:
	ld b,e			;04a5	43		C
	ret p			;04a6	f0		.
	nop			;04a7	00		.
	sub e			;04a8	93		.
	xor (hl)		;04a9	ae		.
	push af			;04aa	f5		.
	jr z,l052ch		;04ab	28 7f		( .
	ex (sp),hl		;04ad	e3		.
	jp c,04b97h		;04ae	da 97 4b	. . K
	dec c			;04b1	0d		.
	call z,0d01dh		;04b2	cc 1d d0	. . .
	add a,b			;04b5	80		.
	ld e,c			;04b6	59		Y
	cp l			;04b7	bd		.
	ld a,b			;04b8	78		x
	ld (hl),l		;04b9	75		u
	ld (hl),d		;04ba	72		r
l04bbh:
	call po,06965h		;04bb	e4 65 69	. e i
	ld e,h			;04be	5c		\
	ld c,c			;04bf	49		I
	adc a,a			;04c0	8f		.
	cp e			;04c1	bb		.
	ld a,l			;04c2	7d		}
	ld (de),a		;04c3	12		.
	ld c,l			;04c4	4d		M
l04c5h:
	adc a,0a4h		;04c5	ce a4		. .
	jp (hl)			;04c7	e9		.
	ld c,(hl)		;04c8	4e		N
	ld sp,hl		;04c9	f9		.
	xor a			;04ca	af		.
	and l			;04cb	a5		.
	cp 02bh			;04cc	fe 2b		. +
	adc a,b			;04ce	88		.
	ld b,078h		;04cf	06 78		. x
	ld c,b			;04d1	48		H
	ld e,h			;04d2	5c		\
	jp 024b5h		;04d3	c3 b5 24	. . $
	rst 8			;04d6	cf		.
	sbc a,(hl)		;04d7	9e		.
	ld e,(hl)		;04d8	5e		^
	ld a,e			;04d9	7b		{
	ld e,l			;04da	5d		]
	push bc			;04db	c5		.
	ld h,e			;04dc	63		c
	ld h,l			;04dd	65		e
	ld a,h			;04de	7c		|
	rst 18h			;04df	df		.
	ld d,(hl)		;04e0	56		V
	rrca			;04e1	0f		.
	ret po			;04e2	e0		.
	ex de,hl		;04e3	eb		.
	dec l			;04e4	2d		-
	ld b,0b8h		;04e5	06 b8		. .
	ret p			;04e7	f0		.
	sub (hl)		;04e8	96		.
	ld a,085h		;04e9	3e 85		> .
	or a			;04eb	b7		.
	ld (hl),a		;04ec	77		w
	ld c,d			;04ed	4a		J
	cp a			;04ee	bf		.
	inc l			;04ef	2c		,
	ld l,l			;04f0	6d		m
	ld c,h			;04f1	4c		L
	inc c			;04f2	0c		.
	ld e,d			;04f3	5a		Z
	cp a			;04f4	bf		.
	pop af			;04f5	f1		.
	sbc a,(hl)		;04f6	9e		.
	ld (hl),0a9h		;04f7	36 a9		6 .
	jp c,077a1h		;04f9	da a1 77	. . w
	halt			;04fc	76		v
	add a,b			;04fd	80		.
	defb 0eah,0cfh		;04fe	ea cf		. .
test_code_end:
	ld a,(de)		;0500	1a		.
	sub (hl)		;0501	96		.
	ld (hl),e		;0502	73		s
	jp nz,041b9h		;0503	c2 b9 41	. . A
	ld h,h			;0506	64		d
	ld sp,hl		;0507	f9		.
	adc a,c			;0508	89		.
	xor 09dh		;0509	ee 9d		. .
	dec a			;050b	3d		=
	or b			;050c	b0		.
	jr z,l04c5h		;050d	28 b6		( .
	ret nc			;050f	d0		.
	push af			;0510	f5		.
	or d			;0511	b2		.
	ex af,af'		;0512	08		.
	ret nz			;0513	c0		.
	rrca			;0514	0f		.
	ld (hl),b		;0515	70		p
	or a			;0516	b7		.
	rst 10h			;0517	d7		.
	jp 0b87ah		;0518	c3 7a b8	. z .
	rrca			;051b	0f		.
	out (02fh),a		;051c	d3 2f		. /
	or c			;051e	b1		.
	add a,h			;051f	84		.
	ld c,(hl)		;0520	4e		N
	defb 0fdh,01ah,0fbh ;illegal sequence	;0521	fd 1a fb	. . .
	inc e			;0524	1c		.
	jp p,0151dh		;0525	f2 1d 15	. . .
	xor 0ach		;0528	ee ac		. .
	sbc a,h			;052a	9c		.
	ld (hl),d		;052b	72		r
l052ch:
	push af			;052c	f5		.
	pop de			;052d	d1		.
	rst 38h			;052e	ff		.
	ld e,d			;052f	5a		Z
	inc sp			;0530	33		3
	add a,b			;0531	80		.
	dec h			;0532	25		%
	add hl,hl		;0533	29		)
	jp po,0240dh		;0534	e2 0d 24	. . $
l0537h:
	ld l,d			;0537	6a		j
	ld de,0d005h		;0538	11 05 d0	. . .
	call 036ech		;053b	cd ec 36	. . 6
	sub (hl)		;053e	96		.
	call m,096bfh		;053f	fc bf 96	. . .
	ld h,b			;0542	60		`
	and (hl)		;0543	a6		.
	sbc a,c			;0544	99		.
	cp e			;0545	bb		.
	adc a,055h		;0546	ce 55		. U
	rst 10h			;0548	d7		.
	ld b,l			;0549	45		E
	jp (hl)			;054a	e9		.
	ld h,d			;054b	62		b
	jr z,l0567h		;054c	28 19		( .
	ccf			;054e	3f		?
l054fh:
	ld c,l			;054f	4d		M
	cp (hl)			;0550	be		.
	and d			;0551	a2		.
	inc d			;0552	14		.
	rst 30h			;0553	f7		.
	ld b,d			;0554	42		B
	sub h			;0555	94		.
	ld d,a			;0556	57		W
	ld h,a			;0557	67		g
	add a,e			;0558	83		.
	jr nz,l05b4h		;0559	20 59		  Y
	or h			;055b	b4		.
	adc a,h			;055c	8c		.
	sub 036h		;055d	d6 36		. 6
	rst 38h			;055f	ff		.
	ld l,l			;0560	6d		m
	pop hl			;0561	e1		.
	ret nc			;0562	d0		.
	inc h			;0563	24		$
	ret			;0564	c9		.
	ld (hl),b		;0565	70		p
	ld e,b			;0566	58		X
l0567h:
	ret z			;0567	c8		.
	ld l,b			;0568	68		h
	ld hl,08c1fh		;0569	21 1f 8c	! . .
	adc a,h			;056c	8c		.
	in a,(041h)		;056d	db 41		. A
	ld a,(bc)		;056f	0a		.
	xor e			;0570	ab		.
	ld h,l			;0571	65		e
	set 0,c			;0572	cb c1		. .
	ld l,l			;0574	6d		m
	ld d,h			;0575	54		T
	ld l,011h		;0576	2e 11		. .
	ex de,hl		;0578	eb		.
	xor b			;0579	a8		.
	ld c,l			;057a	4d		M
	ld l,h			;057b	6c		l
	add hl,bc		;057c	09		.
	inc (hl)		;057d	34		4
	add a,h			;057e	84		.
	ld a,(018f9h)		;057f	3a f9 18	: . .
	ld c,l			;0582	4d		M
	ld h,a			;0583	67		g
	di			;0584	f3		.
	adc a,l			;0585	8d		.
	cp l			;0586	bd		.
	add a,b			;0587	80		.
	ld h,d			;0588	62		b
	inc e			;0589	1c		.
	halt			;058a	76		v
	push hl			;058b	e5		.
	rla			;058c	17		.
	dec a			;058d	3d		=
	ld (hl),d		;058e	72		r
	ld d,046h		;058f	16 46		. F
	cp h			;0591	bc		.
	jp 09d67h		;0592	c3 67 9d	. g .
	or b			;0595	b0		.
	xor (hl)		;0596	ae		.
	and a			;0597	a7		.
	xor c			;0598	a9		.
	ld l,c			;0599	69		i
	ld de,09b27h		;059a	11 27 9b	. ' .
	sbc a,c			;059d	99		.
	ld a,d			;059e	7a		z
	ld h,b			;059f	60		`
	ld b,(hl)		;05a0	46		F
	ld c,d			;05a1	4a		J
	jr nz,l0537h		;05a2	20 93		  .
	jp po,099c7h		;05a4	e2 c7 99	. . .
	and b			;05a7	a0		.
	ld (hl),e		;05a8	73		s
	ld h,02bh		;05a9	26 2b		& +
	ld (hl),b		;05ab	70		p
	jr l054fh		;05ac	18 a1		. .
	sbc a,d			;05ae	9a		.
	jp pe,09292h		;05af	ea 92 92	. . .
	rrca			;05b2	0f		.
	ld (bc),a		;05b3	02		.
l05b4h:
	rst 28h			;05b4	ef		.
	ld l,a			;05b5	6f		o
	ret p			;05b6	f0		.
	ld h,h			;05b7	64		d
	out (06bh),a		;05b8	d3 6b		. k
	ld e,017h		;05ba	1e 17		. .
	ld sp,hl		;05bc	f9		.
	or (hl)			;05bd	b6		.
	dec bc			;05be	0b		.
	jr c,$+5		;05bf	38 03		8 .
	ld h,(hl)		;05c1	66		f
	sub e			;05c2	93		.
	ld h,0f4h		;05c3	26 f4		& .
	sub c			;05c5	91		.
	ld e,h			;05c6	5c		\
	ld e,d			;05c7	5a		Z
	rst 18h			;05c8	df		.
	rst 38h			;05c9	ff		.
	ld e,b			;05ca	58		X
	sbc a,(hl)		;05cb	9e		.
	ld d,h			;05cc	54		T
	ld hl,0d280h		;05cd	21 80 d2	! . .
	ld c,0c5h		;05d0	0e c5		. .
	ld a,h			;05d2	7c		|
	inc bc			;05d3	03		.
	rst 20h			;05d4	e7		.
	dec c			;05d5	0d		.
	ld e,0b7h		;05d6	1e b7		. .
	call po,0e102h		;05d8	e4 02 e1	. . .
	inc hl			;05db	23		#
	ret nc			;05dc	d0		.
	ld h,063h		;05dd	26 63		& c
	ret nz			;05df	c0		.
	add a,c			;05e0	81		.
	and b			;05e1	a0		.
	inc (hl)		;05e2	34		4
	pop de			;05e3	d1		.
	ld d,d			;05e4	52		R
	or a			;05e5	b7		.
	inc b			;05e6	04		.
	call po,05e6ah		;05e7	e4 6a 5e	. j ^
	ld h,h			;05ea	64		d
	add a,e			;05eb	83		.
	adc a,e			;05ec	8b		.
	sub 0cah		;05ed	d6 ca		. .
	ld b,d			;05ef	42		B
	sbc a,e			;05f0	9b		.
	push hl			;05f1	e5		.
	ex af,af'		;05f2	08		.
	cp a			;05f3	bf		.
	ret pe			;05f4	e8		.
	sbc a,h			;05f5	9c		.
	jp z,0a3beh		;05f6	ca be a3	. . .
	add hl,sp		;05f9	39		9
	call nz,0b810h		;05fa	c4 10 b8	. . .
	halt			;05fd	76		v
	sbc a,(hl)		;05fe	9e		.
	dec b			;05ff	05		.
	ld d,b			;0600	50		P
	ld e,d			;0601	5a		Z
	and a			;0602	a7		.
	ld l,h			;0603	6c		l
	ld (hl),e		;0604	73		s
	call p,02aa1h		;0605	f4 a1 2a	. . *
	adc a,l			;0608	8d		.
	ld h,l			;0609	65		e
	ld b,a			;060a	47		G
	call po,02076h		;060b	e4 76 20	. v  
	ld a,(hl)		;060e	7e		~
	cpl			;060f	2f		/
	ld b,d			;0610	42		B
	ld b,a			;0611	47		G
	ld e,e			;0612	5b		[
	cp h			;0613	bc		.
	or (hl)			;0614	b6		.
	ld (0f73ah),hl		;0615	22 3a f7	" : .
	sub d			;0618	92		.
	dec h			;0619	25		%
	ld h,e			;061a	63		c
	rla			;061b	17		.
	jr l0650h		;061c	18 32		. 2
	jr z,$-110		;061e	28 90		( .
	jp c,031bch		;0620	da bc 31	. . 1
	jp nc,083f0h		;0623	d2 f0 83	. . .
	rrca			;0626	0f		.
	ld (hl),063h		;0627	36 63		6 c
	and e			;0629	a3		.
	ld d,095h		;062a	16 95		. .
	ld e,c			;062c	59		Y
l062dh:
	ld d,e			;062d	53		S
	ret nc			;062e	d0		.
	dec a			;062f	3d		=
	adc a,l			;0630	8d		.
	ld b,d			;0631	42		B
	call p,0cae7h		;0632	f4 e7 ca	. . .
	inc h			;0635	24		$
	daa			;0636	27		'
	in a,(0beh)		;0637	db be		. .
	xor (hl)		;0639	ae		.
	nop			;063a	00		.
	rst 38h			;063b	ff		.
	ld d,a			;063c	57		W
	jr z,$-108		;063d	28 92		( .
	adc a,0c7h		;063f	ce c7		. .
	ld b,b			;0641	40		@
	ld c,e			;0642	4b		K
	add a,e			;0643	83		.
	sub e			;0644	93		.
	or 0fch			;0645	f6 fc		. .
	ld c,c			;0647	49		I
	jp nz,0a178h		;0648	c2 78 a1	. x .
	sbc a,017h		;064b	de 17		. .
	ld hl,0a5d0h		;064d	21 d0 a5	! . .
l0650h:
	ld l,(hl)		;0650	6e		n
	ex (sp),hl		;0651	e3		.
	ret m			;0652	f8		.
	cp l			;0653	bd		.
	ld h,h			;0654	64		d
	ld a,(hl)		;0655	7e		~
	inc h			;0656	24		$
	dec h			;0657	25		%
	sub a			;0658	97		.
	ld (hl),e		;0659	73		s
	ld b,c			;065a	41		A
	ld e,b			;065b	58		X
	jr nz,l06d1h		;065c	20 73		  s
	ld a,(0e04ch)		;065e	3a 4c e0	: L .
	defb 0fdh,01ah,095h ;illegal sequence	;0661	fd 1a 95	. . .
	cp (hl)			;0664	be		.
	sub h			;0665	94		.
	di			;0666	f3		.
	xor b			;0667	a8		.
	jr nz,l062dh		;0668	20 c3		  .
	ld c,l			;066a	4d		M
	ld d,b			;066b	50		P
	ret z			;066c	c8		.
	add a,b			;066d	80		.
	and (hl)		;066e	a6		.
	ld (08cb9h),hl		;066f	22 b9 8c	" . .
	cp a			;0672	bf		.
	sub a			;0673	97		.
	ld b,h			;0674	44		D
	ld e,070h		;0675	1e 70		. p
	ld de,0c83ah		;0677	11 3a c8	. : .
	rst 18h			;067a	df		.
	djnz $+116		;067b	10 72		. r
	ld l,a			;067d	6f		o
	ld a,e			;067e	7b		{
	ld e,(hl)		;067f	5e		^
	sbc a,b			;0680	98		.
	ld b,l			;0681	45		E
	ld l,a			;0682	6f		o
	ld a,c			;0683	79		y
	ld b,e			;0684	43		C
	rst 20h			;0685	e7		.
	ld a,b			;0686	78		x
	ld d,075h		;0687	16 75		. u
	ld e,l			;0689	5d		]
	jp po,04b37h		;068a	e2 37 4b	. 7 K
	cp c			;068d	b9		.
	ld (hl),b		;068e	70		p
	ld a,d			;068f	7a		z
	rst 20h			;0690	e7		.
	sbc a,h			;0691	9c		.
	ld (013cbh),a		;0692	32 cb 13	2 . .
	cpl			;0695	2f		/
	ld a,(bc)		;0696	0a		.
	cp c			;0697	b9		.
	cp a			;0698	bf		.
	jr $+45			;0699	18 2b		. +
	ld a,(hl)		;069b	7e		~
	in a,(0b5h)		;069c	db b5		. .
	ld c,b			;069e	48		H
	ld e,(hl)		;069f	5e		^
	ld l,l			;06a0	6d		m
	rst 0			;06a1	c7		.
	cp c			;06a2	b9		.
	inc h			;06a3	24		$
	jp nz,099bfh		;06a4	c2 bf 99	. . .
	and e			;06a7	a3		.
	sbc a,e			;06a8	9b		.
	add hl,hl		;06a9	29		)
	dec h			;06aa	25		%
	or e			;06ab	b3		.
	call pe,039a0h		;06ac	ec a0 39	. . 9
	ld e,(hl)		;06af	5e		^
	di			;06b0	f3		.
	ld a,e			;06b1	7b		{
	ld (hl),h		;06b2	74		t
	dec l			;06b3	2d		-
	jp m,020d0h		;06b4	fa d0 20	. .  
	or a			;06b7	b7		.
	ld d,b			;06b8	50		P
	sbc a,060h		;06b9	de 60		. `
	ld b,a			;06bb	47		G
	ld l,058h		;06bc	2e 58		. X
	ld c,a			;06be	4f		O
	nop			;06bf	00		.
	call 05a87h		;06c0	cd 87 5a	. . Z
	xor (hl)		;06c3	ae		.
	sbc a,(hl)		;06c4	9e		.
	jp pe,09426h		;06c5	ea 26 94	. & .
	sbc a,l			;06c8	9d		.
	push hl			;06c9	e5		.
	pop af			;06ca	f1		.
	ld d,c			;06cb	51		Q
	sub a			;06cc	97		.
	ret po			;06cd	e0		.
	exx			;06ce	d9		.
	ret po			;06cf	e0		.
	sub b			;06d0	90		.
l06d1h:
	rst 30h			;06d1	f7		.
	inc b			;06d2	04		.
	ex af,af'		;06d3	08		.
	ccf			;06d4	3f		?
	inc b			;06d5	04		.
	xor d			;06d6	aa		.
	adc a,d			;06d7	8a		.
	ld (de),a		;06d8	12		.
	or a			;06d9	b7		.
	ld c,b			;06da	48		H
	jp nz,06ceah		;06db	c2 ea 6c	. . l
	inc sp			;06de	33		3
	jp nz,038adh		;06df	c2 ad 38	. . 8
	dec h			;06e2	25		%
	ld d,a			;06e3	57		W
	and (hl)		;06e4	a6		.
	ld h,h			;06e5	64		d
	sub d			;06e6	92		.
	ld a,l			;06e7	7d		}
	ld l,l			;06e8	6d		m
	jr nc,l071ch		;06e9	30 31		0 1
	ld d,c			;06eb	51		Q
	add a,l			;06ec	85		.
	ld (de),a		;06ed	12		.
	jp z,01772h		;06ee	ca 72 17	. r .
	ld a,h			;06f1	7c		|
	ld l,(hl)		;06f2	6e		n
	ld d,(hl)		;06f3	56		V
	inc d			;06f4	14		.
	call p,0c84eh		;06f5	f4 4e c8	. N .
	ret po			;06f8	e0		.
	ld c,(hl)		;06f9	4e		N
	jp nc,02d23h		;06fa	d2 23 2d	. # -
	sbc a,b			;06fd	98		.
	ld c,a			;06fe	4f		O
	sub e			;06ff	93		.
	sbc a,(hl)		;0700	9e		.
	ld h,d			;0701	62		b
	jp pe,0a25dh		;0702	ea 5d a2	. ] .
	ld l,e			;0705	6b		k
	call pe,044b9h		;0706	ec b9 44	. . D
	xor b			;0709	a8		.
	add a,b			;070a	80		.
	ld (hl),d		;070b	72		r
	jp (hl)			;070c	e9		.
	sub (hl)		;070d	96		.
	ld h,c			;070e	61		a
	or e			;070f	b3		.
	ret p			;0710	f0		.
	ld b,d			;0711	42		B
	add hl,sp		;0712	39		9
	sub a			;0713	97		.
	rlca			;0714	07		.
	ld b,c			;0715	41		A
	sbc a,a			;0716	9f		.
	sub l			;0717	95		.
	ld hl,07b58h		;0718	21 58 7b	! X {
	sbc a,(hl)		;071b	9e		.
l071ch:
	defb 0edh ;next byte illegal after ed	;071c	ed		.
	ld c,07dh		;071d	0e 7d		. }
	call z,0a074h		;071f	cc 74 a0	. t .
	sbc a,0c0h		;0722	de c0		. .
	sub d			;0724	92		.
	ld e,b			;0725	58		X
	ld l,b			;0726	68		h
	set 0,(hl)		;0727	cb c6		. .
	jp m,l06d1h		;0729	fa d1 06	. . .
	out (02eh),a		;072c	d3 2e		. .
	ret po			;072e	e0		.
	ccf			;072f	3f		?
	or l			;0730	b5		.
	sbc a,d			;0731	9a		.
	jp m,00de9h		;0732	fa e9 0d	. . .
	di			;0735	f3		.
	jp p,0b887h		;0736	f2 87 b8	. . .
	ld c,(hl)		;0739	4e		N
	ld l,a			;073a	6f		o
	rst 0			;073b	c7		.
	ld l,c			;073c	69		i
	add a,c			;073d	81		.
	dec a			;073e	3d		=
	inc sp			;073f	33		3
	adc a,c			;0740	89		.
	ld b,046h		;0741	06 46		. F
	push de			;0743	d5		.
	ld (de),a		;0744	12		.
	inc a			;0745	3c		<
	ld d,a			;0746	57		W
	inc d			;0747	14		.
	ld a,c			;0748	79		y
	rst 30h			;0749	f7		.
	push bc			;074a	c5		.
	dec d			;074b	15		.
	rst 28h			;074c	ef		.
	cp a			;074d	bf		.
	xor a			;074e	af		.
	and b			;074f	a0		.
	rst 38h			;0750	ff		.
	ld b,d			;0751	42		B
	ret			;0752	c9		.
	ld d,a			;0753	57		W
	or l			;0754	b5		.
	ld c,b			;0755	48		H
	dec (hl)		;0756	35		5
	ret pe			;0757	e8		.
	xor d			;0758	aa		.
	ld b,c			;0759	41		A
	and d			;075a	a2		.
	ld a,025h		;075b	3e 25		> %
	xor e			;075d	ab		.
l075eh:
	ld l,d			;075e	6a		j
	ex af,af'		;075f	08		.
	ld (de),a		;0760	12		.
	ld l,e			;0761	6b		k
	sub a			;0762	97		.
	cp l			;0763	bd		.
	nop			;0764	00		.
	pop de			;0765	d1		.
	add a,(hl)		;0766	86		.
	ld c,l			;0767	4d		M
	sbc a,b			;0768	98		.
	inc d			;0769	14		.
	out (020h),a		;076a	d3 20		.  
	dec sp			;076c	3b		;
	ld c,b			;076d	48		H
	ld (hl),b		;076e	70		p
	add hl,de		;076f	19		.
	in a,(0bfh)		;0770	db bf		. .
	call m,07363h		;0772	fc 63 73	. c s
	jp c,0999dh		;0775	da 9d 99	. . .
	dec a			;0778	3d		=
	cp 08bh			;0779	fe 8b		. .
	or 000h			;077b	f6 00		. .
	ld c,c			;077d	49		I
	push hl			;077e	e5		.
	ld b,c			;077f	41		A
	djnz l075eh		;0780	10 dc		. .
	pop de			;0782	d1		.
l0783h:
	call m,04989h		;0783	fc 89 49	. . I
	push bc			;0786	c5		.
	jp z,01b7dh		;0787	ca 7d 1b	. } .
	ld l,(hl)		;078a	6e		n
	ld e,h			;078b	5c		\
	rst 28h			;078c	ef		.
	ld b,b			;078d	40		@
	jr l0783h		;078e	18 f3		. .
	add a,c			;0790	81		.
	ret c			;0791	d8		.
	push af			;0792	f5		.
	ld d,l			;0793	55		U
	ld a,0f6h		;0794	3e f6		> .
	inc bc			;0796	03		.
	jp c,0e416h		;0797	da 16 e4	. . .
	ex de,hl		;079a	eb		.
	rst 10h			;079b	d7		.
	ret po			;079c	e0		.
	ld b,l			;079d	45		E
	ld c,b			;079e	48		H
	ei			;079f	fb		.
	ld c,e			;07a0	4b		K
	adc a,l			;07a1	8d		.
	ld b,h			;07a2	44		D
	call 0f3f0h		;07a3	cd f0 f3	. . .
	ld bc,0646fh		;07a6	01 6f 64	. o d
	jp nz,0e648h		;07a9	c2 48 e6	. H .
	rrca			;07ac	0f		.
	ld h,b			;07ad	60		`
	xor (hl)		;07ae	ae		.
	ld (l0c07h),hl		;07af	22 07 0c	" . .
	dec a			;07b2	3d		=
	and e			;07b3	a3		.
	jp m,0b812h		;07b4	fa 12 b8	. . .
	ld h,c			;07b7	61		a
l07b8h:
	ld (hl),a		;07b8	77		w
	ld h,l			;07b9	65		e
	ret c			;07ba	d8		.
	ld sp,hl		;07bb	f9		.
	and a			;07bc	a7		.
	cp l			;07bd	bd		.
	dec h			;07be	25		%
	sub 0ach		;07bf	d6 ac		. .
	ld h,e			;07c1	63		c
	sbc a,(hl)		;07c2	9e		.
	ld c,e			;07c3	4b		K
	di			;07c4	f3		.
	rst 20h			;07c5	e7		.
	ret m			;07c6	f8		.
	ld h,h			;07c7	64		d
	ld (de),a		;07c8	12		.
	ld e,e			;07c9	5b		[
	or c			;07ca	b1		.
	sbc a,050h		;07cb	de 50		. P
	or d			;07cd	b2		.
	sub (hl)		;07ce	96		.
	or c			;07cf	b1		.
	inc de			;07d0	13		.
	inc h			;07d1	24		$
	rst 8			;07d2	cf		.
	ld (hl),b		;07d3	70		p
	or a			;07d4	b7		.
	ld e,c			;07d5	59		Y
	pop hl			;07d6	e1		.
	adc a,h			;07d7	8c		.
	xor (hl)		;07d8	ae		.
	ld e,l			;07d9	5d		]
l07dah:
	ld (hl),07bh		;07da	36 7b		6 {
	xor l			;07dc	ad		.
	cp a			;07dd	bf		.
	xor (hl)		;07de	ae		.
	add a,d			;07df	82		.
	dec c			;07e0	0d		.
	push hl			;07e1	e5		.
	jp 024a9h		;07e2	c3 a9 24	. . $
	ld e,c			;07e5	59		Y
	ld e,e			;07e6	5b		[
	xor a			;07e7	af		.
	add a,084h		;07e8	c6 84		. .
	ld (hl),002h		;07ea	36 02		6 .
	inc hl			;07ec	23		#
	ld sp,hl		;07ed	f9		.
	ld hl,05204h		;07ee	21 04 52	! . R
	rst 18h			;07f1	df		.
	inc de			;07f2	13		.
	ld a,(de)		;07f3	1a		.
	ld (hl),c		;07f4	71		q
	add a,e			;07f5	83		.
	ld (hl),a		;07f6	77		w
	djnz l07dah		;07f7	10 e1		. .
	ld l,035h		;07f9	2e 35		. 5
	xor h			;07fb	ac		.
	or 0a8h			;07fc	f6 a8		. .
	xor e			;07fe	ab		.
	and h			;07ff	a4		.
	ld c,d			;0800	4a		J
	add a,a			;0801	87		.
	add a,d			;0802	82		.
	add a,l			;0803	85		.
	ld (de),a		;0804	12		.
	halt			;0805	76		v
	ccf			;0806	3f		?
	inc d			;0807	14		.
	cp d			;0808	ba		.
	sub l			;0809	95		.
	ld e,b			;080a	58		X
	ld de,095b5h		;080b	11 b5 95	. . .
	sbc a,e			;080e	9b		.
	sub e			;080f	93		.
	xor (hl)		;0810	ae		.
	add a,e			;0811	83		.
	inc hl			;0812	23		#
	in a,(04bh)		;0813	db 4b		. K
	sbc a,0c8h		;0815	de c8		. .
	rla			;0817	17		.
	add hl,bc		;0818	09		.
	pop af			;0819	f1		.
	ld (bc),a		;081a	02		.
	ld l,(hl)		;081b	6e		n
	ld d,h			;081c	54		T
	dec (hl)		;081d	35		5
	ld h,e			;081e	63		c
l081fh:
	dec a			;081f	3d		=
	dec l			;0820	2d		-
	ld (hl),e		;0821	73		s
	xor 065h		;0822	ee 65		. e
	ld c,a			;0824	4f		O
	djnz l086eh		;0825	10 47		. G
	and e			;0827	a3		.
	dec hl			;0828	2b		+
	inc d			;0829	14		.
	ld d,d			;082a	52		R
	and h			;082b	a4		.
	inc e			;082c	1c		.
	sbc a,c			;082d	99		.
	ld b,045h		;082e	06 45		. E
	inc (hl)		;0830	34		4
	ld a,c			;0831	79		y
	ld bc,05045h		;0832	01 45 50	. E P
	add a,d			;0835	82		.
	out (02bh),a		;0836	d3 2b		. +
	inc (hl)		;0838	34		4
	ld h,a			;0839	67		g
	add a,001h		;083a	c6 01		. .
	ld d,c			;083c	51		Q
	sub 0dbh		;083d	d6 db		. .
	sbc a,d			;083f	9a		.
	ld d,025h		;0840	16 25		. %
	jr nc,l0861h		;0842	30 1d		0 .
	and b			;0844	a0		.
	ld l,c			;0845	69		i
	ld c,d			;0846	4a		J
	add a,a			;0847	87		.
	defb 0fdh,0ebh,050h ;illegal sequence	;0848	fd eb 50	. . P
	ld sp,hl		;084b	f9		.
	jp c,0a793h		;084c	da 93 a7	. . .
	ld h,e			;084f	63		c
	inc d			;0850	14		.
	ld c,c			;0851	49		I
	push bc			;0852	c5		.
	add a,l			;0853	85		.
	jp p,06d1ah		;0854	f2 1a 6d	. . m
	dec c			;0857	0d		.
	ld (098f8h),a		;0858	32 f8 98	2 . .
	dec a			;085b	3d		=
	pop bc			;085c	c1		.
	ld (hl),065h		;085d	36 65		6 e
	ld d,c			;085f	51		Q
	ld d,l			;0860	55		U
l0861h:
	adc a,0ceh		;0861	ce ce		. .
	ld d,d			;0863	52		R
	jr l08a9h		;0864	18 43		. C
	xor d			;0866	aa		.
	ld bc,0eda2h		;0867	01 a2 ed	. . .
	call m,05bc5h		;086a	fc c5 5b	. . [
	ld a,c			;086d	79		y
l086eh:
	ld l,l			;086e	6d		m
	ld d,h			;086f	54		T
	ld a,b			;0870	78		x
	ld h,d			;0871	62		b
	or 061h			;0872	f6 61		. a
	call po,0fa23h		;0874	e4 23 fa	. # .
	ld l,0a3h		;0877	2e a3		. .
	ld a,c			;0879	79		y
	add a,a			;087a	87		.
	adc a,b			;087b	88		.
	dec c			;087c	0d		.
	ld a,c			;087d	79		y
	ld h,e			;087e	63		c
	and a			;087f	a7		.
	ld (hl),h		;0880	74		t
	ld b,a			;0881	47		G
	jr nz,$-36		;0882	20 da		  .
	ld b,e			;0884	43		C
	inc bc			;0885	03		.
	xor b			;0886	a8		.
	adc a,a			;0887	8f		.
	ld e,c			;0888	59		Y
	ld b,e			;0889	43		C
	sub b			;088a	90		.
	and c			;088b	a1		.
	or a			;088c	b7		.
	ld d,(hl)		;088d	56		V
	ld l,(hl)		;088e	6e		n
	inc b			;088f	04		.
	sub l			;0890	95		.
	inc l			;0891	2c		,
	cp (hl)			;0892	be		.
	sbc a,(hl)		;0893	9e		.
	ld (hl),a		;0894	77		w
	ld sp,hl		;0895	f9		.
	rst 38h			;0896	ff		.
	and e			;0897	a3		.
	jp nc,03b14h		;0898	d2 14 3b	. . ;
	or b			;089b	b0		.
	ld h,d			;089c	62		b
	add a,b			;089d	80		.
	ld h,b			;089e	60		`
	exx			;089f	d9		.
	ld (hl),d		;08a0	72		r
	or d			;08a1	b2		.
	ret m			;08a2	f8		.
	ld l,a			;08a3	6f		o
	or 079h			;08a4	f6 79		. y
	ld h,e			;08a6	63		c
	and (hl)		;08a7	a6		.
	ld l,e			;08a8	6b		k
l08a9h:
	rst 10h			;08a9	d7		.
	inc sp			;08aa	33		3
	inc sp			;08ab	33		3
	ld h,0b2h		;08ac	26 b2		& .
	djnz l08f9h		;08ae	10 49		. I
	rrca			;08b0	0f		.
	or b			;08b1	b0		.
	nop			;08b2	00		.
	ld h,e			;08b3	63		c
	ld b,l			;08b4	45		E
	sbc a,c			;08b5	99		.
	add hl,sp		;08b6	39		9
	jr c,l091fh		;08b7	38 66		8 f
	sub h			;08b9	94		.
	daa			;08ba	27		'
	sbc a,h			;08bb	9c		.
	add a,c			;08bc	81		.
	ld a,l			;08bd	7d		}
	ld c,d			;08be	4a		J
	ld sp,0abd3h		;08bf	31 d3 ab	1 . .
	push hl			;08c2	e5		.
	or b			;08c3	b0		.
	and h			;08c4	a4		.
	sub e			;08c5	93		.
	rst 20h			;08c6	e7		.
	ld e,a			;08c7	5f		_
	di			;08c8	f3		.
	jp m,068cbh		;08c9	fa cb 68	. . h
	ld h,d			;08cc	62		b
	ld d,(hl)		;08cd	56		V
	ld b,(hl)		;08ce	46		F
	ld b,d			;08cf	42		B
	push de			;08d0	d5		.
	ld h,b			;08d1	60		`
	inc d			;08d2	14		.
	dec c			;08d3	0d		.
	cp b			;08d4	b8		.
	add a,e			;08d5	83		.
	dec de			;08d6	1b		.
	sbc a,e			;08d7	9b		.
	ld c,a			;08d8	4f		O
	inc a			;08d9	3c		<
	add hl,hl		;08da	29		)
	or e			;08db	b3		.
	defb 0ddh,028h,05ch ;illegal sequence	;08dc	dd 28 5c	. ( \
	ld e,b			;08df	58		X
	xor l			;08e0	ad		.
	xor d			;08e1	aa		.
	jp 08309h		;08e2	c3 09 83	. . .
	adc a,b			;08e5	88		.
	ld b,l			;08e6	45		E
	add a,d			;08e7	82		.
	or b			;08e8	b0		.
	dec de			;08e9	1b		.
	ld l,d			;08ea	6a		j
	inc bc			;08eb	03		.
	ld l,h			;08ec	6c		l
	jp po,0c1e3h		;08ed	e2 e3 c1	. . .
	push hl			;08f0	e5		.
	or c			;08f1	b1		.
	ld l,e			;08f2	6b		k
	ld d,h			;08f3	54		T
	ld d,l			;08f4	55		U
	or c			;08f5	b1		.
	jp m,0d8bdh		;08f6	fa bd d8	. . .
l08f9h:
	ex de,hl		;08f9	eb		.
	inc l			;08fa	2c		,
	ret			;08fb	c9		.
	ret m			;08fc	f8		.
	ex de,hl		;08fd	eb		.
	inc de			;08fe	13		.
	call z,021eah		;08ff	cc ea 21	. . !
	ld c,016h		;0902	0e 16		. .
	xor c			;0904	a9		.
	ld b,l			;0905	45		E
	ex af,af'		;0906	08		.
	ld e,l			;0907	5d		]
	pop de			;0908	d1		.
	sbc a,h			;0909	9c		.
	and c			;090a	a1		.
	in a,(082h)		;090b	db 82		. .
	ld (hl),b		;090d	70		p
	inc d			;090e	14		.
	exx			;090f	d9		.
	ld h,(hl)		;0910	66		f
	ld (04c49h),hl		;0911	22 49 4c	" I L
	jp 023f3h		;0914	c3 f3 23	. . #
	or a			;0917	b7		.
	xor l			;0918	ad		.
	xor a			;0919	af		.
	ld c,b			;091a	48		H
	ld l,(hl)		;091b	6e		n
	ld b,b			;091c	40		@
	add a,b			;091d	80		.
	ret po			;091e	e0		.
l091fh:
	ld h,h			;091f	64		d
	jp po,028c2h		;0920	e2 c2 28	. . (
	jp l0e6bh		;0923	c3 6b 0e	. k .
	rst 18h			;0926	df		.
	ld c,0f6h		;0927	0e f6		. .
	ld b,e			;0929	43		C
	ld c,h			;092a	4c		L
	or h			;092b	b4		.
	jp nz,08e8fh		;092c	c2 8f 8e	. . .
	add a,l			;092f	85		.
	rst 28h			;0930	ef		.
	rst 18h			;0931	df		.
	sub e			;0932	93		.
	adc a,a			;0933	8f		.
	sbc a,h			;0934	9c		.
	ld c,c			;0935	49		I
	add a,b			;0936	80		.
	ld l,l			;0937	6d		m
	sbc a,h			;0938	9c		.
	ld (hl),c		;0939	71		q
	xor (hl)		;093a	ae		.
	halt			;093b	76		v
	inc sp			;093c	33		3
	ld (hl),08eh		;093d	36 8e		6 .
	ld c,09ah		;093f	0e 9a		. .
	ld (03944h),a		;0941	32 44 39	2 D 9
	dec h			;0944	25		%
	ret p			;0945	f0		.
	ex (sp),hl		;0946	e3		.
	ex de,hl		;0947	eb		.
	inc sp			;0948	33		3
	ld e,c			;0949	59		Y
	sbc a,a			;094a	9f		.
	ld c,h			;094b	4c		L
	ld a,b			;094c	78		x
	cp e			;094d	bb		.
	cp h			;094e	bc		.
	add a,028h		;094f	c6 28		. (
	or 08ch			;0951	f6 8c		. .
	rrca			;0953	0f		.
	rlca			;0954	07		.
	sub l			;0955	95		.
	or a			;0956	b7		.
	rst 20h			;0957	e7		.
	ret			;0958	c9		.
	ld a,c			;0959	79		y
	ld b,a			;095a	47		G
	ld l,b			;095b	68		h
	adc a,a			;095c	8f		.
	call pe,0d366h		;095d	ec 66 d3	. f .
	add hl,sp		;0960	39		9
	ld bc,03c68h		;0961	01 68 3c	. h <
	cp b			;0964	b8		.
	rst 10h			;0965	d7		.
	ld h,c			;0966	61		a
	ld l,a			;0967	6f		o
	rst 0			;0968	c7		.
	jp nc,0a590h		;0969	d2 90 a5	. . .
	di			;096c	f3		.
	jp p,018d7h		;096d	f2 d7 18	. . .
	ld (bc),a		;0970	02		.
	inc a			;0971	3c		<
	rst 8			;0972	cf		.
	ld h,d			;0973	62		b
	out (008h),a		;0974	d3 08		. .
	or c			;0976	b1		.
	xor h			;0977	ac		.
	ld l,a			;0978	6f		o
	push bc			;0979	c5		.
	ld e,e			;097a	5b		[
	adc a,(hl)		;097b	8e		.
	defb 0fdh,013h,00fh ;illegal sequence	;097c	fd 13 0f	. . .
	ld b,l			;097f	45		E
	ld e,h			;0980	5c		\
	ld b,c			;0981	41		A
l0982h:
	ld e,l			;0982	5d		]
	ld l,h			;0983	6c		l
	ld h,0b0h		;0984	26 b0		& .
	ex (sp),hl		;0986	e3		.
	ld b,b			;0987	40		@
	jr l09b4h		;0988	18 2a		. *
	ret po			;098a	e0		.
	cp c			;098b	b9		.
	xor l			;098c	ad		.
	ld a,(hl)		;098d	7e		~
	call sub_017bh		;098e	cd 7b 01	. { .
	dec e			;0991	1d		.
	rst 28h			;0992	ef		.
	ret m			;0993	f8		.
	dec (hl)		;0994	35		5
	sbc a,b			;0995	98		.
	push bc			;0996	c5		.
	or d			;0997	b2		.
	ld e,h			;0998	5c		\
	ld c,h			;0999	4c		L
	out (047h),a		;099a	d3 47		. G
	sbc a,e			;099c	9b		.
	and a			;099d	a7		.
	ld d,08ah		;099e	16 8a		. .
	inc d			;09a0	14		.
	inc h			;09a1	24		$
	call z,09861h		;09a2	cc 61 98	. a .
	sbc a,d			;09a5	9a		.
	dec hl			;09a6	2b		+
	rst 20h			;09a7	e7		.
	push hl			;09a8	e5		.
	ld (hl),c		;09a9	71		q
	cp b			;09aa	b8		.
	ld b,(hl)		;09ab	46		F
	adc a,036h		;09ac	ce 36		. 6
	ld h,d			;09ae	62		b
	ex af,af'		;09af	08		.
	and c			;09b0	a1		.
	ex (sp),hl		;09b1	e3		.
	push de			;09b2	d5		.
	ret z			;09b3	c8		.
l09b4h:
	dec h			;09b4	25		%
	sub 072h		;09b5	d6 72		. r
	ld e,l			;09b7	5d		]
	ld c,d			;09b8	4a		J
	ld b,e			;09b9	43		C
	sub e			;09ba	93		.
	djnz $+21		;09bb	10 13		. .
	rst 8			;09bd	cf		.
	ld a,(05a71h)		;09be	3a 71 5a	: q Z
	sub e			;09c1	93		.
	sub d			;09c2	92		.
	add a,b			;09c3	80		.
	sbc a,011h		;09c4	de 11		. .
	ld e,b			;09c6	58		X
	ld (bc),a		;09c7	02		.
	jr nz,$+30		;09c8	20 1c		  .
	or c			;09ca	b1		.
	or 0f0h			;09cb	f6 f0		. .
	add a,(hl)		;09cd	86		.
	inc l			;09ce	2c		,
	xor 063h		;09cf	ee 63		. c
	ret nz			;09d1	c0		.
	sbc a,c			;09d2	99		.
	add a,h			;09d3	84		.
	ld d,d			;09d4	52		R
	ret c			;09d5	d8		.
	ld (hl),a		;09d6	77		w
	pop de			;09d7	d1		.
	ret m			;09d8	f8		.
	add a,e			;09d9	83		.
	adc a,(hl)		;09da	8e		.
	ld (0852dh),a		;09db	32 2d 85	2 - .
	ld a,l			;09de	7d		}
	sub d			;09df	92		.
	ld c,e			;09e0	4b		K
	ld a,(de)		;09e1	1a		.
	inc bc			;09e2	03		.
	add hl,sp		;09e3	39		9
	call nc,05afah		;09e4	d4 fa 5a	. . Z
	call nz,0d4c8h		;09e7	c4 c8 d4	. . .
	inc c			;09ea	0c		.
	ld h,h			;09eb	64		d
	ld a,h			;09ec	7c		|
	sub b			;09ed	90		.
	add a,a			;09ee	87		.
	ld (hl),l		;09ef	75		u
	sub e			;09f0	93		.
	ld l,c			;09f1	69		i
	dec (hl)		;09f2	35		5
	call 060d2h		;09f3	cd d2 60	. . `
	ld h,b			;09f6	60		`
	ld d,d			;09f7	52		R
	ld l,h			;09f8	6c		l
	inc l			;09f9	2c		,
	jp c,01291h		;09fa	da 91 12	. . .
	and b			;09fd	a0		.
	rst 20h			;09fe	e7		.
	or d			;09ff	b2		.
	dec h			;0a00	25		%
	ccf			;0a01	3f		?
	jp nz,0b439h		;0a02	c2 39 b4	. 9 .
	ld a,(bc)		;0a05	0a		.
	ex (sp),hl		;0a06	e3		.
	ld (hl),0e6h		;0a07	36 e6		6 .
	ld d,h			;0a09	54		T
	push af			;0a0a	f5		.
	dec bc			;0a0b	0b		.
	ld e,c			;0a0c	59		Y
	xor (hl)		;0a0d	ae		.
	ld e,(hl)		;0a0e	5e		^
	ld l,c			;0a0f	69		i
	call c,0e0dah		;0a10	dc da e0	. . .
	inc c			;0a13	0c		.
	xor 0dah		;0a14	ee da		. .
	sbc a,b			;0a16	98		.
	add a,e			;0a17	83		.
	ld (hl),l		;0a18	75		u
	dec bc			;0a19	0b		.
	ld hl,(034dfh)		;0a1a	2a df 34	* . 4
	inc sp			;0a1d	33		3
	ccf			;0a1e	3f		?
	sbc a,l			;0a1f	9d		.
	jr nz,l0a34h		;0a20	20 12		  .
	ld l,h			;0a22	6c		l
	add a,e			;0a23	83		.
	sbc a,a			;0a24	9f		.
	call pe,036b4h		;0a25	ec b4 36	. . 6
	add hl,bc		;0a28	09		.
	ld l,h			;0a29	6c		l
	ld a,c			;0a2a	79		y
	adc a,d			;0a2b	8a		.
	di			;0a2c	f3		.
	add a,b			;0a2d	80		.
	cp e			;0a2e	bb		.
	sub b			;0a2f	90		.
	dec a			;0a30	3d		=
	ld b,c			;0a31	41		A
	dec bc			;0a32	0b		.
	ld a,b			;0a33	78		x
l0a34h:
	inc h			;0a34	24		$
	ld e,h			;0a35	5c		\
	add hl,bc		;0a36	09		.
	jr c,$+102		;0a37	38 64		8 d
	ld a,c			;0a39	79		y
l0a3ah:
	rst 30h			;0a3a	f7		.
	jr nz,l0a3ah		;0a3b	20 fd		  .
	ld e,049h		;0a3d	1e 49		. I
	rst 8			;0a3f	cf		.
	ld c,h			;0a40	4c		L
	ld e,c			;0a41	59		Y
	cp l			;0a42	bd		.
	halt			;0a43	76		v
	add a,a			;0a44	87		.
	ld (hl),043h		;0a45	36 43		6 C
	rst 28h			;0a47	ef		.
	sbc a,d			;0a48	9a		.
	ld (06423h),de		;0a49	ed 53 23 64	. S # d
	ld a,(hl)		;0a4d	7e		~
	dec l			;0a4e	2d		-
	and h			;0a4f	a4		.
	and c			;0a50	a1		.
	ld l,c			;0a51	69		i
	dec h			;0a52	25		%
	call nc,0ab8ch		;0a53	d4 8c ab	. . .
	cp l			;0a56	bd		.
	pop de			;0a57	d1		.
	jp p,0173eh		;0a58	f2 3e 17	. > .
	ld h,05bh		;0a5b	26 5b		& [
	ld d,d			;0a5d	52		R
	inc l			;0a5e	2c		,
	dec sp			;0a5f	3b		;
	ld h,(hl)		;0a60	66		f
	ld hl,0e024h		;0a61	21 24 e0	! $ .
	rst 18h			;0a64	df		.
	ex (sp),hl		;0a65	e3		.
	ld e,a			;0a66	5f		_
	ret p			;0a67	f0		.
	ld c,e			;0a68	4b		K
	scf			;0a69	37		7
	ld a,b			;0a6a	78		x
	ld h,h			;0a6b	64		d
	rst 30h			;0a6c	f7		.
	cp l			;0a6d	bd		.
l0a6eh:
	inc b			;0a6e	04		.
	add a,b			;0a6f	80		.
	or d			;0a70	b2		.
	ld h,b			;0a71	60		`
	ld l,h			;0a72	6c		l
	sbc a,a			;0a73	9f		.
	and 076h		;0a74	e6 76		. v
	ld b,b			;0a76	40		@
	ld b,d			;0a77	42		B
	adc a,a			;0a78	8f		.
	ret nc			;0a79	d0		.
	ret m			;0a7a	f8		.
	xor a			;0a7b	af		.
	ld h,h			;0a7c	64		d
	ld (hl),0eah		;0a7d	36 ea		6 .
	call nc,04cfdh		;0a7f	d4 fd 4c	. . L
	sub h			;0a82	94		.
	ld hl,(0f895h)		;0a83	2a 95 f8	* . .
	sbc a,c			;0a86	99		.
	adc a,07ch		;0a87	ce 7c		. |
	ccf			;0a89	3f		?
	ld d,c			;0a8a	51		Q
	xor e			;0a8b	ab		.
	and 0cbh		;0a8c	e6 cb		. .
	ccf			;0a8e	3f		?
	ld h,a			;0a8f	67		g
	or a			;0a90	b7		.
	ccf			;0a91	3f		?
	dec a			;0a92	3d		=
	bit 7,(hl)		;0a93	cb 7e		. ~
	ret p			;0a95	f0		.
	di			;0a96	f3		.
	ld l,e			;0a97	6b		k
	ld b,c			;0a98	41		A
	sub (hl)		;0a99	96		.
	ld (bc),a		;0a9a	02		.
	jp nc,0e879h		;0a9b	d2 79 e8	. y .
	or c			;0a9e	b1		.
	add a,c			;0a9f	81		.
	ld d,(hl)		;0aa0	56		V
	xor a			;0aa1	af		.
	xor 0edh		;0aa2	ee ed		. .
	ld b,b			;0aa4	40		@
	ld bc,0c99fh		;0aa5	01 9f c9	. . .
	add a,(hl)		;0aa8	86		.
	cp c			;0aa9	b9		.
	call p,01679h		;0aaa	f4 79 16	. y .
	jr nc,l0a6eh		;0aad	30 bf		0 .
	jp nz,057b0h		;0aaf	c2 b0 57	. . W
	sub d			;0ab2	92		.
	or l			;0ab3	b5		.
	call 09b18h		;0ab4	cd 18 9b	. . .
	sub (hl)		;0ab7	96		.
	add a,h			;0ab8	84		.
	add a,h			;0ab9	84		.
	jp nc,07bc6h		;0aba	d2 c6 7b	. . {
	ld (hl),a		;0abd	77		w
	ld h,a			;0abe	67		g
	ld h,b			;0abf	60		`
	ret p			;0ac0	f0		.
	ret			;0ac1	c9		.
	rst 18h			;0ac2	df		.
	and e			;0ac3	a3		.
	ld c,l			;0ac4	4d		M
	sbc a,c			;0ac5	99		.
	ld bc,0d5f1h		;0ac6	01 f1 d5	. . .
	cp d			;0ac9	ba		.
	ld (hl),e		;0aca	73		s
	ld c,c			;0acb	49		I
	cp h			;0acc	bc		.
	or (hl)			;0acd	b6		.
	dec b			;0ace	05		.
	and l			;0acf	a5		.
	pop hl			;0ad0	e1		.
	dec c			;0ad1	0d		.
	jp 0da73h		;0ad2	c3 73 da	. s .
	dec bc			;0ad5	0b		.
	dec hl			;0ad6	2b		+
	and d			;0ad7	a2		.
	ld e,c			;0ad8	59		Y
	rrca			;0ad9	0f		.
	add a,d			;0ada	82		.
	ld sp,hl		;0adb	f9		.
	ex de,hl		;0adc	eb		.
	cp d			;0add	ba		.
	sbc a,e			;0ade	9b		.
	ld e,(hl)		;0adf	5e		^
	pop bc			;0ae0	c1		.
	add hl,bc		;0ae1	09		.
	jp c,097fch		;0ae2	da fc 97	. . .
	ei			;0ae5	fb		.
	rst 18h			;0ae6	df		.
	ld (bc),a		;0ae7	02		.
	ret pe			;0ae8	e8		.
	ld h,h			;0ae9	64		d
	add a,h			;0aea	84		.
	ld a,l			;0aeb	7d		}
	call c,0d5c7h		;0aec	dc c7 d5	. . .
	ld e,d			;0aef	5a		Z
	adc a,l			;0af0	8d		.
	ld a,(bc)		;0af1	0a		.
	adc a,l			;0af2	8d		.
	inc (hl)		;0af3	34		4
	sbc a,04dh		;0af4	de 4d		. M
	ld c,a			;0af6	4f		O
	add a,e			;0af7	83		.
	rst 0			;0af8	c7		.
	pop de			;0af9	d1		.
	adc a,d			;0afa	8a		.
	dec sp			;0afb	3b		;
	jp (hl)			;0afc	e9		.
	sub (hl)		;0afd	96		.
	ld e,(hl)		;0afe	5e		^
	cp a			;0aff	bf		.
	sub h			;0b00	94		.
	ld h,01fh		;0b01	26 1f		& .
	ld (bc),a		;0b03	02		.
	adc a,d			;0b04	8a		.
	in a,(048h)		;0b05	db 48		. H
	adc a,a			;0b07	8f		.
	ld (hl),a		;0b08	77		w
	ld (hl),d		;0b09	72		r
	ld c,b			;0b0a	48		H
	xor b			;0b0b	a8		.
	ld d,b			;0b0c	50		P
	ld (hl),b		;0b0d	70		p
	push bc			;0b0e	c5		.
	and l			;0b0f	a5		.
	res 1,c			;0b10	cb 89		. .
	jp (hl)			;0b12	e9		.
	ld b,e			;0b13	43		C
	jr l0b4dh		;0b14	18 37		. 7
	or b			;0b16	b0		.
	and b			;0b17	a0		.
	rst 38h			;0b18	ff		.
	and l			;0b19	a5		.
	jp 03803h		;0b1a	c3 03 38	. . 8
	defb 0ddh,0c6h,0ddh ;illegal sequence	;0b1d	dd c6 dd	. . .
	and l			;0b20	a5		.
	inc c			;0b21	0c		.
	inc d			;0b22	14		.
	ld (hl),c		;0b23	71		q
	ei			;0b24	fb		.
	ld c,06bh		;0b25	0e 6b		. k
	ld e,(hl)		;0b27	5e		^
	out (0b8h),a		;0b28	d3 b8		. .
	rst 10h			;0b2a	d7		.
	ld e,h			;0b2b	5c		\
	and 095h		;0b2c	e6 95		. .
	dec de			;0b2e	1b		.
	ld hl,0e945h		;0b2f	21 45 e9	! E .
	ld a,(l07b8h)		;0b32	3a b8 07	: . .
	sbc a,d			;0b35	9a		.
	adc a,l			;0b36	8d		.
	xor l			;0b37	ad		.
	jp m,0a043h		;0b38	fa 43 a0	. C .
	call pe,0568ah		;0b3b	ec 8a 56	. . V
	scf			;0b3e	37		7
	sub d			;0b3f	92		.
	ld l,a			;0b40	6f		o
	and l			;0b41	a5		.
	ei			;0b42	fb		.
	ret m			;0b43	f8		.
	ld c,b			;0b44	48		H
	add hl,de		;0b45	19		.
	rla			;0b46	17		.
	ld h,a			;0b47	67		g
	rst 38h			;0b48	ff		.
	sbc a,(hl)		;0b49	9e		.
	ld a,d			;0b4a	7a		z
	dec sp			;0b4b	3b		;
	ld b,c			;0b4c	41		A
l0b4dh:
	add a,(hl)		;0b4d	86		.
	cp a			;0b4e	bf		.
	ld c,l			;0b4f	4d		M
	ld c,d			;0b50	4a		J
	adc a,(hl)		;0b51	8e		.
	ld l,c			;0b52	69		i
	sub a			;0b53	97		.
	and l			;0b54	a5		.
	adc a,l			;0b55	8d		.
	xor h			;0b56	ac		.
	sub l			;0b57	95		.
	ld d,(hl)		;0b58	56		V
	or h			;0b59	b4		.
	or b			;0b5a	b0		.
	add a,a			;0b5b	87		.
	ld (hl),h		;0b5c	74		t
	ld b,(hl)		;0b5d	46		F
l0b5eh:
	cp c			;0b5e	b9		.
	ret nz			;0b5f	c0		.
	or c			;0b60	b1		.
	inc hl			;0b61	23		#
	inc a			;0b62	3c		<
	xor 043h		;0b63	ee 43		. C
	dec b			;0b65	05		.
	ld hl,072feh		;0b66	21 fe 72	! . r
	ld (hl),a		;0b69	77		w
	cp e			;0b6a	bb		.
	sbc a,d			;0b6b	9a		.
	cp c			;0b6c	b9		.
	xor 0bdh		;0b6d	ee bd		. .
	rlca			;0b6f	07		.
	ld d,(hl)		;0b70	56		V
	or c			;0b71	b1		.
	jr z,$-10		;0b72	28 f4		( .
	sbc a,(hl)		;0b74	9e		.
	ld h,l			;0b75	65		e
	sbc a,l			;0b76	9d		.
	add hl,sp		;0b77	39		9
	ld l,h			;0b78	6c		l
	halt			;0b79	76		v
	sub (hl)		;0b7a	96		.
	sbc a,d			;0b7b	9a		.
	pop de			;0b7c	d1		.
	in a,(09fh)		;0b7d	db 9f		. .
	ccf			;0b7f	3f		?
	ld e,h			;0b80	5c		\
	ld a,d			;0b81	7a		z
	ld d,b			;0b82	50		P
	call nz,0bda4h		;0b83	c4 a4 bd	. . .
	cp 01ah			;0b86	fe 1a		. .
	sub b			;0b88	90		.
	ld l,b			;0b89	68		h
	rrca			;0b8a	0f		.
	ld d,l			;0b8b	55		U
	rla			;0b8c	17		.
l0b8dh:
	ld c,d			;0b8d	4a		J
	call po,0dd16h		;0b8e	e4 16 dd	. . .
	ld e,b			;0b91	58		X
	ld bc,0d0efh		;0b92	01 ef d0	. . .
	rra			;0b95	1f		.
	ld b,d			;0b96	42		B
	add a,e			;0b97	83		.
	ld d,a			;0b98	57		W
	ld (bc),a		;0b99	02		.
	ld d,0f2h		;0b9a	16 f2		. .
	jp m,0be37h		;0b9c	fa 37 be	. 7 .
	add a,b			;0b9f	80		.
	rlca			;0ba0	07		.
	jp po,02b12h		;0ba1	e2 12 2b	. . +
	jr nc,l0b5eh		;0ba4	30 b8		0 .
	ret m			;0ba6	f8		.
	ld h,e			;0ba7	63		c
	ld l,b			;0ba8	68		h
	ld d,(hl)		;0ba9	56		V
	sub c			;0baa	91		.
	call p,0e72ah		;0bab	f4 2a e7	. * .
	ld hl,03560h		;0bae	21 60 35	! ` 5
	ld b,b			;0bb1	40		@
	exx			;0bb2	d9		.
	push de			;0bb3	d5		.
	ld c,b			;0bb4	48		H
	ld e,b			;0bb5	58		X
	dec e			;0bb6	1d		.
	xor l			;0bb7	ad		.
	ex de,hl		;0bb8	eb		.
	ld e,0aah		;0bb9	1e aa		. .
	dec (hl)		;0bbb	35		5
	pop bc			;0bbc	c1		.
	xor c			;0bbd	a9		.
	ld b,02eh		;0bbe	06 2e		. .
	ld a,090h		;0bc0	3e 90		> .
	ld e,l			;0bc2	5d		]
	ld d,d			;0bc3	52		R
	xor e			;0bc4	ab		.
	ld d,c			;0bc5	51		Q
	add hl,sp		;0bc6	39		9
	call c,0edebh		;0bc7	dc eb ed	. . .
	push bc			;0bca	c5		.
	ld c,h			;0bcb	4c		L
	call nc,04a8fh		;0bcc	d4 8f 4a	. . J
	sbc a,d			;0bcf	9a		.
	ld d,b			;0bd0	50		P
	sub l			;0bd1	95		.
	call c,04a0fh		;0bd2	dc 0f 4a	. . J
	and b			;0bd5	a0		.
	call po,0c6f9h		;0bd6	e4 f9 c6	. . .
	xor c			;0bd9	a9		.
	inc de			;0bda	13		.
	ld e,(hl)		;0bdb	5e		^
	call 013dah		;0bdc	cd da 13	. . .
	cp 0d7h			;0bdf	fe d7		. .
	ld l,(hl)		;0be1	6e		n
	jp m,02394h		;0be2	fa 94 23	. . #
	add hl,bc		;0be5	09		.
	ld (0869bh),hl		;0be6	22 9b 86	" . .
	ld e,014h		;0be9	1e 14		. .
	add a,l			;0beb	85		.
	ld h,a			;0bec	67		g
	ret p			;0bed	f0		.
	jp nz,0aef9h		;0bee	c2 f9 ae	. . .
	ld (hl),0d2h		;0bf1	36 d2		6 .
	xor 0bfh		;0bf3	ee bf		. .
	inc bc			;0bf5	03		.
	ld l,b			;0bf6	68		h
	pop hl			;0bf7	e1		.
	ld b,(hl)		;0bf8	46		F
	ld (hl),043h		;0bf9	36 43		6 C
	ld c,h			;0bfb	4c		L
	djnz $+122		;0bfc	10 78		. x
	pop af			;0bfe	f1		.
	call 0fff2h		;0bff	cd f2 ff	. . .
	cp 072h			;0c02	fe 72		. r
	ld b,e			;0c04	43		C
	rst 18h			;0c05	df		.
	ld b,d			;0c06	42		B
l0c07h:
	sub (iy+065h)		;0c07	fd 96 65	. . e
	ld (hl),b		;0c0a	70		p
	jp nc,02e83h		;0c0b	d2 83 2e	. . .
	inc c			;0c0e	0c		.
	cp a			;0c0f	bf		.
	ld a,c			;0c10	79		y
	ld b,h			;0c11	44		D
	sbc a,l			;0c12	9d		.
	dec h			;0c13	25		%
	add a,c			;0c14	81		.
	rst 20h			;0c15	e7		.
	adc a,e			;0c16	8b		.
	dec l			;0c17	2d		-
	ld e,d			;0c18	5a		Z
	sbc a,l			;0c19	9d		.
	ld h,l			;0c1a	65		e
	ld c,b			;0c1b	48		H
	djnz $-72		;0c1c	10 b6		. .
	ld (hl),a		;0c1e	77		w
	ld hl,0a932h		;0c1f	21 32 a9	! 2 .
	add a,e			;0c22	83		.
	ret m			;0c23	f8		.
	sub h			;0c24	94		.
	or (hl)			;0c25	b6		.
	halt			;0c26	76		v
	and d			;0c27	a2		.
	ld b,b			;0c28	40		@
	cp e			;0c29	bb		.
	and e			;0c2a	a3		.
l0c2bh:
	ld d,l			;0c2b	55		U
	ld l,b			;0c2c	68		h
	jp nc,0b0e1h		;0c2d	d2 e1 b0	. . .
	pop hl			;0c30	e1		.
	call nc,0fa1ch		;0c31	d4 1c fa	. . .
	rla			;0c34	17		.
	dec h			;0c35	25		%
	xor c			;0c36	a9		.
	add hl,de		;0c37	19		.
	adc a,b			;0c38	88		.
	sub (hl)		;0c39	96		.
	ccf			;0c3a	3f		?
	ld h,(hl)		;0c3b	66		f
	ld c,e			;0c3c	4b		K
	ld hl,(l0b8dh)		;0c3d	2a 8d 0b	* . .
	jp m,07805h		;0c40	fa 05 78	. . x
	add a,c			;0c43	81		.
	add a,(hl)		;0c44	86		.
	ld l,(hl)		;0c45	6e		n
	rst 0			;0c46	c7		.
	inc h			;0c47	24		$
	dec hl			;0c48	2b		+
	ei			;0c49	fb		.
	sub d			;0c4a	92		.
	add a,l			;0c4b	85		.
	ld (hl),a		;0c4c	77		w
	ld a,h			;0c4d	7c		|
	and e			;0c4e	a3		.
	sbc a,a			;0c4f	9f		.
	and 0b3h		;0c50	e6 b3		. .
	xor a			;0c52	af		.
	call nz,017eeh		;0c53	c4 ee 17	. . .
l0c56h:
	jp nz,0ba8fh		;0c56	c2 8f ba	. . .
	ld b,c			;0c59	41		A
	ld l,h			;0c5a	6c		l
	jp nc,098dbh		;0c5b	d2 db 98	. . .
	jr c,l0c2bh		;0c5e	38 cb		8 .
	ld h,l			;0c60	65		e
	ld c,c			;0c61	49		I
	dec c			;0c62	0d		.
	ld (069c4h),hl		;0c63	22 c4 69	" . i
	ld (hl),a		;0c66	77		w
	call z,08b46h		;0c67	cc 46 8b	. F .
	rst 0			;0c6a	c7		.
	ld e,l			;0c6b	5d		]
	jp z,0b6c3h		;0c6c	ca c3 b6	. . .
	or h			;0c6f	b4		.
	call nc,09822h		;0c70	d4 22 98	. " .
	and b			;0c73	a0		.
	jp (hl)			;0c74	e9		.
	call nz,0f567h		;0c75	c4 67 f5	. g .
	xor h			;0c78	ac		.
	xor e			;0c79	ab		.
	push bc			;0c7a	c5		.
	ld c,(hl)		;0c7b	4e		N
	sub d			;0c7c	92		.
	ret p			;0c7d	f0		.
	pop de			;0c7e	d1		.
	inc l			;0c7f	2c		,
	ld a,b			;0c80	78		x
	ld e,c			;0c81	59		Y
	ld d,0e1h		;0c82	16 e1		. .
	ld c,e			;0c84	4b		K
	rst 30h			;0c85	f7		.
	inc bc			;0c86	03		.
	ld b,c			;0c87	41		A
	add a,a			;0c88	87		.
	ex (sp),hl		;0c89	e3		.
	cp h			;0c8a	bc		.
	ld de,01dd7h		;0c8b	11 d7 1d	. . .
	ld e,c			;0c8e	59		Y
	cpl			;0c8f	2f		/
	rst 30h			;0c90	f7		.
	push af			;0c91	f5		.
	jr nz,l0c56h		;0c92	20 c2		  .
	xor a			;0c94	af		.
	cp b			;0c95	b8		.
	inc h			;0c96	24		$
	ld d,(hl)		;0c97	56		V
	ex af,af'		;0c98	08		.
	rrca			;0c99	0f		.
	inc d			;0c9a	14		.
	inc sp			;0c9b	33		3
	ld d,0c7h		;0c9c	16 c7		. .
	ld e,b			;0c9e	58		X
	rrca			;0c9f	0f		.
	defb 0fdh,07ah,04eh ;illegal sequence	;0ca0	fd 7a 4e	. z N
	halt			;0ca3	76		v
	ret m			;0ca4	f8		.
	ld h,e			;0ca5	63		c
	cp (hl)			;0ca6	be		.
	sub c			;0ca7	91		.
	ld h,l			;0ca8	65		e
	dec de			;0ca9	1b		.
	dec h			;0caa	25		%
	or a			;0cab	b7		.
	ei			;0cac	fb		.
	defb 0fdh,04fh,0a4h ;illegal sequence	;0cad	fd 4f a4	. O .
	ld (hl),d		;0cb0	72		r
	ld e,h			;0cb1	5c		\
	sub (hl)		;0cb2	96		.
	ret z			;0cb3	c8		.
	or c			;0cb4	b1		.
	sub (hl)		;0cb5	96		.
	sub 034h		;0cb6	d6 34		. 4
	dec hl			;0cb8	2b		+
	add hl,hl		;0cb9	29		)
	pop hl			;0cba	e1		.
	inc d			;0cbb	14		.
	ld h,h			;0cbc	64		d
	ld h,l			;0cbd	65		e
	scf			;0cbe	37		7
	ld (hl),e		;0cbf	73		s
	inc bc			;0cc0	03		.
	inc hl			;0cc1	23		#
	ld b,0c8h		;0cc2	06 c8		. .
	ld e,a			;0cc4	5f		_
	ret pe			;0cc5	e8		.
	ld (hl),a		;0cc6	77		w
	cp d			;0cc7	ba		.
	ld c,l			;0cc8	4d		M
	sbc a,a			;0cc9	9f		.
	dec de			;0cca	1b		.
	ld b,b			;0ccb	40		@
	rrca			;0ccc	0f		.
	inc a			;0ccd	3c		<
	ld e,h			;0cce	5c		\
	sbc a,l			;0ccf	9d		.
	ld (hl),h		;0cd0	74		t
	jp po,0d1d1h		;0cd1	e2 d1 d1	. . .
	xor h			;0cd4	ac		.
	in a,(02ch)		;0cd5	db 2c		. ,
	ld (hl),e		;0cd7	73		s
	ld d,a			;0cd8	57		W
	adc a,l			;0cd9	8d		.
	jr z,$+28		;0cda	28 1a		( .
	inc hl			;0cdc	23		#
	ld b,d			;0cdd	42		B
	ret p			;0cde	f0		.
	dec h			;0cdf	25		%
	ld a,e			;0ce0	7b		{
	sub e			;0ce1	93		.
	call nc,043ach		;0ce2	d4 ac 43	. . C
	ld e,l			;0ce5	5d		]
	ret p			;0ce6	f0		.
l0ce7h:
	and l			;0ce7	a5		.
	and c			;0ce8	a1		.
	sbc a,e			;0ce9	9b		.
	inc hl			;0cea	23		#
	sbc a,c			;0ceb	99		.
	adc a,l			;0cec	8d		.
	call c,0cc81h		;0ced	dc 81 cc	. . .
	cpl			;0cf0	2f		/
	ld bc,09c95h		;0cf1	01 95 9c	. . .
	jp m,07965h		;0cf4	fa 65 79	. e y
	xor b			;0cf7	a8		.
	ld b,(hl)		;0cf8	46		F
	or l			;0cf9	b5		.
	jr l0d68h		;0cfa	18 6c		. l
	sub d			;0cfc	92		.
	rst 28h			;0cfd	ef		.
	adc a,c			;0cfe	89		.
	ld a,(hl)		;0cff	7e		~
	ld a,c			;0d00	79		y
	inc l			;0d01	2c		,
	daa			;0d02	27		'
	adc a,e			;0d03	8b		.
	ld (04cb4h),a		;0d04	32 b4 4c	2 . L
	ld a,e			;0d07	7b		{
	ex (sp),hl		;0d08	e3		.
	call m,0400ah		;0d09	fc 0a 40	. . @
	ld b,e			;0d0c	43		C
	ld a,h			;0d0d	7c		|
	ret			;0d0e	c9		.
	ld h,l			;0d0f	65		e
	out (c),b		;0d10	ed 41		. A
	call nz,0995ah		;0d12	c4 5a 99	. Z .
	jp m,0a3adh		;0d15	fa ad a3	. . .
	dec sp			;0d18	3b		;
	cp d			;0d19	ba		.
	ld b,c			;0d1a	41		A
	halt			;0d1b	76		v
	adc a,b			;0d1c	88		.
	pop de			;0d1d	d1		.
	ld a,00ah		;0d1e	3e 0a		> .
	sbc a,h			;0d20	9c		.
	and h			;0d21	a4		.
	dec hl			;0d22	2b		+
	ld a,a			;0d23	7f		.
	ld a,(bc)		;0d24	0a		.
	ld (0c27ah),a		;0d25	32 7a c2	2 z .
	ld (08af0h),a		;0d28	32 f0 8a	2 . .
	ld l,d			;0d2b	6a		j
	sbc a,(hl)		;0d2c	9e		.
	di			;0d2d	f3		.
	ld l,0abh		;0d2e	2e ab		. .
	ld hl,0e898h		;0d30	21 98 e8	! . .
	ld c,l			;0d33	4d		M
	cpl			;0d34	2f		/
	rst 38h			;0d35	ff		.
	ld c,l			;0d36	4d		M
	ld c,b			;0d37	48		H
	pop hl			;0d38	e1		.
	inc c			;0d39	0c		.
	ld a,a			;0d3a	7f		.
	rst 10h			;0d3b	d7		.
	inc c			;0d3c	0c		.
	rlc c			;0d3d	cb 01		. .
	inc e			;0d3f	1c		.
	jr $+79			;0d40	18 4d		. M
	ei			;0d42	fb		.
	ld e,(hl)		;0d43	5e		^
	ld a,a			;0d44	7f		.
	ld e,e			;0d45	5b		[
	ccf			;0d46	3f		?
	ld b,e			;0d47	43		C
	ld (09a8ah),a		;0d48	32 8a 9a	2 . .
	sub a			;0d4b	97		.
	ld e,b			;0d4c	58		X
	and e			;0d4d	a3		.
	call c,03361h		;0d4e	dc 61 33	. a 3
	adc a,(hl)		;0d51	8e		.
	add a,0f6h		;0d52	c6 f6		. .
	cp (hl)			;0d54	be		.
	add a,h			;0d55	84		.
	ld l,h			;0d56	6c		l
	cp l			;0d57	bd		.
	ld d,a			;0d58	57		W
	ld e,(hl)		;0d59	5e		^
	and c			;0d5a	a1		.
	and b			;0d5b	a0		.
	rra			;0d5c	1f		.
	ld (hl),h		;0d5d	74		t
	ld (iy+026h),h		;0d5e	fd 74 26	. t &
	sbc a,e			;0d61	9b		.
	xor e			;0d62	ab		.
	ld e,d			;0d63	5a		Z
	dec d			;0d64	15		.
	ld (hl),h		;0d65	74		t
	dec sp			;0d66	3b		;
	cp (hl)			;0d67	be		.
l0d68h:
	rst 18h			;0d68	df		.
	add a,(hl)		;0d69	86		.
	ld d,b			;0d6a	50		P
	ld (hl),036h		;0d6b	36 36		6 6
	ld a,d			;0d6d	7a		z
	cp 089h			;0d6e	fe 89		. .
	ld a,(de)		;0d70	1a		.
	add a,b			;0d71	80		.
	or l			;0d72	b5		.
	ld b,024h		;0d73	06 24		. $
	sbc a,c			;0d75	99		.
	inc bc			;0d76	03		.
	ld bc,l0137h		;0d77	01 37 01	. 7 .
	ld hl,(0bc35h)		;0d7a	2a 35 bc	* 5 .
	and 0c5h		;0d7d	e6 c5		. .
	call m,0384ah		;0d7f	fc 4a 38	. J 8
	dec c			;0d82	0d		.
	and 053h		;0d83	e6 53		. S
	ld l,(hl)		;0d85	6e		n
	xor e			;0d86	ab		.
	add a,a			;0d87	87		.
	and h			;0d88	a4		.
	add a,a			;0d89	87		.
	dec a			;0d8a	3d		=
	dec a			;0d8b	3d		=
	ld c,a			;0d8c	4f		O
	ld hl,01f92h		;0d8d	21 92 1f	! . .
	add hl,hl		;0d90	29		)
	ld a,(bc)		;0d91	0a		.
	ret nz			;0d92	c0		.
	ld h,003h		;0d93	26 03		& .
	ld l,b			;0d95	68		h
	ld c,0aeh		;0d96	0e ae		. .
	push hl			;0d98	e5		.
	or h			;0d99	b4		.
	add a,l			;0d9a	85		.
	ld l,d			;0d9b	6a		j
	ld c,a			;0d9c	4f		O
	ld l,b			;0d9d	68		h
	daa			;0d9e	27		'
	inc l			;0d9f	2c		,
	dec sp			;0da0	3b		;
	and e			;0da1	a3		.
	ld a,c			;0da2	79		y
	di			;0da3	f3		.
	dec bc			;0da4	0b		.
	ld (hl),d		;0da5	72		r
	sbc a,b			;0da6	98		.
	sbc a,a			;0da7	9f		.
	ld c,(hl)		;0da8	4e		N
	ld c,b			;0da9	48		H
	ld e,a			;0daa	5f		_
	inc c			;0dab	0c		.
	sbc a,h			;0dac	9c		.
	add a,l			;0dad	85		.
	sub h			;0dae	94		.
	sub e			;0daf	93		.
	ld sp,hl		;0db0	f9		.
	ld sp,hl		;0db1	f9		.
	ld sp,hl		;0db2	f9		.
	or h			;0db3	b4		.
	ld a,093h		;0db4	3e 93		> .
	ld l,l			;0db6	6d		m
	ret z			;0db7	c8		.
	sbc a,l			;0db8	9d		.
	ld sp,hl		;0db9	f9		.
	ld e,027h		;0dba	1e 27		. '
	ld d,h			;0dbc	54		T
	cp b			;0dbd	b8		.
	rst 8			;0dbe	cf		.
	ld c,b			;0dbf	48		H
	cp (hl)			;0dc0	be		.
	push bc			;0dc1	c5		.
	add a,b			;0dc2	80		.
	ld l,c			;0dc3	69		i
	jp 0fed9h		;0dc4	c3 d9 fe	. . .
	ld a,l			;0dc7	7d		}
	cp b			;0dc8	b8		.
	ei			;0dc9	fb		.
	ld b,l			;0dca	45		E
	inc sp			;0dcb	33		3
	ld d,h			;0dcc	54		T
	add hl,de		;0dcd	19		.
	ld l,(hl)		;0dce	6e		n
	inc e			;0dcf	1c		.
	ld e,d			;0dd0	5a		Z
	ret c			;0dd1	d8		.
	sbc a,d			;0dd2	9a		.
	or 002h			;0dd3	f6 02		. .
	ld d,h			;0dd5	54		T
	ld d,(hl)		;0dd6	56		V
	cp (hl)			;0dd7	be		.
	add a,l			;0dd8	85		.
	dec sp			;0dd9	3b		;
	sub a			;0dda	97		.
	rst 18h			;0ddb	df		.
	ld bc,0b50ah		;0ddc	01 0a b5	. . .
	inc sp			;0ddf	33		3
	rst 0			;0de0	c7		.
	dec b			;0de1	05		.
	ret nz			;0de2	c0		.
	ld (hl),061h		;0de3	36 61		6 a
	jp po,0a0f3h		;0de5	e2 f3 a0	. . .
	ld (0bd2eh),a		;0de8	32 2e bd	2 . .
	ld (hl),h		;0deb	74		t
	rst 8			;0dec	cf		.
	jp p,0ef69h		;0ded	f2 69 ef	. i .
	defb 0edh ;next byte illegal after ed	;0df0	ed		.
	rra			;0df1	1f		.
	adc a,h			;0df2	8c		.
	ld a,e			;0df3	7b		{
	cp b			;0df4	b8		.
	ld d,b			;0df5	50		P
	jr $+86			;0df6	18 54		. T
	adc a,l			;0df8	8d		.
	jp nc,05e2dh		;0df9	d2 2d 5e	. - ^
	xor e			;0dfc	ab		.
	add hl,sp		;0dfd	39		9
	or c			;0dfe	b1		.
	ld b,l			;0dff	45		E
	jp pe,0c17eh		;0e00	ea 7e c1	. ~ .
	jr z,l0e64h		;0e03	28 5f		( _
	cp b			;0e05	b8		.
	call c,03e89h		;0e06	dc 89 3e	. . >
	sbc a,a			;0e09	9f		.
	inc h			;0e0a	24		$
	ld h,l			;0e0b	65		e
	inc de			;0e0c	13		.
	ld h,(hl)		;0e0d	66		f
	ld c,003h		;0e0e	0e 03		. .
	xor a			;0e10	af		.
	defb 0edh ;next byte illegal after ed	;0e11	ed		.
	ld d,l			;0e12	55		U
	ld bc,03e6ch		;0e13	01 6c 3e	. l >
	ld c,h			;0e16	4c		L
	dec d			;0e17	15		.
	ld a,(0ea6dh)		;0e18	3a 6d ea	: m .
	ld b,e			;0e1b	43		C
	add a,a			;0e1c	87		.
	ld e,h			;0e1d	5c		\
	cp a			;0e1e	bf		.
	ld e,h			;0e1f	5c		\
	ret nz			;0e20	c0		.
	cp l			;0e21	bd		.
	ld c,(hl)		;0e22	4e		N
	ld c,d			;0e23	4a		J
	inc de			;0e24	13		.
	cp e			;0e25	bb		.
	jr nc,l0ea4h		;0e26	30 7c		0 |
	sbc a,h			;0e28	9c		.
	ld (hl),e		;0e29	73		s
	rst 10h			;0e2a	d7		.
	jp p,02248h		;0e2b	f2 48 22	. H "
	cpl			;0e2e	2f		/
	sbc a,03dh		;0e2f	de 3d		. =
	ld a,(0f4aah)		;0e31	3a aa f4	: . .
	ld c,b			;0e34	48		H
	xor c			;0e35	a9		.
	defb 0edh ;next byte illegal after ed	;0e36	ed		.
	call 0886ch		;0e37	cd 6c 88	. l .
	sub b			;0e3a	90		.
	ld h,h			;0e3b	64		d
	ld d,h			;0e3c	54		T
	ld de,042deh		;0e3d	11 de 42	. . B
	ld d,0ddh		;0e40	16 dd		. .
	call z,08596h		;0e42	cc 96 85	. . .
	inc l			;0e45	2c		,
	ld c,d			;0e46	4a		J
	and 083h		;0e47	e6 83		. .
	rst 8			;0e49	cf		.
	ld e,b			;0e4a	58		X
	defb 0ddh,03bh,01bh ;illegal sequence	;0e4b	dd 3b 1b	. ; .
	ld hl,(0b950h)		;0e4e	2a 50 b9	* P .
	jp nc,037abh		;0e51	d2 ab 37	. . 7
	ld l,c			;0e54	69		i
	pop af			;0e55	f1		.
	jp c,l081fh		;0e56	da 1f 08	. . .
	ld h,a			;0e59	67		g
	add hl,de		;0e5a	19		.
	ld h,073h		;0e5b	26 73		& s
	jr nc,l0eb8h		;0e5d	30 59		0 Y
	ld d,l			;0e5f	55		U
	xor l			;0e60	ad		.
	or c			;0e61	b1		.
	ld h,b			;0e62	60		`
	inc de			;0e63	13		.
l0e64h:
	ld a,b			;0e64	78		x
	ld b,e			;0e65	43		C
	dec hl			;0e66	2b		+
	ld hl,(093c0h)		;0e67	2a c0 93	* . .
	push af			;0e6a	f5		.
l0e6bh:
	inc bc			;0e6b	03		.
	and c			;0e6c	a1		.
	ld (hl),a		;0e6d	77		w
	out (0c2h),a		;0e6e	d3 c2		. .
	dec sp			;0e70	3b		;
	rra			;0e71	1f		.
	ld h,a			;0e72	67		g
	sbc a,0fch		;0e73	de fc		. .
	adc a,e			;0e75	8b		.
	ld a,c			;0e76	79		y
	ld l,c			;0e77	69		i
	inc (hl)		;0e78	34		4
	sub a			;0e79	97		.
	ld hl,(0a3ebh)		;0e7a	2a eb a3	* . .
	xor e			;0e7d	ab		.
	ld l,b			;0e7e	68		h
	dec hl			;0e7f	2b		+
	ld l,(hl)		;0e80	6e		n
	xor a			;0e81	af		.
	ld (hl),h		;0e82	74		t
	ld h,d			;0e83	62		b
	ret			;0e84	c9		.
	add a,a			;0e85	87		.
	cp e			;0e86	bb		.
	daa			;0e87	27		'
	ld b,0dbh		;0e88	06 db		. .
	dec sp			;0e8a	3b		;
	dec hl			;0e8b	2b		+
	ld (hl),l		;0e8c	75		u
	ld c,h			;0e8d	4c		L
	ld a,(de)		;0e8e	1a		.
	jr $+59			;0e8f	18 39		. 9
	ld e,d			;0e91	5a		Z
	ld hl,0ec4ch		;0e92	21 4c ec	! L .
	ld e,b			;0e95	58		X
	ld h,d			;0e96	62		b
	and c			;0e97	a1		.
	ld b,e			;0e98	43		C
	ret			;0e99	c9		.
	jr nz,l0ea5h		;0e9a	20 09		  .
	ld e,e			;0e9c	5b		[
	ld c,(hl)		;0e9d	4e		N
	ld d,(hl)		;0e9e	56		V
	jp pe,07634h		;0e9f	ea 34 76	. 4 v
	sbc a,d			;0ea2	9a		.
	ld e,a			;0ea3	5f		_
l0ea4h:
	dec c			;0ea4	0d		.
l0ea5h:
	ld d,(hl)		;0ea5	56		V
	sub d			;0ea6	92		.
	rla			;0ea7	17		.
	or l			;0ea8	b5		.
	and l			;0ea9	a5		.
	ld h,b			;0eaa	60		`
	defb 0fdh,005h,077h ;illegal sequence	;0eab	fd 05 77	. . w
	sbc a,021h		;0eae	de 21		. !
	sbc a,034h		;0eb0	de 34		. 4
	call po,0fd14h		;0eb2	e4 14 fd	. . .
	ld bc,07cd8h		;0eb5	01 d8 7c	. . |
l0eb8h:
	rst 10h			;0eb8	d7		.
	xor a			;0eb9	af		.
	adc a,0c0h		;0eba	ce c0		. .
	rst 28h			;0ebc	ef		.
	jp pe,07967h		;0ebd	ea 67 79	. g y
	ld a,(bc)		;0ec0	0a		.
	adc a,a			;0ec1	8f		.
	jp p,0570ah		;0ec2	f2 0a 57	. . W
	cp (hl)			;0ec5	be		.
	nop			;0ec6	00		.
	rst 38h			;0ec7	ff		.
	dec c			;0ec8	0d		.
	ld (hl),0c8h		;0ec9	36 c8		6 .
	call c,072a9h		;0ecb	dc a9 72	. . r
	ld e,b			;0ece	58		X
	inc de			;0ecf	13		.
l0ed0h:
	ret z			;0ed0	c8		.
	ld c,b			;0ed1	48		H
	ld c,(hl)		;0ed2	4e		N
	ld l,(hl)		;0ed3	6e		n
	ld a,a			;0ed4	7f		.
	ld (hl),b		;0ed5	70		p
	rst 38h			;0ed6	ff		.
	dec h			;0ed7	25		%
	jr nz,l0ed0h		;0ed8	20 f6		  .
	rst 20h			;0eda	e7		.
	ld (hl),a		;0edb	77		w
	ld a,(010e4h)		;0edc	3a e4 10	: . .
	inc sp			;0edf	33		3
	ld de,0f776h		;0ee0	11 76 f7	. v .
	ld b,028h		;0ee3	06 28		. (
	jp pe,0288ch		;0ee5	ea 8c 28	. . (
	adc a,l			;0ee8	8d		.
	dec hl			;0ee9	2b		+
	ld (064e4h),a		;0eea	32 e4 64	2 . d
	ei			;0eed	fb		.
	nop			;0eee	00		.
	jp pe,0a5a2h		;0eef	ea a2 a5	. . .
	ld l,b			;0ef2	68		h
	ld b,e			;0ef3	43		C
	ld h,(hl)		;0ef4	66		f
	ld de,0bca7h		;0ef5	11 a7 bc	. . .
	ld b,a			;0ef8	47		G
	ld b,a			;0ef9	47		G
	push de			;0efa	d5		.
	and a			;0efb	a7		.
	ret c			;0efc	d8		.
	jr z,l0f3fh		;0efd	28 40		( @
	jp po,028e2h		;0eff	e2 e2 28	. . (
	ld h,b			;0f02	60		`
	bit 6,a			;0f03	cb 77		. w
	ld c,e			;0f05	4b		K
	pop af			;0f06	f1		.
	cp d			;0f07	ba		.
	sub (hl)		;0f08	96		.
	cp (hl)			;0f09	be		.
	ld h,c			;0f0a	61		a
	ld (bc),a		;0f0b	02		.
	ret			;0f0c	c9		.
	ld d,c			;0f0d	51		Q
	ret nc			;0f0e	d0		.
	dec l			;0f0f	2d		-
	push bc			;0f10	c5		.
	ld sp,hl		;0f11	f9		.
	ld b,d			;0f12	42		B
	inc h			;0f13	24		$
	sub e			;0f14	93		.
	adc a,h			;0f15	8c		.
	halt			;0f16	76		v
	jp nc,0a2f0h		;0f17	d2 f0 a2	. . .
	scf			;0f1a	37		7
	xor l			;0f1b	ad		.
l0f1ch:
	xor l			;0f1c	ad		.
	ld h,d			;0f1d	62		b
	ld hl,07783h		;0f1e	21 83 77	! . w
	inc hl			;0f21	23		#
	ld c,d			;0f22	4a		J
	jp m,0f523h		;0f23	fa 23 f5	. # .
	cp b			;0f26	b8		.
	rst 8			;0f27	cf		.
	or 077h			;0f28	f6 77		. w
	jr nc,l0f3ch		;0f2a	30 10		0 .
	cp (hl)			;0f2c	be		.
	call nz,0d660h		;0f2d	c4 60 d6	. ` .
	or h			;0f30	b4		.
	rst 30h			;0f31	f7		.
	inc bc			;0f32	03		.
	adc a,013h		;0f33	ce 13		. .
	rst 20h			;0f35	e7		.
	adc a,d			;0f36	8a		.
	scf			;0f37	37		7
	ld h,h			;0f38	64		d
	or b			;0f39	b0		.
	ex (sp),hl		;0f3a	e3		.
	dec sp			;0f3b	3b		;
l0f3ch:
	ret			;0f3c	c9		.
	inc a			;0f3d	3c		<
	rst 30h			;0f3e	f7		.
l0f3fh:
	and a			;0f3f	a7		.
	inc l			;0f40	2c		,
	rst 30h			;0f41	f7		.
	sbc a,d			;0f42	9a		.
	ld c,(hl)		;0f43	4e		N
	cp b			;0f44	b8		.
	call m,0ad10h		;0f45	fc 10 ad	. . .
	ld (de),a		;0f48	12		.
	or h			;0f49	b4		.
	ld b,a			;0f4a	47		G
	adc a,e			;0f4b	8b		.
	ld d,(hl)		;0f4c	56		V
	ret m			;0f4d	f8		.
	sbc a,c			;0f4e	99		.
	ld sp,0aaebh		;0f4f	31 eb aa	1 . .
	dec l			;0f52	2d		-
	ld e,l			;0f53	5d		]
	ld d,a			;0f54	57		W
	adc a,b			;0f55	88		.
	rla			;0f56	17		.
	ld (de),a		;0f57	12		.
	sbc a,(hl)		;0f58	9e		.
	dec bc			;0f59	0b		.
	ld (hl),d		;0f5a	72		r
	ld a,08bh		;0f5b	3e 8b		> .
	rst 20h			;0f5d	e7		.
	inc a			;0f5e	3c		<
	ld a,d			;0f5f	7a		z
	ld l,d			;0f60	6a		j
	ld (0dcfah),hl		;0f61	22 fa dc	" . .
	cp d			;0f64	ba		.
	ld l,a			;0f65	6f		o
	call m,045ddh		;0f66	fc dd 45	. . E
	ld h,b			;0f69	60		`
	add hl,de		;0f6a	19		.
	inc e			;0f6b	1c		.
	call m,04f74h		;0f6c	fc 74 4f	. t O
	sbc a,d			;0f6f	9a		.
	jr nz,$-14		;0f70	20 f0		  .
	ld sp,05b93h		;0f72	31 93 5b	1 . [
	scf			;0f75	37		7
	add a,e			;0f76	83		.
	ex de,hl		;0f77	eb		.
	and b			;0f78	a0		.
	xor l			;0f79	ad		.
	sbc a,d			;0f7a	9a		.
	ld l,b			;0f7b	68		h
	ld (hl),a		;0f7c	77		w
	add a,a			;0f7d	87		.
	rst 8			;0f7e	cf		.
	defb 0ddh,0f8h,056h ;illegal sequence	;0f7f	dd f8 56	. . V
	jp 0e066h		;0f82	c3 66 e0	. f .
	ld c,083h		;0f85	0e 83		. .
	sbc a,d			;0f87	9a		.
	rrca			;0f88	0f		.
	ld l,e			;0f89	6b		k
	ld c,a			;0f8a	4f		O
	ld b,e			;0f8b	43		C
	ld b,h			;0f8c	44		D
	djnz l0f1ch		;0f8d	10 8d		. .
	ld l,h			;0f8f	6c		l
	add a,e			;0f90	83		.
	jr z,$+115		;0f91	28 71		( q
	rst 8			;0f93	cf		.
	rlca			;0f94	07		.
	ld l,a			;0f95	6f		o
	jp c,0250dh		;0f96	da 0d 25	. . %
	xor a			;0f99	af		.
	sub h			;0f9a	94		.
	adc a,b			;0f9b	88		.
	dec e			;0f9c	1d		.
	jr c,$-125		;0f9d	38 81		8 .
	ld a,l			;0f9f	7d		}
	add a,c			;0fa0	81		.
	adc a,058h		;0fa1	ce 58		. X
	ld h,h			;0fa3	64		d
	cp 00bh			;0fa4	fe 0b		. .
	ld l,d			;0fa6	6a		j
	jp pe,0f187h		;0fa7	ea 87 f1	. . .
	sub (hl)		;0faa	96		.
	ld d,a			;0fab	57		W
	set 3,l			;0fac	cb dd		. .
	jp z,08e39h		;0fae	ca 39 8e	. 9 .
	dec a			;0fb1	3d		=
	sub a			;0fb2	97		.
	ld l,b			;0fb3	68		h
	ret z			;0fb4	c8		.
	rra			;0fb5	1f		.
	and b			;0fb6	a0		.
	dec l			;0fb7	2d		-
	call c,09610h		;0fb8	dc 10 96	. . .
	pop hl			;0fbb	e1		.
	ld h,h			;0fbc	64		d
	ld l,c			;0fbd	69		i
	add a,e			;0fbe	83		.
	jr z,$-29		;0fbf	28 e1		( .
	ld a,b			;0fc1	78		x
	daa			;0fc2	27		'
	xor c			;0fc3	a9		.
	ret z			;0fc4	c8		.
	ex af,af'		;0fc5	08		.
	ld l,e			;0fc6	6b		k
	or a			;0fc7	b7		.
	and l			;0fc8	a5		.
	push bc			;0fc9	c5		.
	adc a,020h		;0fca	ce 20		.  
	add a,h			;0fcc	84		.
	add hl,bc		;0fcd	09		.
	or l			;0fce	b5		.
	ld e,c			;0fcf	59		Y
	sbc a,b			;0fd0	98		.
	ld h,(hl)		;0fd1	66		f
	rst 8			;0fd2	cf		.
	jp m,0160dh		;0fd3	fa 0d 16	. . .
	jp po,0e569h		;0fd6	e2 69 e5	. i .
	ld (hl),c		;0fd9	71		q
	ld d,b			;0fda	50		P
	ld a,(05fddh)		;0fdb	3a dd 5f	: . _
	and b			;0fde	a0		.
	defb 0fdh,0edh,03ch ;illegal sequence	;0fdf	fd ed 3c	. . <
	jr nc,$-95		;0fe2	30 9f		0 .
	push af			;0fe4	f5		.
	ld c,020h		;0fe5	0e 20		.  
	ld d,l			;0fe7	55		U
	inc b			;0fe8	04		.
	inc sp			;0fe9	33		3
	jp z,08cffh		;0fea	ca ff 8c	. . .
	call nc,00989h		;0fed	d4 89 09	. . .
	ld d,093h		;0ff0	16 93		. .
	ret			;0ff2	c9		.
	jp z,0b5f8h		;0ff3	ca f8 b5	. . .
	dec hl			;0ff6	2b		+
	sub 0f3h		;0ff7	d6 f3		. .
	ccf			;0ff9	3f		?
	ex af,af'		;0ffa	08		.
	ret p			;0ffb	f0		.
	and e			;0ffc	a3		.
	and 062h		;0ffd	e6 62		. b
	xor d			;0fff	aa		.
