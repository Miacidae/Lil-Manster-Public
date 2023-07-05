
rlFadeInByTimer ; 80/AB89

	.autsiz
	.databank ?

	; Fades in with settable time between changes

	; Inputs:
	; A: Frames between intensity step

	; Outputs:
	; None

	phb
	php
	phk
	plb

	.databank `*

	sep #$20
	sta wScreenFadingTimeIncrement,b

	; Check if we need to change brightness

	lda wScreenFadingFlag,b
	bpl +

	; Reset timer and flag

	lda wScreenFadingTimeIncrement,b
	sta wScreenFadingTimer,b
	stz wScreenFadingFlag,b

	+
	lda bBufferINIDISP
	and #15
	cmp #INIDISP_Setting(False, 15)
	beq _MaxBrightness ; If max brightness

	; dec timer

	dec wScreenFadingTimer,b
	bne _NotTime

	; If time to change brightness

	; reset timer

	lda wScreenFadingTimeIncrement,b
	sta wScreenFadingTimer,b

	; increment brightness

	lda bBufferINIDISP
	inc a
	and #15
	sta bBufferINIDISP

	_NotTime
	plp
	plb
	clc
	rtl

	_MaxBrightness
	lda #-1
	sta wScreenFadingFlag,b
	plp
	plb
	sec
	rtl

rlFadeOutByTimer ; 80/ABC7

	.autsiz
	.databank ?

	; Fades out with settable time between changes

	; Inputs:
	; A: Frames between intensity step

	; Outputs:
	; None

	phb
	php
	phk
	plb

	.databank `*

	sep #$20
	sta wScreenFadingTimeIncrement,b

	; Check if we need to change brightness

	lda wScreenFadingFlag,b
	bpl +

	; Reset timer and flag

	lda wScreenFadingTimeIncrement,b
	sta wScreenFadingTimer,b
	stz wScreenFadingFlag,b

	+
	lda bBufferINIDISP
	and #15
	beq _MinBrightness ; If min brightness

	; dec timer

	dec wScreenFadingTimer,b
	bne _NotTime

	; If time to change brightness

	; reset timer

	lda wScreenFadingTimeIncrement,b
	sta wScreenFadingTimer,b

	; decrement brightness

	lda bBufferINIDISP
	dec a
	and #15
	sta bBufferINIDISP

	_NotTime
	plp
	plb
	clc
	rtl

	_MinBrightness
	lda #-1
	sta wScreenFadingFlag,b
	lda #INIDISP_Setting(True)
	sta bBufferINIDISP
	plp
	plb
	sec
	rtl

rlFadeOutColorByTimer ; 80/AC07

	.autsiz
	.databank ?

	; Fades colors out with settable time between changes

	; Inputs:
	; A: Frames between intensity step

	; Outputs:
	; None

	phb
	php
	phk
	plb

	.databank `*

	sep #$20
	sta wScreenFadingTimeIncrement,b

	; Check if we need to change brightness

	lda wScreenFadingFlag,b
	bpl +

	; Reset timer

	lda wScreenFadingTimeIncrement,b
	sta wScreenFadingTimer,b
	lda #COLDATA_Setting(31, True, True, True)
	sta bBufferCOLDATA_0 ; color base?
	stz bBufferCOLDATA_1 ; b?
	stz bBufferCOLDATA_2 ; g?
	stz wScreenFadingFlag,b

	+
	lda bBufferCOLDATA_0 ; get intensity of colors
	and #COLDATA_Intensity
	beq _MinIntensity

	; dec timer

	dec wScreenFadingTimer,b
	bne +

	; decrement intensity and set all channels to be affected

	lda wScreenFadingTimeIncrement,b
	sta wScreenFadingTimer,b
	lda bBufferCOLDATA_0
	and #COLDATA_Intensity
	dec a
	ora #COLDATA_Setting(0, True, True, True)
	sta bBufferCOLDATA_0

	+
	plp
	plb
	clc
	rtl

	_MinIntensity
	lda #-1
	sta wScreenFadingFlag,b
	plp
	plb
	sec
	rtl

rlFadeInColorByTimer ; 80/AC4D

	.autsiz
	.databank ?

	; Fades colors in with settable time between changes

	; Inputs:
	; A: Frames between intensity step

	; Outputs:
	; None

	phb
	php
	phk
	plb

	.databank `*

	sep #$20
	sta wScreenFadingTimeIncrement,b

	; Check if we need to change brightness

	lda wScreenFadingFlag,b
	bpl +

	; Reset timer

	lda wScreenFadingTimeIncrement,b
	sta wScreenFadingTimer,b
	lda #COLDATA_Setting(0, True, True, True)
	sta bBufferCOLDATA_0
	stz bBufferCOLDATA_1
	stz bBufferCOLDATA_2
	stz wScreenFadingFlag,b

	+
	lda bBufferCOLDATA_0
	and #COLDATA_Intensity
	cmp #COLDATA_Intensity
	beq _MaxIntensity

	dec wScreenFadingTimer,b
	bne _NotTime

	lda wScreenFadingTimeIncrement,b
	sta wScreenFadingTimer,b
	lda bBufferCOLDATA_0
	and #COLDATA_Intensity
	inc a
	ora #COLDATA_Setting(0, True, True, True)
	sta bBufferCOLDATA_0

	_NotTime
	plp
	plb
	clc
	rtl

	_MaxIntensity
	lda #-1
	sta wScreenFadingFlag,b
	plp
	plb
	sec
	rtl
