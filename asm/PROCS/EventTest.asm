
	.weak

    aChapterDialoguePointers                             :?= address($82DB8A)
    
	.endweak


procEventTest .dstruct structProcInfo, "ec", rlProcEventTestInit, None, aProcEventTestCode ; 82/8000

rlProcEventTestInit ; 82/8008

	.al
	.xl
	.autsiz
	.databank ?

	lda wUnknown000302,b
	sta $7FAE3E

	lda #$0000
	sta wUnknown000302,b

	lda wUnknown000300,b
	sta $7FAE40

	rtl

aProcEventTestCode ; 82/801D

	PROC_YIELD 1

	PROC_SET_ONCYCLE rlUnknown8288AB

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown8288D1

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown8288F7

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown82891D

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown828943

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_CALL rlProcEventTestSetBG3

	PROC_CALL rlProcEventTestClearBG1Tilemap

	PROC_SET_ONCYCLE rlProcEventTestGetJoypadInput

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_CALL rlProcEventTestHandleAction

	PROC_SET_ONCYCLE rlProcEventTestWaitForEventEnd

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_YIELD 1

	PROC_JUMP aProcEventTestCode

rlProcEventTestSetBG3 ; 82/807A

	.al
	.xl
	.autsiz
	.databank ?

	lda #$0000
	jsl rlClearWMPortraitByIndex

	lda #$0001
	jsl rlClearWMPortraitByIndex

	lda #$0000
	jsl rsUnknown829B99

	lda #$0001
	jsl rsUnknown829B99

	lda #0
	sta wBufferBG3HOFS

	lda #0
	sta wBufferBG3VOFS

	lda #(`aBG3TilemapBuffer)<<8
	sta lR18+1
	lda #<>aBG3TilemapBuffer
	sta lR18
	lda #$0800
	sta lR19
	lda #$0000
	jsl rlBlockFillWord

	lda #(`$83C0F6)<<8
	sta aCurrentTilemapInfo.lInfoPointer+1,b
	lda #<>$83C0F6
	sta aCurrentTilemapInfo.lInfoPointer,b

	lda #$2180
	sta aCurrentTilemapInfo.wBaseTile,b

	ldx #(5 << 8) | 6 ; (Y << 8) | X
	lda #(`menutextEventTestTitle)<<8
	sta lR18+1
	lda #<>menutextEventTestTitle
	sta lR18
	jsl $87E728
	bra +

		menutextEventTestTitle ; 82/80DB
  	.enc "SJIS"
  	.text "イベントテスト\n"

	+
	jsr rsProcEventTestUpdateText
	jsl rlResetHDMAArrayEngine
	jsl rlEnableBG3Sync
	rtl


rlProcEventTestClearBG1Tilemap ; 82/80F7

	.al
	.xl
	.autsiz
	.databank ?

	lda #(`aBG1TilemapBuffer)<<8
	sta lR18+1
	lda #<>aBG1TilemapBuffer
	sta lR18
	lda #$0800
	sta lR19
	lda #$02FF
	jsl rlBlockFillWord
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG1TilemapBuffer, $0800, VMAIN_Setting(True), $E000

	rtl

rlProcEventTestGetJoypadInput ; 82/811B

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x

	lda wJoy1Repeated
	bit #JOY_X | JOY_A | JOY_Down | JOY_Up | JOY_Start | JOY_Y | JOY_B
	bne +

	; If nothing to do

	jmp _End

	+
	ldx aProcSystem.wOffset,b
	bit #JOY_Up
	bne _Up

	bit #JOY_Down
	beq ++

	; aProcSystem.aBody0 is which option we're hovering
	; over, 0-2

	lda aProcSystem.aBody0,b,x
	inc a
	cmp #$0003
	blt +

	; Loop around back to the first option

	lda #$0000
	bra +

	_Up
	lda aProcSystem.aBody0,b,x
	dec a
	bpl +

	; Loop around to the last option

	lda #$0002

	+
	sta aProcSystem.aBody0,b,x
	bra _End

	+

	; If not moving up or down
	; check for changes to numbers

	; Grab which option number we're on

	jsr rsProcEventTestGetOptionNumberOffset

	lda wJoy1Repeated
	bit #JOY_A
	beq +

	; Add 1 to number

	inc $0000,b,x
	jsr rsProcEventTestUpdateText
	bra _End

	+
	bit #JOY_B
	beq +

	; Sub 1 from number

	dec $0000,b,x
	jsr rsProcEventTestUpdateText
	bra _End

	+
	bit #JOY_X
	beq +

	; Add 10 to number

	lda $0000,b,x
	clc
	adc #10
	sta $0000,b,x
	jsr rsProcEventTestUpdateText
	bra _End

	+
	bit #JOY_Y
	beq +

	; Sub 10 from number

	lda $0000,b,x
	sec
	sbc #10
	sta $0000,b,x
	jsr rsProcEventTestUpdateText
	bra _End

	+
	bit #JOY_Start
	beq _End

	; Sleep until start is pressed

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	_End
	ldx aProcSystem.wOffset,b
	jsr rsProcEventTestDrawCursor
	rtl


rsProcEventTestUpdateText ; 82/81AF

	.al
	.xl
	.autsiz

	; Write option labels

	lda #(`$83C0F6)<<8
	sta aCurrentTilemapInfo.lInfoPointer+1,b
	lda #<>$83C0F6
	sta aCurrentTilemapInfo.lInfoPointer,b

	lda #$2180
	sta aCurrentTilemapInfo.wBaseTile,b

	ldx #(10 << 8) | 8 ; (Y << 8) | X
	lda #(`menutextEventTestEventLabel)<<8
	sta lR18+1
	lda #<>menutextEventTestEventLabel
	sta lR18
	jsl $87E728
	bra +

		menutextEventTestEventLabel ; 82/81D4
		.enc "SJIS"
		.text "イベント　　　　　　　\n"

	+
	ldx #(12 << 8) | 8 ; (Y << 8) | X
	lda #(`menutextEventTestConversationLabel)<<8
	sta lR18+1
	lda #<>menutextEventTestConversationLabel
	sta lR18
	jsl $87E728
	bra +

		menutextEventTestConversationLabel ; 81/81FF
 		.enc "SJIS"
 		.text "かいわ　　　　　　　　\n"

	+
	ldx #(14 << 8) | 8 ; (Y << 8) | X
	lda #(`menutextEventTestMapSelectLabel)<<8
	sta lR18+1
	lda #<>menutextEventTestMapSelectLabel
	sta lR18
	jsl $87E728
	bra +

		menutextEventTestMapSelectLabel ; 81/822A
		.enc "SJIS"
		.text "マップセレクト　　　　\n"

	+
	lda #(`$83C0F6)<<8
	sta aCurrentTilemapInfo.lInfoPointer+1,b
	lda #<>$83C0F6
	sta aCurrentTilemapInfo.lInfoPointer,b

	lda #$22A0
	sta aCurrentTilemapInfo.wBaseTile,b

	; Write event number

	ldx aProcSystem.wOffset,b

	lda aProcSystem.aBody1,b,x
	sta lR18
	stz lR18+2
	stz lR19+1
	jsl $85870E
	lda _aEventNumberCoordinates
	tax
	jsl $8587D0

	; write conversation number

	ldx aProcSystem.wOffset,b

	lda aProcSystem.aBody2,b,x
	sta lR18
	stz lR18+2
	stz lR19+1
	jsl $85870E
	lda _aConversationNumberCoordinates
	tax
	jsl $8587D0

	; clamp chapter values
	; for some reason exclude chapter 1

	ldx aProcSystem.wOffset,b

	lda aProcSystem.aBody3,b,x
	cmp #ChapterUnknown
	blt +

	lda #Chapter02 - 1
	sta aProcSystem.aBody3,b,x

	+
	asl a
	tax
	lda #(`menutextEventTestMap01)<<8
	sta lR18+1
	lda <>aEventTestMapSelectNames,b,x
	sta lR18
	lda _aMapSelectNumberCoordinates
	tax
	lda #$2180
	sta aCurrentTilemapInfo.wBaseTile,b
	jsl $87E728
	jsl rlEnableBG3Sync
	rts

	_aEventNumberCoordinates ; 82/82B7
		.word (10 << 8) | 18

	_aConversationNumberCoordinates ; 82/82B9
		.word (12 << 8) | 18

	_aMapSelectNumberCoordinates ; 82/82BB
		.word (14 << 8) | 18

	aEventTestMapSelectNames ; 82/82BD
	  .word <>menutextEventTestMap02
	  .word <>menutextEventTestMap02x
	  .word <>menutextEventTestMap03
	  .word <>menutextEventTestMap04
	  .word <>menutextEventTestMap04x
	  .word <>menutextEventTestMap05
	  .word <>menutextEventTestMap06
	  .word <>menutextEventTestMap07
	  .word <>menutextEventTestMap08
	  .word <>menutextEventTestMap08x
	  .word <>menutextEventTestMap09
	  .word <>menutextEventTestMap10
	  .word <>menutextEventTestMap11
	  .word <>menutextEventTestMap11x
	  .word <>menutextEventTestMap12
	  .word <>menutextEventTestMap12x
	  .word <>menutextEventTestMap13
	  .word <>menutextEventTestMap14
	  .word <>menutextEventTestMap14x
	  .word <>menutextEventTestMap15
	  .word <>menutextEventTestMap16A
	  .word <>menutextEventTestMap17A
	  .word <>menutextEventTestMap16B
	  .word <>menutextEventTestMap17B
	  .word <>menutextEventTestMap18
	  .word <>menutextEventTestMap19
	  .word <>menutextEventTestMap20
	  .word <>menutextEventTestMap21
	  .word <>menutextEventTestMap21x
	  .word <>menutextEventTestMap22
	  .word <>menutextEventTestMap23
	  .word <>menutextEventTestMap24
	  .word <>menutextEventTestMap24x
	  .word <>menutextEventTestMap25
	  .word <>menutextEventTestWorldMap

menutextEventTestMap01 ; 82/8303
  .enc "SJIS"
  .text "マップ０１　\n"

menutextEventTestMap02 ; 82/8311
  .enc "SJIS"
  .text "マップ０２　\n"

menutextEventTestMap02x ; 82/831F
  .enc "SJIS"
  .text "マップ０２ｘ\n"

menutextEventTestMap03 ; 82/832D
  .enc "SJIS"
  .text "マップ０３　\n"

menutextEventTestMap04 ; 82/833B
  .enc "SJIS"
  .text "マップ０４　\n"

menutextEventTestMap04x ; 82/8349
  .enc "SJIS"
  .text "マップ０４ｘ\n"

menutextEventTestMap05 ; 82/8357
  .enc "SJIS"
  .text "マップ０５　\n"

menutextEventTestMap06 ; 82/8365
  .enc "SJIS"
  .text "マップ０６　\n"

menutextEventTestMap07 ; 82/8373
  .enc "SJIS"
  .text "マップ０７　\n"

menutextEventTestMap08 ; 82/8381
  .enc "SJIS"
  .text "マップ０８　\n"

menutextEventTestMap08x ; 82/838F
  .enc "SJIS"
  .text "マップ０８ｘ\n"

menutextEventTestMap09 ; 82/839D
  .enc "SJIS"
  .text "マップ０９　\n"

menutextEventTestMap10 ; 82/83AB
  .enc "SJIS"
  .text "マップ１０　\n"

menutextEventTestMap11 ; 82/83B9
  .enc "SJIS"
  .text "マップ１１　\n"

menutextEventTestMap11x ; 82/83C7
  .enc "SJIS"
  .text "マップ１１ｘ\n"

menutextEventTestMap12 ; 82/83D5
  .enc "SJIS"
  .text "マップ１２　\n"

menutextEventTestMap12x ; 82/83E3
  .enc "SJIS"
  .text "マップ１２ｘ\n"

menutextEventTestMap13 ; 82/83F1
  .enc "SJIS"
  .text "マップ１３　\n"

menutextEventTestMap14 ; 82/83FF
  .enc "SJIS"
  .text "マップ１４　\n"

menutextEventTestMap14x ; 82/840D
  .enc "SJIS"
  .text "マップ１４ｘ\n"

menutextEventTestMap15 ; 82/841B
  .enc "SJIS"
  .text "マップ１５　\n"

menutextEventTestMap16A ; 82/8429
  .enc "SJIS"
  .text "マップ１６Ａ\n"

menutextEventTestMap17A ; 82/8437
  .enc "SJIS"
  .text "マップ１７Ａ\n"

menutextEventTestMap16B ; 82/8445
  .enc "SJIS"
  .text "マップ１６Ｂ\n"

menutextEventTestMap17B ; 82/8453
  .enc "SJIS"
  .text "マップ１７Ｂ\n"

menutextEventTestMap18 ; 82/8461
  .enc "SJIS"
  .text "マップ１８　\n"

menutextEventTestMap19 ; 82/846F
  .enc "SJIS"
  .text "マップ１９　\n"

menutextEventTestMap20 ; 82/847D
  .enc "SJIS"
  .text "マップ２０　\n"

menutextEventTestMap21 ; 82/848B
  .enc "SJIS"
  .text "マップ２１　\n"

menutextEventTestMap21x ; 82/8499
  .enc "SJIS"
  .text "マップ２１ｘ\n"

menutextEventTestMap22 ; 82/84A7
  .enc "SJIS"
  .text "マップ２２　\n"

menutextEventTestMap23 ; 82/84B5
  .enc "SJIS"
  .text "マップ２３　\n"

menutextEventTestMap24 ; 82/84C3
  .enc "SJIS"
  .text "マップ２４　\n"

menutextEventTestMap24x ; 82/84D1
  .enc "SJIS"
  .text "マップ２４ｘ\n"

menutextEventTestMap25 ; 82/84DF
  .enc "SJIS"
  .text "マップ２５　\n"

menutextEventTestWorldMap ; 82/84ED
  .enc "SJIS"
  .text "ぜんたいマップ\n"

rlProcEventTestHandleAction ; 82/84FD

	.al
	.xl
	.autsiz
	.databank ?

	; Figure out what to do by the option
	; we're on

	lda aProcSystem.aBody0,b,x
	beq _Event

	cmp #$0001
	beq _Conversation

	cmp #$0002
	bne +

	jmp _Map

	+
	rtl

	_Event

	; Get event number

	phx
	lda aProcSystem.aBody1,b,x
	cmp #$0000
	blt +

	lda #$0000

	+

	; The table ahead was probably meant to
	; be a table of long pointers to
	; chapter events but is instead
	; pointing to chapter 24's data

	sta wR0
	asl a
	clc
	adc wR0
	tax
	lda $99F2A4,x
	sta lR18
	lda $99F2A4+1,x
	sta lR18+1

	; Start events?

	jsl rlUnknown8C839F

	lda #(`aBG3TilemapBuffer)<<8
	sta lR18+1
	lda #<>aBG3TilemapBuffer
	sta lR18
	lda #$0800
	sta lR19
	lda #$01DF
	jsl rlBlockFillWord
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG3TilemapBuffer, $0800, VMAIN_Setting(True), $A000

	plx
	jsl rlProcEngineFreeProc
	rtl

	_Conversation

	phx
	jsl rlUnknown8CCA8C

	; Get pointer to dialogue

	lda aProcSystem.aBody2,b,x
	cmp #$0344 ; size(aChapterDialoguePointers) / 3
	blt +

	lda #$0000

	+
	sta wR0
	asl a
	clc
	adc wR0
	tax
	lda aChapterDialoguePointers,x
	sta lR18
	lda aChapterDialoguePointers+1,x
	sta lR18+1
	jsl rlUnknown8289AE

	lda #(`aBG3TilemapBuffer)<<8
	sta lR18+1
	lda #<>aBG3TilemapBuffer
	sta lR18
	lda #$0800
	sta lR19
	lda #$01DF
	jsl rlBlockFillWord
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG3TilemapBuffer, $0800, VMAIN_Setting(True), $A000

	plx
	rtl

	_Map

	phx
	lda aProcSystem.aBody3,b,x
	sta wCurrentChapter,b
	phx
	lda #(`procMapSwitch)<<8
	sta lR44+1
	lda #<>procMapSwitch
	sta lR44
	jsl rlProcEngineCreateProc

	plx
	plx
	jsl rlProcEngineFreeProc
	rtl

rlProcEventTestWaitForEventEnd ; 82/85C5

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	phx
	jsl rlUnknown828965
	plx
	lda wEventEngineStatus,b
	bne +

	lda wDialogueEngineStatus,b
	bne +

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rsProcEventTestGetOptionNumberOffset ; 82/85E4

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.aBody0,b,x
	asl a
	tax
	lda _aOptionOffsets,x
	clc
	adc aProcSystem.wOffset,b
	tax
	rts

	_aOptionOffsets ; 82/85F3
		.word aProcSystem.aBody1
		.word aProcSystem.aBody2
		.word aProcSystem.aBody3


rsProcEventTestDrawCursor ; 82/85F9

	.al
	.xl
	.autsiz
	.databank ?

	phx
	lda aProcSystem.aBody0,b,x
	asl a
	asl a
	tax
	lda <>_aCursorCoordinateTable,b,x
	sta wR0
	lda <>_aCursorCoordinateTable+2,b,x
	sta wR1
	jsl $859013
	plx
	rts

	_aCursorCoordinateTable ; 82/8610
		.word 48, 80
		.word 48, 96
		.word 48, 112
