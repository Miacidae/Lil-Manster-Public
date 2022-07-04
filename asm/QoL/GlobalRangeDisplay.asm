
* := $476300
.logical $0EE300

rlGlobalRangeButtonInputCheck

	.al
	.autsiz
	.databank ? 

	; leftover stuff
	asl a 
	bpl + 					; branch if JoypadStart isnt pressed

	stz wUnknown000E2B,b
	jsl rlDisplayMinimap	; show minimap

	+ ; new stuff
	lda wJoy1New
	bit #JoypadL
	beq + ; branch if not perssed

	jsr rsDrawGlobalRange

	+
	rtl

	.databank 0

rsDrawGlobalRange

	.al
	.autsiz
	.databank ? 

	stz wR0
	lda #<>rlCheckIfEnemiesOnMap
	sta lR25
	lda #>`rlCheckIfEnemiesOnMap
	sta lR25+1
	jsl rlRunRoutineForAllTilesVisibleByPlayer
	lda wR0
	beq _Out

	jsl rlClearJoyNewInputs
	lda #$FFFF
	sta wTerrainWindowTerrain
	jsl rlUpdateBurstWindow._ClearWindow

	; Clear map

	lda #<>aMovementMap
	sta lR18
	lda #>`aMovementMap
	sta lR18+1
	lda #$0000
	jsl rlFillMapByWord

	lda #<>rlGetIndividualRange
	sta lR25
	lda #>`rlGetIndividualRange
	sta lR25+1
	jsl rlRunRoutineForAllTilesVisibleByPlayer ; input - lR25 = routine, aPlayerVisibleUnitMap = visible tiles

	lda #<>aRangeMap
	sta lR18
	lda #>`aRangeMap
	sta lR18+1
	lda #$FFFF
	jsl rlFillMapByWord

	jsl rlUpdateUnitMapsAndFog ; fixes the map scroll offset 
	jsl $83C1E9 ; proc range tile display, input: movement map with tiles to draw, red on tiles where rangemap = FF


	lda #$0024 	; rsGlobalRangeCancelCursorPlacementHook
	sta wUnknown000E25,b
	rts

	_Out
	lda #$000B
	jsl rlUnknown808C87
	rts

	.databank 0

rlGetIndividualRange

	.al
	.autsiz
	.databank $7E

	; input: X = map tile index, A = deployment number
	; out: movement map of selected unit with every attackable tile

	rep #$30
	and #$00FF
	beq _Out

	sta wR0
	jsl rlCheckIfTargetableAllegiance
	bcc _Out

	sta wR0

	sep #$20
	lda #0
	sta aRangeMap,X
	rep #$20

	lda #aSelectedCharacterBuffer
	sta wR1
	jsl rlCopyCharacterDataToBufferByDeploymentNumber

	lda aSelectedCharacterBuffer.Status,b
	and #$00FF
	cmp #StatusSleep
	beq _Out

	cmp #StatusStone
	beq _Out

	lda #<>aSelectedCharacterBuffer
	sta wR14
	jsl rlUnknown8387D5 ; get effective move, in: wR14 buffer, out: A= effevtive move
	sta wR2
	sta $7E4F9C
	lda aSelectedCharacterBuffer.X,b
	and #$00FF
	sta wR0
	lda aSelectedCharacterBuffer.Y,b
	and #$00FF
	sta wR1
	lda aSelectedCharacterBuffer.Class,b
	and #$00FF
	sta wR3
	lda #$FFFF
	sta wR4
	lda aSelectedCharacterBuffer.Skills1,b
	sta wR5
	jsl rlUnknown81B9F4 ; fill movement map 

	jsl rlDrawGlobalAttackRange

	_Out
	rtl 

	.databank 0

rlGlobalRangeCancelCursorPlacement

	.al
	.autsiz
	.databank ?

	lda wUnknown000E6D,b
	bne _Out

	jsl rlClearJoypadDirectionalInputsWhileCursorScrolling
	jsl $83BE94
	lda #4
	jsl $83BF67
	jsl rlClearJoypadDirectionalInputsWhileCursorScrolling
	jsl $83C6A9
	lda wJoy1New
	and #JoypadB | JoypadL
	beq _KeepGlobalRange

	; JoypadB / JoypadL pressed

	jsl $81FCE0 			; make a sound 
	lda #aSelectedCharacterBuffer
	sta wR1 
	jsl rlCopyCharacterDataFromBuffer
	jsl rlUpdateRescuedUnitCoordinates
	jsl lrUnknown83894CHook ; update maps and cancel range
	jsl $8A9013
	jmp rsMovedUnknown838529

	_KeepGlobalRange
	bit wJoy1Input
	bvc _Out

	jsr rsMapEnableFastCursorGlobalRange

	_Out
	rtl

	.databank 0

rsMovedUnknown838529 ; 83/8529

	.al
	.autsiz
	.databank ?

	lda wUnknown000E25,b
	and #$00FF
	asl a
	asl a
	inc a
	inc a
	tax
	lda aUnknown83848B,x
	sta wUnknown000E25,b
	rtl

rsMapEnableFastCursorGlobalRange

	.al
	.autsiz
	.databank `wTerrainWindowTerrain

	lda wCursorXCoordPixelsScrolling,b
	ora wCursorYCoordPixelsScrolling,b
	and #$0007
	bne ++

	lda #$FFFF
	sta wTerrainWindowTerrain
	lda wUnknown000E25,b
	jsl rlUnknown8397E8
	lda #$0024
	cmp wUnknown000E25,b
	beq +

	jsl $849FB3
	jsl $84A125
	jsl rlEnableBG1Sync
	jsl rlEnableBG3Sync

	+
	lda #$0004
	sta wUnknown000E25,b

	+
	rts

rlDrawGlobalAttackRange

	stz wR15
	stz wR16

	; Loop through items, getting ranges if weapons

	ldy #size(aSelectedCharacterBuffer.Items) - 2

	_Loop
	lda aSelectedCharacterBuffer.Items,b,y
	beq _Next

	jsl rlCopyItemDataToBuffer
	lda aItemDataBuffer.Traits,b
	bit #TraitWeapon
	beq _Next

	lda #<>aSelectedCharacterBuffer
	sta wR1
	jsl rlCheckItemEquippable
	bcc _Next

	lda aSelectedCharacterBuffer.Status,b
	and #$00FF
	cmp #StatusSilence
	bne +

	lda aItemDataBuffer.Traits,b
	bit #TraitTome
	beq _Next

	+
	lda aItemDataBuffer.Range,b
	and #$00FF
	cmp # 3 | (15 << 4)
	bne +

	jmp _3To15Range

	+
	and #$000F
	tax
	inc wR15,x
	cmp #3
	beq _Next

	lda aItemDataBuffer.Range,b
	and #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	tax
	inc wR15,x

	_Next
	dey
	dey
	bpl _Loop

	sep #$20
	lda wR15+1
	beq +

	lda #$10

	+
	sta wR15

	lda wR16
	beq +

	lda #$01

	+
	sta wR16

	lda wR16+1
	beq +

	lda #$10

	+
	ora wR16
	sta wR15+1
	rep #$30

	; got range of all weapons in inv 

	+
	lda wR15
	cmp #$0010
	beq _1RangeOnly

	cmp #$0100
	beq _2RangeOnly

	cmp #$0110
	beq _1To2Range

	cmp #$1000
	beq _3To10Range

	cmp #$1010
	beq _Not2Range

	cmp #$1110
	beq _1To10Range

	rtl

	_1RangeOnly
	jsl rlDrawRangeTilesGlobal1RangeOnly
	jsl $848B72 ; movement + edge cleanup?
	rtl

	_1To2Range
	jsl rlDrawRangeTilesGlobal1To2Range
	jsl $848B72
	rtl

	_2RangeOnly
	jsl rlDrawRangeTilesGlobal2RangeOnly
	jsl $848B72
	rtl

	_Not2Range ; dunno really
	jsl rlSetupRangePathDirectionDistances
	sep #$20
	lda #$71
	sta bMovementCostCap,b
	rep #$20
	jsl rlUnknown80E551

	_3To10Range
	lda #3 | (10 << 4)
	sta wR17
	jsr rsDrawAttackRangeGlobalByMinMax
	jsl $848B72
	rtl

	_1To10Range
	lda #1 | (10 << 4)
	sta wR17
	jsr rsDrawAttackRangeGlobalByMinMax
	jsl $848B72
	rtl

	_3To15Range
	lda #3 | (15 << 4)
	sta wR17
	jsr rsDrawAttackRangeGlobalByMinMax
	jsl $848B72
	rtl

rsDrawAttackRangeGlobalByMinMax

	.al
	.xl
	.autsiz
	.databank `aPlayerVisibleUnitMap

	pei (lR25)
	pei (lR25+1)

	lda #<>rlDrawAttackRangeGlobalByMinMaxEffect
	sta lR25
	lda #>`rlDrawAttackRangeGlobalByMinMaxEffect
	sta lR25+1
	jsl rlRunRoutineForAllTilesInRange

	pla 
	sta lR25+1
	pla 
	sta lR25
	rts

	.databank 0

rlDrawRangeTilesGlobal1RangeOnly

	.al
	.xl
	.autsiz
	.databank `aRangeMap

	php
	lda #<>aMovementMap
	sec
	sbc wMapRowSize,b
	sta wR0
	lda #<>aMovementMap
	clc
	adc wMapRowSize,b
	sta wR1
	lda wMapTileCount,b
	sec
	sbc wMapRowSize,b
	tay
	sep #$20

	-
	lda aRangeMap,y
	bmi ++

	lda aPlayerVisibleUnitMap,y
	beq +

	cmp aSelectedCharacterBuffer.DeploymentNumber
	bne ++

	+
	lda #$01
	sta aMovementMap - 1,y
	sta aMovementMap + 1,y
	sta (wR0),y
	sta (wR1),y

	+
	dec y
	cpy wMapRowSize,b
	bne -

	plp
	rtl

rlDrawRangeTilesGlobal1To2Range

	.al
	.xl
	.autsiz
	.databank `aRangeMap

	php
	lda #<>aMovementMap
	sec
	sbc wMapRowSize,b
	sec
	sbc wMapRowSize,b
	sta wR0
	lda #<>aMovementMap
	sec
	sbc wMapRowSize,b
	sta wR2
	dec a
	sta wR1
	inc a
	inc a
	sta wR3
	lda #<>aMovementMap
	clc
	adc wMapRowSize,b
	sta wR5
	dec a
	sta wR4
	inc a
	inc a
	sta wR6
	lda #<>aMovementMap
	clc
	adc wMapRowSize,b
	clc
	adc wMapRowSize,b
	sta wR7
	lda wMapRowSize,b
	sta wR8
	ldy wMapTileCount,b
	sec
	sbc wMapRowSize,b
	sep #$20

	-
	lda aRangeMap,y
	bmi ++

	lda aPlayerVisibleUnitMap,y
	beq + ; continue if tile is empty


	cmp aSelectedCharacterBuffer.DeploymentNumber
	bne ++

	+
	lda #$01
	sta aMovementMap - 2,y
	sta aMovementMap - 1,y
	sta aMovementMap + 1,y
	sta aMovementMap + 2,y
	sta (wR0),y
	sta (wR1),y
	sta (wR2),y
	sta (wR3),y
	sta (wR4),y
	sta (wR5),y
	sta (wR6),y
	sta (wR7),y

	+
	dec y
	cpy wR8
	bne -

	plp
	rtl

rlDrawRangeTilesGlobal2RangeOnly 

	.al
	.xl
	.autsiz
	.databank `aRangeMap

	php
	lda #<>aMovementMap
	sec
	sbc wMapRowSize,b
	sec
	sbc wMapRowSize,b
	sta wR0
	clc
	adc wMapRowSize,b
	dec a
	sta wR1
	inc a
	inc a
	sta wR2
	lda #<>aMovementMap
	clc
	adc wMapRowSize,b
	dec a
	sta wR3
	inc a
	inc a
	sta wR4
	clc
	adc wMapRowSize,b
	dec a
	sta wR5
	lda #<>aMovementMap
	clc
	adc wMapRowSize,b
	clc
	adc wMapRowSize,b
	sta wR7
	lda wMapRowSize,b
	sta wR8
	ldy wMapTileCount,b
	sec
	sbc wMapRowSize,b
	sep #$20

	-
	lda aRangeMap,y
	bmi ++

	lda aPlayerVisibleUnitMap,y
	beq + ; continue if tile is empty

	cmp aSelectedCharacterBuffer.DeploymentNumber
	bne ++ ; if not empty check if its the same unit, if not quit

	+
	lda #$01
	sta aMovementMap - 2,y
	sta aMovementMap + 2,y
	sta (wR0),y
	sta (wR1),y
	sta (wR2),y
	sta (wR3),y
	sta (wR4),y
	sta (wR5),y

	+
	dec y
	cpy wR8
	bne -

	plp
	rtl


rlDrawAttackRangeGlobalByMinMaxEffect

	.al
	.xl
	.autsiz
	.databank `aPlayerVisibleUnitMap

	lda aPlayerVisibleUnitMap,x
	beq +

	cmp aSelectedCharacterBuffer.DeploymentNumber
	bne _End

	+
	rep #$30
	txa
	jsl rlGetMapCoordsByTileIndex
	lda #<>aMovementMap
	sta wR3
	lda wR17 ; min | (max << 4)
	jsl rlUnknown80E5CD
	sep #$20

	_End
	rtl

	.databank 0
	
rlCheckIfEnemiesOnMap

	.al
	.xl
	.autsiz
	.databank `aPlayerVisibleUnitMap

	jsl rlCheckIfTargetableAllegiance
	bcc +

	; enemy count
	inc wR0

	+
	rtl

	.databank 0

.here 