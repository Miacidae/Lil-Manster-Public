
rlUnknown80B554 ; 80/B554

	.al
	.xl
	.autsiz
	.databank ?

	phb
	php
	phk
	plb

	.databank `*

	pha
	pla
	sta wMainLoopPointer
	bra rlUnknown80B561

rlUnknown80B55E ; 80/B55E

	.al
	.xl
	.autsiz
	.databank ?

	pla
	sta wR26

rlUnknown80B561 ; 80/B561

	.al
	.xl
	.autsiz
	.databank ?

	plp
	plb
	rtl

rlUnknown80B564 ; 80/B564

	.autsiz
	.databank ?

	php
	phb
	rep #$30
	ldy DecompressionVariables.lSource
	stz DecompressionVariables.lSource
	sep #$20
	lda #$01
	sta DecompressionVariables.bFlag
	bra rlDecompressor._Unknown80B593

rlDecompressor ; 80/B574

	.autsiz
	.databank ?

	; This is the main decompression routine.
	; It has subroutines for various compression methods
	; and handles some basic decompression setup

	; Inputs:
	; DecompressionVariables.lSource: Long pointer to compressed data
	; DecompressionVariables.lDest: Long pointer to where to decompress to

	; Outputs:
	; None

	php
	phb
	rep #$30

	; Fetch source in Y

	ldy DecompressionVariables.lSource
	bmi _ROMSource

	; If decompressing from RAM,
	; we want to wrap 7FFF->0000
	; instead of FFFF->8000

	tya
	clc
	adc #$8000
	tay
	lda #$8000
	sta DecompressionVariables.lSource
	sep #$20
	dec DecompressionVariables.lSource+2
	bra +

	_ROMSource

	.al
	.xl
	.autsiz
	.databank ?

	stz DecompressionVariables.lSource
	sep #$20

	+

	; Clear internal stuff and
	; fetch dest in X

	stz DecompressionVariables.bFlag

	_Unknown80B593
	stz DecompressionVariables.bCount
	lda DecompressionVariables.lDest+2
	pha
	plb

	.databank ?

	ldx DecompressionVariables.lDest
	jmp _GetNextMethod

	_DecCount ; 80/B59E

	.as
	.xl
	.autsiz
	.databank ?

	dec a
	sta DecompressionVariables.bCount
	bne +

	_SetSource ; 80/B5A3

	.as
	.xl
	.autsiz
	.databank ?

	lda DecompressionVariables.lTemp+2
	sta DecompressionVariables.lSource+2
	ldy DecompressionVariables.lTemp

	+
	rts

	_BankBoundary ; 80/B5AA

	.as
	.xl
	.autsiz
	.databank ?

	inc DecompressionVariables.lSource+2
	ldy DecompressionVariables.lSource
	bne _End

	pha
	lda DecompressionVariables.bFlag
	bne +

	ldy #$8000

	+
	pla

	_End
	rts

	_ORR80Plus ; 80/B5BA

	.as
	.xl
	.autsiz
	.databank ?

	sta DecompressionVariables.bVar0
	asl a
	bpl _LessThanC0

	; C0 and above

	and #$20
	beq +

	; D0
	; Upper nybble data
	; Lower nybble F

	lda DecompressionVariables.bVar0
	asl a
	asl a
	asl a
	asl a
	ora #$0F
	sta $0000,b,x
	inc x
	lda #$1F
	bra _ORRHandler

	+

	; C0
	; Upper nybble F
	; Lower nybble data

	lda DecompressionVariables.bVar0
	and #$0F
	ora #$F0
	sta $0000,b,x
	inc x
	lda #$0F
	bra _ORRHandler

	_LessThanC0
	and #$20
	beq +

	; 90
	; Upper nybble data
	; Lower nybble 0

	lda DecompressionVariables.bVar0
	asl a
	asl a
	asl a
	asl a
	sta $0000,b,x
	inc x
	lda #$10
	bra _ORRHandler

	+

	; 80
	; Upper nybble 0
	; Lower nybble data

	lda DecompressionVariables.bVar0
	and #$0F
	sta $0000,b,x
	inc x
	lda #$00
	bra _ORRHandler

	_ORR ; 80/B5FF

	.as
	.xl
	.autsiz
	.databank ?

	and #$0F ; count
	inc a
	sta DecompressionVariables.bMethodCount

	; Next byte determines the type of ORR

	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	pha
	lda DecompressionVariables.bCount
	beq +

	dec a
	sta DecompressionVariables.bCount
	bne +

	jsr _SetSource

	+
	pla
	cmp #$80
	bge _ORR80Plus

	_ORRHandler
	cmp #$10
	blt _LowerNybbleData

	and #$0F
	sta DecompressionVariables.bVar0

	_UpperDataLoop
	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	sta DecompressionVariables.bVar1
	and #$F0
	ora DecompressionVariables.bVar0
	sta $0000,b,x
	inc x
	lda DecompressionVariables.bCount
	beq +

	jsr _DecCount

	+
	dec DecompressionVariables.bMethodCount
	bmi _ORREnd

	lda DecompressionVariables.bVar1
	asl a
	asl a
	asl a
	asl a
	ora DecompressionVariables.bVar0
	sta $0000,b,x
	inc x
	dec DecompressionVariables.bMethodCount
	bpl _UpperDataLoop

	jmp _GetNextMethod

	_LowerNybbleData
	asl a
	asl a
	asl a
	asl a
	sta DecompressionVariables.bVar0

	_LowerDataLoop
	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	sta DecompressionVariables.bVar1
	lsr a
	lsr a
	lsr a
	lsr a
	ora DecompressionVariables.bVar0
	sta $0000,b,x
	inc x
	lda DecompressionVariables.bCount
	beq +

	jsr _DecCount

	+
	dec DecompressionVariables.bMethodCount
	bmi _ORREnd

	lda DecompressionVariables.bVar1
	and #$0F
	ora DecompressionVariables.bVar0
	sta $0000,b,x
	inc x
	dec DecompressionVariables.bMethodCount
	bpl _LowerDataLoop

	_ORREnd
	jmp _GetNextMethod

	_DupOrORR ; 80/B68C

	.as
	.xl
	.autsiz
	.databank ?

	cmp #$50
	bge +
	jmp _ORR

	; Duplicate 2x

	+
	and #$0F
	sta DecompressionVariables.bMethodCount

	_DupLoop
	lda [DecompressionVariables.lSource],y ; get data
	inc y
	bne +

	jsr _BankBoundary

	+
	sta $0000,b,x ; wRite it twice
	inc x
	sta $0000,b,x
	inc x
	lda DecompressionVariables.bCount
	beq +

	jsr _DecCount

	+
	dec DecompressionVariables.bMethodCount
	bpl _DupLoop

	jmp _GetNextMethod

	_DupCheckOrAppend ; 80/B6B5

	.as
	.xl
	.autsiz
	.databank ?

	; Method << 1 in A

	lsr a
	cmp #$60
	blt _DupOrORR

	; Otherwise it's append
	; next byte is the value that is appended

	xba
	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	pha
	lda DecompressionVariables.bCount
	beq +

	dec a
	sta DecompressionVariables.bCount
	bne +

	jsr _SetSource

	+
	pla
	sta DecompressionVariables.bVar0
	xba
	cmp #$70
	and #$0F
	inc a
	sta DecompressionVariables.bMethodCount
	bge _Postappend

	_Preappend
	lda DecompressionVariables.bVar0 ; append val
	sta $0000,b,x
	inc x
	lda [DecompressionVariables.lSource],y ; then data
	inc y
	bne +

	jsr _BankBoundary

	+
	sta $0000,b,x
	inc x
	lda DecompressionVariables.bCount
	beq +

	jsr _DecCount

	+
	dec DecompressionVariables.bMethodCount
	bpl _Preappend
	bra _GetNextMethod

	_Postappend
	lda [DecompressionVariables.lSource],y ; append data
	inc y
	bne +

	jsr _BankBoundary

	+
	sta $0000,b,x
	inc x
	lda DecompressionVariables.bCount
	beq +

	jsr _DecCount

	+
	lda DecompressionVariables.bVar0 ; then val
	sta $0000,b,x
	inc x
	dec DecompressionVariables.bMethodCount
	bpl _Postappend

	bra _GetNextMethod

	_DupAppendOrLiteral ; 80/B71B

	.as
	.xl
	.autsiz
	.databank ?

	; Method << 1 in A

	bmi _DupCheckOrAppend

	; Otherwise literal bytes

	lsr a

	; Number of bytes to copy

	sta DecompressionVariables.bMethodCount

	_LiteralLoop
	lda [DecompressionVariables.lSource],y ; get byte to copy
	inc y
	bne +

	jsr _BankBoundary

	+
	sta $0000,b,x ; Store to dest
	inc x
	lda DecompressionVariables.bCount
	beq +

	jsr _DecCount

	+
	dec DecompressionVariables.bMethodCount
	bpl _LiteralLoop

	_GetNextMethod ; 80/B737

	.as
	.xl
	.autsiz
	.databank ?

	; This fetches the next compressed method byte
	; and decides what to do based on it.

	; Fetch method from source

	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	pha

	; Decrement lookback method count

	lda DecompressionVariables.bCount
	beq +

	dec a
	sta DecompressionVariables.bCount
	bne +

	jsr _SetSource

	+
	pla
	asl a
	bcc _DupAppendOrLiteral ; 70 and below
	bmi _UpperMethodOrLZLong ; E0 and above

	; Else 70 < M <= C0
	; sliding window

	_LZ77 ; 80/B752

	.as
	.xl
	.autsiz
	.databank ?

	; I'm calling this LZ77 based on Twilkitri(?)'s
	; doc but I'm not sure if that's really correct.

	; length = 2 + (method-0x80)>>2

	lsr a
	pha
	lsr a
	lsr a
	inc a
	sta DecompressionVariables.bMethodCount
	pla

	; upper bits of distance

	and #$03
	xba

	_LZGetLowerDistByte
	lda [DecompressionVariables.lSource],y ; get lower distance byte
	inc y
	bne +

	jsr _BankBoundary

	+
	phy
	rep #$20

	; Subtract current dest point
	; to get pos in decomp to read

	sta DecompressionVariables.lDest
	txa
	sec
	sbc DecompressionVariables.lDest
	tay
	sep #$20

	_LZLoop
	lda $0000,b,y ; copy from
	sta $0000,b,x
	inc y
	inc x
	dec DecompressionVariables.bMethodCount
	bpl _LZLoop

	ply

	_NextLookbackOrEnd ; 80/B77E

	.as
	.xl
	.autsiz
	.databank ?

	lda DecompressionVariables.bCount
	beq _GetNextMethod

	jsr _DecCount
	bra _GetNextMethod

	_UpperMethodOrLZLong ; 80/B787

	.as
	.xl
	.autsiz
	.databank ?

	ror a
	cmp #$E0
	bcs _RLEOrSpecial

	; Long LZ77
	; length = 2 + ((((method&0x1F)<<8)|(data[pos+1]&0x80))>>7)

	and #$1F
	xba
	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	pha
	lda DecompressionVariables.bCount
	beq +

	dec a
	sta DecompressionVariables.bCount
	bne +

	jsr _SetSource

	+
	pla
	rep #$20
	asl a
	sep #$20
	lsr a
	xba
	inc a
	sta DecompressionVariables.bMethodCount
	bra _LZGetLowerDistByte

	_RLEOrSpecial ; 80/B7B1

	.as
	.xl
	.autsiz
	.databank ?

	cmp #$F0
	bge _DetermineSpecialMethod

	; RLE

	; length = 3 + (method&0xF)<<8 + data[pos+1]

	and #$0F
	sta DecompressionVariables.bVar1
	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	sta DecompressionVariables.bVar0
	lda DecompressionVariables.bCount
	beq +

	jsr _DecCount

	+
	lda [DecompressionVariables.lSource],y ; grab byte to repeat
	inc y
	bne +

	jsr _BankBoundary

	+
	phy
	pha
	pha
	rep #$20
	lda DecompressionVariables.bVar0
	clc
	adc #$0003
	lsr a
	tay
	pla

	_RLELoop
	sta $0000,b,x ; store byte
	inc x
	inc x
	dec y
	bne _RLELoop
	sep #$20
	bcc _RLEEnd

	sta $0000,b,x
	inc x

	_RLEEnd
	ply
	bra _NextLookbackOrEnd

	_DetermineSpecialMethod ; 80/B7F3

	.as
	.xl
	.autsiz
	.databank ?

	; This stuff seems similar to the LZ77 used on the GBA
	; but without using the same chunk(?) byte?

	cmp #$F8
	bge +

	; Short RLE
	; length = 3 + (method&0x7)

	and #$07
	adc #$02
	sta DecompressionVariables.bMethodCount
	lda [DecompressionVariables.lSource],y ; byte to repeat
	inc y
	bne _ShortRLELoop
	jsr _BankBoundary

	_ShortRLELoop
	sta $0000,b,x
	inc x
	dec DecompressionVariables.bMethodCount
	bpl _ShortRLELoop
	jmp _NextLookbackOrEnd

	+
	cmp #$FC
	bge _CheckForEndFlag

	; like the sliding window but
	; we're going back in the source
	; and decompressing that instead
	; of copying from the output

	; methods to repeat: 3 + (method & 0x3)<<3 + (data[pos+1]>>5)
	; distance: 3 + (data[pos+1]&0x1F)<<8 + data[pos+2]

	and #$03
	xba
	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	rep #$20
	asl a
	asl a
	asl a
	sep #$20
	lsr a
	lsr a
	lsr a
	xba
	pha
	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	rep #$20
	clc
	adc #$0003

	_SetReadposAndCount
	sty DecompressionVariables.lTemp
	sta DecompressionVariables.lDest
	sep #$20
	lda DecompressionVariables.lSource+2
	sta DecompressionVariables.lTemp+2
	lda DecompressionVariables.bFlag
	rep #$20
	beq _GetPreviousBankOffset

	tya
	sec
	sbc DecompressionVariables.lDest
	bge _SetCountAndDecomp

	bra _GetPreviousBank

	_GetPreviousBankOffset
	tya
	sec
	sbc DecompressionVariables.lDest
	bmi _SetCountAndDecomp

	clc
	adc #$8000

	_GetPreviousBank
	dec DecompressionVariables.lSource+2

	_SetCountAndDecomp
	tay
	sep #$20
	pla
	clc
	adc #$03
	sta DecompressionVariables.bCount
	jmp _GetNextMethod

	_CheckForEndFlag
	cmp #$FE
	bge _EndDecomp

	; same as before but
	; distance = data[pos+1]&0x3F
	; count = 3 + data[pos+1]>>6 + (method&1)<<2

	and #$01
	xba
	lda [DecompressionVariables.lSource],y
	inc y
	bne +

	jsr _BankBoundary

	+
	rep #$20
	asl a
	asl a
	sep #$20
	xba
	pha
	xba
	lsr a
	lsr a
	rep #$20
	and #$003F
	inc a
	inc a
	bra _SetReadposAndCount

	_EndDecomp
	plb
	plp
	rtl
