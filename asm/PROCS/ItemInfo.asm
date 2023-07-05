
rlDrawItemInfo ; 81/F590

	.al
	.xl
	.autsiz
	.databank ?

	; Draws the item info text/stats

	; Inputs:
	; wR0: X coordinate in tiles
	; wR1: Y coordinate in tiles
	; wR2: nonzero if showing weapon descriptions

	php
	rep #$30

	; X

	lda wR0
	sta aProcSystem.wInput0,b

	; Y

	lda wR1
	sta aProcSystem.wInput1,b

	; Flag

	lda wR2
	sta aProcSystem.wInput2,b

	; Kill existing item info proc if any

	phx
	lda #(`procItemInfo)<<8
	sta lR44+1
	lda #<>procItemInfo
	sta lR44
	jsl rlProcEngineCreateProc
	plx

	plp
	rtl

rlUnknown81F5B4 ; 81/F5B4

	.al
	.xl
	.autsiz
	.databank ?

	lda wR0
	sta aProcSystem.wInput0,b

	lda wR1
	sta aProcSystem.wInput1,b

	lda #(`procItemInfo)<<8
	sta lR44+1
	lda #<>procItemInfo
	sta lR44
	jsl rlProcEngineFindProc
	jsl rlProcItemInfoInit._F5EC
	rtl

procItemInfo .dstruct structProcInfo, None, rlProcItemInfoInit, rlProcItemInfoOnCycle, None ; 81/F5D1

rlProcItemInfoInit ; 81/F5D9

	.al
	.xl
	.autsiz
	.databank ?

	; aProcSystem.aBody5: flag

	lda aProcSystem.wInput2,b
	sta aProcSystem.aBody5,b,x

	; Clear the current item

	lda #$FFFF
	sta aProcSystem.aBody0,b,x

	lda #$0000
	sta wInfoWindowTarget

	_F5EC

	; aProcSystem.aBody1: X | (Y << 8)

	lda aProcSystem.wInput1,b
	xba
	ora aProcSystem.wInput0,b
	sta aProcSystem.aBody1,b,x

	; aProcSystem.aBody3: X+4, where labels go

	lda aProcSystem.wInput0,b
	clc
	adc #4
	sta aProcSystem.aBody3,b,x

	; aProcSystem.aBody4: Y

	lda aProcSystem.wInput1,b
	sta aProcSystem.aBody4,b,x

	; aProcSystem.aBody2: tilemap position

	lda aProcSystem.wInput1,b
	asl a
	asl a
	asl a
	asl a
	asl a
	


	;clc
	;adc aProcSystem.wInput0,b

	jsl fixshop

	asl a
	clc
	adc #<>aBG3TilemapBuffer
	sta aProcSystem.aBody2,b,x
	rtl

rlProcItemInfoOnCycle ; 81/F61B

	.al
	.xl
	.autsiz
	.databank ?

	; If same item, nothing to do

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

	jsr rsProcItemInfoClearInfo
	jsr rsProcItemInfoClearIcons

	lda wInfoWindowTarget
	sta aProcSystem.aBody0,b,x
	beq _End

	; Fetch item type and draw info
	; based on that

	jsl rlCopyItemDataToBuffer
	lda aItemDataBuffer.Type,b
	and #$000F
	cmp #TypeItem
	beq rlProcItemInfoDrawItemInfo

	cmp #TypeStaff
	beq rlProcItemInfoDrawStaffInfo

	bra rlProcItemInfoDrawWeaponInfo

	_End
	plb
	plp
	rtl

rlProcItemInfoDrawStaffInfo ; 81/F662

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	phx
	lda aProcSystem.aBody1,b,x
	sta wR16

	jsr rsProcItemInfoDrawRankIcon
	jsr rsProcItemInfoDrawRank
	jsr rsProcItemInfoDrawStaffWeight

	; plx but don't change sp

	lda #$01,s
	tax

	lda #$2180
	sta aCurrentTilemapInfo.wBaseTile,b

	; Draw staff labels to X+1, Y

	lda aProcSystem.aBody1,b,x
	inc a
	tax
	lda #<>menutextInventoryStaffStatLabels
	sta lR18
	lda #>`menutextInventoryStaffStatLabels
	sta lR18+1

	jsl $8588E4
	plx

	; Draw staff description to X, Y+4

	lda aProcSystem.aBody1,b,x
	clc
	adc #(0 | (4 << 8)) -1
	tax
	lda #>`$B08000
	sta lR18+1
	lda aItemDataBuffer.Description,b
	sta lR18
	jsl $8588E4

	jsl rlEnableBG3Sync
	bra rlProcItemInfoOnCycle._End

menutextItemInfoStaffLabels ; 81/F6AA

	.word $AE91
	.word $AB90
	.word $0000
	.word $648F
	.word $B382
	.word $0000
	.word $0000

rlProcItemInfoDrawItemInfo ; 81/F6B8

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	jsl rlNewProcItemInfoDrawItemInfo


;	lda #$2180
;	sta aCurrentTilemapInfo.wBaseTile,b
;
;	lda aProcSystem.aBody1,b,x
;	sta wR16
;	tax
;	lda #>`$B08000
;	sta lR18+1
;	lda aItemDataBuffer.Description,b
;	sta lR18
;	jsl $8588E4
;
;	jsl rlEnableBG3Sync
	bra rlProcItemInfoOnCycle._End

	.fill $81F6D8 - *, $FF

rlProcItemInfoDrawWeaponInfo ; 81/F6D8

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	phx
	lda aProcSystem.aBody1,b,x
	sta wR16

	jsr rsProcItemInfoDrawRankIcon
	jsr rsProcItemInfoDrawWeaponLabels
	jsr rsProcItemInfoDrawWeaponStatNumbers
	jsr rsProcItemInfoDrawWeaponRange
	jsr rsProcItemInfoDrawRank
	plx

	; Check to see if we need to display description
	; Shops don't draw the description

	lda aProcSystem.aBody5,b,x
	beq +

	jsr rsProcItemInfoDrawWeaponDescription

	+
	jsl rlEnableBG3Sync
	jmp rlProcItemInfoOnCycle._End

rsProcItemInfoDrawWeaponLabels ; 81/F6FD

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	lda #$2180
	sta aCurrentTilemapInfo.wBaseTile,b

	; Draw labels to X+1, Y

	lda #<>menutextInventoryItemStatLabels
	sta lR18
	lda #>`menutextInventoryItemStatLabels
	sta lR18+1
	lda aProcSystem.aBody1,b,x
	tax
	inc x
	jsl $8588E4
	rts

menutextItemInfoWeaponLabels ; 81/F717 - overwritten

	.word $AE91
	.word $AB90
	.word $0000
	.word $BD96
	.word $8692
	.word $0000
	.word $D088
	.word $CD97
	.word $0000
	.word $4B95
	.word $458E
	.word $0000
	.word $CB8E
	.word $F692
	.word $0000
	.word $648F
	.word $B382
	.word $0000
	.word $0000

rsProcItemInfoDrawWeaponStatNumbers ; 81/F73D

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	lda #$2AA0
	sta aCurrentTilemapInfo.wBaseTile,b

	stz wR17

	-

	; Fetch stat based on pointer pulled from
	; table and check if we need to display --

	ldx wR17
	lda _StatTable,x
	beq _End

	tay
	lda $0000,b,y
	and #$00FF
	cmp #$00FF
	beq _DashedStat

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

	_DashedStat

	; Instead of having to draw numbers we draw
	; a fixed -- at local X-1

	lda #<>menutextDoubleDash
	sta lR18
	lda #>`menutextDoubleDash
	sta lR18+1

	lda #$2980
	sta aCurrentTilemapInfo.wBaseTile,b

	lda _StatTable+2,x
	clc
	adc wR16
	dec a
	tax
	jsl $87E728

	lda #$2AA0
	sta aCurrentTilemapInfo.wBaseTile,b

	bra _Next

	_StatTable ; 81/F799
		; Format:
		; stat short pointer
		; coordinate bytes

		.word aItemDataBuffer.Accuracy
		.byte 6, 2

		.word aItemDataBuffer.Might
		.byte 6, 4

		.word aItemDataBuffer.Critrate
		.byte 6, 6

		.word aItemDataBuffer.Weight
		.byte 6, 10

		.word 0

rsProcItemInfoDrawWeaponRange ; 81/F7AB

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	; Fetch and draw weapon's range to
	; X+4, Y+8

	jsl $8599D5

	lda wR16
	clc
	adc #4 | (8 << 8)
	tax

	lda #$2980
	sta aCurrentTilemapInfo.wBaseTile,b

	jsl $87E728
	rts

rsProcItemInfoDrawStaffWeight ; 81/F7C1

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	; Draw staff weight to X+6, Y+2

	lda #$2AA0
	sta aCurrentTilemapInfo.wBaseTile,b

	lda aItemDataBuffer.Weight,b
	sta lR18
	stz lR18+1

	lda wR16
	clc
	adc #6 | (2 << 8)
	tax
	jsl $858859
	rts

rsProcItemInfoDrawRank ; 81/F7DA

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	; Draw rank number to X+6, Y

	lda #$2980
	sta aCurrentTilemapInfo.wBaseTile,b

	lda aItemDataBuffer.WeaponRank,b
	jsl $839385

	lda wR16
	clc
	adc #6 | (0 << 8)
	tax
	jsl $87E728
	rts

rsProcItemInfoClearInfo ; 81/F7F3

	.al
	.xl
	.autsiz
	.databank ?

	; If displaying weapon description
	; we need to clear a larger area

	phx
	lda aProcSystem.aBody5,b,x
	beq +

	lda aProcSystem.aBody2,b,x
	sec
	sbc #2
	sta wR0

	lda #10
	sta wR1

	lda #20 	; 4 more than vanilla
	sta wR2

	bra ++

	+
	lda aProcSystem.aBody2,b,x
	sta wR0

	lda #10
	sta wR1

	lda #15
	sta wR2

	+
	lda #$01DF
	jsl rlFillTilemapRectByWord
	plx
	rts

rsProcItemInfoClearIcons ; 81/F826

	.al
	.xl
	.autsiz
	.databank ?

	phx
	lda aProcSystem.aBody3,b,x
	sta wR0

	lda aProcSystem.aBody4,b,x
	sta wR1

	jsl $8A81D8
	plx
	rts

rsProcItemInfoDrawRankIcon ; 81/F837

	.al
	.xl
	.autsiz
	.databank ?

	lda aItemDataBuffer.Type,b
	and #$000F
	clc
	adc #$00A7 ; Start of rank icons in icon sheet
	sta wR2

	lda #6 << 9
	sta wR3

	lda aProcSystem.aBody3,b,x
	sta wR0

	lda aProcSystem.aBody4,b,x
	sta wR1

	jsl $8A8085
	rts

rsProcItemInfoDrawWeaponDescription ; 81/F857

	.al
	.xl
	.autsiz
	.databank ?

	; Draw description to X-1, Y+11

	lda #$2180
	sta aCurrentTilemapInfo.wBaseTile,b

	lda #>`$B08000
	sta lR18+1
	lda aItemDataBuffer.Description,b
	sta lR18

	lda wR16
	clc
	adc #(-1 & $FF) | (11 << 8)
	tax
	jsl $8588E4
	rts

rlCloseItemInfo ; 81/F873

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

	lda #(`procItemInfo)<<8
	sta lR44+1
	lda #<>procItemInfo
	sta lR44
	jsl rlProcEngineFindProc
	stz wInfoWindowTarget
	jsr rsProcItemInfoClearIcons
	jsl rlProcEngineFreeProc
	plb
	plp
	rtl
