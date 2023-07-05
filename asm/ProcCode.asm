
rsProcCodeEnd ; 82/9DB7

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderTypeOffset,b,x

	lda aProcSystem.aHeaderBitfield,b,x
	ora #$2000
	sta aProcSystem.aHeaderBitfield,b,x

	pla
	rts

rsProcCodeHaltSleep ; 82/9DC5

	.al
	.xl
	.autsiz
	.databank ?

	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x

rsProcCodeHalt ; 82/9DCB

	.al
	.xl
	.autsiz

	dec y
	dec y
	tya
	sta aProcSystem.aHeaderCodeOffset,b,x
	pla
	rts

rsProcCodeCallRoutine ; 82/9DD3

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta aProcSystem.lPointer,b
	lda $0001,b,y
	sta aProcSystem.lPointer+1,b

	phy
	phx
	jsl +

	plx
	ply
	inc y
	inc y
	inc y
	rts

	+
	jmp [aProcSystem.lPointer]

rsProcCodeCallRoutineWithArgs ; 82/9DEE

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta aProcSystem.lPointer,b
	lda $0001,b,y
	sta aProcSystem.lPointer+1,b

	lda $0003,b,y
	and #$00FF
	pha
	inc y
	inc y
	inc y
	inc y
	phy
	phx
	jsl +

	plx
	ply
	pla
	sta wR0
	tya
	clc
	adc wR0
	tay
	rts

	+
	jmp [aProcSystem.lPointer]

rsProcCodeSetOnCycle ; 82/9E19

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta aProcSystem.aHeaderOnCycle,b,x

	lda aProcSystem.aHeaderBitfield,b,x
	ora #$0800
	sta aProcSystem.aHeaderBitfield,b,x
	inc y
	inc y
	rts

rsProcCodeJump ; 82/9E2B

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	tay
	rts

rsProcCodeSetUnknownTimer ; 82/9E30

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta aProcSystem.aHeaderUnknownTimer,b,x
	inc y
	inc y
	rts

rsProcCodeJumpWhileUnknownTimer ; 82/9E39

	.al
	.xl
	.autsiz
	.databank ?

	dec aProcSystem.aHeaderUnknownTimer,b,x
	bne rsProcCodeJump

	inc y
	inc y
	rts

rsProcCodeJumpIfBitUnset ; 82/9E41

	.al
	.xl
	.autsiz
	.databank ?

	lda $0002,b,y
	bit aProcSystem.aHeaderBitfield,b,x
	beq rsProcCodeJump

	inc y
	inc y
	inc y
	inc y
	rts

rsProcCodeJumpIfBitSet ; 82/9E4E

	.al
	.xl
	.autsiz
	.databank ?

	lda $0002,b,y
	bit aProcSystem.aHeaderBitfield,b,x
	bne rsProcCodeJump

	inc y
	inc y
	inc y
	inc y
	rts

rsProcCodeUnknown829E5B ; 82/9E5B

	.al
	.xl
	.autsiz
	.databank ?

	; save code execution offset

	phy

	; write pointer to lR44

	lda $0000,b,y
	sta lR44
	lda $0001,b,y
	sta lR44+1

	lda $0003,b,y ; arg1
	pha
	lda $0005,b,y ; arg2
	pha

	; set execution offset to arg2

	ply

	; set proc index to arg1

	plx

	; refetch execution offset

	pla
	clc
	adc #$0007 ; add arg size

	; this clobbers what we did with arg2

	tay
	rts

rsProcCodeJumpIfRoutineTrue ; 82/9E77

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta aProcSystem.lPointer,b
	lda $0001,b,y
	sta aProcSystem.lPointer+1,b
	phy
	phx
	jsl ++

	plx
	ply
	bcc +

	lda $0003,b,y
	tay
	rts

	+
	inc y
	inc y
	inc y
	inc y
	inc y
	rts

	+
	jmp [aProcSystem.lPointer]

rsProcCodeJumpIfRoutineFalse ; 82/9E9B

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta aProcSystem.lPointer,b
	lda $0001,b,y
	sta aProcSystem.lPointer+1,b
	phy
	phx
	jsl ++

	plx
	ply
	bcs +

	lda $0003,b,y
	tay
	rts

	+
	inc y
	inc y
	inc y
	inc y
	inc y
	rts

	+
	jmp [aProcSystem.lPointer]

rsProcCodeCreateProc ; 82/9EBF

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta lR44
	lda $0001,b,y
	sta lR44+1
	phy
	phx
	jsl rlProcEngineCreateProc
	plx
	ply
	inc y
	inc y
	inc y
	rts

rsProcCodeDeleteProc ; 82/9ED5

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta lR44
	lda $0001,b,y
	sta lR44+1
	phx
	phy
	jsl rlProcEngineFindProc
	bcc +

	jsl rlProcEngineFreeProc

	+
	ply
	plx
	inc y
	inc y
	inc y
	rts

rsProcCodeDeleteHDMAArrayEntry ; 82/9EF1

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta lR44
	lda $0001,b,y
	sta lR44+1
	phx
	phy
	jsl rlHDMAArrayEngineFindEntry
	bcc +

	jsl rlHDMAArrayEngineFreeEntryByOffset

	+
	ply
	plx
	inc y
	inc y
	inc y
	rts

rsProcCodeHaltWhile ; 82/9F0D

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta lR44
	lda $0001,b,y
	sta lR44+1
	phx
	phy
	jsl rlProcEngineFindProc
	ply
	plx
	bcs +

	inc y
	inc y
	inc y
	rts

	+
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	dey
	dey
	tya
	sta aProcSystem.aHeaderCodeOffset,b,x
	pla
	rts

rsProcCodeCreateHDMAArrayEntry ; 82/9F33

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta lR44
	lda $0001,b,y
	sta lR44+1
	phy
	phx
	jsl rlHDMAArrayEngineCreateEntry
	plx
	ply
	inc y
	inc y
	inc y
	rts

rsProcCodeHaltWhileActiveSprite ; 82/9F49

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta lR44
	lda $0001,b,y
	sta lR44+1
	phx
	phy
	jsl rlActiveSpriteEngineFindEntry
	ply
	plx
	bcs +

	inc y
	inc y
	inc y
	rts

	+
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	dey
	dey
	tya
	sta aProcSystem.aHeaderCodeOffset,b,x
	pla
	rts

rsProcCodeUnknown829F6F ; 82/9F6F

	.al
	.xl
	.autsiz
	.databank ?

	phy
	phx
	lda $0000,b,y
	jsl rlUnknown808C87
	plx
	ply
	inc y
	inc y
	rts

rsProcCodeUnknown829F7D ; 82/9F7D

	.al
	.xl
	.autsiz
	.databank ?

	phy
	phx
	lda $0000,b,y
	jsl rlUnknown808CDD
	plx
	ply
	inc y
	inc y
	rts

rsProcCodeUnknown829F8B ; 82/9F8B

	.al
	.xl
	.autsiz
	.databank ?

	phy
	phx

	lda $0000,b,y
	sta wR0

	lda $0002,b,y
	sta lR18
	lda $0003,b,y
	sta lR18+1

	ldy #$0000
	lda [lR18],y
	sta wR1
	jsl $8E85E7

	plx
	ply

	inc y
	inc y
	inc y
	inc y
	inc y
	rts

rsProcCodeUnknown829FAF ; 82/9FAF

	.al
	.xl
	.autsiz
	.databank ?

	phy
	phx

	lda $0000,b,y
	sta wR0

	lda $0002,b,y
	sta lR18
	lda $0003,b,y
	sta lR18+1

	ldy #$0000
	lda [lR18],y
	sta wR1
	jsl $8E8601

	plx
	ply

	inc y
	inc y
	inc y
	inc y
	inc y
	rts

rsProcCodeUnknown829FD3 ; 82/9FD3

	.al
	.xl
	.autsiz
	.databank ?

	phy
	phx
	lda $0002,b,y
	sta lR18
	lda $0003,b,y
	sta lR18+1

	phy

	phk
	pea <>(+)-1
	jmp [lR18]

	+
	ply

	sta wR1
	lda $0000,b,y
	sta wR0
	jsl $8E85E7

	plx
	ply

	inc y
	inc y
	inc y
	inc y
	inc y
	rts

rsProcCodeUnknown829FFB ; 82/9FFB

	.al
	.xl
	.autsiz
	.databank ?

	phy
	phx
	lda $0002,b,y
	sta lR18
	lda $0003,b,y
	sta lR18+1

	phy

	phk
	pea <>(+)-1
	jmp [lR18]

	+
	ply

	sta wR1
	lda $0000,b,y
	sta wR0
	jsl $8E8601

	plx
	ply

	inc y
	inc y
	inc y
	inc y
	inc y
	rts

rsProcCodeUnknown82A023 ; 82/A023

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta aSoundSystem.aUnknown0004BA,b
	inc y
	inc y
	rts

rsProcCodeUnknown82A02C ; 82/A02C

	.al
	.xl
	.autsiz
	.databank ?

	lda aSoundSystem.aUnknown0004BA,b
	bne +

	rts

	+
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	dec y
	dec y
	tya
	sta aProcSystem.aHeaderCodeOffset,b,x
	pla
	rts

rsProcCodeUnknown82A040 ; 82/A040

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	jsl $9A833C
	inc y
	inc y
	rts

rsProcCodeHaltWhileDecompressing ; 82/A04A

	.al
	.xl
	.autsiz
	.databank ?

	lda bDecompressionArrayFlag,b
	bne +

	rts

	+
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	dec y
	dec y
	tya
	sta aProcSystem.aHeaderCodeOffset,b,x
	pla
	rts

rsProcCodeBranchAndLink ; 82/A05E

	.al
	.xl
	.autsiz
	.databank ?

	tya
	clc
	adc #$0002
	sta aProcSystem.aHeaderName,b,x
	lda $0000,b,y
	tay
	rts

rsProcCodeReturn ; 82/A06B

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.aHeaderName,b,x
	tay
	rts

rsProcCodeHaltUntilButtonNew ; 82/A070

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	bit wJoy1New
	beq +

	inc y
	inc y
	rts

	+
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	dec y
	dec y
	tya
	sta aProcSystem.aHeaderCodeOffset,b,x
	pla
	rts

rsProcCodeUnknown82A088 ; 82/A088

	.al
	.xl
	.autsiz
	.databank ?

	lda $0002,b,y
	sta aProcSystem.aHeaderUnknownTimer,b,x
	tya
	sta aProcSystem.aHeaderCodeOffset,b,x
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	pla
	rts

rsProcCodeHaltUntilButtonNewAndTime ; 82/A09A

	.al
	.xl
	.autsiz
	.databank ?

	lda $0002,b,y
	bit wJoy1New
	bne +

	dec aProcSystem.aHeaderUnknownTimer,b,x
	beq +

	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	dec y
	dec y
	tya
	sta aProcSystem.aHeaderCodeOffset,b,x
	pla
	rts

	+
	inc y
	inc y
	inc y
	inc y
	rts

rsProcCodeJumpIfButton ; 82/A0B9

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	bit wJoy1Input
	beq +

	lda $0002,b,y
	tay
	rts

	+
	inc y
	inc y
	inc y
	inc y
	rts

rsProcCodeDecompress ; 82/A0CA

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta lR18
	lda $0001,b,y
	sta lR18+1

	lda $0003,b,y
	sta lR19
	lda $0004,b,y
	sta lR19+1

	phx
	phy
	jsl rlAppendDecompList

	ply
	plx

	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	rts

rsProcCodeDMA ; 82/A0CA

	.al
	.xl
	.autsiz
	.databank ?

	lda $0000,b,y
	sta lR18
	lda $0001,b,y
	sta lR18+1
	lda $0003,b,y
	sta wR0
	lda $0005,b,y
	sta wR1

	phx
	phy
	jsl rlDMAByPointer

	ply
	plx

	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	rts
