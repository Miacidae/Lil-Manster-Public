
rlDrawSkillInfo ; 81/F898

	.al
	.xl
	.autsiz
	.databank ?

	; Draws the skill info text

	; Inputs:
	; wR0: X coordinate in tiles
	; wR1: Y coordinate in tiles, min 20?

	php
	rep #$30

	lda wR0
	sta aProcSystem.wInput0,b ; X

	; Not sure yet why it's Y-2

	lda wR1
	dec a
	dec a
	sta aProcSystem.wInput1,b ; Y
	phx
	lda #(`procSkillInfo)<<8
	sta lR44+1
	lda #<>procSkillInfo
	sta lR44
	jsl rlProcEngineCreateProc
	plx
	plp
	rtl

procSkillInfo .dstruct structProcInfo, None, rlProcSkillInfoInit, rlProcSkillInfoOnCycle, None ; 81/F8B9

rlProcSkillInfoInit ; 81/F8C1

	.al
	.xl
	.autsiz
	.databank ?

	; aProcSystem.aBody0: drawn skill icon array offset

	lda #$FFFF
	sta wInfoWindowTarget
	sta aProcSystem.aBody0,b,x

	; aProcSystem.aBody1: X | (Y << 8)

	lda aProcSystem.wInput1,b
	xba
	ora aProcSystem.wInput0,b
	sta aProcSystem.aBody1,b,x

	; aProcSystem.aBody3: X

	lda aProcSystem.wInput0,b
	sta aProcSystem.aBody3,b,x

	; aProcSystem.aBody4: Y - 18?

	lda aProcSystem.wInput1,b
	sec
	sbc #18
	sta aProcSystem.aBody4,b,x

	; aProcSystem.aBody2: Tilemap position

	lda aProcSystem.wInput1,b
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc aProcSystem.wInput0,b
	asl a
	clc
	adc #<>aBG3TilemapBuffer
	sta aProcSystem.aBody2,b,x

	rtl

rlProcSkillInfoOnCycle ; 81/F8FA

	.al
	.xl
	.autsiz
	.databank ?

	; Nothing to do if already displaying
	; info for the right skill

	lda aProcSystem.aBody0,b,x
	cmp wInfoWindowTarget
	bne +

	rtl

	+
	php
	phb
	sep #$20
	lda #`wInfoWindowTarget
	pha
	rep #$20
	plb

	.databank `wInfoWindowTarget

	lda #<>$83C0F6
	sta aCurrentTilemapInfo.lInfoPointer,b
	lda #>`$83C0F6
	sta aCurrentTilemapInfo.lInfoPointer+1,b

	; Fetch the icon index and type of skill

	lda wInfoWindowTarget
	sta aProcSystem.aBody0,b,x
	tay
	lda aInventorySkillInfoWindowIconArray,y
	sta aProcSystem.aBody5,b,x
	lda aInventorySkillInfoWindowTypeArray,y
	sta aProcSystem.aBody6,b,x

	; Do the thing

	jsr rsProcSkillInfoClearTilemap
	jsr rsProcItemInfoClearIcons
	jsr rlProcSkillInfoDrawIcon
	jsr rlProcSkillInfoDrawSkillName
	jsr rlProcSkillInfoDrawSkillDescription
	jsr rlProcSkillInfoDrawSkillType
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG3TilemapBuffer+$0780, $03C0, VMAIN_Setting(True), $A780

	plb
	plp
	rtl

rsProcSkillInfoClearTilemap ; 81/F94F

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	phx
	lda aProcSystem.aBody2,b,x
	sta wR0
	lda #10
	sta wR1
	lda #13
	sta wR2
	jsl rlFillTilemapRectByWord
	plx
	rts

rlProcSkillInfoDrawIcon ; 81/F965

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	phx

	; Icon index

	lda aProcSystem.aBody5,b,x
	sta wR2

	; Palette

	lda #5 << 9
	sta wR3

	; X

	lda aProcSystem.aBody3,b,x
	sta wR0

	; Y

	lda aProcSystem.aBody4,b,x
	sta wR1

	jsl $8A8085
	plx
	rts

rlProcSkillInfoDrawSkillName ; 81/F980

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	lda #$2180
	sta aCurrentTilemapInfo.wBaseTile,b

	phx
	phx
	lda #>`aSkillNamePointers
	sta lR18+1

	; Use icon index to fetch name

	lda aProcSystem.aBody5,b,x
	sec
	sbc #$00B1 ; Start of skill icons in sheet
	asl a
	tax
	lda aSkillNamePointers,x
	sta lR18
	plx

	; Draw name at X+2, Y
	; To account for icon

	lda aProcSystem.aBody1,b,x
	inc a
	inc a
	tax
	jsl $87E728
	plx
	rts

rlProcSkillInfoDrawSkillDescription ; 81/F9A9

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	; Same as the name, basically

	phx
	phx
	lda #>`aSkillDescriptionPointers
	sta lR18+1
	lda aProcSystem.aBody5,b,x
	sec
	sbc #$00B1
	asl a
	tax
	lda aSkillDescriptionPointers,x
	sta lR18
	plx

	; Draw to X, Y+3

	lda aProcSystem.aBody1,b,x
	clc
	adc #3 << 8
	tax
	jsl $8588E4
	plx
	rts

rlProcSkillInfoDrawSkillType ; 81/F9CE

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	phx
	phx
	lda #$3580 ; 3580
	sta aCurrentTilemapInfo.wBaseTile,b

	lda #>`menuTextClassSkill
	sta lR18+1

	; Use skill type to get text

	lda aProcSystem.aBody6,b,x
	tax
	lda aSkillTypeTextPointers,x
	sta lR18
	plx

	; Draw to X+4, Y+9

	lda aProcSystem.aBody1,b,x
	clc
	adc #0 | (11 << 8) 	; 4 | 9 in vanilla
	tax
	jsl $87E728
	plx
	rts