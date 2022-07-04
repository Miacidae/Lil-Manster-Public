; reprogramemd options menu

* = $02DA49
.logical $85DA49

	.al
	.xl

	pea <>(++++)-1
	lda wJoy1Alt
	bit #JoypadUp
	bne $85DA79

	bit #JoypadDown
	bne $85DA98

	bit #JoypadLeft
	bne OptionsLeftInput

	bit #JoypadRight
	beq +

	jmp OptionsRightInput

	+
	lda wJoy1New
	bit #JoypadB
	beq +

	jmp $85DB00 		; close menu

	+
	bit #JoypadY
	beq +

	jmp $85E2B5 		; restore to default

	+
	rts 

	+
	rts 

.here


* = $02DAAC
.logical $85DAAC

OptionsLeftInput
jml OptionsMenuLeftPress

OptionsMenuLeftPressHook

rts

OptionsRightInput

jml OptionsMenuRightPress

OptionsMenuRightPressHook

rts

.fill $85DAEA -*, $FF


.here


* = $02DAF5
.logical $85DAF5 ; only goes here if it actually changed

ChangedTileSettings

.here

* = $02DAF8
.logical $85DAF8 ; is right behind the jsr check for tile settings 

UnchangedTileSettings

.here

* = $02DB72
.logical $85DB72

jml OptionMenuCursorFix

nop
nop
nop
nop

OptionMenuCursorFixHook

.here



* = $02E244
.logical $85E244 	; changed a tile settings option 

	pha
	jsl $859566 
	pla  
	and #$000F
	sta $4E18
	jsl $859532
	jsl $85968D
	jsr $85D918
	jsr $85DDF7
	jsr $85D44A ; bunch of hdma or tilemap stuff?
	rts
	nop
	nop
	nop
	nop


.here

* = $02D623
.logical $85D623

	.al
	.xl

	OptionMenuInitialization

	lda #$C0F6
	sta lUnknown000DDE
	lda #$83C0
	sta lUnknown000DDE+1
	stz wR17 

	-
	lda #<>MovedOptions
	sta lR18+1
	ldx wR17 
	lda $A95F,X 		; main option pointer 
	beq + 				; branch if end reached
	sta lR18
	jsr $85D534 		; copy option data to ram 
	jsr OptionPointerNameBankSwapStart	; goes to the OptionPointerNameBankSwap
	jsr $85D67E 		; option choices
	jsr $85D695 		; option icon 
	ldx wR17 
	jml rs85D6B6ShortCallFrom85D623

	_rs85D6B6ShortCallReturn
	inc wR17 
	inc wR17 
	bra -

	+
	lda $A9AB
	and #$FF00
	clc
	adc #$0300
	sta $A9AB
	rts 

.here





* = $02E2D8
.logical $85E2D8

; raise the DMA count to VRAM so the 2 extra options also have their graphics updated when pressing Y

.word $0840 ; previously $06C0 

.here








* = $48D440
.logical $11D440

OptionsMenuLeftPress

	lda $A99F 			; option offset, animation = 0, terrain = 1,...
	asl
	tax 
	lda $A95F,X  		; options main pointer 
	sta lR18
	jsr rsCopyOptionsPointerData			; copies pointer data to ram 

	lda $A99F 			; eg first compact word = 3,2,1,0 2nd is 7,6,5,4, 3rd is x,x,9,8		
	cmp #$000B ; check if its the window pattern option
	bne + ; branch if not
	
	lda $A991
	cmp #0
	beq ++

	dec a
	sta $A991
	ldx #$12
	jml Repointed85DAEA

	+
	asl
	tax 
	jsr NybbleShiftingGetter
	cmp #0
	beq + 				; branch out if left input on leftmost option 


	dec a 				; otherwise go 1 step left
	jsr NybbleShiftingSaver
	jml Repointed85DAEA

	+
	jml OptionsMenuLeftPressHook

OptionsMenuRightPress

	lda $A99F 			; main option number eg animation = 0 
	asl
	tax 
	lda $A95F,X  		; options main pointer 
	sta lR18
	jsr rsCopyOptionsPointerData			; copies pointer data to ram 

	lda $A99F 			; main option number eg animation = 0  
	cmp #$000B ; check if its the window pattern option
	bne + ; branch if not
	
	lda $A991
	inc a 
	cmp $A945
	bcs ++

	sta $A991
	ldx #$12
	jml Repointed85DAEA

	+
	asl
	tax 
	jsr NybbleShiftingGetter


	inc a 				; set the option to 1 further right 
	cmp $A945 			; max amount of options 
	bcs + 				; already at max > dont do anything
 
	jsr NybbleShiftingSaver
	jml Repointed85DAEA

	+
	jml OptionsMenuRightPressHook 

NybbleShiftingGetter

	txa
	stz wR0
	-
	cmp #$0008
	bcc + ; branch if value is less than 8 
	sbc #$0008
	inc wR0
	inc wR0
	bra -

	+
	lsr
	ldx wR0
	sta wR0
	lda $A97F,X 	; selected option offset /// X needs to be :4'd 
	ldx wR0			; use main option offset as counter

	-
	cpx #0 			; if shifted enough then return
	bne +

	and #$000F
	rts

	+ ; still needs shifting, x has number of times 
	lsr 
	lsr
	lsr
	lsr
	dex
	bra -



NybbleShiftingSaver ; A has new selected option value to store 

	; eg has 1234 and want to store 1334 	 0003 but at XAXX

	pha 			; value to save 

	stz wR0
	lda $A99F		; main option number eg animation = 0
	-
	cmp #$0004
	bcc + ; branch if value is less than 4
	sbc #$0004
	inc wR0
	inc wR0
	bra -

	+
	ldx wR0 		; offset from where to load data 
	asl
	asl
	sta wR1 		; amount of times ^ needs to be shifted 
	lda $A97F,X 	; selected option offset  
	ldx wR1

	-
	cpx #0
	beq ++

	clc
	bit #$0001
	beq +
	sec 
	+
	ror

	dex
	bra -


	+ ; finished shifting 
	and #$FFF0 		; null the thing to be modified and keep the other 3 nybbles
	ora $01,S 		; ora the value onto it
	ldx wR1 
	-
	cpx #0
	beq ++

	clc				; shift back to starting position
	bit #$8000
	beq +
	sec 
	+
	rol

	dex
	bra -

	+
	ldx wR0
	sta $A97F,X 	; store new value there
	pla

	rts


Repointed85DAEA			; enters with X:4

	lda $A97F,X 		; currently selected options // correct
	pha
	jsr rsHighAndUnHighlightTilesCycle
	jsr rsRepointed85E07E

	lda $A99F
	cmp #$000B ; options_pointers index, check if you are changing tile settings
	bne +

	pla
	jml ChangedTileSettings 	; goes to check if you changed tile settings

	+ 	
	pla
	jml UnchangedTileSettings

rs85D6B6ShortCallFrom85D623
	jsr rsHighAndUnHighlightTilesInit ; after this some tiles dont properly end up in VRAM
	jml OptionMenuInitialization._rs85D6B6ShortCallReturn


rsHighAndUnHighlightTilesCycle

	php
	rep #$30
	lda $A99F
	cmp #$000B ; check if on window pattern setting
	bne +

	asl
	tax
	jsr rsUnhightlightTiles
	phx
	lda $A991
	bra ++

	+
	asl 
	tax 
	jsr rsUnhightlightTiles  ; unhighlight tiles // needs preserved X 
	phx
	jsr NybbleShiftingGetter

	+
	asl
	asl
	tay
	lda $A947,Y 	; position 1,Y 
	sta wR0
	lda $A949,Y 	; tiles to highlight,Y 
	sta wR1 
	plx
	lda $A99F
	asl 
	tax 
	jsr rsHightlightTiles
	plp
	rts 

rsHighAndUnHighlightTilesInit

	php
	rep #$30
	cpx #$0016
	bne +

	jsr rsUnhightlightTiles
	phx
	lda $A991
	bra ++
	
	+
	jsr rsUnhightlightTiles
	phx
	jsr NybbleShiftingGetter

	+
	asl
	asl
	tay
	lda $A947,Y 	; position 1,Y 
	sta wR0
	lda $A949,Y 	; tiles to highlight,Y 
	sta wR1 
	plx
	jsr rsHightlightTiles
	plp
	rts 



rsUnhightlightTiles 	; unhighlight tiles of previous option , enters with X:4, also exits with X:4

	phx
	lda aHighAndUnHighlightTilesCoordTable,X 	; in vanilla x is option x2
	tay 
	ldx #$000D ; width to clear

	-
	lda <>aBG3TilemapBuffer,Y
	ora #$0400
	sta <>aBG3TilemapBuffer,Y
	lda <>aBG3TilemapBuffer+$40,Y
	ora #$0400
	sta <>aBG3TilemapBuffer+$40,Y
	iny
	iny
	dex
	bpl -

	plx
	rts


rsHightlightTiles

	lda wR0 		; position 
	asl
	clc
	adc aHighAndUnHighlightTilesCoordTable,X 
	tay 
	ldx wR1 
	dex

	-
	lda $E77C,Y 
	and #$FBFF
	sta $E77C,Y
	lda $E7BC,Y
	and #$FBFF
	sta $E7BC,Y
	iny
	iny
	dex
	bpl -

	rts 


rsRepointed85E07E

	lda #$7EE7
	sta $30
	lda $A99F
	asl
	tax 
	lda $85D5C3,X 
	xba
	and #$00FF
	asl
	asl
	asl
	asl
	asl
	pha
	asl
	clc
	adc #$E77C
	sta $2F
	pla
	clc
	adc #$5000
	sta wR1 
	lda #$0080
	sta wR0 
	jsl rlDMAByPointer
	rts 

rsOptionDMAtoVRAM

	asl a
	tax 
	lda #$7EE7
	sta lR18+1
	lda $85D5C3,X 
	xba
	and #$00FF
	asl
	asl
	asl
	asl
	asl
	pha
	asl
	clc
	adc #$E77C
	sta lR18
	pla
	clc
	adc #$5000
	sta wR1 
	lda #$0080
	sta wR0 
	jsl rlDMAByPointer
	rts 

OptionMenuCursorFix

	lda $A99F
	cmp #$000B ; check if you are on the window pattern option
	beq +

	asl
	tax 
	jsr NybbleShiftingGetter
	jml OptionMenuCursorFixHook

	+ 
	lda $A991
	jml OptionMenuCursorFixHook

AnimationByUnitMenuCommandFix

.al
.xl
.autsiz

	lda $4E56
	and #$000F
	cmp #$0002 	; check if it is on "By Unit"
	bne +

	lda #$0100 	; it is
	rtl

	+ 			; it isnt
	lda #$0400
	rtl


AnimationGeneralFix

	lda $4E56
	and #$000F
	cmp #$0001
	beq _AlwaysOn

	cmp #$0000
	beq _AlwaysOFF 	; always on

	jml AnimationByUnit

_AlwaysOn
	jml $83CDA7

_AlwaysOFF
	jml $83CD8F

AutoCursorFix
	
	lda wCurrentPhase
	bne + ; branch if not player phase

	lda aOptions.wAnimationOption
	bit #$1000
	bne +

	jml $81B9A7

	+
	jml rlSetTurnStartCursorPosition._AutocursorDisabled

UnitSpeedFix

	lda aOptions.wTerrainWindowOption
	and #$00F0 ; set z if 0 
	bne +

	jml $8A99BA

	+
	jml $8A99D9

AudioFix

	lda aOptions.wBurstWindowOption
	and #$000F ; set z if 0 
	beq + 

	jml $85E1E7

	+

	jml $85E1F2

BGMFix

	lda aOptions.wBurstWindowOption
	and #$00F0 ; set z if 0 
	bne +

	jml $85E20B

	+

	jml $85E200

VolumeFix

	lda aOptions.wBurstWindowOption
	and #$0F00
	xba
	cmp #$0003
	beq +

	jml $85E21C
	+
	jml $85E238

rlNewDefaultSaveFileOptions

	lda #$0010 	; set terrain window to simple
	sta <>aOptions.wAnimationOption,b
	lda #$1101 ; set preps to 1, hidden info to 1 and message speed to normal
	sta <>aOptions.wTerrainWindowOption,b
	stz <>aOptions.wBurstWindowOption,b
	stz <>aOptions.wTextSpeedOption,b
	stz <>aOptions.wUnitSpeedOption,b
	stz <>aOptions.wSoundOption,b
	stz <>aOptions.wBGMOption,b
	stz <>aOptions.wAutocursorOption,b
	stz <>aOptions.wVolumeOption,b
	rtl

rlInventoryWEXPBars

	.al
	.autsiz
	.databank ?

	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne +

	rtl 

	+
	lda aActionStructUnit1.DeploymentNumber
	and #Player | Enemy | NPC
	beq +

	rtl 

	+
	stz wR17

	_Loop
	ldx wR17
	lda aInventoryWEXPBarStats,X
	bne +

	jmp _End

	+
	sta wR0
	lda (wR0)
	and #$00FF
	cmp #50
	bcc _NextBar ; weapon type not usable 

	cmp #250
	bcs _NextBar

	-
	sec
	sbc #WeaponRankIncrement
	bpl -

	clc
	adc #WeaponRankIncrement

	pha
	jsr rsDrawWEXPNumber
	pla

	cmp #0
	beq _EmptyBar

	dec a 
	sta wR13
	lda #7 		; bar segments
	sta wR14
	jsl rlUnsignedDivide16By8

	lda wR13 	; result
	inc a 		; number from 1 to 7
	asl a

	tax 
	cpx #5*2
	bge _SpecialRight

	; left bar special, right bar empty 

	lda aInventoryWEXPBarTilemapTable,X
	pha
	ldx wR17
	lda aInventoryWEXPBarTilemapBufferTable,X
	tax
	pla
	sta $7E0000,X
	inx
	inx
	lda #$0CB0 + $2000	; empty bar tile
	sta $7E0000,X
	bra _NextBar


	_SpecialRight

	lda aInventoryWEXPBarTilemapTable,X
	pha
	ldx wR17
	lda aInventoryWEXPBarTilemapBufferTable,X
	tax
	pla
	inx
	inx
	sta $7E0000,X
	lda #$0CB4 + $2000 	; full left bar 
	dex
	dex
	sta $7E0000,X
	bra _NextBar

	_EmptyBar

	ldx wR17
	lda aInventoryWEXPBarTilemapBufferTable,X
	tax
	lda #$0CB0 + $2000	; empty bar tile
	sta $7E0000,X
	inx
	inx
	sta $7E0000,X

	
	_NextBar

	inc wR17
	inc wR17
	jmp _Loop

	_End
	rtl

	.databank 0

rsDrawWEXPNumber ; input: WEXP in A 

	pha

	lda #<>$83C0F6
	sta lUnknown000DDE,b
	lda #>`$83C0F6
	sta lUnknown000DDE+1,b

	lda aInventoryNewWEXPBarCoordinateTable,X
	tax
	lda #$268F 	
	sta wUnknown000DE7,b

	pla
	cmp #10
	bcs +

	inx ; shift values from 0 to 9 one tile right to account for no 2nd number

	+
	phx
	asl a
	tax
	lda aInventoryWEXPNumberTileTable,X
	sta wR14
	stz wR15

	plx
	lda #<>wR14
	sta lR18
	lda #>`wR14
	sta lR18+1
	jsl $87DF69 ; draw small numbers 

	rts 


aInventoryWEXPBarStats
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


aInventoryWEXPBarTilemapTable

	.word $0CB0 + $2000		; empty bar
	.word $0CB1 + $2000		; left bar 1
	.word $0CB2 + $2000		; left bar 2
	.word $0CB3 + $2000		; left bar 3
	.word $0CB4 + $2000		; left bar full
	.word $0CB5 + $2000		; right bar 1
	.word $0CB6 + $2000		; right bar 2
	.word $0CB7 + $2000		; right bar 3


aInventoryWEXPBarTilemapBufferTable

	.word <>aBG2TilemapBuffer + (21 * 2) + ((32 * $20) * 2)
	.word <>aBG2TilemapBuffer + (21 * 2) + ((34 * $20) * 2)
	.word <>aBG2TilemapBuffer + (21 * 2) + ((36 * $20) * 2)
	.word <>aBG2TilemapBuffer + (21 * 2) + ((38 * $20) * 2)
	.word <>aBG2TilemapBuffer + (21 * 2) + ((40 * $20) * 2)
	.word <>aBG2TilemapBuffer + (29 * 2) + ((32 * $20) * 2)
	.word <>aBG2TilemapBuffer + (29 * 2) + ((34 * $20) * 2)
	.word <>aBG2TilemapBuffer + (29 * 2) + ((36 * $20) * 2)
	.word <>aBG2TilemapBuffer + (29 * 2) + ((38 * $20) * 2)
	.word <>aBG2TilemapBuffer + (29 * 2) + ((40 * $20) * 2)

aInventoryNewWEXPBarCoordinateTable

	.word 21 | (31 << 8)
	.word 21 | (33 << 8)
	.word 21 | (35 << 8)
	.word 21 | (37 << 8)
	.word 21 | (39 << 8)
	.word 29 | (31 << 8)
	.word 29 | (33 << 8)
	.word 29 | (35 << 8)
	.word 29 | (37 << 8)
	.word 29 | (39 << 8)

aInventoryWEXPNumberTileTable

	.word 1 | ( 0 << 8)
	.word 2 | ( 0 << 8)
	.word 3 | ( 0 << 8)
	.word 4 | ( 0 << 8)
	.word 5 | ( 0 << 8)
	.word 6 | ( 0 << 8)
	.word 7 | ( 0 << 8)
	.word 8 | ( 0 << 8)
	.word 9 | ( 0 << 8)
	.word 10 | (0 << 8) ; values from 0 to 9 show their first number and omit the 2nd one

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
	.word 5 | ( 1 << 8)
	.word 5 | ( 2 << 8)
	.word 5 | ( 3 << 8)
	.word 5 | ( 4 << 8)
	.word 5 | ( 5 << 8)
	.word 5 | ( 6 << 8)
	.word 5 | ( 7 << 8)
	.word 5 | ( 8 << 8)
	.word 5 | ( 9 << 8)
	.word 5 | (10 << 8)

rlNewInventoryDrawStatNumbers

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne +

	ldx #$0000
	bra _Loop

	+
	ldx #(_Table2 - _Table1)

	; Draw stats using a table
	; Format:
	; Base tile word
	; Coordinate (X | (Y << 8)) word
	; stat pointer word

	_Loop
	lda _Table1,x
	beq _End

	sta wUnknown000DE7,b

	inc x
	inc x
	lda _Table1,x
	tay

	inc x
	inc x
	lda _Table1,x

	inc x
	inc x
	phx

	sta lR18

	; Grab stat

	lda (lR18)

	sta lR18
	stz lR18+1

	lda lR18
	cmp #$00FF
	beq _DrawDash

	; Draw number

	tyx
	jsl $858864
	plx
	bra _Loop

	_End
	jsl rlRedFatigue
	rtl

	_DrawDash

	tyx
	dec x

	; Update text info

	lda wUnknown000DE7,b
	and #$1C00
	ora #$2180
	sta wUnknown000DE7,b

	lda #<>menutextDoubleDash
	sta lR18
	lda #>`menutextDoubleDash
	sta lR18+1
	jsl $87E728
	plx
	bra _Loop

	_Table1

		.word $22A0
		.word 6 | (5 << 8)
		.word <>aActionStructUnit1.Level

		.word $22A0
		.word 9 | (5 << 8)
		.word <>aActionStructUnit1.Experience

		.word $22A0
		.word 6 | (7 << 8)
		.word <>aActionStructUnit1.CurrentHP

		.word $22A0
		.word 9 | (7 << 8)
		.word <>aActionStructUnit1.MaxHP

		.word $2AA0
		.word 24 | (3 << 8)
		.word <>aActionStructUnit1.BattleMight

		.word $2AA0
		.word 24 | (5 << 8)
		.word <>aActionStructUnit1.BattleHit

		.word $2AA0
		.word 30 | (3 << 8)
		.word <>aActionStructUnit1.BattleCrit

		.word $2AA0
		.word 30 | (5 << 8)
		.word <>aActionStructUnit1.BattleAvoid

		.word $2AA0
		.word 9 | (12 << 8)
		.word <>aActionStructUnit1.Strength

		.word $2AA0
		.word 9 | (14 << 8)
		.word <>aActionStructUnit1.Magic

		.word $2AA0
		.word 9 | (16 << 8)
		.word <>aActionStructUnit1.Skill

		.word $2AA0
		.word 9 | (18 << 8)
		.word <>aActionStructUnit1.Speed

		.word $2AA0
		.word 9 | (20 << 8)
		.word <>aActionStructUnit1.Luck

		.word $2AA0
		.word 9 | (22 << 8)
		.word <>aActionStructUnit1.Defense

		.word $2AA0
		.word 9 | (24 << 8)
		.word <>aActionStructUnit1.Constitution

		.word $2AA0
		.word 8 | (39 << 8)
		.word <>aActionStructUnit1.Movement

		.word $2AA0
		.word 8 | (41 << 8)
		.word <>aActionStructUnit1.Fatigue

	.word $0000

	_Table2

		.word $22A0
		.word 6 | (5 << 8)
		.word <>aActionStructUnit1.Level

		.word $22A0
		.word 9 | (5 << 8)
		.word <>aActionStructUnit1.Experience

		.word $22A0
		.word 6 | (7 << 8)
		.word <>aActionStructUnit1.CurrentHP

		.word $22A0
		.word 9 | (7 << 8)
		.word <>aActionStructUnit1.MaxHP

		.word $2AA0
		.word 23 | (1 << 8)
		.word <>aActionStructUnit1.BattleMight

		.word $2AA0
		.word 23 | (3 << 8)
		.word <>aActionStructUnit1.BattleHit

		.word $2AA0
		.word 23 | (5 << 8)
		.word <>aActionStructUnit1.BattleCrit

		.word $2AA0
		.word 30 | (1 << 8)
		.word <>aActionStructUnit1.BattleAttackSpeed

		.word $2AA0
		.word 30 | (3 << 8)
		.word <>aActionStructUnit1.BattleAvoid

		.word $2AA0
		.word 30 | (5 << 8)
		.word <>aActionStructUnit1.BattleDodge

		.word $2AA0
		.word 30 | (7 << 8)
		.word <>aActionStructUnit1.CriticalCoefficient

		.word $2AA0
		.word 9 | (12 << 8)
		.word <>aActionStructUnit1.Strength

		.word $2AA0
		.word 9 | (14 << 8)
		.word <>aActionStructUnit1.Magic

		.word $2AA0
		.word 9 | (16 << 8)
		.word <>aActionStructUnit1.Skill

		.word $2AA0
		.word 9 | (18 << 8)
		.word <>aActionStructUnit1.Speed

		.word $2AA0
		.word 9 | (20 << 8)
		.word <>aActionStructUnit1.Luck

		.word $2AA0
		.word 9 | (22 << 8)
		.word <>aActionStructUnit1.Defense

		.word $2AA0
		.word 9 | (24 << 8)
		.word <>aActionStructUnit1.Constitution

		.word $2AA0
		.word 8 | (39 << 8)
		.word <>aActionStructUnit1.Movement

	.word $0000

	.databank 0

rlRedFatigue

	.al
	.xl
	.autsiz

	lda aActionStructUnit1.Character
	cmp #Leif
	beq	_Dash
	clc

	sep #$20
	lda aActionStructUnit1.MaxHP
	cmp aActionStructUnit1.Fatigue
	rep #$20
	bcc _Red

	; Blue
	lda #$2AA0
	bra _DrawStat

	_Red
	lda #$3EA0

	_DrawStat
	sta wUnknown000DE7,b
	lda _Coordinates
	tax
	lda #<>aActionStructUnit1.Fatigue
	sta lR18
	lda (lR18)
	sta lR18
	stz lR18+1
	lda lR18
	cmp #$00FF
	jsl $858864
	bra _End

	_Dash
	clc
	lda #$2AA0
	sta wUnknown000DE7,b
	lda _Coordinates

	tax
	dec x

	lda wUnknown000DE7,b
	and #$1C00
	ora #$2180
	sta wUnknown000DE7,b

	lda #<>$81D27F
	sta lR18
	lda #>`$81D27F
	sta lR18+1
	jsl $87E728

	_End
	rtl

	_Coordinates
		.word 8 | (41 << 8)

	.databank 0


rlNewInventoryDrawEquippedWeaponType

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	jsl $8A8060

	; Check if the unit has an equipped weapon

	lda aActionStructUnit1.EquippedItemID2
	and #$00FF
	beq _End

	jsl rlCopyItemDataToBuffer

	lda aItemDataBuffer.Type,b
	and #$000F
	clc
	adc #$00A7 ; Start of weapon type icons
	sta wR2
	lda #$0C00
	sta wR3

	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne +

	lda #29 ; X vanilla
	sta wR0
	lda #7 ; Y
	sta wR1
	bra ++
	
	+
	lda #24
	sta wR0
	lda #1
	sta wR1

	+
	jsl $8A8085

	_End
	rtl

	.databank 0

rlNewInventoryDrawRangeText

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Tile base

	lda #$2980
	sta wUnknown000DE7,b

	; If unit has a usable weapon, draw range
	; else draw --

	lda aActionStructUnit1.EquippedItemID2
	and #$00FF
	beq _NoWeapon

	jsl rlCopyItemDataToBuffer
	jsl $8599D5

	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne +

	ldx #22 | (7 << 8)
	bra ++

	+
	ldx #21 | (7 << 8)

	+
	jsl $87E728
	rtl

	_NoWeapon

	lda #<>menutextDoubleDash
	sta lR18
	lda #>`menutextDoubleDash
	sta lR18+1

	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne +

	ldx #23 | (7 << 8) ; vanilla
	bra ++

	+
	ldx #22 | (7 << 8)

	+
	jsl $87E728
	rtl

	.databank 0

rlPickInventoryTilemaps

	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne +


	lda #(`InventoryBrownBars2)<<8 ; vanilla without the topmost brown bar
	sta lR18+1
	lda #<>InventoryBrownBars2
	sta lR18
	bra ++

	+
	lda #(`InventoryBrownBars)<<8
	sta lR18+1
	lda #<>InventoryBrownBars
	sta lR18

	+
	lda #(`aBG2TilemapBuffer)<<8
	sta lR19+1
	lda #<>aBG2TilemapBuffer
	sta lR19
	jsl rlAppendDecompList



	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne +

	lda #(`InventoryTextTilemap2)<<8 	; vanilla without FCM/DDG/AS
	sta lR18+1
	lda #<>InventoryTextTilemap2 	
	sta lR18
	bra ++

	+
	lda #(`InventoryTextTilemap1)<<8 
	sta lR18+1
	lda #<>InventoryTextTilemap1 
	sta lR18

	+
	lda #(`aBG3TilemapBuffer)<<8
	sta lR19+1
	lda #<>aBG3TilemapBuffer
	sta lR19
	jsl rlAppendDecompList

	rtl

	.databank 0

rlCritInBattle

	.databank `aActionStructUnit1

	lda aOptions.wTerrainWindowOption
	and #$0F00
	beq _Vanilla

	sep #$20
	lda @l aActionStructUnit1.BattleAdjustedHit
	cmp #$FF 		; check if unit can counter
	beq +

	lda @l aActionStructUnit1.BattleAdjustedCrit

	+
	sta $003E,b,X


	lda @l aActionStructUnit2.BattleAdjustedHit
	cmp #$FF 
	beq +
	
	lda @l aActionStructUnit2.BattleAdjustedCrit

	+
	sta $003E,b,Y
	rep #$20

	_Vanilla
	lda @l aActionStructUnit1.StartingLevel 	
	and #$00FF 								
	sta $0014,b,x 								
	lda @l aActionStructUnit2.StartingLevel
	and #$00FF
	sta $0014,b,y
	rtl

	.databank 0

rlCritInBattleActualStats

	pha 
	phx 
	phy 
	ldy #0
	ldx #0
	lda #10


	_Loop
	pha 
	cmp #6
	bcc +

	lda #$2C00
	bra ++

	+
	lda #$2400

	+
	sta wR1
	lda #2
	sta wR0

	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne _Modified

	lda _LevelCombatStatTable,X 
	inx 
	inx 
	pha 
	lda _LevelCombatStatTable,X 
	sta lR18
	inx 
	lda _LevelCombatStatTable,X 
	bra +

	_Modified
	lda _CritCombatStatTable,X 
	inx 
	inx 
	pha 
	lda _CritCombatStatTable,X 
	sta lR18
	inx 
	lda _CritCombatStatTable,X 

	+
	sta lR18+1
	inx 
	inx
	pla 
	phx 
	tax 
	lda [lR18],Y
	cmp #100
	bcc +

	inc wR0
	dex
	dex

	+
	jsl $9B9619
	plx 
	pla 
	dec a 
	bne _Loop

	ply 
	plx 
	pla 

	; moved original code
	lda #$7F00
	sta lR18+1
	lda #$D0C0
	sta lR18

	; because the equipped item preview and terrain window break when modifying the original battle stats graphic dma
	; for some reason, im just going to dma the LVL graphic over CRT here

	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne _Vanilla	


	jsl rlDMAByStruct
	.dstruct structDMAToVRAM, BattleStatsLevel, $0030, VMAIN_Setting(True), $F690


	_Vanilla
	rtl

	.databank 0

_LevelCombatStatTable


	.word $0A62
	.long $7E41C8 	; attacker HP

	.word $0AF6
	.long $7E41CC 	; attacker level

	.word $0AAA
	.long $7E41EA 	; attacker hit

	.word $0AEA
	.long $7E41F2 	; attacker atk

	.word $0AB6
	.long $7E41F4 	; attacker def



	.word $0A44
	.long $7E4228 	; defender HP

	.word $0AD8 
	.long $7E422C 	; defender level

	.word $0A8C
	.long $7E424A 	; defender hit

	.word $0ACC
	.long $7E4252 	; defender atk

	.word $0A98
	.long $7E4254 	; defender def

_CritCombatStatTable

	.word $0A62
	.long $7E41C8 	; attacker HP

	.word $0AF6
	.long $7E41F6 	; attacker crit

	.word $0AAA
	.long $7E41EA 	; attacker hit

	.word $0AEA
	.long $7E41F2 	; attacker atk

	.word $0AB6
	.long $7E41F4 	; attacker def



	.word $0A44
	.long $7E4228 	; defender HP

	.word $0AD8 
	.long $7E4256 	; defender crit

	.word $0A8C
	.long $7E424A 	; defender hit

	.word $0ACC
	.long $7E4252 	; defender atk

	.word $0A98
	.long $7E4254 	; defender def


rlCritInBattleBossQuoteFix

	.al
	.xl
	.autsiz

	tya
	and #$01FF
	cmp #8
	beq _BattleStatsGraphics

	lda #$9600
	sta lR18+1
	jml $9CB959

	_BattleStatsGraphics
	lda aOptions.wTerrainWindowOption
	and #$0F00
	beq _LevelDisplay

	lda #<>BattleStats
	sta lR18
	lda #>`BattleStats ; has crit
	sta lR18+1
	lda #<>$7EB400
	sta lR19
	lda #>`$7EB400
	sta lR19+1

	jsl rlAppendDecompList
	jml $9CB995 ; behind vanilla rlAppendDecompList

	_LevelDisplay
	lda #<>BattleStatsLevelIncluded
	sta lR18
	lda #>`BattleStatsLevelIncluded ; has level 
	sta lR18+1
	lda #<>$7EB400
	sta lR19
	lda #>`$7EB400
	sta lR19+1

	jsl rlAppendDecompList
	jml $9CB995 ; behind vanilla rlAppendDecompList

rlNewProcItemInfoDrawItemInfo

	.al
	.xl
	.autsiz
	.databank `wInfoWindowTarget

	lda #$2180
	sta wUnknown000DE7,b

	lda aProcBody1,b,x
	sta wR16
	tax
	lda #>`$B08000
	sta lR18+1

	lda aOptions.wTerrainWindowOption
	and #$0F00
	bne _NormalDescription ; if hidden info enabled -> branch and display scroll growths

	; hidden info disabled 
	lda aItemDataBuffer.BaseWeapon,b 
	and #$00FF
	cmp #OdsScroll
	bcc _NormalDescription ; display normal desc for item IDs less than scrolls

	cmp #HeimsScroll+1
	bcs _NormalDescription ; and for IDs more than scrolls

	lda #<>item_descs._BasicScrollDesc
	bra +

	_NormalDescription
	lda aItemDataBuffer.Description,b

	+
	sta lR18

	jsl $8588E4

	jsl rlEnableBG3Sync
	rtl

	.databank 0

rlNewInventoryDrawSkillIcons

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; First, fill out a buffer
	; to see what skills a unit has

	jsr rsInventoryWriteSkillsBuffer

	stz wR16

	lda aOptions.wTerrainWindowOption
	and #$0F00
	cmp #$0300
	beq +

	stz wR17
	bra _Loop

	+
	lda #(aInventorySkillIconTableHiddenSkills - aInventorySkillIconTable)
	sta wR17

	_Loop

	; For each entry in aInventorySkillIconTable
	; we check if the unit has the skill, determine
	; how they have it so we can get the right label,
	; and draw the icon

	ldx wR17
	lda aInventorySkillIconTable,x
	bmi _End

	tay
	lda #<>aActionStructUnit1.Skills1
	sta lR18
	lda #>`aActionStructUnit1.Skills1
	sta lR18+1

	lda [lR18],y

	and aInventorySkillIconTable+2,x
	beq _Next

	; Get whether it's a character,
	; class, or weapon skill

	jsr rsInventoryGetSkillLabelType

	; Copy icon to VRAM

	lda aInventorySkillIconTable+4,x
	sta wR0

	ldx wR16
	sta aInventorySkillInfoWindowIconArray,x

	lda aInventorySkillIconVRAMTable,x
	sta wR1

	jsl $8A8286

	; Next we draw the tilemap

	ldx wR16
	stz wR1

	lda #<>aBG2TilemapBuffer
	sta wR0

	lda aInventorySkillIconTileIndexTable,x
	sta wUnknown000DE7,b

	lda aInventorySkillIconCoordinateTable,x
	tax

	jsl $8A821B

	inc wR16
	inc wR16

	_Next

	lda wR17
	clc
	adc #6 ; aInventorySkillIconTable entry
	sta wR17
	bra _Loop

	_End
	lda wR16
	sta wInventorySkillInfoWindowArrayOffset
	rtl

	.databank 0

rsInventoryWriteSkillsBuffer

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	; Get class skills

	lda aSelectedCharacterBuffer.Class,b
	jsl rlCopyClassDataToBuffer

	lda #<>aClassDataBuffer.Skills1
	sta lR23
	lda #>`aClassDataBuffer.Skills1
	sta lR23+1

	; Get character skills

	lda aSelectedCharacterBuffer.DeploymentNumber,b
	sta wR0

	lda #<>aItemSkillCharacterBuffer
	sta wR1

	jsl rlCopyCharacterDataToBufferByDeploymentNumber

	lda #<>aItemSkillCharacterBuffer.Skills1
	sta lR24
	lda #>`aItemSkillCharacterBuffer.Skills1
	sta lR24+1

	rts

	.databank 0

rsInventoryGetSkillLabelType

	.al
	.xl
	.autsiz
	.databank `aBG1TilemapBuffer

	pha
	phx
	phy

	; Pointer to class skills in lR23
	; Pointer to character skills in lR24

	lda aInventorySkillIconTable,x
	tay

	lda (lR23),y
	and aInventorySkillIconTable+2,x
	bne _ClassSkill

	lda (lR24),y
	and aInventorySkillIconTable+2,x
	bne _CharacterSkill

	; Else weapon skill

	lda #4
	bra _End

	_ClassSkill

	lda #0
	bra _End

	_CharacterSkill

	lda #2

	_End

	ldx wR16
	sta aInventorySkillInfoWindowTypeArray,x

	ply
	plx
	pla
	rts

	.databank 0


aInventorySkillIconTable

	; Format:
	; Offset in skills bitfield word
	; Bit in skills bitfield word
	; Icon index word

	.word 0, Skill1Dance,			$00C2
	.word 0, Skill1Steal,			$00C1
;	.word 0, Skill1FakeImmortal,	$00B6
	.word 0, Skill1Bargain,			$00C3
	.word 1, Skill2Charm,			$00B5
	.word 1, Skill2Adept,			$00B3
	.word 1, Skill2Miracle,			$00B8
	.word 1, Skill2Vantage,			$00BA
	.word 1, Skill2Accost,			$00BB
	.word 1, Skill2Pavise,			$00B4
	.word 1, Skill2Nihil,			$00B7
	.word 1, Skill3Wrath << 8,		$00B1
	.word 1, Skill3Astra << 8,		$00BC
	.word 1, Skill3Luna << 8,		$00BD
	.word 1, Skill3Sol << 8,		$00BE
	.word 1, Skill3Paragon << 8,	$00C0
	.word 0, Skill1Renewal,			$00BF

	.sint -1

aInventorySkillIconTableHiddenSkills

	.word 0, Skill1Dance,			$00C2
	.word 0, Skill1Steal,			$00C1
	.word 0, Skill1Noncombatant,	$00B6
	.word 0, Skill1Bargain,			$00C3
	.word 1, Skill2Charm,			$00B5
	.word 1, Skill2Adept,			$00B3
	.word 1, Skill2Miracle,			$00B8
	.word 1, Skill2Vantage,			$00BA
	.word 1, Skill2Accost,			$00BB
	.word 1, Skill2Pavise,			$00B4
	.word 1, Skill2Nihil,			$00B7
	.word 1, Skill3Wrath << 8,		$00B1
	.word 1, Skill3Astra << 8,		$00BC
	.word 1, Skill3Luna << 8,		$00BD
	.word 1, Skill3Sol << 8,		$00BE
	.word 1, Skill3Paragon << 8,	$00C0
	.word 0, Skill1Renewal,			$00BF
	.word 1, Skill2Anchor,			$00B2
	.word 1, Skill3Immortal << 8,	$00B9

	.sint -1

aInventorySkillIconVRAMTable

	.word (($7900 + ($80 *  0)) / 2)
	.word (($7900 + ($80 *  1)) / 2)
	.word (($7900 + ($80 *  2)) / 2)
	.word (($7900 + ($80 *  3)) / 2)
	.word (($7900 + ($80 *  4)) / 2)
	.word (($7900 + ($80 *  5)) / 2)
	.word (($7900 + ($80 *  6)) / 2)
	.word (($7900 + ($80 *  7)) / 2)
	.word (($7900 + ($80 *  8)) / 2)
	.word (($7900 + ($80 *  9)) / 2)
	.word (($7900 + ($80 * 10)) / 2)
	.word (($7900 + ($80 * 11)) / 2)
	.word (($7900 + ($80 * 12)) / 2)
	.word (($7900 + ($80 * 13)) / 2)
	.word (($7900 + ($80 * 14)) / 2)
	.word (($7900 + ($80 * 15)) / 2)
	.word (($7900 + ($80 * 16)) / 2)
	.word (($7900 + ($80 * 17)) / 2)
	.word (($7900 + ($80 * 18)) / 2)
	.word (($7900 + ($80 * 19)) / 2)

aInventorySkillIconTileIndexTable

	.word $35C8
	.word $35CC
	.word $35D0
	.word $35D4
	.word $35D8
	.word $35DC
	.word $35E0
	.word $35E4
	.word $35E8
	.word $35EC
	.word $35F0
	.word $35F4
	.word $35F8
	.word $35FC
	.word $3600
	.word $3604
	.word $3608
	.word $360C
	.word $3610
	.word $3614

aInventorySkillIconCoordinateTable
	.word 15 | (43 << 8)
	.word 17 | (43 << 8)
	.word 19 | (43 << 8)
	.word 21 | (43 << 8)
	.word 23 | (43 << 8)
	.word 25 | (43 << 8)
	.word 27 | (43 << 8)
	.word 29 | (43 << 8)
	.word 21 | (41 << 8)
	.word 23 | (41 << 8)
	.word 25 | (41 << 8)
	.word 27 | (41 << 8)
	.word 29 | (41 << 8)
	.word 29 | (39 << 8)
	.word 29 | (37 << 8)
	.word 29 | (35 << 8)
	.word 29 | (33 << 8)
	.word 29 | (31 << 8)
	.word 29 | (29 << 8)
	.word 29 | (27 << 8)

rlDMAMoreOptionGraphics

	jsl rlDMAByStruct
	.dstruct structDMAToVRAM, $7FB0F5, $0C00, VMAIN_Setting(True), $5000 ; normal graphic

	jsl rlDMAByStruct
	.dstruct structDMAToVRAM, AdditionalOptionGraphics, $0080, VMAIN_Setting(True), $5C00

	jsl rlDMAByStruct
	.dstruct structDMAToVRAM, (AdditionalOptionGraphics+$200), $0080, VMAIN_Setting(True), $5E00

	rtl

	.databank 0


PhaseGraphicsFix

	lda $4E58
	and #$00F0
	bne +
	jml $8381D0

	+
	jml $83807C

.here


* = $02D3F4
.logical $85D3F4

	jsl rlDMAMoreOptionGraphics

	.fill $85D401 - *, $EA
.here



; hook in Code80B88F
; jsl rlCritInBattle - if enemy cant counter save crit in ram


* = $0D99FD
.logical $9B99FD

	jsl rlCritInBattleActualStats

	.fill $9B9A0A - *, $EA

.here

; various option fixes

; save slot creation: add new standard options

* = $01FC28
.logical $83FC28

jsl rlNewDefaultSaveFileOptions

.here 


; reminder to also change menucommands for new animation ram location
* = $01CD60
.logical $83CD60

jml AnimationGeneralFix

.fill $83CD6D -*, $EA

AnimationByUnit

.here 


; fix terrain window

* = $021E80
.logical $849E80

lda <>aOptions.wAnimationOption
bit #$0020
bne $849E97

.here

; fix unit window - changed in EquippedItemPreview


; fix auto cursor 

; > see Code81B982.asm in asm folder



; fix text speed

* = $0A92E6
.logical $9592E6

lda aOptions.wTerrainWindowOption
and #$0003

.here

; fix unit speed - changed in MovementSpeedup
;
; * = $0519B4
; .logical $8A99B4
; 
; jml UnitSpeedFix
; 
; .here


; audo (stereo/mono) fix 

* = $02E1E2
.logical $85E1E2

jml AudioFix
nop  

.here

; BGM fix 

* = $02E1FB
.logical $85E1FB

jml BGMFix

.here

; volume fix

* = $02E214
.logical $85E214

jml VolumeFix
nop
nop

.here

* = $0D1D79
.logical $9A9D79

	.al
	.databank $7E

	lda wUnknown0004EA,b
	ora #$0005
	sta wUnknown0004EA,b
	lda #$0300
	sta @l aOptions.wBurstWindowOption
	rtl

	.databank 0

.here

* = $0E3954
.logical $9CB954

	.al
	.databank $7E

	jml rlCritInBattleBossQuoteFix
	nop

	.databank 0

.here