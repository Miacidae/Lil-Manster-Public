
;	Remodeled Options setup

* = $02D4EC
.logical lorom($02D4EC, 1)

.al

lda #<>aOptionsMenuPointers
sta lR25
lda #>`aOptionsMenuPointers
sta lR25+1

.here

* = $02D53D
.logical lorom($02D53D, 1)

mvn #`aOptionsMenuPointers,$7E

.here

* = $02DC93
.logical lorom($02DC93, 1)

lda #>`aOptionsMenuPointers

.here


* = $02D675 	; vanilla 02D664
.logical lorom($02D675, 1)

OptionPointerNameBankSwapStart

jsl OptionPointerNameBankSwap
jsl $87E728
rts 

.here


* = $02E123
.logical lorom($02E123, 1)

jsl OptionGetAndSaveBankSwap
rts 

.fill $85E14C - *, $FF

.here

* = $48CE00 ; Somewhere in freespace
.logical lorom($48CE00, 1)

OptionPointerNameBankSwap

	lda #>`aOptionsMenuPointers
	sta lR18+1
	lda $A939
	sta lR18
	lda #$2180
	sta aCurrentTilemapInfo.wBaseTile
	ldx wR17
	lda $85D5C3,X
	tax
	stx $A9AB
	rtl


OptionGetAndSaveBankSwap

	.al
	.xl
	.autsiz

	.databank `aOptionsWindowMenuLinePointers

	sta wR16
	stz wR17 
	
	-
	ldx wR17 
	lda aOptionsWindowMenuLinePointers,X
	sta lR18
	jsr rsCopyOptionsPointerData

	ldx wR16
	lda $0000,b,X
	sta wR0				; short pointer
	ldx wR17 
	pea <>(+)-1	
	jmp (wR0) 	; option getter 

	+
	inc wR17
	inc wR17 
	lda wR17
	cmp $A95D,b
	bne -
	rtl


rsCopyOptionsPointerData

	phb
	ldx lR18 
	ldy #<>aOptionsWindowTempMenuLine
	lda #$0025
	mvn #`aOptionsMenuPointers, $7E
	plb
	rts 

.here

;	Moved Options pointers

	.section OptionsMenuPointers
		
		.word <>aOptionsMenuAnimationOption 			; CEEC
		.word <>aOptionsMenuTerrainOption				; CF08
		.word <>aOptionsMenuUnitOption 					; CF24
		.word <>aOptionsMenuAutocursorOption 			; CF40
		.word <>aOptionsMenuTextSpeedOption 			; CF58
		.word <>aOptionsMenuUnitSpeedOption 			; CF74
		.word <>aOptionsMenuHiddenInfoOption 			; CF8C
		.word <>aOptionsMenuPrepsOption 				; CFAC
		.word <>aOptionsMenuAudioSettingOption 			; CFC8
		.word <>aOptionsMenuBGMOption 					; CFE0
		.word <>aOptionsMenuVolumeOption 				; CFF8
		.word <>aOptionsMenuTileSettingOption 			; D018
		.word 0

	.endsection OptionsMenuPointers

;	Positions of the options next to each setting

	.section OptionMenuDataSection

		aOptionsMenuAnimationOption
		.word $0000
		.word <>aOptionMenuAnimationName
		.word <>aOptionMenuAnimationChoices
		.word <>aOptionMenuAnimationSubtext
		.word <>aOptionMenuAnimationTerrainUnitAutocursorGetter 	; Get option
		.word <>aOptionMenuAnimationTerrainUnitAutocursorSaver 		; Store newly selected option
		.word $38A0	;  Option icon 
		.word $0003	;  Number of options
		.word $0000	;  Position 1
		.word $0001	;  Tiles to highlight
		.word $0003	;  Position 2
		.word $0002	;  Tiles to highlight
		.word $0007	;  Position 3
		.word $0004	;  Tiles to highlight
		

		aOptionsMenuTerrainOption
		.word $0000
		.word <>aOptionMenuTerrainName
		.word <>aOptionMenuTerrainChoices
		.word <>aOptionMenuTerrainSubtext
		.word <>aOptionMenuAnimationTerrainUnitAutocursorGetter
		.word <>aOptionMenuAnimationTerrainUnitAutocursorSaver
		.word $38A2	;  Option icon 
		.word $0003	;  Number of options
		.word $0000	;  Position 1
		.word $0003	;  Tiles to highlight
		.word $0005	;  Position 2
		.word $0004	;  Tiles to highlight
		.word $000B	;  Position 3 
		.word $0002	;  Tiles to highlight
		
		aOptionsMenuUnitOption
		.word $0000
		.word <>aOptionMenuUnitName
		.word <>aOptionMenuUnitChoices
		.word <>aOptionMenuUnitSubtext
		.word <>aOptionMenuAnimationTerrainUnitAutocursorGetter
		.word <>aOptionMenuAnimationTerrainUnitAutocursorSaver
		.word $38A4	;  Option icon 
		.word $0003	;  Number of options
		.word $0000	;  Position 1
		.word $0003	;  Tiles to highlight
		.word $0005	;  Position 2
		.word $0004	;  Tiles to highlight
		.word $000B	;  Position 3 
		.word $0002	;  Tiles to highlight
		
		aOptionsMenuAutocursorOption
		.word $0000
		.word <>aOptionMenuAutocursorName
		.word <>aOptionMenuAutocursorChoices
		.word <>aOptionMenuAutocursorSubtext
		.word <>aOptionMenuAnimationTerrainUnitAutocursorGetter
		.word <>aOptionMenuAnimationTerrainUnitAutocursorSaver
		.word $38A6	;  Option icon 
		.word $0002	;  Number of options
		.word $0000	;  Position 1
		.word $0001	;  Tiles to highlight
		.word $0003	;  Position 2
		.word $0002	;  Tiles to highlight
		
		aOptionsMenuTextSpeedOption
		.word $0000
		.word <>aOptionMenuTextSpeedName
		.word <>aOptionMenuTextSpeedChoices
		.word <>aOptionMenuTextSpeedSubtext
		.word <>aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsGetter
		.word <>aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsSaver
		.word $38A8	;  Option icon 
		.word $0003	;  Number of options
		.word $0000	;  Position 1
		.word $0003	;  Tiles to highlight
		.word $0005	;  Position 2
		.word $0004	;  Tiles to highlight
		.word $000B	;  Position 3
		.word $0002	;  Tiles to highlight
		
		aOptionsMenuUnitSpeedOption
		.word $0000
		.word <>aOptionMenuUnitSpeedName
		.word <>aOptionMenuUnitSpeedChoices
		.word <>aOptionMenuUnitSpeedSubtext
		.word <>aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsGetter
		.word <>aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsSaver
		.word $38AA	;  Option icon 
		.word $0002	;  Number of options
		.word $0000	;  Position 1
		.word $0004	;  Tiles to highlight
		.word $0006	;  Position 2
		.word $0002	;  Tiles to highlight
		
		aOptionsMenuHiddenInfoOption
		.word $0000
		.word <>aOptionMenuHiddenInfoName
		.word <>aOptionMenuHiddenInfoChoices
		.word <>aOptionMenuHiddenInfoSubtext
		.word <>aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsGetter
		.word <>aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsSaver
		.word $38E0	;  Option icon 
		.word $0004	;  Number of options
		.word $0000	;  Position 1
		.word $0001	;  Tiles to highlight
		.word $0003	;  Position 2
		.word $0001	;  Tiles to highlight
		.word $0006	;  Position 3
		.word $0001	;  Tiles to highlight
		.word $0009 ;  Position 4
		.word $0001	;  Tiles to highlight
		
		aOptionsMenuPrepsOption
		.word $0000
		.word <>aOptionMenuPrepsName
		.word <>aOptionMenuPrepsChoices
		.word <>aOptionMenuPrepsSubtext
		.word <>aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsGetter
		.word <>aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsSaver
		.word $38E2	;  Option icon 
		.word $0003	;  Number of options
		.word $0000	;  Position 1
		.word $0001	;  Tiles to highlight
		.word $0003	;  Position 2
		.word $0001	;  Tiles to highlight
		.word $0006	;  Position 3
		.word $0001	;  Tiles to highlight
		
		aOptionsMenuAudioSettingOption
		.word $0000
		.word <>aOptionMenuAudioSettingName
		.word <>aOptionMenuAudioSettingChoices
		.word <>aOptionMenuAudioSettingSubtext
		.word <>aOptionMenuAudioBGMVolumeGetter
		.word <>aOptionMenuAudioBGMVolumeSaver
		.word $38AC	;  Option icon 
		.word $0002	;  Number of options
		.word $0000	;  Position 1
		.word $0003	;  Tiles to highlight
		.word $0005	;  Position 2
		.word $0003	;  Tiles to highlight
		
		aOptionsMenuBGMOption
		.word $0000
		.word <>aOptionMenuBGMName
		.word <>aOptionMenuBGMChoices
		.word <>aOptionMenuBGMSubtext
		.word <>aOptionMenuAudioBGMVolumeGetter
		.word <>aOptionMenuAudioBGMVolumeSaver
		.word $38AE	;  Option icon 
		.word $0002	;  Number of options
		.word $0000	;  Position 1
		.word $0001	;  Tiles to highlight
		.word $0003	;  Position 2
		.word $0002	;  Tiles to highlight
		
		aOptionsMenuVolumeOption
		.word $0000
		.word <>aOptionMenuVolumeName
		.word <>aOptionMenuVolumeChoices
		.word <>aOptionMenuVolumeSubtext
		.word <>aOptionMenuAudioBGMVolumeGetter
		.word <>aOptionMenuAudioBGMVolumeSaver
		.word $38C0	;  Option icon 
		.word $0004	;  Number of options
		.word $0000	;  Position 1
		.word $0003	;  Tiles to highlight
		.word $0005	;  Position 2
		.word $0002	;  Tiles to highlight
		.word $0009	;  Position 3
		.word $0001	;  Tiles to highlight
		.word $000C	;  Position 4
		.word $0002	;  Tiles to highlight
		
		aOptionsMenuTileSettingOption
		.word $0000
		.word <>aOptionMenuTileSettingName
		.word <>aOptionMenuTileSettingChoices
		.word <>aOptionMenuTileSettingSubtext
		.word <>aOptionMenuTileSettingGetter
		.word <>aOptionMenuTileSettingSaver
		.word $38C2	;  Option icon 
		.word $0005	;  Number of options
		.word $0000	;  Position 1
		.word $0001	;  Tiles to highlight
		.word $0003	;  Position 2
		.word $0001	;  Tiles to highlight
		.word $0006	;  Position 3 
		.word $0001	;  Tiles to highlight
		.word $0009	;  Position 4
		.word $0001	;  Tiles to highlight
		.word $000C	;  Position 5
		.word $0001	;  Tiles to highlight
		
	.endsection OptionMenuDataSection




;	Options & Settings names and descriptions
;	("Animation" is an option. "On", "Off" and "By Unit" are settings.)

;	Option character limit: 18
;	This can be expanded by pushing the position of the settings further right.

;	Settings character limit: 30 characters total for all settings
;	Spaces after a settings count for 4 characters (5 if the setting has an odd number of characters)

;	Description character limit: 57

	.section OptionMenuTextSection

		aOptionMenuAnimationName
		.text "An{im}ations\n"
		
		aOptionMenuAnimationSubtext
		.text "Turn attack an{im}ations on or off\n"
		
		aOptionMenuAnimationChoices
		.text "On"
		.word $2020
		.word $2020
		.text "Off "
		.word $2020
		.word $2020
		.text "By Unit \n"
		
		
		aOptionMenuTerrainName
		.text "(Map Data \n"
		
		aOptionMenuTerrainSubtext
		.text "Turn terrain ]windo]w and {H}{P} bars on or off \n"
		
		aOptionMenuTerrainChoices
		aOptionMenuUnitChoices
		.text "Detail"
		.word $2020
		.word $2020
		.text "Si[mple "
		.word $2020
		.word $2020
		.text "Off \n"
		
		aOptionMenuUnitName
		.text "Units )Windo12\n"
		
		aOptionMenuUnitSubtext
		.text "Set the unit ]windo]w's level of detail \n"
		
		aOptionMenuAutocursorName
		.text "Autocursor\n"
		
		aOptionMenuAutocursorSubtext
		.text "Set cursor to start on Leif \n"
		
		aOptionMenuAutocursorChoices
		aOptionMenuBGMChoices
		.text "On"
		.word $2020
		.word $2020
		.text "Off \n"
		
		
		aOptionMenuTextSpeedName
		.text "(Message Speed\n"
		
		aOptionMenuTextSpeedSubtext
		.text "Adjust ho]w fast text [messages display \n"
		
		aOptionMenuTextSpeedChoices
		.text "Slo12 "
		.word $2020
		.word $2020
		aOptionMenuUnitSpeedChoices
		.text "+Nor[mal"
		.word $2020
		.word $2020
		.text "Fast\n"
		
		aOptionMenuUnitSpeedName
		.text "Ga[me Speed \n"
		
		aOptionMenuUnitSpeedSubtext
		.text "Adjust ho]w fast the ga[me progresses \n"
		
		aOptionMenuHiddenInfoName
		.text "Hidden Data \n"
		
		aOptionMenuHiddenInfoSubtext
		.text "{0}: +None {1}: Inventory {2}: Chapter {3}: Hidden Skills \n"
		
		aOptionMenuHiddenInfoChoices
		.text "{0}"
		.word $2020
		.word $2020
		.text "{1}"
		.word $2020
		.word $2020
		.text "{2}"
		.word $2020
		.word $2020
		.text "{3}\n"
		
		aOptionMenuPrepsName
		.text "Deploy[ment \n"
		
		aOptionMenuPrepsSubtext
		.text "{0}: Default {1}: Display units {2}: Rearrange units \n"
		
		aOptionMenuPrepsChoices
		.text "{0}"
		.word $2020
		.word $2020
		.text "{1}"
		.word $2020
		.word $2020
		.text "{2}\n"
		
		aOptionMenuAudioSettingName
		.text "Audio \n"
		
		aOptionMenuAudioSettingSubtext
		.text "Adjust audio settings \n"
		
		aOptionMenuAudioSettingChoices
		.text "Stereo"
		.word $2020
		.word $2020
		.text "(Mono \n"
		
		aOptionMenuBGMName
		.text "(Music\n"
		
		aOptionMenuBGMSubtext
		.text "Turn [music on or off \n"
		
		aOptionMenuVolumeName
		.text "Sound Effects \n"
		
		aOptionMenuVolumeSubtext
		.text "Adjust volu[me of sound effects \n"
		
		aOptionMenuVolumeChoices
		.text "{note}{note}{note}"
		.word $2020
		.word $2020
		.text "{note}{note}"
		.word $2020
		.word $2020
		.text "{note}"
		.word $2020
		.word $2020
		.text "Off \n"
		
		aOptionMenuTileSettingName
		.text ")Windo]w Pattern\n"
		
		aOptionMenuTileSettingSubtext
		.text "Change the [menu ]windo12 \n"
		
		aOptionMenuTileSettingChoices
		.text "{1}"
		.word $2020
		.word $2020
		.text "{2}"
		.word $2020
		.word $2020
		.text "{3}"
		.word $2020
		.word $2020
		.text "{4}"
		.word $2020
		.word $2020
		.text "{5}"
		.word $2020
		.word $2020
		.text "\n"

	.endsection OptionMenuTextSection

	.section OptionMenuGettersSaversSection

		.databank ?

		aOptionMenuAnimationTerrainUnitAutocursorGetter
		
			txa
			lsr
			lsr
			lsr
			tax 
			lda aOptions.wAnimation 
			sta $A97F,b,X
			rts 
		
		aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsGetter
		
			txa
			lsr
			lsr
			lsr
			tax 
			lda aOptions.wTerrainWindow 
			sta $A97F+1,b,X
			rts 
		
		aOptionMenuAudioBGMVolumeGetter
		
			txa
			lsr
			lsr
			lsr
			tax 
			lda aOptions.wBurstWindow
			sta $A97F+2,b,X
			rts 
		
		aOptionMenuTileSettingGetter
			lda aOptions.wBackground
			sta $A991,b
			rts
		
		aOptionMenuAnimationTerrainUnitAutocursorSaver
		
			txa
			lsr
			lsr
			lsr
			tax 
			lda $A97F,b,X
			sta aOptions.wAnimation
			rts 
		
		aOptionMenuTextSpeedUnitSpeedHiddenInfoPrepsSaver
		
			txa
			lsr
			lsr
			lsr
			tax 
			lda $A97F+1,b,X
			sta aOptions.wTerrainWindow
			rts 
		
		aOptionMenuAudioBGMVolumeSaver
		
			txa
			lsr
			lsr
			lsr
			tax 
			lda $A97F+2,b,X
			sta aOptions.wBurstWindow
			rts 
		
		aOptionMenuTileSettingSaver
			rts

	.endsection OptionMenuGettersSaversSection

	.section OptionMenuHighlightSection

		aHighAndUnHighlightTilesCoordTable
		; +$C0 to the next entry 

		.word $0160 ; animation
		.word $0220 ; terrain 
		.word $02E0 ; unit
		.word $03A0 ; autocursor
		.word $0460 ; text speed
		.word $0520 ; unit speed
		.word $05E0 ; hidden info
		.word $06A0 ; preps
		.word $0760 ; audio
		.word $0820 ; BGM
		.word $08E0 ; volume
		.word $09A0 ; tile settings

	.endsection OptionMenuHighlightSection


; Window color descriptions

	.section OptionMenuTintTextSection

		aOptionMenuTintUpperTintName
		.text "Set color for the upper layer \n"

		aOptionMenuTintLowerTintName
		.text "Set color for the lo]wer layer\n"

		aOptionMenuTintRestoreName
		.text "Restore color to default\n"

	.endsection OptionMenuTintTextSection


; Window color descriptions pointers

	.section OptionsMenuTintPointersSection

		.word <>aOptionMenuTintUpperTintName
		.word <>aOptionMenuTintUpperTintName
		.word <>aOptionMenuTintUpperTintName
		.word <>aOptionMenuTintLowerTintName
		.word <>aOptionMenuTintLowerTintName
		.word <>aOptionMenuTintLowerTintName
		.word <>aOptionMenuTintRestoreName

	.endsection OptionsMenuTintPointersSection



; Window color labels pointers

* = $02D733
.logical lorom($02D733, 1)

.word <>WindowColorName

.here

* = $02D739
.logical lorom($02D739, 1)

.word <>UpperSettingName

.here

* = $02D73F
.logical lorom($02D73F, 1)

.word <>LowerSettingName

.here

* = $02D745
.logical lorom($02D745, 1)

.word <>DefaultSettingName

.here

;	Window color labels

* = $02D749
.logical lorom($02D749, 1)

WindowColorName
.text ")Windo]w Color\n"

UpperSettingName
.text "Upper \n"

LowerSettingName
.text "Lo]wer\n"

DefaultSettingName
.text "Default \n"

.here

;	Window default color
;	Counted from right to left. Rightmost value is 0. Leftmost is 24.

* = $0295E5
.logical lorom($0295E5, 1)

Setting1
.word 18
.word 15
.word 12
.word 19
.word 19
.word 15

Setting2
.word 00
.word 00
.word 00
.word 15
.word 15
.word 15

Setting3
.word 04
.word 08
.word 14
.word 15
.word 20
.word 24

Setting4
.word 23
.word 23
.word 23
.word 08
.word 08
.word 08

Setting5
.word 00
.word 08
.word 04
.word 06
.word 00
.word 11

.here