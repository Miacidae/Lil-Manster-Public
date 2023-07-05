
rlDecompressSingle ; 80/AF93

	.al
	.autsiz
	.databank ?

	; Decompresses a single thing.

	; Inputs:
	; lR45: Source pointer
	; lR47: Destination pointer

	; Outputs:
	; None

	; Copy offsets

	lda lR45
	sta DecompressionVariables.lSource
	lda lR47
	sta DecompressionVariables.lDest

	; Copy banks

	sep #$20
	lda lR45+2
	sta DecompressionVariables.lSource+2
	lda lR47+2
	sta DecompressionVariables.lDest+2
	rep #$20

	; Decompress

	jsl rlDecompressor
	rtl

rlClearDecompList ; 80/AFAC

	.autsiz
	.databank ?

	; Clears all pending decompresses.

	; Inputs:
	; None

	; Outputs:
	; None

	php
	rep #$20
	stz aDecompressionArray,b
	stz wDecompressionArrayPosition,b
	sep #$20
	stz bDecompressionArrayFlag,b
	plp
	rtl

rlDecompressByList ; 80/AFBC

	.autsiz
	.databank ?

	; Tries to decompress all pending requests.

	; Inputs:
	; None

	; Outputs:
	; None

	phb
	php
	phk
	plb

	.databank `*

	sep #$20
	rep #$10

	; Check if there's anything to decompress

	lda bDecompressionArrayFlag,b
	beq _End

	rep #$20
	stz wDecompressionArrayPosition,b

	; Loop counter

	ldy #$0000

	_Loop
	cpy #size(aDecompressionArray)
	blt _DoNotHang

	; Hang if too many things to decompress?

	_Hang
	bra _Hang

	_DoNotHang

	; Check for end of list

	lda aDecompressionArray+structDecompListEntry.Source,b,y
	ora aDecompressionArray+structDecompListEntry.Source+1,b,y
	beq _ListEnd

	; Else decompress

	lda aDecompressionArray+structDecompListEntry.Source,b,y
	sta DecompressionVariables.lSource
	lda aDecompressionArray+structDecompListEntry.Source+1,b,y
	sta DecompressionVariables.lSource+1

	lda aDecompressionArray+structDecompListEntry.Dest,b,y
	sta DecompressionVariables.lDest
	lda aDecompressionArray+structDecompListEntry.Dest+1,b,y
	sta DecompressionVariables.lDest+1

	phy
	jsl rlDecompressor
	pla
	clc
	adc #size(structDecompListEntry)
	tay
	bra _Loop

	_ListEnd
	stz bDecompressionArrayFlag,b
	stz aDecompressionArray,b

	_End
	plp
	plb
	rtl

rlAppendDecompList ; 80/B00A

	.al
	.autsiz
	.databank ?

	php
	phx

	ldx wDecompressionArrayPosition,b

	lda lR18
	sta aDecompressionArray+structDecompListEntry.Source,b,x
	lda lR18+1
	sta aDecompressionArray+structDecompListEntry.Source+1,b,x

	lda lR19
	sta aDecompressionArray+structDecompListEntry.Dest,b,x
	lda lR19+1
	sta aDecompressionArray+structDecompListEntry.Dest+1,b,x

	; Clear the slot after that

	lda #$0000
	sta aDecompressionArray+size(structDecompListEntry)+structDecompListEntry.Source,b,x
	sta aDecompressionArray+size(structDecompListEntry)+structDecompListEntry.Source+1,b,x
	sta aDecompressionArray+size(structDecompListEntry)+structDecompListEntry.Source+2,b,x

	; Advance a slot

	txa
	clc
	adc #size(structDecompListEntry)
	sta wDecompressionArrayPosition,b

	; Set flag for pending decompression

	sep #$20
	lda #$01
	sta bDecompressionArrayFlag,b

	; Decompress if forced blank enabled

	lda bBufferINIDISP
	bpl +

	jsl rlDecompressByList

	+
	rep #$20
	plx
	plp
	rtl
