
rlDMAPaletteAndOAMBuffer ; 80/807C

	.autsiz
	.databank ?

	; Copies the palette and sprite buffers
	; to CGRAM and OAM.

	; You shouldn't call this yourself.

	; Inputs:
	; Sprite buffer and palette buffer

	; Outputs:
	; None

	php
	sep #$10
	rep #$20

	lda #((OAMDATA - PPU_REG_BASE) << 8) | DMAP_DMA_Setting(DMAP_CPUToIO, DMAP_Mode0, DMAP_Increment)
	sta DMA_IO[0].DMAP,b
	lda #<>aSpriteBuffer
	sta DMA_IO[0].A1,b
	ldx #`aSpriteBuffer
	stx DMA_IO[0].A1+2,b
	lda #size(aSpriteBuffer) + size(aSpriteExtBuffer)
	sta DMA_IO[0].DAS,b
	stz OAMADD,b

	lda #((CGDATA - PPU_REG_BASE) << 8) | DMAP_DMA_Setting(DMAP_CPUToIO, DMAP_Mode0, DMAP_Increment)
	sta DMA_IO[1].DMAP,b
	lda #<>aBGPaletteBuffer
	sta DMA_IO[1].A1,b
	ldx #`aBGPaletteBuffer
	stx DMA_IO[1].A1+2,b
	lda #size(aBGPaletteBuffer)+size(aOAMPaletteBuffer)
	sta DMA_IO[1].DAS,b
	ldx #$00 ; color index 0
	stx CGADD,b

	ldx #MDMAEN_Setting([0,1])
	stx MDMAEN,b
	lda wBufferOAMADD
	sta OAMADD,b
	plp
	rtl

rlCopyPPURegBuffer ; 80/80C3

	.autsiz
	.databank ?

	; Copies the PPU register buffer
	; to the actual registers.

	; You shouldn't call this yourself.

	; Inputs:
	; PPU register buffer

	; Outputs:
	; None

	php
	phb
	phk
	plb

	.databank `*

	sep #$20

	lda bBufferINIDISP
	sta INIDISP,b

	lda bBufferOBSEL
	sta OBSEL,b

	lda bBufferBGMODE
	sta BGMODE,b

	lda bBufferMOSAIC
	sta MOSAIC,b

	lda bBufferBG1SC
	sta BG1SC,b

	lda bBufferBG2SC
	sta BG2SC,b

	lda bBufferBG3SC
	sta BG3SC,b

	lda bBufferBG4SC
	sta BG4SC,b

	lda bBufferBG12NBA
	sta BG12NBA,b

	lda bBufferBG34NBA
	sta BG34NBA,b

	lda bBufferW12SEL
	sta W12SEL,b

	lda bBufferW34SEL
	sta W34SEL,b

	lda bBufferWOBJSEL
	sta WOBJSEL,b

	lda bBufferWH0
	sta WH0,b

	lda bBufferWH1
	sta WH1,b

	lda bBufferWH2
	sta WH2,b

	lda bBufferWH3
	sta WH3,b

	lda bBufferWBGLOG
	sta WBGLOG,b

	lda bBufferWOBJLOG
	sta WOBJLOG,b

	lda bBufferTM
	sta TM,b

	lda bBufferTMW
	sta TMW,b

	lda bBufferTS
	sta TS,b

	lda bBufferTSW
	sta TSW,b

	lda bBufferCGWSEL
	sta CGWSEL,b

	lda bBufferCGADSUB
	sta CGADSUB,b

	lda bBufferCOLDATA_1
	sta COLDATA,b

	lda bBufferCOLDATA_2
	sta COLDATA,b

	lda bBufferCOLDATA_3
	sta COLDATA,b

	lda bBufferSETINI
	sta SETINI,b

	lda wBufferBG1HOFS
	sta BG1HOFS,b
	lda wBufferBG1HOFS+1
	sta BG1HOFS,b

	lda wBufferBG1VOFS
	sec
	sbc #$01
	sta BG1VOFS,b
	lda wBufferBG1VOFS+1
	sbc #$00
	sta BG1VOFS,b
	lda wBufferBG2HOFS
	sta BG2HOFS,b
	lda wBufferBG2HOFS+1
	sta BG2HOFS,b
	lda wBufferBG2VOFS
	sec
	sbc #$01
	sta BG2VOFS,b
	lda wBufferBG2VOFS+1
	sbc #$00
	sta BG2VOFS,b
	lda wBufferBG3HOFS
	sta BG3HOFS,b
	lda wBufferBG3HOFS+1
	sta BG3HOFS,b
	lda wBufferBG3VOFS
	sec
	sbc #$01
	sta BG3VOFS,b
	lda wBufferBG3VOFS+1
	sbc #$00
	sta BG3VOFS,b

	plb
	plp
	rtl

rlCopyINIDISPBuffer ; 80/81A8

	.autsiz
	.databank ?

	; Copies INIDISP from buffer to register

	; Inputs:
	; bBufferINIDISP

	; Outputs:
	; None

	php
	phb

	phk
	plb

	.databank `*

	sep #$20

	lda bBufferINIDISP
	sta INIDISP,b

	plb
	plp
	rtl
