
rlSignedMultiply32By32 ; 80/A91F

	.al
	.xl
	.autsiz
	.databank ?

	; Multiplies two signed 32-bit numbers
	; and returns a signed 64-bit number

	; I couldn't come up with a good name for
	; a 64-bit number so it just uses two dws

	; Inputs:
	; wR10: signed 32-bit multiplier
	; wR12: signed 32-bit multiplicand

	; Outputs:
	; wR14: signed 64-bit result

	; Get sign of result
	; upper bit set for both -> 0
	; upper bit unset for both -> 0
	; upper bit set for one -> 1

	; We'll check the N flag later

	lda wR10+2
	eor wR12+2
	php

	; check if multiplier negative
	; if it is, negate it

	lda wR10+2
	bpl _PositiveMultiplier

	; Negation is just
	; 1 + (NOT val)

	; NOT is just val EOR -1

	clc
	lda wR10
	eor #-1
	adc #1
	sta wR10
	lda wR10+2
	eor #-1
	adc #0
	sta wR10+2

	_PositiveMultiplier

	; Same for multiplicand

	lda wR12+2
	bpl _PositiveMultiplicand
	clc
	lda wR12
	eor #-1
	adc #1
	sta wR12
	lda wR12+2
	eor #-1
	adc #0
	sta wR12+2

	_PositiveMultiplicand

	; Multiply

	jsl rlUnsignedMultiply32By32

	; Fetch result sign (N flag from earlier)

	plp
	bpl _PositiveResult

	; Negate result

	clc
	lda wR14
	eor #-1
	adc #1
	sta wR14
	lda wR14+2
	eor #-1
	adc #0
	sta wR14+2
	lda wR16
	eor #-1
	adc #0
	sta wR16
	lda wR16+2
	eor #-1
	adc #0
	sta wR16+2

	_PositiveResult
	rtl

rlSignedDivide32By32 ; 80/A987

	.al
	.xl
	.autsiz
	.databank ?

	; Divides two signed 32-bit numbers
	; and returns a signed 32-bit number

	; Inputs:
	; wR12: 32-bit signed dividend
	; wR14: 32-bit signed divisor

	; Outputs:
	; wR12: 32-bit signed result

	; Get sign of result
	; upper bit set for both -> 0
	; upper bit unset for both -> 0
	; upper bit set for one -> 1

	; We'll check the N flag later

	lda wR12+2
	eor wR14+2
	php

	; check if dividend negative
	; if it is, negate it

	lda wR12+2
	bpl _PositiveDividend
	clc
	lda wR12
	eor #-1
	adc #1
	sta wR12
	lda wR12+2
	eor #-1
	adc #0
	sta wR12+2

	_PositiveDividend

	; Same for divisor

	lda wR14+2
	bpl _PositiveDivisor
	clc
	lda wR14
	eor #-1
	adc #1
	sta wR14
	lda wR14+2
	eor #-1
	adc #0
	sta wR14+2

	_PositiveDivisor

	; Multiply dividend by $100

	sep #$20
	lda wR12+2
	sta wR12+3
	lda wR12+1
	sta wR12+2
	lda wR12
	sta wR12+1
	lda #$00
	sta wR12
	rep #$20

	; Divide

	jsl rlUnsignedDivide32By32

	; Multiply result by $100

	sep #$20
	lda wR12+2
	sta wR12+3
	lda wR12+1
	sta wR12+2
	lda wR12
	sta wR12+1
	lda #$00
	sta wR12
	rep #$20

	; Fetch result sign (N flag from earlier)

	plp
	bpl _PositiveResult

	clc
	lda wR12
	eor #-1
	adc #1
	sta wR12
	lda wR12+2
	eor #-1
	adc #0
	sta wR12+2

	_PositiveResult
	rtl

rlUnsignedMultiply16By16High ; 80/AA03

	.autsiz
	.databank ?

	; Multiplies two 16-bit unsigned numbers
	; and returns a 32-bit unsigned number

	; Uses higher RAM space, hence the name

	; Inputs:
	; wR34: 16-bit unsigned multiplier
	; wR35: 16-bit unsigned multiplicand

	; Outputs:
	; wR36: 32-bit unsigned result

	phx
	php
	phb
	phk
	plb

	.databank `*

	rep #$30
	stz wR36
	stz wR36+2
	ldx #16

	-
	lsr wR34
	bcc +

	lda wR35
	clc
	adc wR36+2
	sta wR36+2

	+
	ror wR36+2
	ror wR36
	dec x
	bne -
	plb
	plp
	plx
	rtl

rlUnsignedMultiply16By16 ; 80/AA27

	.autsiz
	.databank ?

	; Multiplies two 16-bit unsigned numbers
	; and returns a 32-bit unsigned number

	; Inputs:
	; wR10: 16-bit unsigned multiplier
	; wR11: 16-bit unsigned multiplicand

	; Outputs:
	; wR12: 32-bit unsigned result

	phb
	phk
	plb

	.databank `*

	phx
	phy
	pha
	php
	rep #$20
	sep #$10

	; Multiply lower bytes

	ldx wR10
	stx WRMPYA,b
	ldx wR11
	stx WRMPYB,b
	nop
	nop
	nop
	lda RDMPY,b
	sta wR12

	; Upper bytes

	ldx wR10+1
	stx WRMPYA,b
	ldx wR11+1
	stx WRMPYB,b
	nop
	nop
	nop
	ldx RDMPY,b
	stx wR12+2

	; Next multiply out middle bytes

	ldy RDMPY+1,b
	ldx wR10+1
	stx WRMPYA,b
	ldx wR11
	stx WRMPYB,b
	nop
	nop
	lda wR12+1
	clc
	adc RDMPY,b
	sta wR12+1
	bcc +

	inc y

	+
	ldx wR10
	stx WRMPYA,b
	ldx wR11+1
	stx WRMPYB,b
	nop
	nop
	lda wR12+1
	clc
	adc RDMPY,b
	sta wR12+1
	bcc +

	inc y

	+
	sty wR12+3
	plp
	pla
	ply
	plx
	plb
	rtl

rlUnsignedMultiply32By32 ; 80/AA8F

	.autsiz
	.databank ?

	; Multiply two 32-bit unsigned numbers
	; and return a 64-bit unsigned number

	; Inputs:
	; wR10: 32-bit unsigned multiplier
	; wR12: 32-bit unsigned multiplicand

	; Outputs:
	; wR14: 64-bit unsigned result

	phx
	php
	phb
	phk
	plb

	.databank `*

	rep #$30
	stz wR14
	stz wR14+2
	stz wR16
	stz wR16+2
	ldx #32

	-
	lsr wR10+2
	ror wR10
	bcc +

	lda wR12
	clc
	adc wR16
	sta wR16
	lda wR12+2
	adc wR16+2
	sta wR16+2

	+
	ror wR16+2
	ror wR16
	ror wR14+2
	ror wR14
	dec x
	bne -

	plb
	plp
	plx
	rtl

rlUnsignedDivide16By8 ; 80/AAC3

	.autsiz
	.databank ?

	; Divides a 16-bit number by an 8-bit number

	; Inputs:
	; wR13: 16-bit unsigned dividend
	; wR14: 8-bit unsigned divisor

	; Outputs:
	; wR10: 16-bit unsigned remainder
	; wR13: 16-bit unsigned result

	phb
	php
	phk
	plb

	.databank `*

	rep #$30
	lda wR13
	sta WRDIVA,b
	sep #$20
	lda wR14
	sta WRDIVB,b
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	rep #$20
	lda RDMPY,b
	sta wR10
	lda RDDIV,b
	sta wR13
	plp
	plb
	rtl

rlUnsignedDivide16By16High ; 80/AAEB

	.autsiz
	.databank ?

	; Divides a 16-bit unsigned number by another
	; 16-bit unsigned number.

	; Inputs:
	; wR36: 16-bit unsigned dividend
	; wR37: 16-bit unsigned divisor

	; Outputs:
	; wR34: 16-bit unsigned result

	phx
	php
	phb
	phk
	plb

	.databank `*

	rep #$30
	stz wR34
	lda wR37
	bne +

	stz wR36
	bra ++

	+
	ldx #17
	clc

	-
	rol wR36
	dec x
	beq +

	rol wR34
	lda wR34
	beq -

	sec
	sbc wR37
	bcc -

	sta wR34
	bra -

	+
	plb
	plp
	plx
	rtl

rlUnsignedDivide16By16 ; 80/AB18

	.autsiz
	.databank ?

	; Same as the previous routine but with different inputs

	; Inputs:
	; wR13: 16-bit unsigned dividend
	; wR14: 16-bit unsigned divisor

	; Outputs:
	; wR10: 16-bit unsigned result

	phx
	php
	phb
	phk
	plb

	.databank `*

	rep #$30
	stz wR10
	lda wR14
	bne +

	stz wR13
	bra ++

	+
	ldx #17
	clc

	-
	rol wR13
	dec x
	beq +
	rol wR10
	lda wR10
	beq -

	sec
	sbc wR14
	blt -

	sta wR10
	bra -

	+
	plb
	plp
	plx
	rtl

rlUnsignedDivide32By32 ; 80/AB45

	.autsiz
	.databank ?

	; Divides two 32-bit unsigned numbers
	; returns a 32-bit unsigned number

	; Inputs:
	; wR12: 32-bit unsigned dividend
	; wR14: 32-bit unsigned divisor

	; Outputs:
	; wR10: 32-bit result

	phx
	phy
	php
	phb
	phk
	plb

	.databank `*

	rep #$30
	stz wR10+2
	stz wR10
	lda wR14+2
	ora wR14 ; 32-bit divisor
	bne + ; clear result if div by 0

	stz wR12+2
	stz wR12
	bra _End

	+
	ldx #33
	clc

	-
	rol wR12
	rol wR12+2
	dec x
	beq _End

	rol wR10
	rol wR10+2
	lda wR10+2
	ora wR10
	beq -

	lda wR10
	sec
	sbc wR14
	tay
	lda wR10+2
	sbc wR14+2
	bcc -

	sta wR10+2
	sty wR10
	bra -

	_End
	plb
	plp
	ply
	plx
	rtl
