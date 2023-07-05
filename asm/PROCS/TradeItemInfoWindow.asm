
procTradeItemInfoWindow .dstruct structProcInfo, None, rlProcTradeItemInfoWindowInit, rlProcTradeItemInfoWindowOnCycle, None ; 81/FD0D

rlProcTradeItemInfoWindowInit ; 81/FD15

	.al
	.xl
	.autsiz
	.databank ?

	rtl

rlProcTradeItemInfoWindowOnCycle ; 81/FD16

	.al
	.xl
	.autsiz
	.databank ?

	lda wInfoWindowTarget
	beq +

	jmp ++

	+
	rtl

	+
	php
	phb
	sep #$20
	lda #`wInfoWindowTarget
	pha
	rep #$20
	plb

	.databank `wInfoWindowTarget

	lda #<>rlProcTradeItemInfoWindowOnCycle2
	sta aProcSystem.aHeaderOnCycle,b,x

	; Check which side to draw window on

	lda $7EAD4A
	sta aProcSystem.aBody0,b,x
	beq +

	jmp _Left

	+

	; Else right

	; Save existing tilemap sections

	lda #>`aBG3TilemapBuffer
	sta lR18+1
	lda #<>aBG3TilemapBuffer + ((18 + (6 * $20)) * 2)
	sta lR18
	lda #<>$7F9214
	sta lR19
	lda #>`$7F9214
	sta lR19+1
	lda #12
	sta wR0
	lda #22
	sta wR1
	jsl rlCopyWindowTilemapRect

	lda #>`aBG2TilemapBuffer
	sta lR18+1
	lda #<>aBG2TilemapBuffer + ((18 + (6 * $20)) * 2)
	sta lR18
	lda #<>$7F8C14
	sta lR19
	lda #>`$7F8C14
	sta lR19+1
	lda #12
	sta wR0
	lda #22
	sta wR1
	jsl rlCopyWindowTilemapRect

	; Clear tilemap space for text layer

	lda #<>aCopyTradeItemInfoWindowTextLayerWindowInfo
	sta aCurrentTilemapInfo.lInfoPointer,b
	lda #>`aCopyTradeItemInfoWindowTextLayerWindowInfo
	sta aCurrentTilemapInfo.lInfoPointer+1,b
	lda #$01DF
	sta aCurrentTilemapInfo.wFillTile,b
	jsl $87D69D

	; Draw window border

	lda #<>$85801A
	sta lR18
	lda #>`$85801A
	sta lR18+1
	lda #$0800
	sta aCurrentTilemapInfo.wBaseTile,b
	jsl $87D7FD

	; Copy border to tilemap

	ldx #((18 + (6 * $20)) * 2)
	jsl $87D4DD

	; Draw window background

	lda #<>aCopyTradeItemInfoWindowBackgroundLayerWindowInfo
	sta aCurrentTilemapInfo.lInfoPointer,b
	lda #>`aCopyTradeItemInfoWindowBackgroundLayerWindowInfo
	sta aCurrentTilemapInfo.lInfoPointer+1,b
	lda #<>$85970F
	sta lR18
	lda #>`$85970F
	sta lR18+1
	lda #$3C00
	sta aCurrentTilemapInfo.wBaseTile,b
	jsl $87D6FC

	; Copy background to tilemap

	ldx #((18 + (6 * $20)) * 2)
	jsl $87D4DD
	jmp +

	_Left
	lda #>`aBG3TilemapBuffer
	sta lR18+1
	lda #<>aBG3TilemapBuffer + ((2 + (6 * $20)) * 2)
	sta lR18
	lda #<>$7F9214
	sta lR19
	lda #>`$7F9214
	sta lR19+1
	lda #12
	sta wR0
	lda #22
	sta wR1
	jsl rlCopyWindowTilemapRect

	lda #>`aBG2TilemapBuffer
	sta lR18+1
	lda #<>aBG2TilemapBuffer + ((2 + (6 * $20)) * 2)
	sta lR18
	lda #<>$7F8C14
	sta lR19
	lda #>`$7F8C14
	sta lR19+1
	lda #12
	sta wR0
	lda #22
	sta wR1
	jsl rlCopyWindowTilemapRect

	lda #<>aCopyTradeItemInfoWindowTextLayerWindowInfo
	sta aCurrentTilemapInfo.lInfoPointer,b
	lda #>`aCopyTradeItemInfoWindowTextLayerWindowInfo
	sta aCurrentTilemapInfo.lInfoPointer+1,b
	lda #$01DF
	sta aCurrentTilemapInfo.wFillTile,b
	jsl $87D69D

	lda #<>$85801A
	sta lR18
	lda #>`$85801A
	sta lR18+1
	lda #$0800
	sta aCurrentTilemapInfo.wBaseTile,b
	jsl $87D7FD

	ldx #((2 + (6 * $20)) * 2)
	jsl $87D4DD

	lda #<>aCopyTradeItemInfoWindowBackgroundLayerWindowInfo
	sta aCurrentTilemapInfo.lInfoPointer,b
	lda #>`aCopyTradeItemInfoWindowBackgroundLayerWindowInfo
	sta aCurrentTilemapInfo.lInfoPointer+1,b
	lda #<>$85970F
	sta lR18
	lda #>`$85970F
	sta lR18+1
	lda #$3C00
	sta aCurrentTilemapInfo.wBaseTile,b
	jsl $87D6FC

	ldx #((2 + (6 * $20)) * 2)
	jsl $87D4DD

	+
	lda #(`procItemInfo)<<8
	sta lR44+1
	lda #<>procItemInfo
	sta lR44
	jsl rlProcEngineFindProc

	lda #<>rlProcTradeItemInfoWindowOnCycle2._FEDC
	sta aProcSystem.aBody0,b,x
	jsl rlProcItemInfoOnCycle

	jsl rlEnableBG2Sync
	jsl rlEnableBG3Sync

	lda #$000D
	jsl rlUnknown808C87
	plb
	plp
	rtl

rlProcTradeItemInfoWindowOnCycle2 ; 81/FEA0

	.al
	.xl
	.autsiz
	.databank ?

	; Check if we need to kill window

	lda wInfoWindowTarget
	beq +

	phx
	lda #(`procItemInfo)<<8
	sta lR44+1
	lda #<>procItemInfo
	sta lR44
	jsl rlProcEngineFindProc
	jsl rlProcItemInfoOnCycle
	plx
	rtl

	+
	php
	phb
	sep #$20
	lda #`wInfoWindowTarget
	pha
	rep #$20
	plb

	.databank `wInfoWindowTarget

	; Clear rank icons

	phx
	lda #8
	sta wR0
	lda #7
	sta wR1
	jsl $8A81D8

	lda #24
	sta wR0
	lda #7

	_FEDC
	sta wR1
	jsl $8A81D8

	plx
	lda #<>rlProcTradeItemInfoWindowOnCycle3
	sta aProcSystem.aHeaderOnCycle,b,x
	plb
	plp
	rtl

rlProcTradeItemInfoWindowOnCycle3 ; 81/FEEC

	.al
	.xl
	.autsiz
	.databank ?

	php
	phb
	sep #$20
	lda #`wInfoWindowTarget
	pha
	rep #$20
	plb

	.databank `wInfoWindowTarget

	lda #<>rlProcTradeItemInfoWindowOnCycle
	sta aProcSystem.aHeaderOnCycle,b,x
	lda aProcSystem.aBody0,b,x
	bne +

	; Same as above but we're copying the original tilemap sections back

	lda #>`aBG3TilemapBuffer
	sta lR19+1
	lda #<>aBG3TilemapBuffer + ((18 + (6 * $20)) * 2)
	sta lR19
	lda #<>$7F9214
	sta lR18
	lda #>`$7F9214
	sta lR18+1
	lda #12
	sta wR0
	lda #22
	sta wR1
	jsl rlRevertWindowTilemapRect

	lda #>`aBG2TilemapBuffer
	sta lR19+1
	lda #<>aBG2TilemapBuffer + ((18 + (6 * $20)) * 2)
	sta lR19
	lda #<>$7F8C14
	sta lR18
	lda #>`$7F8C14
	sta lR18+1
	lda #12
	sta wR0
	lda #22
	sta wR1
	jsl rlRevertWindowTilemapRect

	bra ++

	+
	lda #>`aBG3TilemapBuffer
	sta lR19+1
	lda #<>aBG3TilemapBuffer + ((2 + (6 * $20)) * 2)
	sta lR19
	lda #<>$7F9214
	sta lR18
	lda #>`$7F9214
	sta lR18+1
	lda #12
	sta wR0
	lda #22
	sta wR1
	jsl rlRevertWindowTilemapRect

	lda #>`aBG2TilemapBuffer
	sta lR19+1
	lda #<>aBG2TilemapBuffer + ((2 + (6 * $20)) * 2)
	sta lR19
	lda #<>$7F8C14
	sta lR18
	lda #>`$7F8C14
	sta lR18+1
	lda #12
	sta wR0
	lda #22
	sta wR1
	jsl rlRevertWindowTilemapRect

	+
	jsl rlEnableBG2Sync
	jsl rlEnableBG3Sync

	lda #$0021
	jsl rlUnknown808C87

	plb
	plp
	rtl
