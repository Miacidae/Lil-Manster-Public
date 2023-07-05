
procMapSwitch .dstruct structProcInfo, "ms", rlProcMapSwitchInit, None, aProcMapSwitchCode ; 82/861C

rlProcMapSwitchInit ; 82/8624

	.al
	.xl
	.autsiz
	.databank ?

	rtl

aProcMapSwitchCode ; 82/8625

	PROC_YIELD 1

	PROC_SET_ONCYCLE rlProcMapSwitchMain

	PROC_YIELD 1

	PROC_SET_ONCYCLE None

	PROC_END

rlProcMapSwitchMain ; 82/8633

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderSleepTimer,b,x

	; Fade out

	lda bBufferINIDISP
	dec a
	sta bBufferINIDISP
	bne +

	; Clear tilemap

	phx
	ldx aProcSystem.wOffset,b
	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x
	plx
	phx
	lda #(`aBG3TilemapBuffer)<<8
	sta lR18+1
	lda #<>aBG3TilemapBuffer
	sta lR18
	lda #$0800
	sta lR19
	lda #$0000
	jsl rlBlockFillWord

	; Switch chapters

	jsl rlUnknownChapterEnd8CAC00
	plx

	+
	rtl
