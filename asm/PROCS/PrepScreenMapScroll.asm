
procPrepScreenMapScroll .dstruct structProcInfo, None, rlProcPrepScreenMapScrollInit, rlProcPrepScreenMapScrollOnCycle, None ; 81/C213

rlProcPrepScreenMapScrollInit ; 81/C21B

	.al
	.xl
	.autsiz
	.databank ?

	lda #$FFFF
	sta wMapBattleFlag

	stz wMapScrollXPixels,b
	stz wMapScrollYPixels,b

	phx
	jsl rlUpdateUnitMapsAndFog
	plx
	lda #30
	sta aProcSystem.aBody0,b,x
	lda #$0000
	sta aProcSystem.aBody1,b,x
	lda @l wDefaultVisibilityFill
	bne +

	lda #<>rlProcPrepScreenMapScrollOnCycle5._End
	sta aProcSystem.aHeaderOnCycle,b,x

	+
	rtl

rlProcPrepScreenMapScrollOnCycle ; 81/C247

	.al
	.xl
	.autsiz
	.databank ?

	dec aProcSystem.aBody0,b,x
	bne +

	lda #<>rlProcPrepScreenMapScrollOnCycle2
	sta aProcSystem.aHeaderOnCycle,b,x

	+
	rtl

rlProcPrepScreenMapScrollOnCycle2 ; 81/C253

	.al
	.xl
	.autsiz
	.databank ?

	; Scroll right

	lda wMapScrollXPixels,b
	cmp wMapWidthPixels,b
	beq +

	inc a
	inc a
	sta wMapScrollXPixels,b
	jsr rsPrepScreenMapScrollCheckJoypad
	rtl

	+
	lda #<>rlProcPrepScreenMapScrollOnCycle3
	sta aProcSystem.aHeaderOnCycle,b,x
	rtl

rlProcPrepScreenMapScrollOnCycle3 ; 81/C26B

	.al
	.xl
	.autsiz
	.databank ?

	; Scroll down

	lda wMapScrollYPixels,b
	cmp wMapHeightPixels,b
	beq +

	inc a
	inc a
	sta wMapScrollYPixels,b
	jsr rsPrepScreenMapScrollCheckJoypad
	rtl

	+
	lda #<>rlProcPrepScreenMapScrollOnCycle4
	sta aProcSystem.aHeaderOnCycle,b,x
	rtl

rlProcPrepScreenMapScrollOnCycle4 ; 81/C283

	.al
	.xl
	.autsiz
	.databank ?

	; Scroll left

	lda wMapScrollXPixels,b
	beq +

	dec a
	dec a
	sta wMapScrollXPixels,b
	jsr rsPrepScreenMapScrollCheckJoypad
	rtl

	+
	lda #<>rlProcPrepScreenMapScrollOnCycle5
	sta aProcSystem.aHeaderOnCycle,b,x
	rtl

rlProcPrepScreenMapScrollOnCycle5 ; 81/C298

	.al
	.xl
	.autsiz
	.databank ?

	; Scroll up

	lda wMapScrollYPixels,b
	beq _End

	dec a
	dec a
	sta wMapScrollYPixels,b
	jsr rsPrepScreenMapScrollCheckJoypad
	rtl

	_End

	; Wrap up

	lda #$0000
	sta wMapBattleFlag

	jsl rlProcEngineFreeProc

	lda wMapScrollXPixels,b
	lsr A
	lsr A
	lsr A
	lsr A
	clc 
	adc #$0007
	sta wR0
	lda wMapScrollYPixels,b
	lsr A
	lsr A
	lsr A
	lsr A
	clc
	adc #$0006
	sta wR1
	jsl $83C181
	rtl

rsPrepScreenMapScrollCheckJoypad ; 81/C2D0

	.al
	.xl
	.autsiz
	.databank ?

	lda wJoy1New
	bit #~(JOY_ID | JOY_Right | JOY_Left | JOY_Down | JOY_Up)
	beq +

	lda #$0001
	sta aProcSystem.aBody1,b,x

	+
	lda aProcSystem.aBody1,b,x
	beq +

	lda wMapScrollXPixels,b
	ora wMapScrollYPixels,b
	and #$000F
	bne +

	lda #<>rlProcPrepScreenMapScrollOnCycle5._End
	sta aProcSystem.aHeaderOnCycle,b,x

	+
	rts
