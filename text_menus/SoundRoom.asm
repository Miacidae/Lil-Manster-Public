;	Controls text pointers

* = $07E7FB
.logical lorom($07E7FB, 1)
.byte `SRTitle
.here

* = $07E7FF
.logical lorom($07E7FF, 1)
.word <>SRTitle
.here

* = $07E824
.logical lorom($07E824, 1)
.byte `SRAButton
.here

* = $07E828
.logical lorom($07E828, 1)
.word <>SRAButton
.here

* = $07E847
.logical lorom($07E847, 1)
.byte `SRBButton
.here

* = $07E84B
.logical lorom($07E84B, 1)
.word <>SRBButton
.here

* = $07E86A
.logical lorom($07E86A, 1)
.byte `SRStartButton
.here

* = $07E86E
.logical lorom($07E86E, 1)
.word <>SRStartButton
.here

;	Controls text

* = $475580
.logical lorom($475580, 1)

SRTitle
.text "     Sound Roo{m}"	; Character limit: 18. Use spaces to center it.
.word $0000

SRAButton
.text "{A} to play"			; Character limit: 25
.word $0000

SRBButton
.text "{B} to stop"			; Character limit: 25
.word $0000

SRStartButton
.text "Start to exit "		; Character limit: 25
.word $0000

.here

;	Categories pointers

* = $07F253
.logical lorom($07F253, 1)

sound_categories_pointers		.block

.word	<>category_names._category00_data
.word	<>category_names._category01_data
.word	<>category_names._category02_data
.word	<>category_names._category03_data
.word	<>category_names._category04_data
.word	<>category_names._category05_data
.word	<>category_names._category06_data
.word	<>category_names._category07_data

.bend
.here

;	Categories text
;	Character limit: 25. An ending space to complete the last tile doesn't count as a character.

* = $07F263
.logical lorom($07F263, 1)

category_names		.block
	
_category00_data
	.text "Thracia {7}{7}{6}"
	.word $0000

_category01_data
	.text "Leif's Search for Victory "
	.word $0000

_category02_data
	.text "Pressing Threat "
	.word $0000

_category03_data
	.text "Serving Justice "
	.word $0000

_category04_data
	.text "A[midst the Battle"
	.word $0000

_category05_data
	.text "Chapter End "
	.word $0000

_category06_data
	.text "(Mid Chapter"
	.word $0000

_category07_data
	.text "Finale"
	.word $0000

.bend
.here

;	Track name pointers

* = $07EB69
.logical lorom($07EB69, 1)

sound_tracks_pointers		.block

.word	<>track_names._track01_data
.word	<>track_names._track02_data
.word	<>track_names._track03_data
.word	<>track_names._track04_data
.word	<>track_names._track05_data
.word	<>track_names._track06_data
.word	<>track_names._track07_data
.word	<>track_names._track08_data
.word	<>track_names._track09_data
.word	<>track_names._track10_data
.word	<>track_names._track11_data
.word	<>track_names._track12_data
.word	<>track_names._track13_data
.word	<>track_names._track14_data
.word	<>track_names._track15_data
.word	<>track_names._track16_data
.word	<>track_names._track17_data
.word	<>track_names._track18_data
.word	<>track_names._track19_data
.word	<>track_names._track20_data
.word	<>track_names._track21_data
.word	<>track_names._track22_data
.word	<>track_names._track23_data
.word	<>track_names._track24_data
.word	<>track_names._track25_data
.word	<>track_names._track26_data
.word	<>track_names._track27_data
.word	<>track_names._track28_data
.word	<>track_names._track29_data
.word	<>track_names._track30_data
.word	<>track_names._track31_data
.word	<>track_names._track32_data
.word	<>track_names._track33_data
.word	<>track_names._track34_data
.word	<>track_names._track35_data
.word	<>track_names._track36_data
.word	<>track_names._track37_data
.word	<>track_names._track38_data
.word	<>track_names._track39_data
.word	<>track_names._track40_data
.word	<>track_names._track41_data
.word	<>track_names._track42_data
.word	<>track_names._track43_data
.word	<>track_names._track44_data
.word	<>track_names._track45_data
.word	<>track_names._track46_data
.word	<>track_names._track47_data
.word	<>track_names._track48_data
.word	<>track_names._track49_data
.word	<>track_names._track50_data
.word	<>track_names._track51_data
.word	<>track_names._track52_data
.word	<>track_names._track53_data
.word	<>track_names._track54_data
.word	<>track_names._track55_data
.word	<>track_names._track56_data
.word	<>track_names._track57_data
.word	<>track_names._track58_data
.word	<>track_names._track59_data

.bend
.here

;	Track names
;	Character limit: 25. An ending space to complete the last tile doesn't count as a character.

* = $07EBDF
.logical lorom($07EBDF, 1)

track_names		.block

_track01_data
	.byte $00		; Category
	.byte $21		; Music track number
	.text "Begins"
	.word $0000		

_track02_data
	.byte $00		; Category
	.byte $23		; Music track number
	.text "Fire E[mble[m The[me"
	.word $0000

_track03_data
	.byte $00		; Category
	.byte $29		; Music track number
	.text "(Map  {A}"
	.word $0000

_track04_data
	.byte $00		; Category
	.byte $2B		; Music track number
	.text "(Map  {B}"
	.word $0000

_track05_data
	.byte $00		; Category
	.byte $2C		; Music track number
	.text "(Map  {C}"
	.word $0000

_track06_data
	.byte $00		; Category
	.byte $2D		; Music track number
	.text "Sally Forth "
	.word $0000

_track07_data
	.byte $01		; Category
	.byte $01		; Music track number
	.text "Base"
	.word $0000

_track08_data
	.byte $01		; Category
	.byte $02		; Music track number
	.text "Assault {A}"
	.word $0000

_track09_data
	.byte $01		; Category
	.byte $03		; Music track number
	.text "Assault {B}"
	.word $0000

_track10_data
	.byte $01		; Category
	.byte $04		; Music track number
	.text "Adversity "
	.word $0000

_track11_data
	.byte $01		; Category
	.byte $05		; Music track number
	.text "The Cusp of Victory "
	.word $0000

_track12_data
	.byte $01		; Category
	.byte $06		; Music track number
	.text "The Edge of Defeat"
	.word $0000

_track13_data
	.byte $01		; Category
	.byte $07		; Music track number
	.text "Reconnoissance"
	.word $0000

_track14_data
	.byte $01		; Category
	.byte $08		; Music track number
	.text "Leif"
	.word $0000

_track15_data
	.byte $02		; Category
	.byte $09		; Music track number
	.text "Base  {A}"
	.word $0000

_track16_data
	.byte $02		; Category
	.byte $0A		; Music track number
	.text "Base  {B}"
	.word $0000

_track17_data
	.byte $02		; Category
	.byte $0B		; Music track number
	.text "Assault "
	.word $0000

_track18_data
	.byte $02		; Category
	.byte $0C		; Music track number
	.text "Dark Bishops"
	.word $0000

_track19_data
	.byte $02		; Category
	.byte $0D		; Music track number
	.text "Reconnoissance"
	.word $0000

_track20_data
	.byte $02		; Category
	.byte $0E		; Music track number
	.text "Endga[me"
	.word $0000

_track21_data
	.byte $03		; Category
	.byte $11		; Music track number
	.text "Attack"
	.word $0000

_track22_data
	.byte $03		; Category
	.byte $12		; Music track number
	.text "Defense "
	.word $0000

_track23_data
	.byte $03		; Category
	.byte $13		; Music track number
	.text "Recovery  {A}"
	.word $0000

_track24_data
	.byte $03		; Category
	.byte $14		; Music track number
	.text "Recovery  {B}"
	.word $0000

_track25_data
	.byte $03		; Category
	.byte $15		; Music track number
	.text "Dance "
	.word $0000

_track26_data
	.byte $03		; Category
	.byte $16		; Music track number
	.text "Class Change"
	.word $0000

_track27_data
	.byte $03		; Category
	.byte $1E		; Music track number
	.text "Boss Battle "
	.word $0000

_track28_data
	.byte $03		; Category
	.byte $18		; Music track number
	.text "Against Raydrik "
	.word $0000

_track29_data
	.byte $03		; Category
	.byte $19		; Music track number
	.text "Against Veld"
	.word $0000

_track30_data
	.byte $03		; Category
	.byte $1A		; Music track number
	.text "Arena Battle"
	.word $0000

_track31_data
	.byte $03		; Category
	.byte $1B		; Music track number
	.text "Level Up  {A}"
	.word $0000

_track32_data
	.byte $03		; Category
	.byte $1C		; Music track number
	.text "Level Up  {B}"
	.word $0000

_track33_data
	.byte $04		; Category
	.byte $31		; Music track number
	.text "Crisis"
	.word $0000

_track34_data
	.byte $04		; Category
	.byte $32		; Music track number
	.text "Assault "
	.word $0000

_track35_data
	.byte $04		; Category
	.byte $33		; Music track number
	.text "Destiny "
	.word $0000

_track36_data
	.byte $04		; Category
	.byte $39		; Music track number
	.text "Battalion {A}"
	.word $0000

_track37_data
	.byte $04		; Category
	.byte $3F		; Music track number
	.text "Battalion {B}"
	.word $0000

_track38_data
	.byte $04		; Category
	.byte $3A		; Music track number
	.text "Bandits "
	.word $0000

_track39_data
	.byte $04		; Category
	.byte $3D		; Music track number
	.text "Thracia "
	.word $0000

_track40_data
	.byte $04		; Category
	.byte $3C		; Music track number
	.text "Loptrians {A}"
	.word $0000

_track41_data
	.byte $04		; Category
	.byte $3E		; Music track number
	.text "Loptrians {B}"
	.word $0000

_track42_data
	.byte $04		; Category
	.byte $3B		; Music track number
	.text "Raydrik "
	.word $0000

_track43_data
	.byte $05		; Category
	.byte $41		; Music track number
	.text "Victory "
	.word $0000

_track44_data
	.byte $05		; Category
	.byte $42		; Music track number
	.text "(Minor Victory"
	.word $0000

_track45_data
	.byte $05		; Category
	.byte $43		; Music track number
	.text "August Speaks {A}"
	.word $0000

_track46_data
	.byte $05		; Category
	.byte $44		; Music track number
	.text "August Speaks {B}"
	.word $0000

_track47_data
	.byte $05		; Category
	.byte $45		; Music track number
	.text "Go, Leif, Go! "
	.word $0000

_track48_data
	.byte $05		; Category
	.byte $46		; Music track number
	.text "Conquest"
	.word $0000

_track49_data
	.byte $06		; Category
	.byte $4A		; Music track number
	.text "Recruit[ment"
	.word $0000

_track50_data
	.byte $06		; Category
	.byte $4B		; Music track number
	.text "(Meetings and Reunions"
	.word $0000

_track51_data
	.byte $06		; Category
	.byte $4C		; Music track number
	.text "Co[mic Relief "
	.word $0000

_track52_data
	.byte $06		; Category
	.byte $4D		; Music track number
	.text "Church"
	.word $0000

_track53_data
	.byte $06		; Category
	.byte $4E		; Music track number
	.text "Sorro12 "
	.word $0000

_track54_data
	.byte $06		; Category
	.byte $4F		; Music track number
	.text "Sara"
	.word $0000

_track55_data
	.byte $06		; Category
	.byte $50		; Music track number
	.text "Eyvel "
	.word $0000

_track56_data
	.byte $07		; Category
	.byte $24		; Music track number
	.text "Results "
	.word $0000

_track57_data
	.byte $07		; Category
	.byte $25		; Music track number
	.text "Epilogue"
	.word $0000

_track58_data
	.byte $07		; Category
	.byte $26		; Music track number
	.text "Ballad"
	.word $0000

_track59_data
	.byte $07		; Category
	.byte $27		; Music track number
	.text "(Music Box"
	.word $0000

.bend
.here