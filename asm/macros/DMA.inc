
; RAM versions for pulling struct parts

structDMAToCGRAMEntry .struct
	Type	.byte ?
	Source	.long ?
	Count	.word ?
	Start	.byte ?
	.ends

structDMAToVRAMEntry .struct
	Type	.byte ?
	Source	.long ?
	Count	.word ?
	Mode	.byte ?
	Dest	.word ?
	.ends

structDMAFromVRAMEntry .struct
	Type	.byte ?
	Dest	.long ?
	Count	.word ?
	Mode	.byte ?
	Source	.word ?
	.ends

structDMAInputDestEntry .struct
	Type	.byte ?
	Source	.long ?
	Count	.word ?
	Param	.byte ?
	Port	.byte ?
	Mode	.byte ?
	Dest	.word ?
	.ends

; DMA by struct

.virtual #$03,s

lDMAByStructReturnLocation .long ?

.endv

