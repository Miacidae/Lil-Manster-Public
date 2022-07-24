;	Item stat label pointers

* = $00F704
.logical lorom($00F704, 1)

.word <>itemstatlabels

.here

* = $00F709
.logical lorom($00F709, 1)

.word itemstatlabels>>8

.here

* = $00F680
.logical lorom($00F680, 1)

.word <>staffstatlabels

.here

* = $00F685
.logical lorom($00F685, 1)

.word staffstatlabels>>8

.here

;	Inventory item stat labels

* = $00FF9D
.logical lorom($00FF9D, 1)

itemstatlabels
	.text "Type"		; Character limit: 6
	.word $0000
	.text "Hit "        ; Character limit: 6
	.word $0000
	.text "(Might"      ; Character limit: 8
	.word $0000
	.text "Crit"        ; Character limit: 8
	.word $0000
	.text "Range "      ; Character limit: 6
	.word $0000
	.text ")Weight "    ; Character limit: 8
	.word $0000
.word $0000

staffstatlabels
	.text "Type"		; Character limit: 6
	.word $0000
	.text ")Weight "    ; Character limit: 6 (8 it can't go go over 99)
	.word $0000
.word $0000

.here

;	Supply item stat labels

* = $03A728
.logical lorom($03A728, 1)

.text "Type    "        ; Character COUNT: 8
.word $0000             
.text "Atk   "          ; Character COUNT: 6
.word $0000             
.text "Hit     "        ; Character COUNT: 8
.word $0000             
.text "Crit    "        ; Character COUNT: 8
.word $0000             
.text "Avo   "          ; Character COUNT: 6
.word $0000             
.word $0000

.here

;	Arena "Funds"
;	Character limit: 6

* = $02EE2F
.logical lorom($02EE2F, 1)

Funds_arena
.text "Funds "
.word $0000

.here

;	Arena "G"
;	Character limit: 2

* = $02EE6B
.logical lorom($02EE6B, 1)

.text "{G}"

.here

;	Repointed Prf text - Code for it is in Code838000
;	Character limit: 6

* = $01FCF0
.logical lorom($01FCF0, 1)

Prf_rank
.text "Prf "
.word $0000

.here

;	Range strings

* = $029A31
.logical lorom($029A31, 1)

range_one
.text "    {1}"
.word $0000

range_onetwo
.text "{1}{-}{2}  "
.word $0000

range_two
.text "    {2}"
.word $0000

range_threeten
.text "{3}{-}{1}{0}"
.word $0000

range_threefifteen
.text "{3}{-}{1}{5}"
.word $0000

.here

;	Growth display

* = $480500
.logical lorom($480500, 1)
GrowthLabels ; 13C341

	.text "{H}{P}      {%}"
	.word $0000

	.text "Str       {%}"
	.word $0000

	.text "(Mag      {%}"
	.word $0000

	.text "Skl       {%}"
	.word $0000

	.text "Spd       {%}"
	.word $0000

	.text "Lck       {%}"
	.word $0000

	.text "Def       {%}"
	.word $0000

	.text "Con       {%}"
	.word $0000

	.text "(Mov      {%}"
	.word $0000

.word $0000

.here

;	Status screen

* = $053DA1
.logical lorom($053DA1, 1)

.byte `nocommander

.here

* = $053DA5
.logical lorom($053DA5, 1)

.word <>nocommander

.here

* = $475C50
.logical lorom($475C50, 1)

nocommander
.text "+No co{mm}nander on the field "	; Character limit: 28
.word $0000

.here

;	Unit menu sorting categories pointers

* = $0855EA
.logical lorom($0855EA, 1)

unit_menu_pointers			.block

.word <>unit_menu_text._NameText
.word <>unit_menu_text._ClassText
.word <>unit_menu_text._LevelText
.word <>unit_menu_text._ExPText
.word <>unit_menu_text._HPText
.word <>unit_menu_text._MHPText
.word <>unit_menu_text._EquipText
.word <>unit_menu_text._AttackText
.word <>unit_menu_text._HitText
.word <>unit_menu_text._AvoidText
.word <>unit_menu_text._StrText
.word <>unit_menu_text._MagicText
.word <>unit_menu_text._SkillText
.word <>unit_menu_text._SpeedText
.word <>unit_menu_text._LuckText
.word <>unit_menu_text._DefText
.word <>unit_menu_text._ConText
.word $0000
.word $0000
.word $0000
.word $0000
.word $0000
.word <>unit_menu_text._StatusText
.word $0000
.word <>unit_menu_text._MoveText
.word $0000
.word $0000
.word $0000
.word $0000
.word $0000
.word $0000
.word $0000
.word $0000
.word $0000
.word $0000
.word <>unit_menu_text._SkillsText
.word <>unit_menu_text._FatgText
.word <>unit_menu_text._TrvlrText

.bend
.here

;	Unit menu sorting categories text
;	Character limit: 6

* = $085638
.logical lorom($085638, 1)

unit_menu_text				.block

_NameText
	.text "+Na[me"
.word $0000

_ClassText
	.text "Class "
.word $0000

_LevelText
	.text "Level "
.word $0000

_ExPText
	.text "{E}{X}{P}"
.word $0000

_HPText
	.text "  {H}{P}"
.word $0000

_MHPText
	.text "{M}{H}{P}"
.word $0000

_EquipText
	.text "Equip "
.word $0000

_AttackText
	.text "Attack"
.word $0000

_HitText
	.text "Hit "
.word $0000

_AvoidText
	.text "Avoid "
.word $0000

_StrText
	.text "Str "
.word $0000

_MagicText
	.text "(Mag"
.word $0000

_SkillText
	.text "Skl "
.word $0000

_SpeedText
	.text "Spd "
.word $0000

_LuckText
	.text "Lck "
.word $0000

_DefText
	.text "Def "
.word $0000

_ConText
	.text "Con "
.word $0000

_MoveText
	.text "(Mov"
.word $0000

_FatgText
	.text "Fatg"
.word $0000

_StatusText
	.text "Cond"
.word $0000

_TrvlrText
	.text "Trvlr "
.word $0000

_SkillsText
	.text "Skills"
.word $0000

.bend
.here
