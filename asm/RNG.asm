
rlUnknown80B0D1 ; 80/B0D1

	.autsiz
	.databank ?

	phb
	php
	phk
	plb

	.databank `*

	sep #$20
	inc bFrameCounterByOnes,b

	lda bFrameCounterByThrees,b
	clc
	adc #$03
	sta bFrameCounterByThrees,b
	plp
	plb
	rtl

rlGetRandomNumber100 ; 80/B0E6

	.al
	.autsiz
	.databank ?

	; (val * RN) / 100

	; Inputs:
	; A: value to multiply

	; Outputs:
	; A: result

	phb
	php
	phk
	plb

	.databank `*

	phx
	phy

	; If 0 chance

	and #$00FF
	beq _End

	sta wR10

	jsl rlGetRandomNumber
	and #$00FF
	beq _End

	sta wR11
	jsl rlUnsignedMultiply16By16


	lda wR12
	sta wR13

	lda #100
	sta wR14
	jsl rlUnsignedDivide16By8
	lda wR13

	_End
	ply
	plx
	plp
	plb
	rtl

rlGetRandomNumber ; 80/B116

	.autsiz
	.databank ?

	; Grabs a random number.

	; Inputs:
	; None

	; Outputs:
	; A: RN

	phx
	phy
	phb
	php
	phk
	plb

	.databank `*

	lda #$0000
	sep #$30
	inc wRNIndex,b
	lda wRNIndex,b
	cmp #size(aRNArray)
	blt +

	jsr rsShuffleRNTable
	rep #$30
	lda #$0000
	sep #$30
	sta wRNIndex,b

	+
	tay
	lda aRNArray,b,y
	dec a
	bpl +

	lda #99

	+
	plp
	plb
	ply
	plx
	rtl

rlResetRNTable ; 80/B146

	.al
	.autsiz
	.databank ?

	; Regenerates the RN table.

	; Inputs:
	; None

	; Outputs:
	; None

	php
	phb
	phk
	plb

	.databank `*

	stz wRNIndex,b
	sep #$30
	lda bFrameCounterByOnes,b
	and #$3F
	sta bRNShuffleVar1,b
	sta aRNArray + size(aRNArray) - 1,b

	lda #$01
	sta bRNShuffleVar2,b

	ldy #20
	ldx #size(aRNArray) - 1

	-
	lda bRNShuffleVar2,b
	sta aRNArray,b,y

	lda bRNShuffleVar1,b
	sec
	sbc bRNShuffleVar2,b
	bge +

	clc
	adc #100

	+
	sta bRNShuffleVar2,b

	lda aRNArray,b,y
	sta bRNShuffleVar1,b
	tya
	clc
	adc #21
	cmp #size(aRNArray)
	blt +

	sbc #size(aRNArray)

	+
	tay
	dec x
	bne -

	jsr rsShuffleRNTable
	jsr rsShuffleRNTable
	jsr rsShuffleRNTable
	plb
	plp
	rtl

rsShuffleRNTable ; 80/B198

	.as
	.xs
	.autsiz
	.databank ?

	ldy #$00

	-
	tya
	sta bRNShuffleVar1,b
	cmp #24
	bge +

	adc #31
	bcc ++

	+
	sbc #24

	+
	tay
	lda aRNArray,b,y
	sta bRNShuffleVar2,b
	ldy bRNShuffleVar1,b
	lda aRNArray,b,y
	sec
	sbc bRNShuffleVar2,b
	bge +

	adc #100

	+
	sta aRNArray,b,y
	inc y
	cpy #size(aRNArray)
	bne -

	rts

rsUnknown80B1C6 ; 80/B1C6

	.autsiz
	.databank ?

	rep #$30
	lda #$0000
	lsr a
	lsr a
	sta bRNShuffleVar1,b

	txa
	asl a
	asl a
	asl a
	asl a
	clc
	adc bRNShuffleVar1,b
	sec
	sbc #80
	blt +

	cmp #100
	blt ++

	lda #100
	bra ++

	+
	lda #$0000

	+
	sta bRNShuffleVar1,b

	sep #$30
	ldy #$00
	tyx

	-
	lda aRNArray,b,y
	cmp bRNShuffleVar1,b
	bge +

	txa
	sta aRNArray,b,y

	+
	inc y
	cpy #size(aRNArray)
	bne -

	rep #$30
	rts
