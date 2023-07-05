
procUnknown81BE18 .dstruct structProcInfo, None, rlProcUnknown81BE18Init, rlProcUnknown81BE18OnCycle, None ; 81/BE18

rlProcUnknown81BE18Init ; 81/BE20

	.al
	.xl
	.autsiz
	.databank ?

	rtl

rlProcUnknown81BE18OnCycle ; 81/BE21

	.al
	.xl
	.autsiz
	.databank ?

	lda wForcedMapScrollFlag,b
	bne +

	phx
	lda #(`procPhaseGraphicSprites)<<8
	sta lR44+1
	lda #<>procPhaseGraphicSprites
	sta lR44
	jsl rlProcEngineFindProc
	plx
	bcc +

	lda wJoy1New
	bit #JOY_R | JOY_L | JOY_X | JOY_A | JOY_Start | JOY_Y | JOY_B
	bne ++

	+
	rtl

	+
	phx
	jsl rlProcEngineFreeProc
	lda #(`$87C4EF)<<8
	sta lR44+1
	lda #<>$87C4EF
	sta lR44
	jsl rlProcEngineFindProc
	bcc +

	stz aProcSystem.aHeaderTypeOffset,b,x

	+
	lda #(`procUnknown81BDA3)<<8
	sta lR44+1
	lda #<>procUnknown81BDA3
	sta lR44
	jsl rlProcEngineFindProc
	bcc +

	stz aProcSystem.aHeaderTypeOffset,b,x

	+
	lda #(`procUnknown81BDA9)<<8
	sta lR44+1
	lda #<>procUnknown81BDA9
	sta lR44
	jsl rlProcEngineFindProc
	bcc +

	stz aProcSystem.aHeaderTypeOffset,b,x

	+
	lda #(`procPhaseGraphicSprites)<<8
	sta lR44+1
	lda #<>procPhaseGraphicSprites
	sta lR44
	jsl rlProcEngineFindProc
	bcc +

	stz aProcSystem.aHeaderTypeOffset,b,x

	+
	lda #(`procPhaseGraphicColor)<<8
	sta lR44+1
	lda #<>procPhaseGraphicColor
	sta lR44
	jsl rlProcEngineFindProc
	bcc +

	stz aProcSystem.aHeaderTypeOffset,b,x

	+
	lda #(`aFadingPaletteSpace)<<8
	sta lR18+1
	lda #<>aFadingPaletteSpace
	sta lR18
	lda #(`aBGPaletteBuffer.aPalette3)<<8
	sta lR19+1
	lda #<>aBGPaletteBuffer.aPalette3
	sta lR19
	lda #5 * $10 * 2
	sta lR20
	jsl rlBlockCopy

	lda #(`aFadingPaletteSpace+(5 * $10 * 2))<<8
	sta lR18+1
	lda #<>aFadingPaletteSpace+(5 * $10 * 2)
	sta lR18
	lda #(`aOAMPaletteBuffer.aPalette0)<<8
	sta lR19+1
	lda #<>aOAMPaletteBuffer.aPalette0
	sta lR19
	lda #4 * $10 * 2
	sta lR20
	jsl rlBlockCopy

	plx
	lda #$0003
	sta wUnknown000302,b
	sep #$20
	lda #T_Setting(True, True, True, False, True)
	sta bBufferTM
	stz bBufferTS
	rep #$30
	lda #<>aBG1TilemapBuffer
	sta wR0
	lda #$02FF
	jsl rlFillTilemapByWord
	jsl rlEnableBG1Sync
	rtl
