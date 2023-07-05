
aProcEngineMainProcActionTable ; 82/9BD5

	; Names subject to change

	.addr rlProcEngineResetProcEngine
	.addr rlProcEngineMainProcLoop
	.addr rlProcEngineStub

rlProcEngineResetProcEngine ; 82/9BDB

	.al
	.xl
	.autsiz
	.databank ?

	; Clears RAM associated with the proc system

	; Inputs:
	; None

	; Outputs:
	; None

	php
	phb

	phk
	plb

	.databank `*

	ldx #size(aProcSystem)-1

	sep #$20

	lda #$00

	-
	sta aProcSystem,b,x
	dec x
	bpl -

	rep #$20
	plb
	plp
	rtl

rlProcEngineCreateProc ; 82/9BF1

	.al
	.xl
	.autsiz
	.databank ?

	; Creates a new proc

	; Inputs:
	; lR44: Long pointer to proc info

	; Outputs:
	; Carry set if unsuccessful

	php
	phb

	phx
	phy

	sep #$20

	lda lR44+2
	pha
	rep #$20
	plb

	.databank ?

	ldy lR44

	; Find first free proc slot

	ldx #(16 - 1) * 2

	_FreeProcLoop
	lda aProcSystem.wFlag,b
	bpl +

	cpx aProcSystem.wOffset,b
	beq ++

	+
	lda aProcSystem.aHeaderTypeOffset,b,x
	beq _InitProc

	+
	dec x
	dec x
	bpl _FreeProcLoop

	ply
	plx
	plb
	plp

	sec
	rtl

	_InitProc

	; Create a proc

	; Start by storing a pointer to the proc info

	tya
	sta aProcSystem.aHeaderTypeOffset,b,x

	lda lR44+1
	and #$FF00
	sta aProcSystem.lPointer + 1,b

	xba
	sta aProcSystem.aHeaderTypeBank,b,x

	lda #$0001
	sta aProcSystem.aHeaderSleepTimer,b,x

	; Clear the proc body

	lda #$0000
	sta aProcSystem.aHeaderBitfield,b,x
	sta aProcSystem.aHeaderUnknownTimer,b,x
	sta aProcSystem.aBody0,b,x
	sta aProcSystem.aBody1,b,x
	sta aProcSystem.aBody2,b,x
	sta aProcSystem.aBody3,b,x
	sta aProcSystem.aBody4,b,x
	sta aProcSystem.aBody5,b,x
	sta aProcSystem.aBody6,b,x
	sta aProcSystem.aBody7,b,x

	; Store parts from the proc info

	lda structProcInfo.Name,b,y
	sta aProcSystem.aHeaderName,b,x

	lda structProcInfo.Init,b,y
	sta aProcSystem.lPointer,b

	lda structProcInfo.OnCycle,b,y
	sta aProcSystem.aHeaderOnCycle,b,x

	lda structProcInfo.Code,b,y
	sta aProcSystem.aHeaderCodeOffset,b,x

	; Store new proc Index

	phx
	lda aProcSystem.wOffset,b
	pha

	stx aProcSystem.wOffset,b

	; Run init code

	jsl rlProcEngineRunProcInit

	; on cycle and code, too

	ldx aProcSystem.wOffset,b
	jsr rsProcEngineRunProcOnCycleAndCode

	; Update that the proc has run this cycle

	lda aProcSystem.aHeaderBitfield,b,x
	ora #$4000
	sta aProcSystem.aHeaderBitfield,b,x

	pla
	sta aProcSystem.wOffset,b

	pla
	ply
	plx
	plb
	plp
	clc
	rtl

rlProcEngineRunProcInit ; 82/9C90

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.lPointer,b
	bmi +
	rtl

	+
	jmp [aProcSystem.lPointer]

rlProcEngineCreateProcByIndex ; 82/9C99

	.al
	.xl
	.autsiz
	.databank ?

	; Creates a proc with then given
	; index if no proc is in that slot

	; Inputs:
	; A: Index in proc array
	; lR44: long pointer to proc info

	; Outputs:
	; Carry set if unsuccessful

	php
	phb
	phx
	phy

	asl a
	tax
	lda lR44
	tay

	sep #$20
	lda lR44+2
	pha
	rep #$20
	plb

	.databank ?

	lda aProcSystem.aHeaderTypeOffset,b,x
	beq +

	ply
	plx
	plb
	plp
	sec
	rtl

	+
	jmp rlProcEngineCreateProc._InitProc


rlProcEngineDeleteProcByIndex ; 82/9CB8

	.al
	.xl
	.autsiz
	.databank ?

	; Deletes a proc given by the index

	; Inputs:
	; A: Index of proc to delete

	; Outputs:
	; Carry set if there was no proc

	phb
	php

	phk
	plb

	.databank `*

	phx
	asl a
	tax
	lda aProcSystem.aHeaderTypeOffset,b,x
	bne +

	plx
	plp
	plb
	sec

	-
	rtl

	+
	jsl rlProcEngineFreeProc
	plx
	plp
	plb
	clc
	bra -


rlProcEngineCheckUnkBitfieldByIndex ; 82/9CD3

	.al
	.xl
	.autsiz
	.databank ?

	phb
	php

	phk
	plb

	.databank `*

	phx
	tax
	lda aProcSystem.aUnknownBitfield,b,x
	bit #$2000
	beq +

	plx
	plp
	plb
	sec

	-
	rtl

	+
	plx
	plp
	plb
	clc
	bra -

rlProcEngineFindProc ; 82/9CEC

	.as
	.xl
	.autsiz
	.databank ?

	; Given a pointer to proc info, returns
	; offset in the proc array of the proc

	; Inputs:
	; lR44: long pointer to proc code

	; Outputs:
	; X: Offset of proc in array
	; Carry set if found

	phb
	php

	phk
	plb

	.databank `*

	ldx #(16 - 1) * 2

	-
	rep #$20
	lda aProcSystem.aHeaderTypeOffset,b,x
	cmp lR44
	bne +

	sep #$20
	lda aProcSystem.aHeaderTypeBank,b,x
	cmp lR44+2
	beq ++

	+
	dec x
	dec x
	bpl -

	plp
	plb
	clc
	rtl

	+
	plp
	plb
	sec
	rtl

rlProcEngineFreeProc ; 82/9D11

	.al
	.xl
	.autsiz
	.databank ?

	stz aProcSystem.aHeaderTypeOffset,b,x
	lda aProcSystem.aHeaderBitfield,b,x
	ora #$2000
	sta aProcSystem.aHeaderBitfield,b,x
	rtl

rlProcEngineMainProcLoop ; 82/9D1E

	.al
	.xl
	.autsiz
	.databank ?

	php
	phb

	phk
	plb

	.databank `*

	lda #$8000
	tsb aProcSystem.wFlag,b

	ldx #(16 - 1) * 2

	-
	stx aProcSystem.wOffset,b
	lda aProcSystem.aHeaderTypeOffset,b,x
	beq +

	jsr rsProcEngineRunProcOnCycleAndCode

	+
	ldx aProcSystem.wOffset,b
	dec x
	dec x
	bpl -

	jsr rsProcEngineUnblockAllProcs

	lda #$8000
	trb aProcSystem.wFlag,b
	plb
	plp
	rtl

rsProcEngineRunProcOnCycleAndCode ; 82/9D49

	.al
	.xl
	.autsiz
	.databank ?

	sep #$20
	lda aProcSystem.aHeaderTypeBank,b,x
	pha
	rep #$20
	plb

	.databank ?

	lda aProcSystem.aHeaderBitfield,b,x
	bit #$1000
	bne +

	bit #$4000
	beq ++

	+
	rts

	+
	phb
	jsl rlProcEngineRunProcOnCycle
	plb

	ldx aProcSystem.wOffset,b

	dec aProcSystem.aHeaderSleepTimer,b,x
	bne ++

	ldy aProcSystem.aHeaderCodeOffset,b,x
	bpl ++

	_Loop
	lda $0000,b,y
	bpl +

	sta aProcSystem.lPointer,b
	iny
	iny
	pea <>_Loop - 1
	jmp (aProcSystem.lPointer)

	+
	sta aProcSystem.aHeaderSleepTimer,b,x
	tya
	clc
	adc #$0002
	sta aProcSystem.aHeaderCodeOffset,b,x

	+
	rts


rlProcEngineRunProcOnCycle ; 82/9D8F

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.aHeaderTypeBank,b,x
	xba
	sta aProcSystem.lPointer + 1,b
	lda aProcSystem.aHeaderOnCycle,b,x
	bmi +

	rtl

	+
	sta aProcSystem.lPointer,b
	jmp [aProcSystem.lPointer]


rsProcEngineUnblockAllProcs ; 82/9DA2

	.al
	.xl
	.autsiz
	.databank ?

	ldx #(16 - 1) * 2

	_Loop
	lda aProcSystem.aHeaderBitfield,b,x
	and #~$4000
	sta aProcSystem.aHeaderBitfield,b,x
	sta aProcSystem.aUnknownBitfield,b,x
	dec x
	dec x
	bpl _Loop

	rts

rlProcEngineStub ; 82/9DB6

	.autsiz
	.databank ?

	rtl
