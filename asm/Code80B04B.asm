
rlUnknown80B04B ; 80/B04B

	.xl
	.autsiz
	.databank ?

	phb
	php
	sep #$20
	lda lR18+2
	pha
	rep #$20
	plb

	.databank ?

	lda wR11
	sta wR15

	lda wR10
	cmp #127
	bge +

	lda wR10
	jsr rsUnknown80B080

	-
	plp
	plb
	rtl

	+
	lda #120
	jsr rsUnknown80B080

	lda wR15
	clc
	adc wR13
	sta wR15

	lda wR10
	sec
	sbc #120
	jsr rsUnknown80B080

	bra -

rsUnknown80B080 ; 80/B080

	.al
	.xl
	.autsiz
	.databank ?

	ldx lR18
	ora wR12
	sta $0000,b,x

	inc x
	lda wR15
	sta $0000,b,x

	lda lR18
	clc
	adc #$0003
	sta lR18
	rts

rlButtonCombinationResetCheck ; 80/B096

	.al
	.xl
	.autsiz
	.databank ?

	; Resets the game if R + L + Select + Start are pressed
	; at the same time.

	php
	lda wJoy1Input
	and #~JOY_Start
	eor #JOY_R | JOY_L | JOY_Select
	bne _End

	lda wJoy1Repeated
	bit #JOY_Start
	beq _End

	lda wUnknown0004FA,b
	bne _End

	sep #$20
	lda #INIDISP_Setting(True)
	sta INIDISP,b
	lda #NMITIMEN_Setting(True, False, False, False)
	sta NMITIMEN,b
	sta bBufferNMITIMEN
	stz bDMAPendingChannels,b
	stz bHDMAPendingChannels,b
	stz bBufferHDMAEN
	stz bDMAArrayFlag,b
	rep #$20
	stz wDMAArrayPosition,b
	jml rsResetAlreadyInitialized

	_End
	plp
	rtl
