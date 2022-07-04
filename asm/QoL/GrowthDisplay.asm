; FE5 Growth Display - by Ultimage

* = $480000
.logical $108000

GrowthsDisplaySelectCheck

	bit #JoypadSelect
	bne _SelectPressed

	; X Pressed
	lda wInventoryScrolledFlag
	beq _XonUpperScreen

	jml rsInventoryHandleInput._X_Lower

	_XonUpperScreen

	jml rsInventoryHandleInput._X_Higher


_SelectPressed 

	lda aSelectedCharacterBuffer.DeploymentNumber,b
	and #Player | Enemy | NPC
	beq +

	jml rsInventoryHandleInput._End

	+ ; draw only for players
	lda wInventoryScrolledFlag
	beq +

	jml rsInventoryHandleInput._End ; dont allow window on lower half

	+
	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne +

	jml rsInventoryHandleInput._End

	+ ; only show when not on option "0"
	jsl rlCopyInventoryItemInfoWindowTilemaps ; just use the same window
	jsl rlDrawGrowthInfo

	lda #aMainInventoryActionTable.UpdateGrowthInfoWindow
	sta wInventoryActionIndex

	lda #$0023
	jsl rlUnknown808C87 ; make a "ding" sound to check

	jml rsInventoryHandleInput._End


rlDrawGrowthInfo ; 13c29b

	.al
	.xl
	.autsiz
	.databank ?

	; Inputs:
	; wR0: X coordinate in tiles
	; wR1: Y coordinate in tiles

	php
	rep #$30

	; X

	lda #1
	sta wProcInput0,b

	; Y

	lda #7
	sta wProcInput1,b

	phx
	lda #(`procGrowthInfo)<<8
	sta lR43+1
	lda #<>procGrowthInfo
	sta lR43
	jsl rlProcEngineCreateProc
	plx

	plp
	rtl

procGrowthInfo .dstruct structProcInfo, None, rlProcGrowthInfoInit, rlProcGrowthInfoOnCycle , None ; 13C2BC

rlProcGrowthInfoInit ; 13C2C4

	.al
	.xl
	.autsiz
	.databank ?

	; aProcBody1: X | (Y << 8)

	lda wProcInput1,b 	; Y 
	xba
	ora wProcInput0,b
	sta aProcBody1,b,x

	; aProcBody3: X+2, where labels go

	lda wProcInput0,b
	clc
	adc #2
	sta aProcBody3,b,x

	; aProcBody4: Y

	lda wProcInput1,b
	sta aProcBody4,b,x

	; aProcBody2: tilemap position

	lda wProcInput1,b ; Y
	asl a
	asl a
	asl a
	asl a
	asl a ; x32
	clc
	adc wProcInput0,b ; X
	asl a
	clc
	adc #<>aBG3TilemapBuffer
	sta aProcBody2,b,x
	rtl

rlProcGrowthInfoOnCycle ; 13C304

	.al
	.xl
	.autsiz
	.databank ?

	php
	phb

	sep #$20
	lda #`wInfoWindowTarget
	pha
	rep #$20
	plb

	lda #<>$83C0F6
	sta lUnknown000DDE,b
	lda #>`$83C0F6
	sta lUnknown000DDE+1,b

	lda aProcBody1,b,x
	sta wR16

	phx
	jsr rsProcItemInfoDrawGrowthLabels
	jsr rsProcItemInfoDrawGrowthStatNumbers
	jsr rsProcItemInfoDrawGrowthModifyingStatNumbers
	plx

	lda #$0000
	sta aProcHeaderOnCycle,b,x

	plb
	plp
	rtl


rsProcItemInfoDrawGrowthLabels

	.al
	.xl
	.autsiz
	.databank $7E

	lda #$2180
	sta wUnknown000DE7,b

	lda #<>GrowthLabels
	sta lR18
	lda #>`GrowthLabels
	sta lR18+1
	lda aProcBody1,b,x
	tax
	jsl $8588E4 	; draw text on several lines

	rts

rsProcItemInfoDrawGrowthStatNumbers

	.al
	.xl
	.autsiz
	.databank $7E

	lda aActionStructUnit1.Character
	and #$00FF
	jsl rlCopyCharacterDataToBuffer


	lda #$2AA0
	sta wUnknown000DE7,b

	stz wR17

	-

	; Fetch stat based on pointer pulled from
	; table

	ldx wR17
	lda _StatTable,x
	beq _End

	tay
	lda $0000,b,y
	and #$00FF
	sta lR18
	stz lR18+1

	; Next grab local coordinates and combine
	; with coordinates before drawing

	lda _StatTable+2,x
	clc
	adc wR16
	tax
	jsl $858859

	_Next
	lda wR17
	clc
	adc #$0004
	sta wR17
	bra -

	_End
	rts

	_StatTable ; 81/F799
		; Format:
		; stat short pointer
		; coordinate bytes

		.word <>aCharacterDataBuffer.HPGrowth
		.byte 4, 0

		.word <>aCharacterDataBuffer.StrengthGrowth
		.byte 4, 2

		.word <>aCharacterDataBuffer.MagicGrowth
		.byte 4, 4

		.word <>aCharacterDataBuffer.SkillGrowth
		.byte 4, 6

		.word <>aCharacterDataBuffer.SpeedGrowth
		.byte 4, 8

		.word <>aCharacterDataBuffer.LuckGrowth
		.byte 4, 10

		.word <>aCharacterDataBuffer.DefenseGrowth
		.byte 4, 12

		.word <>aCharacterDataBuffer.ConstitutionGrowth
		.byte 4, 14

		.word <>aCharacterDataBuffer.MovementGrowth
		.byte 4, 16

		.word 0


rsProcItemInfoDrawGrowthModifyingStatNumbers

	.al
	.xl
	.autsiz
	.databank $7E

	phx
	phy
	lda wR0
	pha
	lda lR18
	pha 
	lda lR18+1
	pha	
	lda wR26
	pha
	lda wR27
	pha
	lda wR28
	pha


	lda aActionStructUnit1.Character
	and #$00FF
	jsl rlCopyCharacterDataToBuffer

	lda #<>aActionStructUnit1.Character
	tax
	jsl $83DD73	; get ROM growth data and write it to wAutolevel registers, input X = buffer

 	stz wR17

 	-
 	ldx wR17
	lda aActionStructUnit1.Items,x
	and #$00FF
	beq +

	jsl $83DDE0 ; checks if item ID in A modifies growths, if yes apply it to wAutolevel registers

	sep #$20
	ldx wR17
	inx 
	inx 
	stx wR17
	rep #$20
	cpx #size(aActionStructUnit1.Items)
	bne -

	+ ; got all the modified growths in the wAutolevel registers

	stz wR17

	lda wR16 
	clc 
	adc #$6 	; moved 6 right 
	sta wR16 

	_Loop
	ldx wR17
	lda #(`aCharacterDataBuffer)<<8
	sta lR18+1
	lda _UnmodifiedGrowthNumberTable,x
	beq _End

	sta lR18
	lda [lR18] 		; actual modified growth
	and #$00FF
	sta wR0

	lda _ModifiedGrowthNumberTable,x
	sta lR18
	lda [lR18]
	and #$00FF
	sep #$20
	sec
	sbc wR0 			; set z if equal, set c if A>Data
	bmi _GrowthReduced
	rep #$20

	beq _NoText
; 	bcc _GrowthReduced
	bra _GrowthIncreased

	_GrowthReduced
	rep #$20
	jsr rsDrawRedModifiedGrowthText
	bra _NoText

	_GrowthIncreased
	jsr rsDrawGreenModifiedGrowthText

	_NoText
	lda wR16	
	clc 
	adc #$0200
	sta wR16
	ldx wR17
	inx 
	inx
	stx wR17
	cpx #18
	bne _Loop

	_End
	pla 
	sta wR28
	pla 
	sta wR27
	pla 
	sta wR26
	pla 
	sta lR18+1
	pla 
	sta lR18
	pla
	sta wR0
	ply
	plx
	rts

_UnmodifiedGrowthNumberTable

	.word <>aCharacterDataBuffer.HPGrowth
	.word <>aCharacterDataBuffer.StrengthGrowth
	.word <>aCharacterDataBuffer.MagicGrowth
	.word <>aCharacterDataBuffer.SkillGrowth
	.word <>aCharacterDataBuffer.SpeedGrowth
	.word <>aCharacterDataBuffer.LuckGrowth
	.word <>aCharacterDataBuffer.DefenseGrowth
	.word <>aCharacterDataBuffer.ConstitutionGrowth
	.word <>aCharacterDataBuffer.MovementGrowth
	.word $0000

_ModifiedGrowthNumberTable

	.word <>wAutolevelHPGrowth
	.word <>wAutolevelSTRGrowth
	.word <>wAutolevelMAGGrowth
	.word <>wAutolevelSKLGrowth
	.word <>wAutolevelSPDGrowth
	.word <>wAutolevelLUKGrowth
	.word <>wAutolevelDEFGrowth
	.word <>wAutolevelCONGrowth
	.word <>wAutolevelMOVGrowth

rsDrawGreenModifiedGrowthText

; growth difference in A

	.al
	.xl
	.autsiz
	.databank ?

	phx
	pha
	lda #$3580
	sta wUnknown000DE7,b
	lda #<>_GreenGrowthString
	sta lR18
	lda #>`_GreenGrowthString
	sta lR18+1

	ldx wR16
	jsl $87E728 ; draw + string

	pla 
	jsr rsTurnHexIntoText
	ldx wR16
	inx
	jsl $87E728 ; draw actual number
	plx
	rts

_GreenGrowthString

	.word $2B83 ; +
	.word $2020 ; space, space
	.word $2020 ; space, space
	.word $2582 ; %
	.word $0000

rsDrawRedModifiedGrowthText

	.al
	.xl
	.autsiz
	.databank ?

	pha 
	phx 

	eor #$00FF
	inc a 
	sta wR0  		; growth modifier
	plx 
	phx 
	lda #(`aCharacterDataBuffer)<<8
	sta lR18+1
	lda rsProcItemInfoDrawGrowthModifyingStatNumbers._UnmodifiedGrowthNumberTable,x
	sta lR18
	lda [lR18]
	and #$00FF 		; actual stat 
	beq _SkipGrowthReduction
	sec 
	sbc wR0 
	bpl + 			; if growth doesnt go below base, load modifier

	lda [lR18]
	and #$00FF
	bra ++

	+
	lda wR0 

	+
	pha 

	lda #$3D80
	sta wUnknown000DE7,b
	lda #<>_RedGrowthString
	sta lR18
	lda #>`_RedGrowthString
	sta lR18+1

	ldx wR16
	jsl $87E728 ; text drawing routine, x = coords

	pla 



	jsr rsTurnHexIntoText
	ldx wR16
	inx
	jsl $87E728

	_SkipGrowthReduction
	plx
	pla
	rts

_RedGrowthString

	.word $5B81 ; -
	.word $2020 ; space, space
	.word $2020 ; space, space
	.word $2582 ; %
	.word $0000

rsTurnHexIntoText

; idea: enter with hex number to display in A, exit with text string somewhere in RAM and a pointer to it in lR18
; string is always 3 words long, 10s digit, 1s digit, terminator : maybe wR26, wR27, wR28 ? 

; if value is less than 10, write $2020, [number as tilemap], $0000
; if value equal or more than 10 write [10s as number], [1s as number], $0000

	.al
	.xl
	.autsiz
	.databank ?

	cmp #10
	bcc _LessThan10

	ldx #2+2 ; offset the 2 dex when waiting for the hardware calc

	-
	sta @l WRDIV 		; dividend
	sep #$20
	lda #10
	sta @l WRDIVB		; divisor, store hex number and divide by $A
	dex
	dex
	nop
	nop
	nop
	rep #$21
	lda #$824F
	adc @l RDMPY 		; remainder
	xba
	sta wR26,X 		
	lda @l RDDIV 		; result
	bne - 
	bra _WriteTerminator

	_LessThan10
	clc 
	adc #$824F 	; xba'd tilemap address for big 0 number 
	xba
	sta wR27
	lda #$2020 	; space 
	sta wR26 

	_WriteTerminator
	lda #$0000
	sta wR28

	lda #<>wR26
	sta lR18
	lda #>`wR26
	sta lR18+1

	rts


rsInventoryActionUpdateGrowthInfoWindow 

	.al
	.xl
	.autsiz
	.databank `wInventoryItemInfoWindowOffset ; bank is still the same

	; only thing to do is to check for B/Select press to close

	lda wJoy1New
	bit #JoypadB | JoypadSelect
	bne _CloseGrowthWindow

	jml rsInventoryActionUpdateGrowthInfoWindowReturn

	_CloseGrowthWindow

	jsl rlCloseGrowthInfo
	jsl rlRevertInventoryItemInfoWindowTilemaps 	; just clear same box again
	jml rsInventorySelectNextAction


rlCloseGrowthInfo ; 81/F873

	.al
	.xl
	.autsiz
	.databank ?

	php
	phb
	sep #$20
	lda #`wInfoWindowTarget
	pha
	rep #$20
	plb

	.databank `wInfoWindowTarget

	lda #(`procGrowthInfo)<<8
	sta lR43+1
	lda #<>procGrowthInfo
	sta lR43
	jsl rlProcEngineFindProc
	stz wInfoWindowTarget 		; reused as flag if growth window is displayed, zero it out 
	jsl rlProcEngineFreeProc
	plb
	plp
	rtl

.here