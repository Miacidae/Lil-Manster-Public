
procFadeIn1 .dstruct structProcInfo, "FI", rlProcFadeIn1Init, rlProcFadeIn1OnCycle, aProcFadeIn1Code ; 82/A111

rlProcFadeIn1Init ; 82/A119

	.al
	.xl
	.autsiz
	.databank ?

	php
	jsl rlClearFadeOuts
	sep #$20
	lda #$FF
	sta wScreenFadingFlag,b
	plp
	rtl

rlProcFadeIn1OnCycle ; 82/A127

	.al
	.xl
	.autsiz
	.databank ?

	lda #$0001
	jsl rlFadeInByTimer
	bcc +

	jsl rlProcEngineFreeProc

	+
	rtl

aProcFadeIn1Code ; 82/A135

	PROC_HALT

procFadeOut1 .dstruct structProcInfo, "FO", rlProcFadeOut1Init, rlProcFadeOut1OnCycle, aProcFadeOut1Code ; 82/A137

rlProcFadeOut1Init ; 82/A13F

	.al
	.xl
	.autsiz
	.databank ?

	php
	jsl rlClearFadeIns
	sep #$20
	lda #$FF
	sta wScreenFadingFlag,b
	plp
	rtl

rlProcFadeOut1OnCycle ; 82/A14D

	.al
	.xl
	.autsiz
	.databank ?

	lda #$0001
	jsl rlFadeOutByTimer
	bcc +

	jsl rlProcEngineFreeProc

	+
	rtl

aProcFadeOut1Code ; 82/A15B

	PROC_HALT

rlClearFadeIns ; 82/A15D

	.al
	.xl
	.autsiz
	.databank ?

	phx
	lda #(`procFadeIn1)<<8
	sta lR44+1
	lda #<>procFadeIn1
	sta lR44
	jsl rlProcEngineFindProc
	bcc +

	txa
	lsr a
	jsl rlProcEngineDeleteProcByIndex

	+
	lda #(`procFadeIn2)<<8
	sta lR44+1
	lda #<>procFadeIn2
	sta lR44
	jsl rlProcEngineFindProc
	bcc +

	txa
	lsr a
	jsl rlProcEngineDeleteProcByIndex

	+
	plx
	rtl

rlClearFadeOuts ; 82/A18C

	.al
	.xl
	.autsiz
	.databank ?

	phx
	lda #(`procFadeOut1)<<8
	sta lR44+1
	lda #<>procFadeOut1
	sta lR44
	jsl rlProcEngineFindProc
	bcc +

	txa
	lsr a
	jsl rlProcEngineDeleteProcByIndex

	+
	lda #(`procFadeOut2)<<8
	sta lR44+1
	lda #<>procFadeOut2
	sta lR44
	jsl rlProcEngineFindProc
	bcc +

	txa
	lsr a
	jsl rlProcEngineDeleteProcByIndex

	+
	plx
	rtl

procUnknown82A1BB .dstruct structProcInfo, "Bt", rlProcUnknown82A1BBInit, rlProcUnknown82A1BBOnCycle, aProcUnknown82A1BBCode ; 82/A1BB

rlProcUnknown82A1BBInit ; 82/A1C3

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.wInput0,b
	sta aProcSystem.aBody0,b,x

	lda bBufferINIDISP
	bit #INIDISP_ForcedBlank
	bne +

	bit #INIDISP_Setting(False, 15)
	beq +

	lda #(`procFadeOut1)<<8
	sta lR44+1
	lda #<>procFadeOut1
	sta lR44
	jsl rlProcEngineCreateProc

	+
	rtl

rlProcUnknown82A1BBOnCycle ; 82/A1E4

	.al
	.xl
	.autsiz
	.databank ?

	lda bBufferINIDISP
	bit #INIDISP_ForcedBlank
	bne +

	bit #INIDISP_Setting(False, 15)
	bne ++

	+
	lda aProcSystem.aBody0,b,x
	jsl rlUnknown80B554
	sei
	sep #$20
	lda bBufferNMITIMEN
	and #~(NMITIMEN_VCountIRQ | NMITIMEN_HCountIRQ)
	sta bBufferNMITIMEN
	sta NMITIMEN,b
	rep #$20
	jsl rlProcEngineFreeProc

	+
	rtl

aProcUnknown82A1BBCode ; 82/A20A

	PROC_HALT

procFadeIn2 .dstruct structProcInfo, "FI", rlProcFadeIn2Init, rlProcFadeIn2OnCycle, aProcFadeIn2Code ; 82/A20C

rlProcFadeIn2Init ; 82/A214

	.al
	.xl
	.autsiz
	.databank ?

	php
	jsl rlClearFadeOuts
	sep #$20
	lda #$FF
	sta wScreenFadingFlag,b
	lda wScreenFadingProcInput,b
	sta aProcSystem.aBody0,b,x
	plp
	rtl

rlProcFadeIn2OnCycle ; 82/A228

	.al
	.xl
	.autsiz
	.databank ?

	lda #<>rlProcFadeIn2OnCycle2
	sta aProcSystem.aHeaderOnCycle,b,x
	rtl

rlProcFadeIn2OnCycle2 ; 82/A22F

	.al
	.xl
	.autsiz
	.databank ?

	lda #<>rlProcFadeIn2OnCycle3
	sta aProcSystem.aHeaderOnCycle,b,x
	rtl

rlProcFadeIn2OnCycle3 ; 82/A236

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.aBody0,b,x
	jsl rlFadeInByTimer
	bcc +

	jsl rlProcEngineFreeProc

	+
	rtl

aProcFadeIn2Code ; 82/A244

	PROC_HALT

procFadeOut2 .dstruct structProcInfo, "FO", rlProcFadeOut2Init, rlProcFadeOut2OnCycle, aProcFadeOut2Code ; 82/A246

rlProcFadeOut2Init ; 82/A24E

	.al
	.xl
	.autsiz
	.databank ?

	php
	jsl rlClearFadeIns
	sep #$20
	lda #$FF
	sta wScreenFadingFlag,b
	lda wScreenFadingProcInput,b
	sta aProcSystem.aBody0,b,x
	plp
	rtl

rlProcFadeOut2OnCycle ; 82/A262

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.aBody0,b,x
	jsl rlFadeOutByTimer
	bcc +

	jsl rlProcEngineFreeProc

	+
	rtl

aProcFadeOut2Code ; 82/A270

	PROC_HALT

procUnknown82A272 .dstruct structProcInfo, "Bt", rlProcUnknown82A272Init, rlProcUnknown82A272OnCycle, aProcUnknown82A272Code ; 82/A272

rlProcUnknown82A272Init ; 82/A27A

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.wInput0,b
	sta aProcSystem.aBody0,b,x

	lda bBufferINIDISP
	bit #INIDISP_ForcedBlank
	bne +

	bit #INIDISP_Setting(False, 15)
	beq +

	lda #(`procFadeOut2)<<8
	sta lR44+1
	lda #<>procFadeOut2
	sta lR44
	jsl rlProcEngineCreateProc

	+
	rtl

rlProcUnknown82A272OnCycle ; 82/A29B

	.al
	.xl
	.autsiz
	.databank ?

	lda bBufferINIDISP
	bit #INIDISP_ForcedBlank
	bne +

	bit #INIDISP_Setting(False, 15)
	bne ++

	+
	lda aProcSystem.aBody0,b,x
	jsl rlUnknown80B554
	sei
	sep #$20
	lda bBufferNMITIMEN
	and #~(NMITIMEN_VCountIRQ | NMITIMEN_HCountIRQ)
	sta bBufferNMITIMEN
	sta NMITIMEN,b
	rep #$20
	jsl rlProcEngineFreeProc

	+
	rtl

aProcUnknown82A272Code ; 82/A2C1

	PROC_HALT

procUnknown82A2C3 .dstruct structProcInfo, "Bt", rlProcUnknown82A2C3Init, rlProcUnknown82A2C3OnCycle, aProcUnknown82A2C3Code ; 82/A2C3

rlProcUnknown82A2C3Init ; 82/A2CB

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.wInput0,b
	sta aProcSystem.aBody0,b,x

	lda aProcSystem.wInput1,b
	sta aProcSystem.aBody1,b,x

	lda aProcSystem.wInput2,b
	sta aProcSystem.aBody2,b,x

	lda aProcSystem.wInput3,b
	sta aProcSystem.aBody3,b,x

	rtl

rlProcUnknown82A2C3OnCycle ; 82/A2E4

	.al
	.xl
	.autsiz
	.databank ?

	lda aProcSystem.aBody3,b,x
	and #$FF00
	sta lR44+1

	lda aProcSystem.aBody2,b,x
	sta lR44

	phx
	jsl rlProcEngineFindProc
	plx
	bcs +

	phx
	lda aProcSystem.aBody0,b,x
	sta aProcSystem.wInput0,b

	lda aProcSystem.aBody3,b,x
	xba
	and #$FF00
	sta lR44+1

	lda aProcSystem.aBody1,b,x
	sta lR44

	jsl rlProcEngineCreateProc

	plx
	jsl rlProcEngineFreeProc

	+
	rtl

aProcUnknown82A2C3Code ; 82/A318

	PROC_HALT
