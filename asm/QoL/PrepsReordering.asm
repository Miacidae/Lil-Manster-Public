* = $01B854
.logical $83B854
 
rlPreps83B854

	php
	phb
	pea #$7E7E

	plb
	plb
	rep #$30
	lda #(`$83C0F6)<<8
	sta lUnknown000DDE+1
	lda #<>$83C0F6
	sta lUnknown000DDE
	lda #$2180
	sta wUnknown000DE7
	jsl rlUnknown83B69F ; background stuff

	lda #$8300
	sta lR18+1
	tdc 
	tax 
	bra _B89A

	_Loop
	phx
	pha
	sta lR18
	lda a83B8FD,X
	tax
	phx
	jsl $87E728
	pla 
	clc 
	adc #$000E
	tax
	pla 
	sta lR18
	jsl $87E728
	plx
	inx
	inx

	_B89A
	lda a83B8E5,X
	bne _Loop

	lda #$2A70
	sta wUnknown000DE7
	tdc 
	tax 
	bra _B8D5

	_Loop2
	phx
	tay
	lda a83B8FD,X 
	clc 
	adc #8
	tax
	phy 
	phx
	lda $0000,Y 
	and #$00FF
	jsl $87E4A9
	pla 
	clc 
	adc #$000E 
	tax
	ply
	lda $0071,Y 
	and #$00FF
	jsl $87E4A9
	plx
	inx 
	inx 

	_B8D5
	lda $83B913,X 
	bne _Loop2

	jsr $83BCE0
	jsl rlEnableBG3Sync
	plb
	plp
	rtl 

a83B8E5

	.word <>a83B92B
	.word <>a83B93B
	.word <>a83B94B
	.word <>a83B95B
	.word <>a83B96B
	.word <>a83B979
	.word <>a83B987
	.word <>a83B995
	.word <>a83B99D
	.word <>a83B9AB
	.word <>a83B9B9
	.word $0000

a83B8FD

	.word $0004
	.word $0204
	.word $0404
	.word $0604
	.word $0804
	.word $0A04
	.word $0C04
	.word $0E04
	.word $1004
	.word $1204
	.word $1404
	.word $A535
	.word $A538
	.word $A533
	.word $A534
	.word $A539
	.word $A53D
	.word $A540
	.word $A542
	.word $A53E
	.word $A547
	.word $A54B
	.word $0000

a83B92B

	.word $B182
	.word $A482
	.word $B082
	.word $AB82
	.word $BB82
	.word $AD82
	.word $C782
	.word $0000

a83B93B

	.word $DF82
	.word $A282
	.word $BF82
	.word $E382
	.word $A482
	.word $E882
	.word $C282
	.word $0000

a83B94B

	.word $B182
	.word $A482
	.word $B082
	.word $AB82
	.word $E882
	.word $E582
	.word $AD82
	.word $0000

a83B95B

	.word $DA82
	.word $A482
	.word $AC82
	.word $E582
	.word $E882
	.word $E582
	.word $AD82
	.word $0000

a83B96B

	.word $D082
	.word $C182
	.word $B382
	.word $C282
	.word $E882
	.word $C282
	.word $0000

a83B979

	.word $D482
	.word $AB82
	.word $CE82
	.word $F182
	.word $B282
	.word $A482
	.word $0000

a83B987

	.word $D482
	.word $AB82
	.word $B582
	.word $E382
	.word $E982
	.word $A282
	.word $0000

a83B995

	.word $BF82
	.word $AF82
	.word $A282
	.word $0000

a83B99D

	.word $BD82
	.word $A282
	.word $AB82
	.word $E382
	.word $A482
	.word $C782
	.word $0000

a83B9AB

	.word $B582
	.word $A682
	.word $F182
	.word $B182
	.word $A482
	.word $A982
	.word $0000

a83B9B9

	.word $A982
	.word $B382
	.word $F182
	.word $AF82
	.word $A282
	.word $AF82
	.word $F182
	.word $0000

rsPreps83B9C9

	.databank ?

	lda wUnknown000E25,b
	and #$00FF
	asl 
	asl 
	tax 
	lda aUnknown83848B,X
	sta wR0
	jmp (wR0)
	
	jsl $80BCBF
	ldx wCursorTileIndex,b

	.databank `aPlayerVisibleUnitMap

	lda aPlayerVisibleUnitMap,X
	sta wR0
	lda #aTargetingCharacterBuffer
	sta wR1
	jsl rlCopyCharacterDataToBufferByDeploymentNumber
	ldx #aSelectedCharacterBuffer
	ldy structExpandedCharacterDataRAM.Coordinates,X 
	lda structExpandedCharacterDataRAM.Coordinates+size(structExpandedCharacterDataRAM),X ; 47	
	sty structExpandedCharacterDataRAM.Coordinates+size(structExpandedCharacterDataRAM),X 
	sta structExpandedCharacterDataRAM.Coordinates,X 
	ldy structExpandedCharacterDataRAM.DeploymentSlot,X 
	lda structExpandedCharacterDataRAM.DeploymentSlot+size(structExpandedCharacterDataRAM),X 
	sty structExpandedCharacterDataRAM.DeploymentSlot+size(structExpandedCharacterDataRAM),X 
	sta structExpandedCharacterDataRAM.DeploymentSlot,X
	lda #aSelectedCharacterBuffer
	sta wR1
	jsl rlCopyCharacterDataFromBuffer
	lda #aTargetingCharacterBuffer
	sta wR1 
	jsl rlCopyCharacterDataFromBuffer
	jsr rsUnknown83894C
	jsl rlUpdateBurstWindow._ClearWindow
	rts 

rsPreps83BA1D

	.al 
	.autsiz
	.databank ?

	sta $3FF0,b
	jsr rsPreps83BAEE
	stz $4F96,b
	stz $4F98,b
	jsl rlUnknown839A3D
	lda #$000B
	jsl rlUnknown808C87
	lda #$FFFF
	sta $4F87,b ; wTerrainWindowTerrain
	lda wUnknown000E25,b
	jsl	rlUnknown8397E8
	lda #$0022
	sta wUnknown000E25,b
	rts 

	.databank 0

rsPreps83BA48 ; pressed Y code

	.al 
	.autsiz
	.databank ?

	lda wUnknown000E6D,b
	bne _Out1

	jsr rsPreps83BB1D

	lda wJoy1New
	bit #JoypadR
	beq +

	; pressed R
	jsl rlCenterOnNextUnmovedUnit

	_Out1
	rts 

	+
	jsr rsPreps83BAD7
	bcc +

	lda wJoy1New
	bit #JoypadY | JoypadA
	beq ++

	jsr $83B9DB
	bra _BA8B

	+
	bit wJoy1Input
	bvc +

	jmp _BA92

	+
	bit wJoy1New
	bpl _Out2

	jsl $81FCE0
	lda #aSelectedCharacterBuffer
	sta wR1 
	jsl rlCopyCharacterDataFromBuffer
	jsr rsUnknown83894C
	jsr rsUnknown838669 ; center cursor on unit

	_BA8B
	jsl $8A9013
	jmp $83869C ; grab next preps routine index

	_BA92
	lda $0E51,b
	ora $0E53,b
	and #$0007
	bne _Out2

	lda #$FFFF
	sta $4F87,b ; wTerrainWindowTerrain

	lda wUnknown000E25,b
	jsl rlUnknown8397E8
	jsl $849FB3
	jsl rlUpdateBurstWindow._ClearWindow
	jsl rlEnableBG1Sync
	jsl rlEnableBG3Sync
	lda #$0023
	sta wUnknown000E25,b ; preps routine index

	_Out2
	rts 


rsPreps83BAC1

	jsl $83BDC5
	lda #8
	jsl $83BF67
	jsr rsPreps83BAD7

	bit wJoy1Input
	bvs +

	jmp $83869C ; grab next preps routine index

	+
	rts 

rsPreps83BAD7

	jsr rsPreps83BB00
	bcc +

	cmp $3FF0,b
	beq +

	jsl $83C753 ; draw pointing finger above unit
	sec 
	bra ++

	+
	jsl $83C776
	clc 

	+
	rts 

rsPreps83BAEE

	.al 
	.autsiz
	.databank `aPlayerVisibleUnitMap

	ldx wCursorTileIndex,b
	lda aPlayerVisibleUnitMap,X 
	sta wR0 
	lda #aSelectedCharacterBuffer
	sta wR1 
	jsl rlCopyCharacterDataToBufferByDeploymentNumber
	rts 

rsPreps83BB00

	jmp rsPrepsMapRearrangeAllowedCheck

	_Allowed
	sec 
	rts 

	_NotAllowed
	clc 
	rts


	.fill $83BB13 - *, $FF

rsPrepsGetCursorUnitDeploymentNumber ; 83BB13

	.al
	.autsiz
	.databank `aPlayerVisibleUnitMap

	ldx wCursorTileIndex,b
	lda aPlayerVisibleUnitMap,X
	and #$00FF
	rts 

rsPreps83BB1D

	jsl $849E80 ; check if terrain window is enabled or not
	jsl rlUpdateBurstWindow
	jsl rlClearJoypadDirectionalInputsWhileCursorScrolling
	jsl $83BDD1
	lda #4
	jsl $83BF67
	jsl rlClearJoypadDirectionalInputsWhileCursorScrolling
	rts

rlPreps83BB39 ; push deployed characters to the start of the deployment slots

	.al
	.autsiz 
	.databank $7E

	pei (lR18)
	ldx #$005E

	-
	stz aPrepDeploymentSlots+$60,X 
	dex 
	dex 
	bpl -

	-
	inx 
	inx 
	ldy aPrepDeploymentSlots,X 
	beq +

	lda structCharacterDataRAM.TurnStatus,b,Y 
	bit #TurnStatusMoved
	bne -

	+ ; unselected unit ? 
	txa
	sta lR18 ; index x2
	lsr
	sta wR17 ; index 
	cmp wPrepSelectedDeployableUnits
	bcc +

	jmp _Out

	+
	sta aPrepDeploymentSlots+$60,X 
	inx 
	inx 
	eor #$FFFF
	adc wPrepSelectedDeployableUnits
	sta wR16

	_GetSelectedAndUnselectedUnitsLoop
	ldy aPrepDeploymentSlots,X 
	beq _BB92

	lda structCharacterDataRAM.TurnStatus,b,Y 
	and #TurnStatusMoved
	beq +

	lda wR17 	; deployment index
	inc wR17
	dec wR16
	ora #$8000
	bra ++

	+
	txa
	lsr

	+
	sta aPrepDeploymentSlots+$60,X
	inx 
	inx 
	bit wR16
	bpl _GetSelectedAndUnselectedUnitsLoop
	
	; created new odered unit table in ram 
	_BB92 
	stx wR17
	stz wR16 
	dec wR16
	bra _BBAD

	_ReorganizeLoop
	lda aPrepDeploymentSlots+$60,X
	bmi + ; highest bit set > branch

	; bit unset, push unselected unit back in the list
	adc wR16
	bra ++

	+
	inc wR16

	+
	asl a 
	tay 
	lda aPrepDeploymentSlots,Y 
	sta aPrepDeploymentSlots+$60,X

	_BBAD
	dex 
	dex 
	cpx lR18
	bcs _ReorganizeLoop

	; done reorganizing 
	ldx lR18

	_ApplyNewOrderingLoop
	lda aPrepDeploymentSlots,X 
	ldy aPrepDeploymentSlots+$60,X 
	stz aPrepDeploymentSlots+$60,X 
	sty wR16
	cmp wR16
	beq _BBF1

	phx 
	
	-
	inx 
	inx
	cmp aPrepDeploymentSlots+$60,X
	bne -

	sta wR16
	tya
	sta aPrepDeploymentSlots+$60,X 
	lda aPrepDeploymentSlots,X 
	sta lR18


	ldy #size(structCharacterDataRAM)-1

	-
	dey 

	-
	lda (wR16),Y 
	tax
	lda (lR18),Y 
	sta (wR16),Y 
	txa
	sta (lR18),Y 
	dey 
	bmi +
	bne -- ; swap unit data 

	sep #$20
	bra - ; loop an additional time to swap DeploymentNumber

	+
	rep #$20
	plx 

	_BBF1
	inx 
	inx 
	cpx wR17
	bcc _ApplyNewOrderingLoop

	_Out
	plx 
	stx lR18
	rtl 


rsPrepsMapRearrangeAllowedCheck

	phx
	jsr rsPrepsGetCursorUnitDeploymentNumber
	beq _NotAllowed

	cmp #Leif
	beq _NotAllowed

	cmp #Leif+$40
	bcs _NotAllowed

	tax
	lda aOptions.wTerrainWindowOption
	bit #$2000
	beq +

	txa
	plx
	jmp rsPreps83BB00._Allowed

	+
	txa 

	_NotAllowed
	plx
	jmp rsPreps83BB00._NotAllowed 


rlPrepsAutomaticRearrageAllowedCheck

	lda aOptions.wTerrainWindowOption
	bit #$2000
	beq _NotAllowed

	jsl rlPreps83BB39

	_NotAllowed
	rtl 



.fill $83BC82 - * , $FF

.here



* = $01C753
.logical $83C753

rlPreps83C753

	phb
	php
	phk
	plb
	lda wCursorXOffset,b
	sta wR0
	lda wCursorYOffset,b
	sta wR1
	stz wR4
	stz wR5
	jsr rsPreps83C793
	jsr rsPreps83C7EC
	lda #<>a83C826

	_C76E
	sta wR0
	jsr rsPreps83C80C
	plp
	plb
	rtl

rlPreps83C776

	phb
	php
	phk
	plb 
	lda wCursorXOffset,b
	sta wR0 
	lda wCursorYOffset,b
	sta wR1
	stz wR4
	stz wR5
	jsr rsPreps83C842
	jsr rsPreps83C7EC
	lda #<>a83C834
	bra rlPreps83C753._C76E

rsPreps83C793

	ldx	wCursorCycleTimer,b
	cpx #$0038
	bcc +

	tdc 
	tax 

	+
	cpx #$0012
	bcs +

	lda #<>a83C7D0
	bra _C7C8

	+
	cpx #$0032
	bcs +

	cpx #$0016
	bcs ++

	+
	lda #<>a83C7D7
	bra _C7C8
	
	+
	cpx #$002E
	bcs +

	cpx #$001C
	bcs +
	
	lda #<>a83C7DE
	bra _C7C8

	+
	lda #<>a83C7E5

	_C7C8
	inx 
	inx 
	stx wCursorCycleTimer,b
	tay
	bra rsPreps83C807


a83C7D0
	.word $0001
	.word $C3FF
	.word $06F3
	.byte $39

a83C7D7
	.word $0001
	.word $C3FF
	.word $06F4
	.byte $39

a83C7DE
	.word $0001
	.word $C3FF
	.word $06F5
	.byte $39

a83C7E5
	.word $0001
	.word $C3FF
	.word $06F6
	.byte $39

rsPreps83C7EC

	ldy #<>a83C7F1
	bra rsPreps83C807

a83C7F1; structSpriteArray

	.word $0004

	.byte $00, $00, $00, $04, $3F
	.byte $08, $00, $00, $05, $3F
	.byte $00, $00, $08, $05, $FF
	.byte $08, $00, $08, $04, $FF

rsPreps83C807

	jsl rlPushToOAMBuffer
	rts

rsPreps83C80C

	lda wVBlankEnabledFramecount
	and #$000C
	lsr
	adc wR0
	sta wR0
	ldy #$0006
	
	-
	lda (wR0),Y
	sta $02F0,b,Y
	dey
	dey
	bpl -

	stz $02EC,b
	rts


a83C826

	.word $7FFF
	.word $03FF
	.word $031F
	.word $03FF
	.word $7FFF
	.word $03FF
	.word $031F

a83C834

	.word $2E54
	.word $2E54
	.word $2E54
	.word $2E54
	.word $2E54
	.word $2E54
	.word $2E54

rsPreps83C842

	lda wVBlankEnabledFramecount
	and #$003C
	cmp #$0020
	and #$001C
	eor #$001C
	beq +
	bcs ++

	ldy #<>a83C86A
	bra +++

	+
	ldy #<>a83C871
	bra ++

	+
	ldy #<>a83C878
	
	+
	jsl rlPushToOAMBuffer
	ldy #<>a83C7DE
	bra rsPreps83C807

a83C86A
	.word $0001
	.byte $F8, $C3, $E9, $08, $39

a83C871
	.word $0001 
	.byte $F8, $C3, $EA, $08, $39

a83C878
	.word $0001
	.byte $F8, $C3, $EB, $08, $39


	.fill $83C8BF - *, $FF

.here 


* = $02F42F
.logical $85F42F

rlPreps85F42F

	php
	phb
	pea $7E7E
	plb
	plb 
	jsr rsPreps85F520 	; get min/max deployable units
	jsr $85F6DB
	jsr rsPreps85F474 	; check if unit is deployable
	jsr rsPreps85F4EE
	jsr $85FF7B
	jsr $85FF9D
	jsr $85FE13

	lda wDefaultVisibilityFill,b
	beq +

	lda wUnknown000E25,b
	beq ++

	jsr rsPrepsPutUnitsOnStartingPositions

	+
	lda wUnknown000E25,b

	+
	cmp #$0005
	beq ++

	cmp #$001A
	bne +

	lda wMenuType,b
	cmp #$000B
	beq ++

	+
	jsl rlPrepsAutomaticRearrageAllowedCheck

	+
	plb 
	plp 
	rtl 

rsPreps85F474

	lda #<>rlPrepsCheckIfUnitIsDeployable
	sta lR25
	lda #>`rlPrepsCheckIfUnitIsDeployable
	sta lR25+1
	jsl $8AC4A7
	rts 

rlPrepsCheckIfUnitIsDeployable ; 85F483 

	sep #$20
	lda structCharacterDataRAM.Fatigue,b,X
	cmp #$FF
	beq +

	cmp structCharacterDataRAM.MaxHP,b,X
	beq +
	bcc +

	rep #$20
	jsr rsPrepsUpdateStatusIfStaminaDrink
	bra ++

	+
	rep #$20
	lda structCharacterDataRAM.TurnStatus,b,X 
	and #$9FFF ; unset TurnStatusUnknown3 and TurnStatusUnknown4
	sta structCharacterDataRAM.TurnStatus,b,X

	+
	rtl 

rsPrepsUpdateStatusIfStaminaDrink ; 85F4A6 

	pei (lR25)
	pei (lR25+1)
	phx
	stz wR17
	lda #<>rsPrepsCheckIfItemIsStaminaDrink
	sta lR25
	lda #>`rsPrepsCheckIfItemIsStaminaDrink
	sta lR25+1
	txa
	clc 
	adc #structCharacterDataRAM.Items
	jsl rlRunRoutineForAllItemsInInventory
	plx
	lda wR17
	cmp #1
	lda structCharacterDataRAM.TurnStatus,b,X 
	bcc +

	ora #TurnStatusUnknown4
	and #$DFFF
	bra ++

	+
	ora #TurnStatusUnknown3
	and #$BFFF

	+
	sta structCharacterDataRAM.TurnStatus,b,X
	pla 
	sta lR25+1
	pla 
	sta lR25
	rts 

rsPrepsCheckIfItemIsStaminaDrink ;	85F4E3

	and #$00FF
	cmp #StaminaDrink
	bne +
	inc wR17

	+
	rtl

rsPreps85F4EE

	ldx aPrepDeploymentSlots	
	lda structCharacterDataRAM.TurnStatus,b,X
	and #$DFFF
	ora #TurnStatusMoved
	sta structCharacterDataRAM.TurnStatus,b,X
	lda #<>rsPreps85F50C
	sta lR25
	lda #>`rsPreps85F50C
	sta lR25+1
	jsl $8AC4A7
	rts

rsPreps85F50C

	lda structCharacterDataRAM.TurnStatus,b,X
	bit #TurnStatusMoved
	beq +

	bit #TurnStatusUnknown3
	beq +
	
	and #$FDFF
	sta structCharacterDataRAM.TurnStatus,b,X
	
	+
	rtl 

rsPreps85F520

	.al
	.autsiz
	.databank `wPrepMinimumDeployableUnits


	lda #structChapterDataTableEntry.MinUnits ; 25
	sta lR18
	lda wCurrentChapter,b
	jsl $848933 		; fetch data of current chapter
	lda lR18
	and #$00FF
	sta wPrepMinimumDeployableUnits
	eor lR18
	xba
	sta wPrepMaximumDeployableUnits
	rts 

rsPrepsPutUnitsOnStartingPositions ; 85F53B

	stz wR17
	lda #structChapterDataTableEntry.StartingPositions ; 15
	sta lR18
	lda wCurrentChapter,b
	jsl $848933
	lda #<>rlPreps85F558
	sta lR25
	lda #>`rlPreps85F558
	sta lR25+1
	jsl $8AC4A7	
	rts 

rlPreps85F558 ; assign units the starting position coords based on deployment slot 

	jmp HideOrDisplayUnitsOnPerpsMapCheck
	
	nop
	nop 
	nop 
	nop 
	nop 

	_AssignStartingCoords
	and #$F3BA
	sta structCharacterDataRAM.TurnStatus,b,X
	ldy wR17
	lda [lR18],Y
	iny
	iny
	sty wR17
	bra +

	_HideUnit ; hide undeployed units and give them generic coords 
	ora #TurnStatusHidden
	sta structCharacterDataRAM.TurnStatus,b,X
	lda #$0101

	+
	sta structCharacterDataRAM.Coordinates,b,X
	rtl

rsPreps85F57D

	.al
	.autsiz
	.databank `wPrepSelectedDeployableUnits

	ldy wR1
	lda structCharacterDataRAM.TurnStatus,b,Y
	and #$FDFF
	ora #TurnStatusHidden
	sta structCharacterDataRAM.TurnStatus,b,Y
	lda #$0101
	sta structCharacterDataRAM.Coordinates,b,Y
	dec wPrepSelectedDeployableUnits
	rts

HideOrDisplayUnitsOnPerpsMapCheck

	lda aOptions.wTerrainWindowOption
	and #$F000
	beq _Hide 

	lda structCharacterDataRAM.TurnStatus,b,X
	bit #TurnStatusMoved
	beq _Hide

	jmp rlPreps85F558._AssignStartingCoords


	_Hide
	lda structCharacterDataRAM.TurnStatus,b,X
	jmp rlPreps85F558._HideUnit


	.fill $85F5BA - *, $FF

.here

* = $02F996
.logical $85F996


	lda wJoy1Alt
	bit #JoypadUp | JoypadDown | JoypadLeft | JoypadRight
	beq _F9D2

	xba
	ldx #$FFFE

	-
	inx
	inx
	lsr 
	bcc -

	lda wPrepUnitListColumn
	clc 
	adc $85FA36,X
	sta wR0 
	pha
	clc
	lda wPrepUnitListRow
	adc $85FA3E,X
	sta wR1
	pha
	jsl $85FAD0
	plx
	pla
	bcc +

	sta wPrepUnitListColumn
	stx wPrepUnitListRow
	dec wPrepUnitListMovingFlag
	jsl $81F512

	+
	rts 


_F9D2

	lda wJoy1New
	bit #JoypadA
	beq +
	
	jmp $85FD31

	+
	bit #JoypadB | JoypadSelect
	beq +

	jmp _PrepsBOrSelectPress

	+
	bit #JoypadX
	beq +

	jmp _PrepsXPress

	+
	bit #JoypadStart
	beq +

	jmp $85FDA7

	+
	bit #JoypadR
	beq +

	jmp $85FF39

	+
	rts 

_PrepsBOrSelectPress ; 	85F9FD

	jsr rsPreps85FA46
	lda #$A1E0
	sta wProcInput0,b
	lda #(`procUnknown82A1BB)<<8
	sta lR43+1
	lda #<>procUnknown82A1BB
	sta lR43
	jsl rlProcEngineCreateProc
	sep #$20
	stz bBuf_INIDISP
	rep #$20
	jsl $81FCE0
	rts

_PrepsXPress ; 85FA1F

	lda #<>rlUnknown80BD87
	sta lUnknown7EA4EC
	lda #>`rlUnknown80BD87
	sta lUnknown7EA4EC+1
	jsl $85FA88
	lda #$0003
	sta $4E08,b
	rts

a85FA36
	.word $0001
	.word $FFFF

	.word $0000
	.word $0000 

	.word $0000 
	.word $0000 

	.word $0001 
	.word $FFFF 

rsPreps85FA46

	lda wDefaultVisibilityFill,b
	beq +

	jsr rsPrepsPutUnitsOnStartingPositions

	+
	jsl rlPrepsAutomaticRearrageAllowedCheck
	rts

rsPreps85FA53

	clc
	lda wDefaultVisibilityFill,b
	beq +

	lda wUnknown000E25,b
	beq +

	sec

	+
	rts


	.fill $85FA88 - *, $FF
	
.here


* = $02FCBA
.logical $85FCBA


	lda wPrepSelectedDeployableUnits
	cmp wPrepMaximumDeployableUnits
	bcs ++

	jsr rsPreps85FA53
	ldy wR1
	lda structCharacterDataRAM.TurnStatus,b,Y
	ora #TurnStatusMoved
	bcc +

	and #$F3BA

	+
	sta structCharacterDataRAM.TurnStatus,b,Y
	inc wPrepSelectedDeployableUnits

	+
	rts

	.fill $85FCE0 - *, $FF

.here


* = $02FD89
.logical $85FD89

	jsr rsPreps85F57D

.here

* = $02FFBB
.logical $85FFBB

	lda aSRAM.aSaveDataHeader
	and #$00FF
	tay
	jsl rlGetSaveSlotOffset
	ldx wSaveSlotOffset,b
	lda aSRAM+structSaveDataEntry.CurrentChapter,X
	and #$00FF
	cmp wCurrentChapter,b
	bne +

	phy
	jsr rsPreps85FA46
	pla 
	jsl rlSaveToSRAMSlot

	+
	rtl

	.byte $FF

.here

* = $04045C
.logical $88845C

	and #$9ABB

.here