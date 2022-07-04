.include "../asm/QoL/NewOptionFixes.asm"

;	Remodeled Options setup

* = $02D4EC
.logical lorom($02D4EC, 1)

.al

lda #<>MovedOptions
sta lR25
lda #>`MovedOptions
sta lR25+1

.here

* = $02D53D
.logical lorom($02D53D, 1)

mvn #`MovedOptions,$7E

.here

* = $02DC93
.logical lorom($02DC93, 1)

lda #>`MovedOptions

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

	lda #>`MovedOptions
	sta lR18+1
	lda $A939
	sta lR18
	lda #$2180
	sta wUnknown000DE7
	ldx wR17
	lda $85D5C3,X
	tax
	stx $A9AB
	rtl


OptionGetAndSaveBankSwap

	.al
	.xl
	.autsiz

	sta wR16
	stz wR17 
	
	-
	ldx wR17 
	lda $A95F,X
	sta lR18
	jsr rsCopyOptionsPointerData

	ldx wR16
	lda  @w $0000,X
	sta wR0				; short pointer
	ldx wR17 
	pea <>(+)-1	
	jmp (wR0) 	; option getter 

	+
	inc wR17
	inc wR17 
	lda wR17
	cmp $A95D
	bne -
	rtl


rsCopyOptionsPointerData

	phb
	ldx lR18 
	ldy #$A937
	lda #$0025
	mvn #`MovedOptions, $7E
	plb
	rts 

.here

;	Moved Options pointers

* = $48CED2 		
.logical lorom($48CED2 , 1)

MovedOptions

options_pointers			.block

.word <>options_positions._AnimationOption 		; CEEC
.word <>options_positions._TerrainOption		; CF08
.word <>options_positions._UnitOption 			; CF24
.word <>options_positions._AutocursorOption 	; CF40
.word <>options_positions._TextSpeedOption 		; CF58
.word <>options_positions._UnitSpeedOption 		; CF74
.word <>options_positions._HiddenInfoOption 	; CF8C
.word <>options_positions._PrepsOption 			; CFAC
.word <>options_positions._AudioSettingOption 	; CFC8
.word <>options_positions._BGMOption 			; CFE0
.word <>options_positions._VolumeOption 		; CFF8
.word <>options_positions._TileSettingOption 	; D018
.word $0000

.bend

;	Positions of the options next to each setting

options_positions			.block

_AnimationOption
.word $0000
.word <>options_text._AnimationName
.word <>options_text._AnimationChoices
.word <>options_text._AnimationSubtext
.word <>options_text._AnimationTerrainUnitAutocursorGetter 	; Get set option  		   	  - Short pointer lorom($02E14C, 1)
.word <>options_text._AnimationTerrainUnitAutocursorSaver 	; Store newly selected option - Short pointer lorom($02E192, 1)
.word $38A0	;  Option icon 
.word $0003	;  Number of options
.word $0000	;  Position 1
.word $0001	;  Tiles to highlight
.word $0003	;  Position 2
.word $0002	;  Tiles to highlight
.word $0007	;  Position 3
.word $0004	;  Tiles to highlight

_TerrainOption
.word $0000
.word <>options_text._TerrainName
.word <>options_text._TerrainChoices
.word <>options_text._TerrainSubtext
.word <>options_text._AnimationTerrainUnitAutocursorGetter
.word <>options_text._AnimationTerrainUnitAutocursorSaver
.word $38A2	;  Option icon 
.word $0003	;  Number of options
.word $0000	;  Position 1
.word $0003	;  Tiles to highlight
.word $0005	;  Position 2
.word $0004	;  Tiles to highlight
.word $000B	;  Position 3 
.word $0002	;  Tiles to highlight

_UnitOption
.word $0000
.word <>options_text._UnitName
.word <>options_text._UnitChoices
.word <>options_text._UnitSubtext
.word <>options_text._AnimationTerrainUnitAutocursorGetter
.word <>options_text._AnimationTerrainUnitAutocursorSaver
.word $38A4	;  Option icon 
.word $0003	;  Number of options
.word $0000	;  Position 1
.word $0003	;  Tiles to highlight
.word $0005	;  Position 2
.word $0004	;  Tiles to highlight
.word $000B	;  Position 3 
.word $0002	;  Tiles to highlight

_AutocursorOption
.word $0000
.word <>options_text._AutocursorName
.word <>options_text._AutocursorChoices
.word <>options_text._AutocursorSubtext
.word <>options_text._AnimationTerrainUnitAutocursorGetter
.word <>options_text._AnimationTerrainUnitAutocursorSaver
.word $38A6	;  Option icon 
.word $0002	;  Number of options
.word $0000	;  Position 1
.word $0001	;  Tiles to highlight
.word $0003	;  Position 2
.word $0002	;  Tiles to highlight

_TextSpeedOption
.word $0000
.word <>options_text._TextSpeedName
.word <>options_text._TextSpeedChoices
.word <>options_text._TextSpeedSubtext
.word <>options_text._TextSpeedUnitSpeedHiddenInfoPrepsGetter ; D338
.word <>options_text._TextSpeedUnitSpeedHiddenInfoPrepsSaver
.word $38A8	;  Option icon 
.word $0003	;  Number of options
.word $0000	;  Position 1
.word $0003	;  Tiles to highlight
.word $0005	;  Position 2
.word $0004	;  Tiles to highlight
.word $000B	;  Position 3
.word $0002	;  Tiles to highlight

_UnitSpeedOption
.word $0000
.word <>options_text._UnitSpeedName
.word <>options_text._UnitSpeedChoices
.word <>options_text._UnitSpeedSubtext
.word <>options_text._TextSpeedUnitSpeedHiddenInfoPrepsGetter
.word <>options_text._TextSpeedUnitSpeedHiddenInfoPrepsSaver
.word $38AA	;  Option icon 
.word $0002	;  Number of options
.word $0000	;  Position 1
.word $0004	;  Tiles to highlight
.word $0006	;  Position 2
.word $0002	;  Tiles to highlight

_HiddenInfoOption
.word $0000
.word <>options_text._HiddenInfoName
.word <>options_text._HiddenInfoChoices
.word <>options_text._HiddenInfoSubtext
.word <>options_text._TextSpeedUnitSpeedHiddenInfoPrepsGetter
.word <>options_text._TextSpeedUnitSpeedHiddenInfoPrepsSaver
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

_PrepsOption
.word $0000
.word <>options_text._PrepsName
.word <>options_text._PrepsChoices
.word <>options_text._PrepsSubtext
.word <>options_text._TextSpeedUnitSpeedHiddenInfoPrepsGetter
.word <>options_text._TextSpeedUnitSpeedHiddenInfoPrepsSaver
.word $38E2	;  Option icon 
.word $0003	;  Number of options
.word $0000	;  Position 1
.word $0001	;  Tiles to highlight
.word $0003	;  Position 2
.word $0001	;  Tiles to highlight
.word $0006	;  Position 3
.word $0001	;  Tiles to highlight

_AudioSettingOption
.word $0000
.word <>options_text._AudioSettingName
.word <>options_text._AudioSettingChoices
.word <>options_text._AudioSettingSubtext
.word <>options_text._AudioBGMVolumeGetter
.word <>options_text._AudioBGMVolumeSaver
.word $38AC	;  Option icon 
.word $0002	;  Number of options
.word $0000	;  Position 1
.word $0003	;  Tiles to highlight
.word $0005	;  Position 2
.word $0003	;  Tiles to highlight

_BGMOption
.word $0000
.word <>options_text._BGMName
.word <>options_text._BGMChoices
.word <>options_text._BGMSubtext
.word <>options_text._AudioBGMVolumeGetter
.word <>options_text._AudioBGMVolumeSaver
.word $38AE	;  Option icon 
.word $0002	;  Number of options
.word $0000	;  Position 1
.word $0001	;  Tiles to highlight
.word $0003	;  Position 2
.word $0002	;  Tiles to highlight

_VolumeOption
.word $0000
.word <>options_text._VolumeName
.word <>options_text._VolumeChoices
.word <>options_text._VolumeSubtext
.word <>options_text._AudioBGMVolumeGetter
.word <>options_text._AudioBGMVolumeSaver
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

_TileSettingOption
.word $0000
.word <>options_text._TileSettingName
.word <>options_text._TileSettingChoices
.word <>options_text._TileSettingSubtext
.word <>options_text._TileSettingGetter
.word <>options_text._TileSettingSaver
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

.bend

;	Options & Settings names and descriptions
;	("Animation" is an option. "On", "Off" and "By Unit" are settings.)

;	Option character limit: 18
;	This can be expanded by pushing the position of the settings further right.

;	Settings character limit: 30 characters total for all settings
;	Spaces after a settings count for 4 characters (5 if the setting has an odd number of characters)

;	Description character limit: 57

options_text			.block

_AnimationName
.text "An{im}ations"
.word $0000

_AnimationSubtext
.text "Turn attack an{im}ations on or off"
.word $0000

_AnimationChoices
.text "On"
.word $2020
.word $2020
.text "Off "
.word $2020
.word $2020
.text "By Unit "
.word $0000


_TerrainName
.text "(Map Data "
.word $0000

_TerrainSubtext
.text "Turn terrain ]windo]w and {H}{P} bars on or off "
.word $0000

_TerrainChoices
_UnitChoices
.text "Detail"
.word $2020
.word $2020
.text "Si[mple "
.word $2020
.word $2020
.text "Off "
.word $0000


_UnitName
.text "Units )Windo12"
.word $0000

_UnitSubtext
.text "Set the unit ]windo]w's level of detail "
.word $0000


_AutocursorName
.text "Autocursor"
.word $0000

_AutocursorSubtext
.text "Set cursor to start on Leif "
.word $0000

_AutocursorChoices
_BGMChoices
.text "On"
.word $2020
.word $2020
.text "Off "
.word $0000


_TextSpeedName
.text "(Message Speed"
.word $0000

_TextSpeedSubtext
.text "Adjust ho]w fast text [messages display "
.word $0000

_TextSpeedChoices
.text "Slo12 "
.word $2020
.word $2020
_UnitSpeedChoices
.text "+Nor[mal"
.word $2020
.word $2020
.text "Fast"
.word $0000


_UnitSpeedName
.text "Ga[me Speed "
.word $0000

_UnitSpeedSubtext
.text "Adjust ho]w fast the ga[me progresses "
.word $0000


_HiddenInfoName
.text "Hidden Data "
.word $0000

_HiddenInfoSubtext
.text "{0}: +None {1}: Inventory {2}: Chapter {3}: Hidden Skills "
.word $0000

_HiddenInfoChoices
.text "{0}"
.word $2020
.word $2020
.text "{1}"
.word $2020
.word $2020
.text "{2}"
.word $2020
.word $2020
.text "{3}"
.word $0000


_PrepsName
.text "Deploy[ment "
.word $0000

_PrepsSubtext
.text "{0}: Default {1}: Display units {2}: Rearrange units "
.word $0000

_PrepsChoices
.text "{0}"
.word $2020
.word $2020
.text "{1}"
.word $2020
.word $2020
.text "{2}"
.word $0000


_AudioSettingName
.text "Audio "
.word $0000

_AudioSettingSubtext
.text "Adjust audio settings "
.word $0000

_AudioSettingChoices
.text "Stereo"
.word $2020
.word $2020
.text "(Mono "
.word $0000


_BGMName
.text "(Music"
.word $0000

_BGMSubtext
.text "Turn [music on or off "
.word $0000


_VolumeName
.text "Sound Effects "
.word $0000

_VolumeSubtext
.text "Adjust volu[me of sound effects "
.word $0000

_VolumeChoices
.text "{note}{note}{note}"
.word $2020
.word $2020
.text "{note}{note}"
.word $2020
.word $2020
.text "{note}"
.word $2020
.word $2020
.text "Off "
.word $0000


_TileSettingName
.text ")Windo]w Pattern"
.word $0000

_TileSettingSubtext
.text "Change the [menu ]windo12 "
.word $0000

_TileSettingChoices
.word $5082
.word $2020
.word $2020
.word $5182
.word $2020
.word $2020
.word $5282
.word $2020
.word $2020
.word $5382
.word $2020
.word $2020
.word $5482
.word $2020
.word $2020
.word $0000


_AnimationTerrainUnitAutocursorGetter

	txa
	lsr
	lsr
	lsr
	tax 
	lda aOptions.wAnimationOption 
	sta $A97F,X
	rts 

_TextSpeedUnitSpeedHiddenInfoPrepsGetter

	txa
	lsr
	lsr
	lsr
	tax 
	lda aOptions.wTerrainWindowOption 
	sta $A97F+1,X
	rts 

_AudioBGMVolumeGetter

	txa
	lsr
	lsr
	lsr
	tax 
	lda aOptions.wBurstWindowOption
	sta $A97F+2,X
	rts 

_TileSettingGetter
	lda aOptions.wWindowOption
	sta $A991
	rts

_AnimationTerrainUnitAutocursorSaver

	txa
	lsr
	lsr
	lsr
	tax 
	lda $A97F,X
	sta aOptions.wAnimationOption
	rts 

_TextSpeedUnitSpeedHiddenInfoPrepsSaver

	txa
	lsr
	lsr
	lsr
	tax 
	lda $A97F+1,X
	sta aOptions.wTerrainWindowOption
	rts 

_AudioBGMVolumeSaver

	txa
	lsr
	lsr
	lsr
	tax 
	lda $A97F+2,X
	sta aOptions.wBurstWindowOption
	rts 

_TileSettingSaver
	rts

.bend

aHighAndUnHighlightTilesCoordTable ; 85D717 vanilla
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

; Window color descriptions

options_tint_text			.block

_UpperTintName
.text "Set color for the upper layer "
.word $0000
_LowerTintName
.text "Set color for the lo]wer layer"
.word $0000
_RestoreName
.text "Restore color to default"
.word $0000

.bend

.here

; Window color descriptions pointers

* = $02D280
.logical lorom($02D280, 1)

options_tint_pointers		.block

.word <>options_tint_text._UpperTintName
.word <>options_tint_text._UpperTintName
.word <>options_tint_text._UpperTintName
.word <>options_tint_text._LowerTintName
.word <>options_tint_text._LowerTintName
.word <>options_tint_text._LowerTintName
.word <>options_tint_text._RestoreName

.bend
.here

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
.text ")Windo]w Color"
.word $0000

UpperSettingName
.text "Upper "
.word $0000

LowerSettingName
.text "Lo]wer"
.word $0000

DefaultSettingName
.text "Default "
.word $0000

.here

;	Window default color
;	Counted from left to right. Rightmost value is 0. Leftmost is 24.

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