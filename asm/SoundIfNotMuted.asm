
rlUnknown81C2F4 ; 81/C2F4

	.al
	.autsiz
	.databank ?

	; Play sound if not muted?

	pha
	lda #$0002
	cmp aOptions.wVolume
	beq +

	pla
	jsl rlUnknown808C87
	rtl

	+
	pla
	rtl

rlUnknown81C306 ; 81/C306

	.al
	.autsiz
	.databank ?

	; Play sound if not muted?

	pha
	lda #$0002
	cmp aOptions.wVolume
	beq +

	pla
	jsl rlUnknown808CDD
	rtl

	+
	pla
	rtl
