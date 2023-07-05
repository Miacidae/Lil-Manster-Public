
aHDMAArrayEngineMainActionTable ; 82/A396

	.addr rlResetHDMAArrayEngine
	.addr rlHDMAArrayEngineMainLoop
	.addr rlHDMAArrayEngineStub

rlClearHDMAArray ; 82/A39C

	.al
	.xl
	.autsiz
	.databank ?

	; Clears the RAM used by the HDMA array

	; Inputs:
	; None

	; Outputs:
	; None

	phb
	php

	phk
	plb

	.databank `*

	ldx #size(aHDMASystem.aTypeOffset)-2

	-
	stz aHDMASystem.aTypeOffset,b,x
	dec x
	dec x
	bpl -

	plp
	plb
	rtl

rlResetHDMAArrayEngine ; 82/A3AD

	.al
	.xl
	.autsiz
	.databank ?

	php
	phb

	phk
	plb

	.databank `*

	ldx #size(aHDMASystem)-2
	lda #$0000

	-
	sta aHDMASystem,b,x
	dec x
	dec x
	bpl -

	ldx #7 * $10

	sep #$20

	lda #$00
	sta HDMAEN,b
	sta bHDMAPendingChannels,b

	-
	lda #$00
	sta DMA_IO[0].DMAP,b,x
	sta DMA_IO[0].DAS+2,b,x
	sta DMA_IO[0].A1,b,x
	sta DMA_IO[0].A1+1,b,x
	sta DMA_IO[0].A1+2,b,x

	lda #BG4HOFS - PPU_REG_BASE
	sta DMA_IO[0].BBAD,b,x

	txa
	sec
	sbc #$10
	bmi +

	tax
	bra -

	+
	plb
	plp
	rtl

rlHDMAArrayEngineCreateEntry ; 82/A3ED

	.al
	.xl
	.autsiz
	.databank ?

	php
	phb
	sep #$20
	lda lR44+2
	pha
	rep #$20
	plb

	.databank ?

	phx
	phy

	lda #$0000
	sta wR41

	ldy lR44
	ldx #$0000

	-
	lda aHDMASystem.aTypeOffset,b,x
	beq _AddEntry

	lda wR41
	clc
	adc #$0010
	sta wR41
	inc x
	inc x
	cpx #size(aHDMASystem.aTypeOffset)
	blt -

	ply
	plx
	plb
	plp
	sec
	rtl

	_AddEntry
	tya
	sta aHDMASystem.aTypeOffset,b,x
	lda lR44+1
	and #$FF00
	sta aHDMASystem.lPointer+1,b
	xba
	sta aHDMASystem.aTypeBank,b,x

	lda #$0001
	sta aHDMASystem.aSleepTimer,b,x

	lda #$0000
	sta aHDMASystem.aBitfield,b,x
	sta aHDMASystem.aTimer,b,x

	lda structHDMADirectEntryInfo.Init,b,y
	sta aHDMASystem.lPointer,b

	lda structHDMADirectEntryInfo.OnCycle,b,y
	sta aHDMASystem.aOnCycle,b,x

	lda structHDMADirectEntryInfo.Code,b,y
	sta aHDMASystem.aCodeOffset,b,x

	lda structHDMADirectEntryInfo.TableOffset,b,y
	sta aHDMASystem.aOffset,b,x

	lda structHDMADirectEntryInfo.TableBankAndBBADx,b,y
	sta aHDMASystem.aBankAndBBADx[0],b,x

	lda structHDMADirectEntryInfo.DMAPx,b,y
	sta aHDMASystem.aDMAPxAndIndirectBank[0],b,x

	stx aHDMASystem.wOffset,b
	jsl +

	ply
	plx
	plb
	plp
	clc
	rtl

	+
	jmp [aHDMASystem.lPointer]

rlHDMAArrayEngineCreateEntryByIndex ; 82/A470

	.al
	.xl
	.autsiz
	.databank ?

	php
	phb

	sep #$20
	lda lR44+2
	pha
	rep #$20
	plb

	.databank ?

	phx
	phy
	ldy lR44
	lda wR40
	asl a
	tax
	asl a
	asl a
	asl a
	sta wR41
	lda aHDMASystem.aTypeOffset,b,x
	bne +

	jmp rlHDMAArrayEngineCreateEntry._AddEntry

	+
	ply
	plx
	plb
	plp
	sec
	rtl

rlHDMAArrayEngineFreeEntryByIndex ; 82/A495

	.al
	.xl
	.autsiz
	.databank ?

	phx
	asl a
	tax
	jsl rlHDMAArrayEngineFreeEntryByOffset
	plx
	rtl

rlHDMAArrayEngineMainLoop ; 82/A49E

	.al
	.xl
	.autsiz
	.databank ?

	php
	phb

	phk
	plb

	.databank `*

	sep #$20
	stz aHDMASystem.bPendingChannels,b
	rep #$20
	ldx #$0000

	-
	stx aHDMASystem.wOffset,b
	lda aHDMASystem.aTypeOffset,b,x
	beq +

	jsr rsHDMAArrayEngineRunOnCycleAndCode

	+
	ldx aHDMASystem.wOffset,b
	inc x
	inc x
	cpx #size(aHDMASystem.aTypeOffset)
	blt -

	sep #$20
	lda aHDMASystem.bPendingChannels,b
	sta bHDMAPendingChannels,b
	stz aHDMASystem.bPendingChannels,b
	rep #$20
	plb
	plp
	rtl

rsHDMAArrayEngineRunOnCycleAndCode ; 82/A4D1

	.al
	.xl
	.autsiz
	.databank ?

	lda aHDMAChannelTable,x
	ora aHDMASystem.bPendingChannels,b
	sta aHDMASystem.bPendingChannels,b
	lda aHDMASystem.aBitfield,b,x
	bit #$1000
	bne _End

	sep #$20
	lda aHDMASystem.aTypeBank,b,x
	pha
	rep #$20
	plb

	.databank ?

	jsl rlHDMAArrayEngineRunOnCycle
	ldx aHDMASystem.wOffset,b
	dec aHDMASystem.aSleepTimer,b,x
	bne _End

	ldy aHDMASystem.aCodeOffset,b,x

	_Loop
	lda $0000,b,y
	bpl +

	sta aHDMASystem.lPointer,b
	inc y
	inc y
	pea <>_Loop-1
	jmp (aHDMASystem.lPointer)

	+
	sta aHDMASystem.aSleepTimer,b,x
	lda $0002,b,y
	sta aHDMASystem.aOffset,b,x
	tya
	clc
	adc #$0004
	sta aHDMASystem.aCodeOffset,b,x

	_End
	rts

rlHDMAArrayEngineRunOnCycle ; 82/A51D

	.al
	.xl
	.autsiz
	.databank ?

	lda aHDMASystem.aTypeBank,b,x
	xba
	sta aHDMASystem.lPointer+1,b
	lda aHDMASystem.aOnCycle,b,x
	sta aHDMASystem.lPointer,b
	jmp [aHDMASystem.lPointer]

aHDMAChannelTable ; 82/A52D

	.for i in range(8)

		.word 1 << i

	.next

rlHDMAArrayEngineStub ; 82/A53D

	.al
	.xl
	.autsiz
	.databank ?

	rtl

rlHDMAArrayEngineProcessHDMAArray ; 82/A53E

	.al
	.xl
	.autsiz
	.databank ?

	php
	lda wR0
	pha
	sep #$30
	lda bBufferHDMAEN
	sta wR0
	ldx #size(aHDMASystem.aTypeOffset)-2
	ldy #7 * $10

	-
	asl wR0
	bcc +

	lda aHDMASystem.aOffset,b,x
	sta DMA_IO[0].A1,b,y
	lda aHDMASystem.aOffset+1,b,x
	sta DMA_IO[0].A1+1,b,y
	lda aHDMASystem.aBankAndBBADx[0].bBank,b,x
	sta DMA_IO[0].A1+2,b,y
	lda aHDMASystem.aBankAndBBADx[0].bBBADx,b,x
	sta DMA_IO[0].BBAD,b,y
	lda aHDMASystem.aDMAPxAndIndirectBank[0].bDMAPx,b,x
	sta DMA_IO[0].DMAP,b,y
	lda aHDMASystem.aDMAPxAndIndirectBank[0].bIndirectBank,b,x
	sta DMA_IO[0].DAS+2,b,y

	+
	tya
	sec
	sbc #$10
	tay
	dec x
	dec x
	bpl -

	pla
	sta wR0
	plp
	rtl

rlHDMAArrayEngineFreeEntryByOffset ; 82/A582

	.al
	.xl
	.autsiz
	.databank ?

	stz aHDMASystem.aTypeOffset,b,x
	rtl

rlHDMAArrayEngineFindEntry ; 82/A586

	.al
	.xl
	.autsiz
	.databank ?

	php
	ldx #size(aHDMASystem.aTypeOffset)-2

	-
	rep #$20

	lda aHDMASystem.aTypeOffset,b,x
	cmp lR44
	bne +

	sep #$20
	lda aHDMASystem.aTypeBank,b,x
	cmp lR44+2
	rep #$20
	beq ++

	+
	dec x
	dec x
	bpl -

	plp
	clc
	rtl

	+
	plp
	sec
	rtl
