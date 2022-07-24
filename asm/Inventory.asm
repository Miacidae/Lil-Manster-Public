
aMainInventoryActionTable .binclude "../tables/SYSTEM/InventoryActionTable.casm" ; 81/CE55

rlBuildInventoryWindow ; 81/CE71

	.xl
	.autsiz
	.databank ?

	php
	phb
	sep #$20
	lda #`aBG1TilemapBuffer
	pha
	rep #$20
	plb

	.databank `aBG1TilemapBuffer

	jsl rlUnknown809FE5
	jsl rsSetInventorySubwindowShading
	jsl $85968D

	; Bar and label palettes

	lda #(`$9E8666)<<8
	sta lR18+1
	lda #<>$9E8666
	sta lR18
	lda #(`aBGPal3)<<8
	sta lR19+1
	lda #<>aBGPal3
	sta lR19
	lda #size(aBGPal3)+size(aBGPal4)
	sta wR20
	jsl rlBlockCopy

	; Item and weapon rank palettes

	lda #(`$9E8220)<<8
	sta lR18+1
	lda #<>$9E8220
	sta lR18
	lda #(`aBGPal5)<<8
	sta lR19+1
	lda #<>aBGPal5
	sta lR19
	lda #size(aBGPal5)+size(aBGPal6)
	sta wR20
	jsl rlBlockCopy

	; Item and skill info box palette

	lda #(`$F4FF60)<<8
	sta lR18+1
	lda #<>$F4FF60
	sta lR18
	lda #(`aBGPal7)<<8
	sta lR19+1
	lda #<>aBGPal7
	sta lR19
	lda #size(aBGPal7)
	sta wR20
	jsl rlBlockCopy

	; Alternate menutext palettes

	lda #(`$9E82A0)<<8
	sta lR18+1
	lda #<>$9E82A0
	sta lR18
	lda #(`aBGPal1)<<8
	sta lR19+1
	lda #<>aBGPal1
	sta lR19
	lda #size(aBGPal1)
	sta wR20
	jsl rlBlockCopy

	; Bar and label tiles

	lda #(`$9EDF1C)<<8
	sta lR18+1
	lda #<>$9EDF1C
	sta lR18
	lda #(`$7FB0F5)<<8
	sta lR19+1
	lda #<>$7FB0F5
	sta lR19
	jsl rlAppendDecompList
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, $7FB0F5, $1A00, VMAIN_Setting(True), $5000

	; Background tilemap

	lda #(`$9EDB28)<<8
	sta lR18+1
	lda #<>$9EDB28
	sta lR18
	lda #(`aBG1TilemapBuffer)<<8
	sta lR19+1
	lda #<>aBG1TilemapBuffer
	sta lR19
	jsl rlAppendDecompList

	; Bars and labels tilemap 81CF38

	; Text and frames tilemap

	jsl rlPickInventoryTilemaps

	.fill $81CF68 - *, $EA





	; Populate the window

	; 81CF68
	jsr rsInventorySetScrollPositions
	jsr rsInventorySelectMapSpritePalette
	jsl rlInventorySetSubwindows
	jsr rsInventoryDrawAlternateWeaponRanks
	jsr rsInventoryGetBaseStats 
	jsr rsInventoryDrawStatBonusNumbers	
	jsr rsInventoryDrawWeaponRanks	
	jsr rsInventoryDrawNameAndClass
	jsr rsInventoryDrawDebuffArrows
	jsr rsInventoryDrawStatNumbers
	jsr rsInventoryDrawRangeText
	jsr rsInventoryDrawStatBars
	jsr rsInventoryDrawSkillIcons
	jsr rsInventoryDrawPortrait
	jsr rsInventoryDrawIcons
	jsr rsInventoryDrawStatusText
	jsr rsInventoryDrawLeaderText
	jsr rsInventoryDrawRescueText
	jsr rsInventoryDrawLeadershipStars
	jsr rsInventoryDrawMovementStars
	jsr rsInventoryDrawItemNamesAndDurability
	jsr rsInventoryDrawEquippedItemE

	; Create a proc to handle scrolling arrows

	phx
	lda #(`procInventoryScrollingArrows)<<8
	sta lR43+1
	lda #<>procInventoryScrollingArrows
	sta lR43
	jsl rlProcEngineCreateProc
	plx

	; Copy tilemaps to RAM

	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG1TilemapBuffer, ((0 + (48 * $20)) * 2), VMAIN_Setting(True), $E000

	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG2TilemapBuffer, ((0 + (48 * $20)) * 2), VMAIN_Setting(True), $F000

	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG3TilemapBuffer, ((0 + (48 * $20)) * 2), VMAIN_Setting(True), $A000

	plb
	plp
	rtl

rsSetInventorySubwindowShading ; 81/CFE5

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	jsl $8591F0

	lda #3
	sta wR0
	lda #74 - 3
	sta wR1
	jsl $859233

	lda #78
	sta wR0
	lda #223 - 78
	sta wR1
	jsl $859233

	jsl $859205
	rtl

rsInventoryGetBaseStats ; 81/D00A

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	stz wCapturingFlag

	; Fill the action struct

	lda #<>aSelectedCharacterBuffer
	sta wR0

	lda #-1
	sta wR17

	jsl $83CE64

	lda #<>aActionStructUnit1
	sta wR1

	jsl $8391B4

	; Subtract bonuses from totals

	sep #$20
	lda aActionStructUnit1.Strength
	sec
	sbc aItemStatBonusBuffer.Strength
	sta aActionStructUnit1.Strength

	lda aActionStructUnit1.Magic
	sec
	sbc aItemStatBonusBuffer.Magic
	sta aActionStructUnit1.Magic

	lda aActionStructUnit1.Skill
	sec
	sbc aItemStatBonusBuffer.Skill
	sta aActionStructUnit1.Skill

	lda aActionStructUnit1.Speed
	sec
	sbc aItemStatBonusBuffer.Speed
	sta aActionStructUnit1.Speed

	lda aActionStructUnit1.Luck
	sec
	sbc aItemStatBonusBuffer.Luck
	sta aActionStructUnit1.Luck

	lda aActionStructUnit1.Defense
	sec
	sbc aItemStatBonusBuffer.Defense
	sta aActionStructUnit1.Defense

	lda aActionStructUnit1.Constitution
	sec
	sbc aItemStatBonusBuffer.Constitution
	sta aActionStructUnit1.Constitution

	lda aActionStructUnit1.Movement
	sec
	sbc aItemStatBonusBuffer.Movement
	sta aActionStructUnit1.Movement

	; Discard hit/might if unit has no usable weapons

	lda aActionStructUnit1.EquippedItemID2
	bne +

	lda #-1
	sta aActionStructUnit1.BattleMight
	sta aActionStructUnit1.BattleHit

	+

	; Discard EXP if not a player unit

	lda aActionStructUnit1.DeploymentNumber
	and #Player | Enemy | NPC
	beq +

	lda #-1
	sta aActionStructUnit1.Experience

	+
	rep #$30
	rts

rsInventorySetScrollPositions ; 81/D092

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	sep #$20

	; Set all tilemaps to 32x62

	lda bBuf_BG1SC
	and #~BG1SC.Size
	ora #BGSize32x64
	sta bBuf_BG1SC

	lda bBuf_BG2SC
	and #~BG2SC.Size
	ora #BGSize32x64
	sta bBuf_BG2SC

	lda bBuf_BG3SC
	and #~BG3SC.Size
	ora #BGSize32x64
	sta bBuf_BG3SC

	; Use all layers but BG4

	lda #TM_Setting(True, True, True, False, True)
	sta bBuf_TM

	rep #$30

	stz wInventorySkillInfoWindowIndex
	stz wInventoryItemInfoWindowOffset

	lda #$0000
	sta wInventoryActionIndex

	; Clear scroll offsets

	stz wBuf_BG1HOFS
	stz wBuf_BG2HOFS
	stz wBuf_BG3HOFS

	; Set scroll offsets based on if the screen
	; was scrolled last time the inventory was viewed

	lda wInventoryScrolledFlag
	bne +

	stz wBuf_BG1VOFS
	stz wBuf_BG2VOFS
	stz wBuf_BG3VOFS
	stz wUnknown7E51F6
	stz wUnknown7E51F9
	rts

	+
	lda #143
	sta wBuf_BG1VOFS
	sta wBuf_BG2VOFS
	sta wBuf_BG3VOFS
	sta wUnknown7E51F6
	sta wUnknown7E51F9
	rts

rsInventorySelectMapSpritePalette ; 81/D0E6

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; If unit's been rescued, skip checking
	; if gray

	lda aSelectedCharacterBuffer.TurnStatus,b
	bit #TurnStatusRescued
	bne +

	; Gray palette

	ldx #<>aOAMPal3

	; Check if unit is grayed

	lda aSelectedCharacterBuffer.TurnStatus,b
	bit #TurnStatusGrayed
	bne _CopyPalette

	+

	; Otherwise palette is by allegiance

	lda aSelectedCharacterBuffer.DeploymentNumber,b
	and #Player | Enemy | NPC
	beq _End ; Player palette already in aOAMPal0

	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	tax
	lda _PaletteSlotTable,x
	tax

	_CopyPalette
	ldy #<>aOAMPal0
	lda #size(aOAMPal0)-1
	mvn #$7E,#$7E

	_End
	rts

	_PaletteSlotTable ; 81/D116
		.word <>aOAMPal0
		.word <>aOAMPal1
		.word <>aOAMPal2

rsInventoryDrawNameAndClass ; 81/D11C

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Text info

	lda #<>$83C0F6
	sta lUnknown000DDE,b
	lda #>`$83C0F6
	sta lUnknown000DDE+1,b

	lda #$2180
	sta wUnknown000DE7,b

	; Name

	lda aActionStructUnit1.Character
	jsl $839334

	ldx #4 | (1 << 8) ; X | (Y << 8)
	jsl $87E728

	; Class

	lda aActionStructUnit1.Class
	jsl $839351

	ldx #2 | (3 << 8) ; X | (Y << 8)
	jsl $87E728

	rts

rsInventoryDrawDebuffArrows ; 81/D14B

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Units that are asleep, petrified,
	; or are rescuing someone get debuff arrows

	lda aActionStructUnit1.Status
	and #$00FF
	cmp #StatusSleep
	beq _DrawArrows

	cmp #StatusStone
	beq _DrawArrows

	lda aActionStructUnit1.TurnStatus
	bit #TurnStatusRescuing
	bne _DrawArrows

	; No debuff arrows

	bra _End

	_DrawArrows

	; Text info

	lda #$3580
	sta wUnknown000DE7,b

	lda #<>menutextStatDebuffArrows
	sta lR18
	lda #>`menutextStatDebuffArrows
	sta lR18+1
	ldx #7 | (12 << 8) ; X | (Y << 8)
	jsl $8588E4

	; Check if we need to draw a debuff arrow
	; for move

	lda #<>aSelectedCharacterBuffer
	sta wR14
	jsl $8387D5

	lda aActionStructUnit1.Movement
	and #$00FF
	cmp wR2
	beq _End

	; Draw arrow for move

	sep #$20
	lda wR2
	sta aActionStructUnit1.Movement
	rep #$20

	lda #<>menutextStatDebuffArrows
	sta lR18
	lda #>`menutextStatDebuffArrows
	sta lR18+1
	ldx #4 | (39 << 8) ; X | (Y << 8)
	jsl $87E728

	_End
	rts

	menutextStatDebuffArrows ; 81D1AA

	.word $AB81
	.word $0000

	.word $AB81
	.word $0000

	.word $AB81
	.word $0000

	.word $AB81
	.word $0000

	.word $4081
	.word $0000

	.word $AB81
	.word $0000
	.word $0000


rsInventoryDrawStatNumbers ; 81/D1C4

	jsl rlNewInventoryDrawStatNumbers
	rts

	.fill $81D27F - *, $FF

menutextDoubleDash ; 81D27F

	.word $5B81
	.word $5B81
	.word $0000

menutextQuadrupleDash ; 81D285

	.word $5B81
	.word $5B81
	.word $5B81
	.word $5B81
	.word $0000

aInventoryItemNameCoordinateTable ; 81/D28F
	.word 17 | (12 << 8)
	.word 17 | (14 << 8)
	.word 17 | (16 << 8)
	.word 17 | (18 << 8)
	.word 17 | (20 << 8)
	.word 17 | (22 << 8)
	.word 17 | (24 << 8)

aInventoryItemCurrentDurabilityCoordinateTable ; 81/D29D
	.word 26 | (12 << 8)
	.word 26 | (14 << 8)
	.word 26 | (16 << 8)
	.word 26 | (18 << 8)
	.word 26 | (20 << 8)
	.word 26 | (22 << 8)
	.word 26 | (24 << 8)

aInventoryItemSlashCoordinateTable ; 81/D2AB
	.word 27 | (12 << 8)
	.word 27 | (14 << 8)
	.word 27 | (16 << 8)
	.word 27 | (18 << 8)
	.word 27 | (20 << 8)
	.word 27 | (22 << 8)
	.word 27 | (24 << 8)

aInventoryItemMaxDurabilityCoordinateTable ; 81/D2B9
	.word 29 | (12 << 8)
	.word 29 | (14 << 8)
	.word 29 | (16 << 8)
	.word 29 | (18 << 8)
	.word 29 | (20 << 8)
	.word 29 | (22 << 8)
	.word 29 | (24 << 8)

rsInventoryDrawItemNamesAndDurability ; 81/D2C7

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	lda #aSelectedCharacterBuffer
	sta wR0

	lda #<>aActionStructUnit1
	sta wR1

	jsl $83905C

	lda #<>aActionStructUnit1.Item7ID
	sta wR16

	lda #size(aActionStructUnit1.Items) - 2
	sta wR17

	_Loop
	lda (wR16)
	bne +

	jmp _Next

	+

	; Grab item data and check if it's equippable

	jsl rlCopyItemDataToBuffer

	; Color

	stz wR15

	lda #<>aActionStructUnit1
	sta wR1
	jsl $83965E
	bcs +

	; If not equippable, swap color to gray

	inc wR15
	inc wR15

	+
	ldx wR15
	lda aInventoryTextBaseTable,x
	sta wUnknown000DE7,b

	; Item name

	jsl $83931A

	ldx wR17
	lda aInventoryItemNameCoordinateTable,x
	tax
	jsl $87E728

	; Durability

	lda wR15
	sta wUnknown000DE7,b

	ldx wR17
	lda aInventoryItemCurrentDurabilityCoordinateTable,x
	tax
	jsl $858921

	lda wR15
	sta wUnknown000DE7,b

	ldx wR17
	lda aInventoryItemMaxDurabilityCoordinateTable,x
	tax
	jsl $858912

	; Slash

	ldx wR15
	lda aInventoryTextBaseTable,x
	sta wUnknown000DE7,b

	lda #<>menutextSlash
	sta lR18
	lda #>`menutextSlash
	sta lR18+1
	ldx wR17
	lda aInventoryItemSlashCoordinateTable,x
	tax
	jsl $87E728

	_Next
	dec wR16
	dec wR16

	dec wR17
	dec wR17
	bmi _End

	jmp _Loop

	_End
	rts

aInventoryTextBaseTable ; 81/D35F
	.word $2180
	.word $2D80

aUnknown81D363 ; 81/D363
	.word $2AA0
	.word $2EA0

menutextSlash

	.word $5E81
	.word $0000

rsInventoryDrawRangeText ; 81/D36B

	jsl rlNewInventoryDrawRangeText
	rts

	.fill $81D39B - *, $EA

rsInventoryDrawPortrait ; 81/D39B

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	lda #12 | (1 << 8)
	sta wR0
	lda aActionStructUnit1.Character
	ldx #$0000
	jsl rlUnknown8CBF73
	rts

aInventoryStatBonusBufferOffsetTable ; 81/D3AB
	.word <>aBG3TilemapBuffer + (10 * 2) + ((13 * $20) * 2)
	.word <>aBG3TilemapBuffer + (10 * 2) + ((15 * $20) * 2)
	.word <>aBG3TilemapBuffer + (10 * 2) + ((17 * $20) * 2)
	.word <>aBG3TilemapBuffer + (10 * 2) + ((19 * $20) * 2)
	.word <>aBG3TilemapBuffer + (10 * 2) + ((21 * $20) * 2)
	.word <>aBG3TilemapBuffer + (10 * 2) + ((23 * $20) * 2)
	.word <>aBG3TilemapBuffer + (10 * 2) + ((25 * $20) * 2)

aInventoryStatBonusCoordinateTable ; 81/D3B9
	.word 11 | (13 << 8)
	.word 11 | (15 << 8)
	.word 11 | (17 << 8)
	.word 11 | (19 << 8)
	.word 11 | (21 << 8)
	.word 11 | (23 << 8)
	.word 11 | (25 << 8)

aInventoryStatBonusStatsTable ; 81/D3C7
	.word <>aItemStatBonusBuffer.Strength
	.word <>aItemStatBonusBuffer.Magic
	.word <>aItemStatBonusBuffer.Skill
	.word <>aItemStatBonusBuffer.Speed
	.word <>aItemStatBonusBuffer.Luck
	.word <>aItemStatBonusBuffer.Defense
	.word <>aItemStatBonusBuffer.Constitution
	.word $0000

rsInventoryDrawStatBonusNumbers ; 81/D3D7

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Text info

	lda #<>$83C0F6
	sta lUnknown000DDE,b
	lda #>`$83C0F6
	sta lUnknown000DDE+1,b

	stz wR17 ; Loop counter

	_Loop
	ldx wR17
	lda aInventoryStatBonusStatsTable,x
	beq _End

	; Check if bonus

	sta wR0
	lda (wR0)
	and #$00FF
	beq _Next

	pha

	lda aInventoryStatBonusBufferOffsetTable,x
	tay

	lda #$369A ; + tile
	sta $0000,b,y

	lda aInventoryStatBonusCoordinateTable,x
	tax
	lda #$368F
	sta wUnknown000DE7,b

	pla

	jsr rsInventoryGetStatBonusNumberTileIndex

	lda #<>wR14
	sta lR18
	lda #>`wR14
	sta lR18+1
	jsl $87DF69

	_Next
	inc wR17
	inc wR17
	bra _Loop

	_End
	rts

rsInventoryGetStatBonusNumberTileIndex ; 81/D426

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	phx
	phy

	asl a
	tax
	lda aInventoryStatBonusNumberTileTable,x
	sta wR14
	stz wR15

	ply
	plx
	rts

aInventoryStatBonusNumberTileTable ; 81/D435
	.word $0001
	.word $0002
	.word $0003
	.word $0004
	.word $0005
	.word $0006
	.word $0007
	.word $0008
	.word $0009
	.word $000A

aUnknown81D449 ; 81/D449
	.word 2 | ( 1 << 8)
	.word 2 | ( 2 << 8)
	.word 2 | ( 3 << 8)
	.word 2 | ( 4 << 8)
	.word 2 | ( 5 << 8)
	.word 2 | ( 6 << 8)
	.word 2 | ( 7 << 8)
	.word 2 | ( 8 << 8)
	.word 2 | ( 9 << 8)
	.word 2 | (10 << 8)
	.word 3 | ( 1 << 8)
	.word 3 | ( 2 << 8)
	.word 3 | ( 3 << 8)
	.word 3 | ( 4 << 8)
	.word 3 | ( 5 << 8)
	.word 3 | ( 6 << 8)
	.word 3 | ( 7 << 8)
	.word 3 | ( 8 << 8)
	.word 3 | ( 9 << 8)
	.word 3 | (10 << 8)
	.word 4 | ( 1 << 8)
	.word 4 | ( 2 << 8)
	.word 4 | ( 3 << 8)
	.word 4 | ( 4 << 8)
	.word 4 | ( 5 << 8)
	.word 4 | ( 6 << 8)
	.word 4 | ( 7 << 8)
	.word 4 | ( 8 << 8)
	.word 4 | ( 9 << 8)
	.word 4 | (10 << 8)

rlInventoryDrawMapSpriteDefaultPalette ; 81/D485

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	stz wR5 ; First palette
	bra rlInventoryDrawMapSprite._Main

rlInventoryDrawMapSpriteCheckGrayed ; 81/D489

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	lda structActionStructEntry.TurnStatus,b,y
	bit #TurnStatusGrayed
	beq rlInventoryDrawMapSprite

	lda #$0600 ; Gray palette
	sta wR5
	bra rlInventoryDrawMapSprite._Main

aInventoryMapSpritePaletteTable ; 81/D498
	.word 0 << 9
	.word 1 << 9
	.word 2 << 9

rlInventoryDrawMapSpriteUnknownNOP ; 81/D49E

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	nop
	nop

rlInventoryDrawMapSprite ; 81/D4A0

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Get palette by allegiance

	lda structActionStructEntry.DeploymentNumber,b,y
	and #$00FF
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	and #(Player | Enemy | NPC) >> 5
	tax
	lda aInventoryMapSpritePaletteTable,x
	sta wR5

	_Main

	; Determine if we're drawing a
	; map sprite or a rescued sprite

	lda structActionStructEntry.TurnStatus,b,y
	bit #TurnStatusRescued
	bne _DrawRescuedSprite

	lda structActionStructEntry.SpriteInfo2,b,y
	sta wR4

	; Check for tall sprite

	lda structActionStructEntry.SpriteInfo1,b,y
	and #$0080
	lsr a
	lsr a
	lsr a
	lsr a
	tax
	lda _SpriteSizeTable,x
	tay

	phb
	php
	phk
	plb

	.databank `*

	jsl rlPushToOAMBuffer

	plp
	plb

	.databank `aBG1TilemapBuffer

	rtl

	_SpriteSizeTable ; 81/D4DD
		.addr _ShortSprite
		.word $0000
		.word $0000
		.word $0000
		.addr _TallSprite

	_ShortSprite .dstruct structSpriteArray, [[[0, 2], $42, True, 0, 2, $000, False, False]]

	_TallSprite .dstruct structSpriteArray, [[[0, 2], $42, True, 0, 2, $000, False, False], [[0, -14], $42, True, $002, 2, 0, False, False]]

	_DrawRescuedSprite

	.databank `aBG1TilemapBuffer

	stz wR4

	phb
	php
	phk
	plb

	.databank `*

	ldy #<>_RescuedSprite
	jsl rlPushToOAMBuffer

	plp
	plb

	.databank `aBG1TilemapBuffer

	rtl

	_RescuedSprite .dstruct structSpriteArray, [[[7, 6], $00, False, $114, 2, 0, False, False]]

aInventoryStatBarTilemapTable ; 81/D511
	.word <>$F4FC00
	.word <>$F4FC40
	.word <>$F4FC80
	.word <>$F4FCC0
	.word <>$F4FD00
	.word <>$F4FD40
	.word <>$F4FD80
	.word <>$F4FDC0
	.word <>$F4FC14
	.word <>$F4FC54
	.word <>$F4FC94
	.word <>$F4FCD4
	.word <>$F4FD14
	.word <>$F4FD54
	.word <>$F4FD94
	.word <>$F4FDD4
	.word <>$F4FC28
	.word <>$F4FC68
	.word <>$F4FCA8
	.word <>$F4FCE8
	.word <>$F4FD28

aInventoryStatBarTilemapBufferTable ; 81/D53B
	.word <>aBG2TilemapBuffer + (3 * 2) + ((13 * $20) * 2)
	.word <>aBG2TilemapBuffer + (3 * 2) + ((15 * $20) * 2)
	.word <>aBG2TilemapBuffer + (3 * 2) + ((17 * $20) * 2)
	.word <>aBG2TilemapBuffer + (3 * 2) + ((19 * $20) * 2)
	.word <>aBG2TilemapBuffer + (3 * 2) + ((21 * $20) * 2)
	.word <>aBG2TilemapBuffer + (3 * 2) + ((23 * $20) * 2)
	.word <>aBG2TilemapBuffer + (3 * 2) + ((25 * $20) * 2)

aInventoryStatBarStats ; 81/D549
	.word <>aActionStructUnit1.Strength
	.word <>aActionStructUnit1.Magic
	.word <>aActionStructUnit1.Skill
	.word <>aActionStructUnit1.Speed
	.word <>aActionStructUnit1.Luck
	.word <>aActionStructUnit1.Defense
	.word <>aActionStructUnit1.Constitution
	.word $0000



rsInventoryDrawStatBars ; 81/D559

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Base tile

	lda #$2000
	sta wUnknown000DE7,b

	stz wR17 ; Loop counter

	; Use stat * 2 as index for which
	; tilemap to use

	_Loop

	ldx wR17
	lda aInventoryStatBarStats,x
	beq _End

	sta wR0

	lda #>`$F4FC00
	sta lR18+1

	lda (wR0)
	and #$00FF
	asl a
	tax
	lda aInventoryStatBarTilemapTable,x
	sta lR18

	ldx wR17
	lda aInventoryStatBarTilemapBufferTable,x
	sta lR19

	lda #10 ; Width
	sta wR0

	lda #1 ; Height
	sta wR1

	jsl $84A3FF

	inc wR17
	inc wR17
	bra _Loop

	_End
	rts

aInventoryItemIconVRAMTable ; 81/D59A
	.word (($7000 + ($80 * 0)) / 2)
	.word (($7000 + ($80 * 1)) / 2)
	.word (($7000 + ($80 * 2)) / 2)
	.word (($7000 + ($80 * 3)) / 2)
	.word (($7000 + ($80 * 4)) / 2)
	.word (($7000 + ($80 * 5)) / 2)
	.word (($7000 + ($80 * 6)) / 2)

aInventoryItemIconTileIndexTable ; 81/D5A8
	.word $3580
	.word $3584
	.word $3588
	.word $358C
	.word $3590
	.word $3594
	.word $3598

aInventoryItemIconCoordinateTable ; 81/D5B6
	.word 15 | (12 << 8)
	.word 15 | (14 << 8)
	.word 15 | (16 << 8)
	.word 15 | (18 << 8)
	.word 15 | (20 << 8)
	.word 15 | (22 << 8)
	.word 15 | (24 << 8)

aUnknown81D5C4 ; 81/D5C4
	.word $39C0
	.word $399C
	.word 25 | (1 << 8)

aInventoryWeaponRankIconVRAMTable ; 81/D5CA
	.word (($7400 + ($80 * 0)) / 2)
	.word (($7400 + ($80 * 1)) / 2)
	.word (($7400 + ($80 * 2)) / 2)
	.word (($7400 + ($80 * 3)) / 2)
	.word (($7400 + ($80 * 4)) / 2)
	.word (($7400 + ($80 * 5)) / 2)
	.word (($7400 + ($80 * 6)) / 2)
	.word (($7400 + ($80 * 7)) / 2)
	.word (($7400 + ($80 * 8)) / 2)
	.word (($7400 + ($80 * 9)) / 2)

aInventoryWeaponRankIconTileIndexTable ; 81/D5DE
	.word $39A0
	.word $39A4
	.word $39A8
	.word $39AC
	.word $39B0
	.word $39B4
	.word $39B8
	.word $39BC
	.word $39C0
	.word $39C4

aInventoryWeaponRankIconCoordinateTable ; 81/D5F2
	.word 16 | (31 << 8)
	.word 16 | (33 << 8)
	.word 16 | (35 << 8)
	.word 16 | (37 << 8)
	.word 16 | (39 << 8)
	.word 24 | (31 << 8)
	.word 24 | (33 << 8)
	.word 24 | (35 << 8)
	.word 24 | (37 << 8)
	.word 24 | (39 << 8)

aWeaponRankIconIndexTable ; 81/D606
	.word $00A7
	.word $00A8
	.word $00A9
	.word $00AA
	.word $00AB
	.word $00AC
	.word $00AD
	.word $00AE
	.word $00AF
	.word $00B0

rsInventoryDrawIcons ; 81/D61A

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	jsr rsInventoryDrawEquippedWeaponType
	jsr rsInventoryDrawItemIcons
	jsr rsInventoryDrawWeaponRankIcons
	rts

rsInventoryDrawEquippedWeaponType ; 81/D624

	jsl rlNewInventoryDrawEquippedWeaponType
	rts

	.fill $81D654 - *, $FF

rsInventoryDrawItemIcons ; 81/D654

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	stz wR17

	_Loop
	ldx wR17
	lda aActionStructUnit1.Items,x
	beq _End

	jsl rlCopyItemDataToBuffer

	lda aItemDataBuffer.Icon,b
	and #$00FF
	sta wR0

	lda aInventoryItemIconVRAMTable,x
	sta wR1

	jsl $8A8286

	stz wR1

	lda #<>aBG2TilemapBuffer
	sta wR0

	ldx wR17
	lda aInventoryItemIconTileIndexTable,x
	sta wUnknown000DE7,b

	lda aInventoryItemIconCoordinateTable,x
	tax

	jsl $8A821B

	inc wR17
	inc wR17
	lda wR17
	cmp #size(aActionStructUnit1.Items)
	bne _Loop

	_End
	rts

rsInventoryDrawWeaponRankIcons ; 81/D698

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	lda #(size(aActionStructUnit1.WeaponRanks) - 1) *2
	sta wR17

	_Loop
	ldx wR17
	lda aWeaponRankIconIndexTable,x
	sta wR0

	lda aInventoryWeaponRankIconVRAMTable,x
	sta wR1

	jsl $8A8286

	stz wR1

	lda #<>aBG2TilemapBuffer
	sta wR0

	ldx wR17
	lda aInventoryWeaponRankIconTileIndexTable,x
	sta wUnknown000DE7,b

	lda aInventoryWeaponRankIconCoordinateTable,x
	tax

	jsl $8A821B

	dec wR17
	dec wR17
	bpl _Loop

	rts

aInventoryWEXPCoordinateTable ; 81/D6CF
	.word 20 | (31 << 8)
	.word 20 | (33 << 8)
	.word 20 | (35 << 8)
	.word 20 | (37 << 8)
	.word 20 | (39 << 8)
	.word 28 | (31 << 8)
	.word 28 | (33 << 8)
	.word 28 | (35 << 8)
	.word 28 | (37 << 8)
	.word 28 | (39 << 8)

aInventoryWEXPStatTable ; 81/D6E3
	.word <>aActionStructUnit1.SwordRank
	.word <>aActionStructUnit1.LanceRank
	.word <>aActionStructUnit1.AxeRank
	.word <>aActionStructUnit1.BowRank
	.word <>aActionStructUnit1.StaffRank
	.word <>aActionStructUnit1.FireRank
	.word <>aActionStructUnit1.ThunderRank
	.word <>aActionStructUnit1.WindRank
	.word <>aActionStructUnit1.LightRank
	.word <>aActionStructUnit1.DarkRank
	.word $0000

rsInventoryDrawAlternateWeaponRanks ; 81/D6F9

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Only units able to mount/dismount get
	; alternate weapon ranks

	lda aSelectedCharacterBuffer.Skills1,b
	bit #Skill1Mount
	beq _End

	lda #<>aSelectedCharacterBuffer
	sta wR0

	lda #<>aActionStructUnit1
	sta wR1

	jsl $83905C

	lda aActionStructUnit1.Class
	jsl $83A80F
	bcs _Mounted

	; Get dismounted class

	lda $888000,x
	bra +

	_Mounted

	lda $88801C,x

	+

	; Get alternate class' weapon ranks

	sep #$20
	sta aActionStructUnit1.Class
	rep #$20

	lda #<>aActionStructUnit1
	sta wR1

	jsl $8391B4

	; Text info

	lda #<>$83C0F6
	sta lUnknown000DDE,b
	lda #>`$83C0F6
	sta lUnknown000DDE+1,b

	lda #$2D80
	sta wUnknown000DE7,b

	; We offset the text by 1

	lda #1
	sta wR16
	bra rsInventoryDrawWeaponRanks._Main

	_End
	rts

rsInventoryDrawWeaponRanks ; 81/D74C

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Text info

	lda #<>$83C0F6
	sta lUnknown000DDE,b
	lda #>`$83C0F6
	sta lUnknown000DDE+1,b

	lda #$2980
	sta wUnknown000DE7,b

	stz wR16 ; Offsetting value

	_Main

	stz wR17

	_Loop

	ldx wR17
	cpx #size(aActionStructUnit1.WeaponRanks)
	beq _End

	lda aActionStructUnit1.WeaponRanks,x
	and #$00FF

	jsl $83936D

	lda wR17
	asl a
	tax
	lda aInventoryWEXPCoordinateTable,x

	phy
	tay 
	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne + ; branch greater than 0

	tya
	ply
	clc 
	adc wR16
	bra ++

	+
	tya
	ply
	clc
	sbc wR16

	+
	tax
	jsl $87E728

	inc wR17
	bra _Loop

	_End

	jsl rlInventoryWEXPBars
	rts

; rsInventoryDrawWEXPProgress ; 81/D788
; 
; 	.al
; 	.xl
; 	.autsiz
; 	.databank `aBG1TilemapBuffer
; 
; 	; Unused routine
; 
; 	lda #$36A0
; 	sta wUnknown000DE7,b
; 
; 	stz wR17
; 
; 	_Loop
; 
; 	ldx wR17
; 	cpx #size(aActionStructUnit1.WeaponRanks)
; 	beq _End
; 
; 	stz lR18+1
; 
; 	lda aActionStructUnit1.WeaponRanks,x
; 	and #$00FF
; 
; 	-
; 	sec
; 	sbc #WeaponRankIncrement
; 	bpl -
; 
; 	clc
; 	adc #WeaponRankIncrement
; 	sta lR18
; 
; 	lda wR17
; 	asl a
; 	tax
; 	lda aInventoryWEXPCoordinateTable,x
; 	tax
; 	inc x
; 	inc x
; 	jsl $858859
; 
; 	inc wR17
; 	bra _Loop
; 
; 	_End
; 	rts

.fill $81D7BF - *, $FF




rlInventorySetSubwindows ; 81/D7BF

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	sep #$20

	lda #79
	sta bUnknown7E51F2
	sta bUnknown7E51F5

	lda #66
	sta bUnknown7E51F8

	stz bUnknown7E51FB

	rep #$30

	stz wUnknown7E51F3

	lda #<>aInventoryHDMAInfo1
	sta lR43
	lda #>`aInventoryHDMAInfo1
	sta lR43+1

	lda #3
	sta wR39

	jsl rlHDMAArrayEngineCreateEntryByIndex

	lda #<>aInventoryHDMAInfo3
	sta lR43
	lda #>`aInventoryHDMAInfo3
	sta lR43+1

	lda #5
	sta wR39

	jsl rlHDMAArrayEngineCreateEntryByIndex

	lda #$0009
	cmp wMenuType,b
	beq _End

	lda #<>aInventoryHDMAInfo2
	sta lR43
	lda #>`aInventoryHDMAInfo2
	sta lR43+1

	lda #4
	sta wR39

	jsl rlHDMAArrayEngineCreateEntryByIndex

	_End
	rtl

aInventoryHDMAInfo1 .dstruct structHDMAArrayEntryInfo, rlInventoryHDMADummy, rlInventoryHDMADummy, aInventoryHDMACode, bUnknown7E51F2, BG1VOFS - PPU_REG_BASE, DMAPx_Setting(DMAPx_TransferCPUToIO, DMAPx_Mode2, DMAPx_ABusFixed1, DMAPx_Direct) ; 81/D818

aInventoryHDMAInfo2 .dstruct structHDMAArrayEntryInfo, rlInventoryHDMADummy, rlInventoryHDMADummy, aInventoryHDMACode, bUnknown7E51F2, BG2VOFS - PPU_REG_BASE, DMAPx_Setting(DMAPx_TransferCPUToIO, DMAPx_Mode2, DMAPx_ABusFixed1, DMAPx_Direct) ; 81/D823

aInventoryHDMAInfo3 .dstruct structHDMAArrayEntryInfo, rlInventoryHDMADummy, rlInventoryHDMADummy, aInventoryHDMACode, bUnknown7E51F2, BG3VOFS - PPU_REG_BASE, DMAPx_Setting(DMAPx_TransferCPUToIO, DMAPx_Mode2, DMAPx_ABusFixed1, DMAPx_Direct) ; 81/D82E

rlInventoryHDMADummy ; 81/D839

	.al
	.xl
	.autsiz
	.databank ?

	rtl

aInventoryHDMACode ; 81/D83A

	.dstruct structHDMAArrayCodeHalt


rsInventoryDrawSkillIcons ; 81D83C

	jsl rlNewInventoryDrawSkillIcons
	brl $81D9CD

	.fill $81D9CD - *, $FF

rsInventoryDrawLeaderText ; 81/D9CD

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Text info

	lda #<>$83C0F6
	sta lUnknown000DDE,b
	lda #>`$83C0F6
	sta lUnknown000DDE+1,b

	lda #$2980
	sta wUnknown000DE7,b

	lda aActionStructUnit1.Leader
	jsl rlGetLeaderString
	ldx #5 | (31 << 8)
	jsl $87E728
	rts

rsInventoryDrawStatusText ; 81/D9EE

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Text info

	lda #<>$83C0F6
	sta lUnknown000DDE,b
	lda #>`$83C0F6
	sta lUnknown000DDE+1,b

	lda #$2980
	sta wUnknown000DE7,b

	lda aActionStructUnit1.Status
	jsl rlGetStatusString
	ldx #6 | (43 << 8)
	jsl $87E728
	rts

rlGetStatusString ; 81/DA0F

	.al
	.xl
	.autsiz
	.databank ?

	ldx #$0000 ; Counter

	; For each status the unit
	; DOES NOT have, increment count

	and #$000F
	beq _GetString

	.for status in [StatusSleep, StatusPoison, StatusSilence, StatusBerserk, StatusStone]

		inc x

		cmp #status
		beq _GetString

	.next

	; Hang

	-
	bra -

	_GetString

	lda #>`status_text_pointers
	sta lR18+1

	txa
	asl a
	tax

	lda status_text_pointers,x
	sta lR18
	rtl


	.fill $81DA98 - * , $FF


rsInventoryDrawRescueText ; 81/DA98

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	lda aActionStructUnit1.Rescue
	and #$00FF
	bne _Rescue

	; Carrying nobody, draw ----

	lda #<>menutextQuadrupleDash
	sta lR18
	lda #>`menutextQuadrupleDash
	sta lR18+1
	ldx #6 | (37 << 8)
	jsl $87E728
	rts

	_Rescue

	; Copy the rescue's data so we can grab
	; their name and see if they're the
	; rescuer or rescuee

	sta wR0
	lda #<>aBurstWindowCharacterBuffer
	sta wR1
	jsl $83901C

	lda aBurstWindowCharacterBuffer.Character,b
	jsl $839334

	ldx #6 | (37 << 8)

	; Check if rescuer or rescuee

	lda aBurstWindowCharacterBuffer.TurnStatus,b
	bit #TurnStatusRescued
	bne _Rescuee

	jsl $87E728
	rts

	_Rescuee

	; If they're being rescued we need to
	; draw the rescue icon

	jsl $87E728

	lda aBurstWindowCharacterBuffer.DeploymentNumber,b
	and #$00FF

	sta wProcInput0,b
	phx
	lda #(`procInventoryRescueIcon)<<8
	sta lR43+1
	lda #<>procInventoryRescueIcon
	sta lR43
	jsl rlProcEngineCreateProc
	plx
	rts

aInventoryECoordinateTable ; 81/DAF2
	.word 30 | (13 << 8)
	.word 30 | (15 << 8)
	.word 30 | (17 << 8)
	.word 30 | (19 << 8)
	.word 30 | (21 << 8)
	.word 30 | (23 << 8)
	.word 30 | (25 << 8)

rsInventoryDrawEquippedItemE ; 81/DB00

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	lda #<>aActionStructUnit1
	sta wR1
	jsl $839705

	lda aItemDataBuffer.DisplayedWeapon,b
	and #$00FF
	beq _End

	ldx wR1
	lda aInventoryECoordinateTable,x
	tax
	lda #16 | (35 << 8)
	jsl $87E0F6

	_End
	rts

rsInventoryDrawLeadershipStars ; 81/DB20

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	lda #$2980
	sta wUnknown000DE7,b

	lda aActionStructUnit1.LeadershipStars
	and #$00FF

	jsl rlGetStarString

	ldx #6 | (33 << 8)
	jsl $87E728
	rts

rsInventoryDrawMovementStars ; 81/DB38

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	lda #$2980
	sta wUnknown000DE7,b

	lda aActionStructUnit1.MovementStars
	and #$00FF
	sta wR13

	lda #5
	sta wR14

	jsl rlUnsignedDivide16By8

	lda wR13
	jsl rlGetStarString

	ldx #6 | (35 << 8)
	jsl $87E728
	rts

rlGetStarString ; 81/DB5D

	.al
	.xl
	.autsiz
	.databank ?

	; Given a number in A
	; return a pointer to menutext
	; for the number of stars in lR18

	; Inputs:
	; A: Number of stars

	; Outputs:
	; lR18: Long pointer to menutext

	; modified code

	phy 		
	tay 		; number of stars in A 
	lda #$4081
	sta $3FF0,b 	; use end of sound decomp buffer as storage 
	ldx #2 		; text string length?
	lda #$9A81
	cpy #6
	bcc _DBAE 	; branch if less than 6 stars

	sta $3FF0,b,X
	ldx #6
	cpy #100
	bcc + 		; branch if less than 100 stars 

	; more than 100
	inx
	inx

	+
	cpy #10
	bcc +

	inx
	inx 		; 10

	+
	phx
	phd
	pea $4200 	
	pld 		; swaps high byte to hardware multiplication registers

	-
	sty $04 	; WRDIVL dividend
	sep #$20
	lda #10
	sta $06		; WRDIVB divisor
	dex
	dex
	nop
	nop
	nop
	rep #$21
	lda #$824F
	adc $16 	; RDMPYL remainder
	xba
	sta $3FF0,b,X ; store actual number going from 1s digit to 10s, to 100s
	ldy $14 	; RDDIVL result
	bne - 

	pld
	plx
	bra +

	-
	sta $3FF0,b,X
	inx
	inx

	_DBAE 		; enters with less than 6 stars
	dey
	bpl -

	+
	stz $3FF0,b,X ; store terminator after number of stars
	lda #$3FF0
	cpx #10
	bcc + 		; branch if less than 10

	inc a
	inc a

	+
	sta lR18
	lda #$7E3F
	sta lR18+1
	ply
	rtl

rsInventoryActionUpdateGrowthInfoWindowHook

	jml rsInventoryActionUpdateGrowthInfoWindow

rsInventoryActionUpdateGrowthInfoWindowReturn

	rts

.fill $81DBDD - *, $FF

rlRunActionAndShowMapSprite ; 81/DBDD

	.al
	.xl
	.autsiz
	.databank `wInventoryActionIndex

	; Update scroll position

	lda wBuf_BG3VOFS
	sta wUnknown7E51F6
	sta wUnknown7E51F9

	; Get action

	lda wInventoryActionIndex
	and #$00FF
	asl a
	asl a
	tax
	lda aMainInventoryActionTable,x
	sta wR0
	pea <>(+)-1

	jmp (wR0)

	+
	jsl $8A8126

	; Draw map sprite

	ldy #<>aActionStructUnit1

	lda #16 ; X
	sta wR0

	lda #8 ; Y
	sta wR1

	jsl rlInventoryDrawMapSpriteDefaultPalette
	rtl

rsInventorySelectNextAction ; 81/DC10

	.al
	.xl
	.autsiz
	.databank `wInventoryActionIndex

	lda wInventoryActionIndex
	and #$00FF
	asl a
	asl a
	inc a
	inc a
	tax
	lda aMainInventoryActionTable,x
	sta wInventoryActionIndex
	rts

rsInventoryActionDefault ; 81/DC23

	.al
	.xl
	.autsiz
	.databank `wInventoryActionIndex

	jsr rsInventoryHandleInput
	rts

rsInventoryHandleInput ; 81/DC27

	.al
	.xl
	.autsiz
	.databank `wInventoryActionIndex

	lda wJoy1New

	bit #JoypadB
	bne _B_Press

	bit #JoypadUp
	bne _Up_Press

	bit #JoypadDown
	bne _Down_Press

	bit #JoypadX | JoypadSelect
	bne _XorSelect_Press

	bit #JoypadL
	beq +

	jmp _L_Press

	+
	bit #JoypadR
	beq +

	jmp _R_Press

	+
	bit #JoypadA | JoypadStart
	beq +

	jmp _AOrStart_Press

	+
	rts

	_Down_Press

	; 0 at top, -1 at bottom

	lda wInventoryScrolledFlag
	bne _End

	lda #-1
	sta wInventoryScrolledFlag

	lda #$0042
	jsl rlUnknown808CDD

	_UD_SetNext

	stz wInventoryScrollingStep

	lda #aMainInventoryActionTable.GetScrollAmount
	sta wInventoryActionIndex

	_End
	rts

	_Up_Press

	lda wInventoryScrolledFlag
	beq _End

	stz wInventoryScrolledFlag

	lda #$0041
	jsl rlUnknown808CDD

	bra _UD_SetNext

	_B_Press

	lda #$0021
	jsl rlUnknown808C87

	jmp rsInventorySelectNextAction

	_XorSelect_Press

	;lda wInventoryScrolledFlag
	;bne _X_Lower

	jml GrowthsDisplaySelectCheck
	nop

	_X_Higher

	; Else at the top, see if unit has items
	; before making the item info window

	lda aSelectedCharacterBuffer.Item1ID,b
	beq _End

	jsl rlCopyInventoryItemInfoWindowTilemaps

	; Set next action

	lda #aMainInventoryActionTable.DisplayItemInfoWindow
	sta wInventoryActionIndex
	rts

	_X_Lower

	; See if the unit has any skills before
	; making the skill info window

	lda wInventorySkillInfoWindowArrayOffset
	beq _End

	jsl rlCopyInventorySkillInfoWindowTilemaps

	lda #3 ; X
	sta wR0

	lda #33
	sta wR1

	jsl rlDrawSkillInfo

	lda #aMainInventoryActionTable.UpdateSkillInfoWindow
	sta wInventoryActionIndex
	rts

	_L_Press

	; If on the prep screen, don't allow
	; cycling using L/R

	lda wPrepScreenFlag,b
	bne _End

	lda aSelectedCharacterBuffer.DeploymentNumber,b

	jsl rlInventoryGetPreviousUnitInventory
	bra _LR_SetNext

	_R_Press

	lda wPrepScreenFlag,b
	bne _End

	lda aSelectedCharacterBuffer.DeploymentNumber,b

	jsl rlInventoryGetNextUnitInventory

	_LR_SetNext

	sta wR17

	; See if the unit's visible on the map before
	; trying to get their inventory window

	lda wDefaultVisibilityFill,b
	bne _GetNewInventory

	lda aActionStructUnit1.DeploymentNumber
	and #Player | Enemy | NPC

	jsl $83B296

	lda aAllegianceTargets,x
	and #$00FF
	cmp #Player
	bne _GetNewInventory
	jmp _End

	_GetNewInventory

	lda #$000A
	jsl rlUnknown808C87

	; Kill running procs

	lda #(`procInventoryScrollingArrows)<<8
	sta lR43+1
	lda #<>procInventoryScrollingArrows
	sta lR43
	jsl rlProcEngineFindProc
	bcc +

	stz aProcHeaderTypeOffset,b,x

	+
	lda #(`$83CB4B)<<8
	sta lR43+1
	lda #<>$83CB4B
	sta lR43
	jsl rlProcEngineFindProc
	bcc +

	stz aProcHeaderTypeOffset,b,x

	+
	lda #(`$83CB78)<<8
	sta lR43+1
	lda #<>$83CB78
	sta lR43
	jsl rlProcEngineFindProc
	bcc +

	stz aProcHeaderTypeOffset,b,x

	+
	lda wR17
	jsl rlUnknown80BBE2
	rts

	_AOrStart_Press

	lda aSelectedCharacterBuffer.Rescue,b
	and #$00FF
	bne +

	jmp _End

	+
	sta wR17
	bra _GetNewInventory

rsInventoryGetScrollAmount ; 81/DD4F

	.al
	.xl
	.autsiz
	.databank `wInventoryScrollingStep

	ldx wInventoryScrollingStep

	lda aInventoryScrollTable,x
	bpl +

	jmp rsInventorySelectNextAction

	+
	sta wR0

	lda wBuf_BG3VOFS
	ldy wInventoryScrolledFlag
	bne _Lower

	sec
	sbc wR0
	bra +

	_Lower
	clc
	adc wR0

	+
	sta wBuf_BG1VOFS
	sta wBuf_BG2VOFS
	sta wBuf_BG3VOFS

	inc wInventoryScrollingStep
	inc wInventoryScrollingStep
	rts

aInventoryScrollTable ; 81/DD79

	.word 36 ; 144/4
	.word 27 ; (144-36)/4
	.word 20 ; (144-36-27)/4
	.word 16 ; ...
	.word 11
	.word  8
	.word  7
	.word  5
	.word  3
	.word  3
	.word  2
	.word  2
	.word  1
	.word  1
	.word  0
	.word  1
	.word  0
	.sint -1
	.word  1
	.sint -1

rlInventoryActionCloseMenu ; 81/DDA1

	.al
	.xl
	.autsiz
	.databank `wInventoryScrollingStep

	; Kill running procs

	lda #(`procInventoryScrollingArrows)<<8
	sta lR43+1
	lda #<>procInventoryScrollingArrows
	sta lR43
	jsl rlProcEngineFindProc
	bcc +

	stz aProcHeaderTypeOffset,b,x

	+
	lda #(`$83CB4B)<<8
	sta lR43+1
	lda #<>$83CB4B
	sta lR43
	jsl rlProcEngineFindProc
	bcc +

	stz aProcHeaderTypeOffset,b,x

	+
	lda #(`$83CB78)<<8
	sta lR43+1
	lda #<>$83CB78
	sta lR43
	jsl rlProcEngineFindProc
	bcc +

	stz aProcHeaderTypeOffset,b,x

	+
	sep #$20
	lda #INIDISP_Setting(False, 0)
	sta bBuf_INIDISP
	rep #$20

	lda $7E4E12
	bne +

	lda aSelectedCharacterBuffer.X,b
	and #$00FF
	sta wR0

	lda aSelectedCharacterBuffer.Y,b
	and #$00FF
	sta wR1

	jsl $83C181

	lda aSelectedCharacterBuffer.X,b
	and #$00FF
	sta wR0

	lda aSelectedCharacterBuffer.Y,b
	and #$00FF
	sta wR1

	jsl rlUnknown81B4ED

	stz $7E4F91

	lda #$9EF0
	sta wProcInput0,b

	lda #(`procUnknown82A1BB)<<8
	sta lR43+1
	lda #<>procUnknown82A1BB
	sta lR43
	jsl rlProcEngineCreateProc
	pla
	rtl

	+
	lda lUnknown7EA4EC
	sta lR18
	lda lUnknown7EA4EC+1
	sta lR18+1
	lda aSelectedCharacterBuffer.DeploymentNumber,b
	and #$00FF
	phk
	pea <>(+)-1

	jmp [lR18]

	+
	jsl rlUnknown809C9B
	rts

rsInventoryActionDisplayItemInfoWindow ; 81/DE44

	.al
	.xl
	.autsiz
	.databank ?

	lda #2 ; X, 3 in vanilla
	sta wR0

	lda #7 ; Y, 11 in vanilla
	sta wR1

	lda #1 ; Flag
	sta wR2

	jsl rlDrawItemInfo
	jmp rsInventorySelectNextAction

rsInventoryActionUpdateItemInfoWindow ; 81/DE5A

	.al
	.xl
	.autsiz
	.databank ?

	jsr rsInventoryGetItemInfoItem
	jsr rsInventoryHandleItemInfoInput
	jsr rsInventoryDrawItemInfoCursor
	rts

rsInventoryHandleItemInfoInput ; 81/DE64

	.al
	.xl
	.autsiz
	.databank `wInventoryItemInfoWindowOffset

	lda wJoy1Alt
	bit #JoypadUp
	bne _Up

	bit #JoypadDown
	bne _Down

	lda wJoy1New
	bit #JoypadX | JoypadB
	beq +

	jmp _BOrX

	+
	rts

	_BOrX

	jsl rlCloseItemInfo
	jsl rlRevertInventoryItemInfoWindowTilemaps
	jmp rsInventorySelectNextAction

	_Up

	lda wInventoryItemInfoWindowOffset
	beq _End

	dec wInventoryItemInfoWindowOffset
	dec wInventoryItemInfoWindowOffset

	lda #$0009
	jsl rlUnknown808C87

	_End
	rts

	_Down

	ldx wInventoryItemInfoWindowOffset
	inc x
	inc x
	lda aActionStructUnit1.Items,x
	beq _End

	cpx #size(aActionStructUnit1.Items)
	beq _End

	inc wInventoryItemInfoWindowOffset
	inc wInventoryItemInfoWindowOffset

	lda #$0009
	jsl rlUnknown808C87
	rts

rsInventoryDrawItemInfoCursor ; 81/DEB6

	.al
	.xl
	.autsiz
	.databank `wInventoryItemInfoWindowOffset

	ldx wInventoryItemInfoWindowOffset
	lda aInventoryItemInfoWindowCursorTable,x
	sta wR1
	lda #104 ; X coordinate
	sta wR0
	jsl $859013
	rts

aInventoryItemInfoWindowCursorTable ; 81/DEC9
	.word  96
	.word 112
	.word 128
	.word 144
	.word 160
	.word 176
	.word 192

rsInventoryGetItemInfoItem ; 81/DED7

	.al
	.xl
	.autsiz
	.databank `wInventoryItemInfoWindowOffset

	ldx wInventoryItemInfoWindowOffset
	lda aActionStructUnit1.Items,x
	sta wInfoWindowTarget
	rts

rsInventoryUnknownDrawItemDescription ; 81/DEE1

	.al
	.xl
	.autsiz
	.databank ?

	lda #$2180
	sta wUnknown000DE7,b

	ldx #3 | (22 << 8)

	lda #<>menutextUnknownBlankItemDescription
	sta lR18
	lda #>`menutextUnknownBlankItemDescription
	sta lR18+1

	jsl $8588E4

	lda aItemDataBuffer.Traits,b
	bit #TraitWeapon
	beq +

	lda #>`$B08000
	sta lR18+1

	lda aItemDataBuffer.Description,b
	sta lR18
	beq +

	jsl $8588E4

	+
	rts

menutextUnknownBlankItemDescription ; 81/DF11

	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $0000

	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $4081
	.word $0000
	.word $0000


rsInventoryActionUpdateSkillInfoWindow ; 81/DF37

	.al
	.xl
	.autsiz
	.databank `wInventorySkillInfoWindowIndex

	jsr rsInventoryGetSkillInfoSkill
	jsr rsInventoryHandleSkillInfoInput
	jsr rsInventoryDrawSkillInfoCursor
	rts

rsInventoryHandleSkillInfoInput ; 81/DF41

	.al
	.xl
	.autsiz
	.databank `wInventorySkillInfoWindowIndex

	lda wJoy1Alt
	bit #JoypadLeft
	bne _Left

	bit #JoypadRight
	bne _Right

	lda wJoy1New
	bit #JoypadX | JoypadB
	beq +

	jmp _BOrX

	+
	rts

	_Left

	lda wInventorySkillInfoWindowIndex
	beq _End

	dec a
	dec a
	sta wInventorySkillInfoWindowIndex

	lda #$0009
	jsl rlUnknown808C87

	_End
	rts

	_Right

	lda wInventorySkillInfoWindowIndex
	inc a
	inc a
	cmp wInventorySkillInfoWindowArrayOffset
	beq _End

	sta wInventorySkillInfoWindowIndex

	lda #$0009
	jsl rlUnknown808C87
	rts

	_BOrX
	jsl rlClearInventorySkillInfoWindow
	jsl rlRevertInventorySkillInfoWindowTilemaps
	jmp rsInventorySelectNextAction

rsInventoryDrawSkillInfoCursor ; 81/DF8A

	.al
	.xl
	.autsiz
	.databank `wInventorySkillInfoWindowIndex

	ldx wInventorySkillInfoWindowIndex

	lda aInventorySkillIconCoordinateTable,x
	and #$00FF
	asl a
	asl a
	asl a
	sta wCursorXOffset,b

	lda aInventorySkillIconCoordinateTable+1,x
	sec
	sbc #18
	and #$00FF
	asl a
	asl a
	asl a
	sta wCursorYOffset,b

	jsl $83C753
	rts

rsInventoryGetSkillInfoSkill ; 81/DFB0

	.al
	.xl
	.autsiz
	.databank `wInventorySkillInfoWindowIndex

	ldx wInventorySkillInfoWindowIndex
	stx wInfoWindowTarget
	rts

rsInventoryActionUnknown ; 81/DFB7

	.al
	.xl
	.autsiz
	.databank ?

	rts

rlInventoryGetNextUnitInventory ; 81/DFB8

	.al
	.xl
	.autsiz
	.databank ?

	ldx #-1
	stx wR10

	ldx #0
	stx wR11

	ldx #TurnStatusDead | TurnStatusUnknown1 | TurnStatusInvisible | TurnStatusCaptured | TurnStatusUnknown2
	stx wR12

	ldx #2
	stx wR13

	bra rlInventoryGetUnit

rlInventoryGetPreviousUnitInventory ; 81/DFCE

	.al
	.xl
	.autsiz
	.databank ?

	ldx #0
	stx wR10

	ldx #-1
	stx wR11

	ldx #TurnStatusDead | TurnStatusUnknown1 | TurnStatusInvisible | TurnStatusCaptured | TurnStatusUnknown2
	stx wR12

	ldx #-2
	stx wR13

rlInventoryGetUnit ; 81/DFE2

	.al
	.xl
	.autsiz
	.databank `aActionStructUnit2

	; Inputs:
	; A: Original unit's deployment number
	; wR10: Start terminator
	; wR11: End terminator
	; wR12: Turn statuses a valid unit can't have
	; wR13: Step amount for deployment table

	and #$00FF
	asl a
	sta wR2

	_SearchLoop

	; Move forward or backward a
	; deployment table entry

	lda wR2
	clc
	adc wR13
	sta wR2

	tax
	lda $838E98,x

	; Check if we need to wrap

	cmp wR11
	beq +

	cmp wR10
	beq _WrapToLast

	+

	; Get slot and see if unit has right
	; turn status to be viewable

	tay
	lda $0000,b,y
	beq _Next

	txa
	lsr a
	sta wR0
	lda #<>aActionStructUnit2
	sta wR1
	jsl $83901C
	lda aActionStructUnit2.TurnStatus
	bit wR12
	beq _Found

	_Next
	bra _SearchLoop

	_WrapToLast

	ldx wR2

	_LastLoop

	; Loop until we find the end of the list

	lda $838E98,x
	cmp wR11
	beq _LastFound

	txa
	sec
	sbc wR13
	tax
	bra _LastLoop

	_LastFound

	stx wR2
	bra _SearchLoop

	_Found

	lda aActionStructUnit2.DeploymentNumber
	and #$00FF
	rtl

.include "PROCS/InventoryScrollingArrows.asm"
.include "PROCS/InventoryRescueIcon.asm"
