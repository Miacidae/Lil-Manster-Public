
proclm .dstruct structProcInfo, "lm", rlProclmInit, rlProclmOnCycle, None ; 94/CCDF

rlProclmInit ; 94/CCE7

	.al
	.autsiz
	.databank ?

	lda aProcSystem.wInput1,b
	sta aProcSystem.aBody0,b,x
	cmp #$0000
	beq +

	lda wDialogueEngineStatus,b
	ora #$0200
	sta wDialogueEngineStatus,b

	lda #-1
	sta wUnknown0017ED,b

	lda #-1
	sta wUnknown0017EF,b

	lda aProcSystem.wInput0,b
	sta wUnknown0017F7,b

	rtl

	+
	lda wDialogueEngineStatus,b
	eor aProcSystem.wInput2,b
	sta wDialogueEngineStatus,b

	lda aProcSystem.wInput0,b
	beq +

	sta wUnknown0017ED,b

	+
	phx
	phy

	lda #(`$94EA21)<<8
	sta lR44+1
	lda #<>$94EA21
	sta lR44
	jsl rlProcEngineFindProc

	ply
	plx
	lda #0
	bcs +

	lda #1

	+
	sta wUnknown001800
	rtl

rlProclmOnCycle ; 94/CD3E

	.autsiz
	.databank ?

	lda aProcSystem.aBody0,b,x
	asl a
	tax
	jsr (_aUnknown94CD47,x)
	rtl

	_aUnknown94CD47 ; 94/CD47
		.addr rsUnknown94CD92
		.addr rsUnknown94CD4D
		.addr rsUnknown94CD78

rsUnknown94CD4D ; 94/CD4D

	.autsiz
	.databank ?

	lda wBGUpdateFlags
	ora bDMAArrayFlag,b
	bne _End

	jsl $9583FD
	bcs _End

	ldx aProcSystem.wOffset,b
	stz aProcSystem.aHeaderSleepTimer,b,x

	jsl rlProcEngineFreeProc
	jsl rlEnableBG3Sync

	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG3TilemapBuffer+$700, $0100, VMAIN_Setting(True), $A700

	_End
	rts

rsUnknown94CD78 ; 94/CD78

	.autsiz
	.databank ?

	lda wBGUpdateFlags
	ora bDMAArrayFlag,b
	bne _End

	jsl $9583FD
	bcs _End

	ldx aProcSystem.wOffset,b
	stz aProcSystem.aHeaderSleepTimer,b,x

	jsl rlProcEngineFreeProc

	_End
	rts

rsUnknown94CD92 ; 94/CD92

	.autsiz
	.databank ?

	lda wBGUpdateFlags
	ora bDMAArrayFlag,b
	bne _End

	jsl $958233

	lda wDialogueEngineStatus,b
	bne _End

	ldx aProcSystem.wOffset,b
	stz aProcSystem.aHeaderSleepTimer,b,x

	jsl rlProcEngineFreeProc

	_End

	jsl rlDMAByStruct

	.dstruct structDMAToVRAM, aBG3TilemapBuffer+$700, $0100, VMAIN_Setting(True), $A700

	jsl rlEnableBG3Sync
	rts

