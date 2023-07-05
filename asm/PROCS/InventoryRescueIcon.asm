
procInventoryRescueIcon .dstruct structProcInfo, None, rlProcInventoryRescueIconInit, rlProcInventoryRescueIconOnCycle, None ; 81/E0A1

rlProcInventoryRescueIconInit ; 81/E0A9

	.al
	.xl
	.autsiz
	.databank ?

	; Copy palette

	lda #<>$F4FF80
	sta lR18
	lda #>`$F4FF80
	sta lR18+1

	lda #<>aOAMPaletteBuffer.aPalette1
	sta lR19
	lda #>`aOAMPaletteBuffer.aPalette1
	sta lR19+1

	; Use allegiance to get right palette

	lda aProcSystem.wInput0,b
	lsr a
	and #(Player | Enemy | NPC) >> 1
	clc
	adc lR18
	sta lR18

	lda #size(aOAMPaletteBuffer.aPalette1)
	sta lR20

	jsl rlBlockCopy

	; Palette setting for sprite

	lda #$0200
	sta aProcSystem.aBody1,b,x
	rtl

rlProcInventoryRescueIconOnCycle ; 81/E0D9

	.al
	.xl
	.autsiz
	.databank ?

	phx
	lda #(`procSkillInfo)<<8
	sta lR44+1
	lda #<>procSkillInfo
	sta lR44
	jsl rlProcEngineFindProc
	plx
	bcc +

	rtl

	+
	phb
	php
	phk
	plb

	.databank `*

	lda #32
	sta wR0

	lda #256 + 40
	sec
	sbc wBufferBG3VOFS
	sta wR1

	stz wR4

	lda aProcSystem.aBody1,b,x
	sta wR5

	ldy #<>_Sprite
	jsl rlPushToOAMBuffer

	plp
	plb
	rtl

	_Sprite .dstruct structSpriteArray, [[[7, 6], $00, False, $114, 3, 0, False, False]]
