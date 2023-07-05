

procDialogue .dstruct structProcInfo, "TT", rlProcDialogueInit, None, aProcDialogueCode ; 82/8672

aUnknown82867A ; 82/867A
	.word $0000

rlProcDialogueInit ; 82/867C

	.al
	.xl
	.autsiz
	.databank ?

	lda #8
	sta aProcSystem.aBody0,b,x

	jsl $8593EB
	jsl rlUnknown8CCA8C

	; Pointer to text

	lda lEventEngineLongParameter,b
	sta lR18
	lda lEventEngineLongParameter+1,b
	sta lR18+1

	jsl rlUnknown8289AE
	jsl rlUnknown828A0D

	; Text uses BG3, so we reset it

	lda #0
	sta wBufferBG3VOFS

	lda #0
	sta wBufferBG3HOFS

	sep #$20
	lda bBufferBG3SC
	and #~BGSC_Setting(0, BGSC_64x32)
	sta bBufferBG3SC
	rep #$20

	; Copy a blank tile

	phx
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, _g2bppBlankDialogueTile, size(_g2bppBlankDialogueTile), VMAIN_Setting(True), $CD00

	plx
	rtl

	_g2bppBlankDialogueTile .fill $10, $00


aProcDialogueCode ; 82/86D0

	PROC_SET_ONCYCLE rlProcDialogueGetPalettes

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlProcDialogueFadeToPalette

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlProcDialogueMain

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown828880

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

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

	PROC_CALL $84A17D

	PROC_CALL rlRestoreMenuTextPalette

	PROC_YIELD 1

	PROC_END

rlProcDialogueGetPalettes ; 82/8738

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x

	; Wait to be able to decompress

	lda bDecompressionArrayFlag,b
	and #$00FF
	bne _End

	phx
	lda #$00E0
	sta aProcSystem.aBody1,b,x

	; Copy original BG palettes

	lda #(`aBGPaletteBuffer.aPalette3)<<8
	sta lR18+1
	lda #<>aBGPaletteBuffer.aPalette3
	sta lR18
	lda #(`$7E4CF8)<<8
	sta lR19+1
	lda #<>$7E4CF8
	sta lR19
	lda #aOAMPaletteBuffer.aPalette0 - aBGPaletteBuffer.aPalette3
	sta lR20
	jsl rlBlockCopy

	; Grab our target fade palette

	jsl rlGetTilesetFadePalettePointer

	lda #(`$7E4BF8)<<8
	sta lR19+1
	lda #<>$7E4BF8
	sta lR19
	jsl rlAppendDecompList

	lda #(`aDialogueBoxHDMAInfo)<<8
	sta lR44+1
	lda #<>aDialogueBoxHDMAInfo
	sta lR44
	lda #$0006
	sta wR40
	jsl rlHDMAArrayEngineCreateEntryByIndex

	; Sleep

	plx
	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	_End
	rtl

rlProcDialogueFadeToPalette ; 82/8799

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x

	; Wait to be able to decompress

	lda bDecompressionArrayFlag,b
	and #$00FF
	bne _End

	; Fade

	phx
	lda #$0010
	sta wUnknown0017D7,b

	clc
	jsl $979B67

	.word <>$7E4BF8
	.word $0050, $0060

	plx
	bcc _End

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	_End
	rtl

rlProcDialogueMain ; 82/87C5

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x

	; Wait for max brightness

	lda bBufferINIDISP
	and #$00FF
	cmp #INIDISP_Setting(False, 15)
	beq +

	jmp _End

	+

	phx

	; Offset text layer by half a tile

	lda #4
	sta wBufferBG3HOFS

	; Main handler

	jsl rlUnknown828965
	plx

	; Wait until dialogue is finished

	lda wDialogueEngineStatus,b
	bit #$0001
	beq +

	jmp _End

	+
	phx

	; Stub?

	jsl rlUnknown828A35

	; Clears a thing

	jsl $958127

	; Clear tilemap buffers

	lda #(`aBG1TilemapBuffer)<<8
	sta lR18+1
	lda #<>aBG1TilemapBuffer
	sta lR18
	lda #$0800
	sta lR19
	lda #$02FF
	jsl rlBlockFillWord

	lda #(`aBG3TilemapBuffer)<<8
	sta lR18+1
	lda #<>aBG3TilemapBuffer
	sta lR18
	lda #$0800
	sta lR19
	lda #$01DF
	jsl rlBlockFillWord

	; Copy them to VRAM

	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG3TilemapBuffer, $0800, VMAIN_Setting(True), $A000

	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, _g2bppBlankMenuTextTile, size(_g2bppBlankMenuTextTile), VMAIN_Setting(True), $BDF0

	; Reset BG3 size

	stz wBufferBG3HOFS
	sep #$20
	lda bBufferBG3SC
	ora #BGSC_Setting(0, BGSC_64x32)
	sta bBufferBG3SC
	rep #$20
	plx
	phx

	; Sleep

	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	; Reset our palettes

	lda #(`$7E4CF8)<<8
	sta lR18+1
	lda #<>$7E4CF8
	sta lR18
	lda #(`$7E4BF8)<<8
	sta lR19+1
	lda #<>$7E4BF8
	sta lR19
	lda #$20 * 5
	sta lR20
	jsl rlBlockCopy

	_End
	rtl

	_g2bppBlankMenuTextTile .fill $10, $00

rlUnknown828880 ; 82/8880

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	phx
	lda #$0010
	sta wUnknown0017D7,b
	clc
	jsl $979B67

	.word <>$7E4BF8
	.word $0050, $0060

	plx
	bcc +

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx
	lda #$0006
	jsl rlHDMAArrayEngineFreeEntryByIndex

	+
	rtl

rlUnknown8288AB ; 82/88AB

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	lda bDMAArrayFlag,b
	and #$00FF
	bne +

	phx
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, $F3CC80, $0800, VMAIN_Setting(True), $B800

	plx
	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown8288D1 ; 82/88D1

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	lda bDMAArrayFlag,b
	and #$00FF
	bne +

	phx
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, $F3D480, $0800, VMAIN_Setting(True), $C000

	plx
	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown8288F7 ; 82/88F7

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	lda bDMAArrayFlag,b
	and #$00FF
	bne +

	phx
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, $F3DC80, $0800, VMAIN_Setting(True), $C800

	plx
	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown82891D ; 82/891D

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	lda bDMAArrayFlag,b
	and #$00FF
	bne +

	phx
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, $F3E480, $0800, VMAIN_Setting(True), $D000

	plx
	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown828943 ; 82/8943

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	lda bDMAArrayFlag,b
	and #$00FF
	bne +

	phx
	jsl $85968D

	lda #$0000
	sta wBufferBG3HOFS

	plx
	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown828965 ; 82/8965

	.al
	.xl
	.autsiz
	.databank ?

	jsl $958233
	jsl $95882A
	jsr rsUnknown828975
	jsl rlUpdateTwoPositionDialogueArrow
	rtl

rsUnknown828975 ; 82/8975

	.al
	.xl
	.autsiz
	.databank ?

	lda $7E45CF
	cmp #$FFFF
	beq +

	lda $7E458E
	ldy #$0000

	+
	lda $7E45E8
	cmp #$FFFF
	beq +

	lda $7E4590
	ldy #$0001

	+
	lda $7E45CF
	cmp #$FFFF
	bne +

	lda $7E45E8
	cmp #$FFFF
	beq ++

	+
	lda $7E4592
	beq +

	+
	rts

rlUnknown8289AE ; 82/89AE

	.al
	.xl
	.autsiz
	.databank ?

	php
	lda #$0001
	jsl $958157

	lda #$0020
	tsb wDialogueEngineStatus,b

	lda #$0001
	sta wUnknown001800,b

	lda #$0004
	sta wBufferBG3HOFS

	lda wEventEngineStatus,b
	bit #$8000
	beq +

	lda #$0040
	tsb wDialogueEngineStatus,b

	+
	sep #$20
	lda #T_Setting(True, False, True, False, False)
	tsb bBufferTM
	lda #CGWSEL_Setting(False, False, CGWSEL_MathAlways, CGWSEL_BlackNever)
	sta bBufferCGWSEL
	lda #CGADSUB_Setting(CGADSUB_Subtract, False, True, False, False, False, True, False)
	sta bBufferCGADSUB
	lda #COLDATA_Setting(0, False, False, False)
	sta bBufferCOLDATA_0
	jsl rlUnknown8289ED
	plp
	rtl

rlUnknown8289ED ; 82/89ED

	.al
	.xl
	.autsiz
	.databank ?

	php
	sep #$20
	lda bBufferCOLDATA_0
	ora #COLDATA_ApplyRed
	sta bBufferCOLDATA_1
	sta COLDATA,b
	lda bBufferCOLDATA_0
	ora #COLDATA_ApplyGreen
	sta bBufferCOLDATA_2
	sta COLDATA,b
	lda bBufferCOLDATA_0
	ora #COLDATA_ApplyBlue
	sta bBufferCOLDATA_3
	sta COLDATA,b
	plp
	rtl

rlUnknown828A0D ; 82/8A0D

	.al
	.xl
	.autsiz
	.databank ?

	phx
	lda #$0000
	sta wUnknown001834,b

	phx
	jsl $8A923A
	plx

	lda #$0000
	rol a
	eor #$0001
	sta aProcSystem.aBody2,b,x
	beq +

	lda aSelectedCharacterBuffer.UnitState,b
	sta aProcSystem.aBody3,b,x

	lda aSelectedCharacterBuffer.Character,b
	sta @l wUnknown001834

	+
	plx
	rtl

rlUnknown828A35 ; 82/8A35

	.al
	.xl
	.autsiz
	.databank ?

	phx
	plx
	rtl

procDialogueUnknown828A38 .dstruct structProcInfo, "TT", rlProcDialogueUnknown828A38Init, None, aProcDialogueUnknown828A38Code ; 82/8A38

aUnknown828A40 ; 82/8A40
	.word $0000

rlProcDialogueUnknown828A38Init ; 82/8A42

	.al
	.xl
	.autsiz
	.databank ?

	ldy wEventEngineOffset,b
	lda lEventEngineStartPointer+1,b
	sta lR22+1,b
	lda lEventEngineStartPointer,b
	sta lR22,b
	lda [lR22],y
	sta aProcSystem.aBody4,b,x
	inc y
	lda [lR22],y
	sta aProcSystem.aBody5,b,x

	inc y
	inc y
	lda [lR22],y
	and #$00FF
	cmp #$00FF
	bne +

	lda #$FFFF

	+
	sta aProcSystem.aBody2,b,x
	inc y
	lda [lR22],y
	and #$00FF
	sta aProcSystem.aBody3,b,x

	lda #$040A
	sta $7E45C3

	lda #$070B
	sta aProcSystem.aBody0,b,x
	jsl rlUnknown828C66

	lda #$0140
	tsb wDialogueEngineStatus,b

	lda #$0000
	sta @l wUnknown001836

	lda #(`aBGPaletteBuffer.aPalette0)<<8
	sta lR18+1
	lda #<>aBGPaletteBuffer.aPalette0
	sta lR18
	lda #(`$7E4BF8)<<8
	sta lR19+1
	lda #<>$7E4BF8
	sta lR19
	lda #size(aBGPaletteBuffer.aPalette0)
	sta lR20
	jsl rlBlockCopy

	lda #(`aBGPaletteBuffer.aPalette0)<<8
	sta lR18+1
	lda #<>aBGPaletteBuffer.aPalette0
	sta lR18
	lda #size(aBGPaletteBuffer.aPalette0)
	sta lR19
	lda $00 ; should be #$0000?
	jsl rlBlockFillWord
	rtl

aProcDialogueUnknown828A38Code ; 82/8AC8

	PROC_SET_ONCYCLE rlUnknown828B3F

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown828BA6

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown828BDC

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown828BF0

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown828C08

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_SET_ONCYCLE rlUnknown828C1C

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

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

	PROC_CALL $84A17D

	PROC_YIELD 1

	PROC_END

rlUnknown828B3F ; 82/8B3F

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x

	phx
	jsl $958233
	plx

	lda wDialogueEngineStatus,b
	bit #$0001
	bne +

	lda wDialogueEngineTotalPixelWidth,b
	lsr a
	lsr a
	lsr a
	clc
	adc #$0004
	sta wR0

	lda aProcSystem.aBody1,b,x
	and #$FF00
	ora wR0
	sta aProcSystem.aBody1,b,x

	lda wR0
	lsr a
	sta wR0

	lda #$0010
	sec
	sbc wR0
	sta wR0

	lda aProcSystem.aBody0,b,x
	and #$FF00
	ora wR0
	sec
	sbc #$0001
	sta aProcSystem.aBody0,b,x

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	jsl rlUnknown828C66

	lda #$2000
	sta wDialogueEngineTileBase,b

	lda #$0140
	tsb wDialogueEngineStatus,b

	lda #$01DF
	jsl rlFillBG3Tilemap

	+
	rtl

rlUnknown828BA6 ; 82/8BA6

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x

	phx
	jsl $958233
	plx

	lda wDialogueEngineStatus,b
	bit #$0001
	bne +

	phx
	lda #$0000
	sta wBufferBG3VOFS

	lda #$0000
	sta wBufferBG3HOFS

	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG3TilemapBuffer, $0800, VMAIN_Setting(True), $A000

	plx
	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown828BDC ; 82/8BDC

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	jsr rsUnknown828CCE
	bcc +

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown828BF0 ; 82/8BF0

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	lda aProcSystem.aBody3,b,x
	dec a
	sta aProcSystem.aBody3,b,x
	bne +

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown828C08 ; 82/8C08

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x
	jsr rsUnknown828CE2
	bcc +

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown828C1C ; 82/8C1C

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x

	lda bDMAArrayFlag,b
	and #$00FF
	bne +

	phx
	lda #$01DF
	jsl rlFillBG3Tilemap
	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG3TilemapBuffer, $0800, VMAIN_Setting(True), $A000

	lda #(`$7E4BF8)<<8
	sta lR18+1
	lda #<>$7E4BF8
	sta lR18
	lda #(`aBGPaletteBuffer.aPalette0)<<8
	sta lR19+1
	lda #<>aBGPaletteBuffer.aPalette0
	sta lR19
	lda #size(aBGPaletteBuffer.aPalette0)
	sta lR20
	jsl rlBlockCopy
	plx

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx

	+
	rtl

rlUnknown828C66 ; 82/8C66

	.al
	.xl
	.autsiz
	.databank ?

	phx
	jsl $95800B
	plx

	phx
	lda aProcSystem.aBody4,b,x
	sta lR18
	lda aProcSystem.aBody5,b,x
	sta lR18+1
	lda #$0000
	jsl $958157
	jsl $958127
	plx

	phx
	lda aProcSystem.aBody1,b,x
	sta $7E45C3
	lda aProcSystem.aBody0,b,x
	clc
	adc #$0101
	jsl $95812F
	tay
	lda #$5D00
	sta $7E45BF
	lda #$5000
	sta $7E45B8
	lda #$061C
	sta $7E45C3
	lda #$061C
	sta $7E45DC
	lda #$7E00
	sta $7E45BC+1
	tya
	clc
	adc #$0002
	adc #<>aBG3TilemapBuffer
	sta $7E45BC
	lda #$FFFF
	sta wUnknown0017ED,b
	plx
	rtl

rsUnknown828CCE ; 82/8CCE

	.al
	.xl
	.autsiz
	.databank ?

	phx
	lda #$0010
	sta wUnknown0017D7,b
	clc
	jsl $979B67

	.word <>$7E4BF8
	.word $0010, $0000

	plx
	rts

rsUnknown828CE2 ; 82/8CE2

	.al
	.xl
	.autsiz
	.databank ?

	phx
	lda #$0000
	sta wUnknown0017D9,b
	lda #$0008
	sta wUnknown0017D7,b
	clc
	jsl $979BD5

	.word <>aUnknown828CF8

	plx
	rts

aUnknown828CF8 ; 82/8CF8
	.word $0000, $0010, $FFFF
