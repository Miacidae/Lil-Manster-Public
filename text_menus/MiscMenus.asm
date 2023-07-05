
;	Inventory item stat labels

	.section InventoryItemStatLabelsSection

		menutextInventoryItemStatLabels
			.text "Type\n"		  ; Character limit: 6
			.text "Hit \n"        ; Character limit: 6
			.text "(Might\n"      ; Character limit: 8
			.text "Crit\n"        ; Character limit: 8
			.text "Range \n"      ; Character limit: 6
			.text ")Weight \n"    ; Character limit: 8
			.word 0

		menutextInventoryStaffStatLabels
			.text "Type\n"		  ; Character limit: 6
			.text ")Weight \n"    ; Character limit: 6 (8 it can't go go over 99)
			.word 0
		
	.endsection InventoryItemStatLabelsSection


;	Supply item stat labels

* = $03A728
.logical lorom($03A728, 1)

	.text "Type    \n"        ; Character COUNT: 8          
	.text "Atk   \n"          ; Character COUNT: 6       
	.text "Hit     \n"        ; Character COUNT: 8           
	.text "Crit    \n"        ; Character COUNT: 8            
	.text "Avo   \n"          ; Character COUNT: 6           
	.word 0

.here

;	Arena "Funds"
;	Character limit: 6

* = $02EE2F
.logical lorom($02EE2F, 1)

	Funds_arena
		.text "Funds \n"

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
		.text "Prf \n"

.here

;	Range strings

	.section RangeTextSection

		range_one
			.text "    {1}\n"
		
		range_onetwo
			.text "{1}{-}{2}  \n"
		
		range_two
			.text "    {2}\n"
		
		range_threeten
			.text "{3}{-}{1}{0}\n"
		
		range_threefifteen
			.text "{3}{-}{1}{5}\n"

	.endsection RangeTextSection


;	Growth window

	.section GrowthWindowLabelsSection

		.text "{H}{P}      {%}\n"
		.text "Str       {%}\n"
		.text "(Mag      {%}\n"
		.text "Skl       {%}\n"
		.text "Spd       {%}\n"
		.text "Lck       {%}\n"
		.text "Def       {%}\n"
		.text "Con       {%}\n"
		.text "(Mov      {%}\n"
		.word 0

	.endsection GrowthWindowLabelsSection

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
.text "+No co{mm}nander on the field \n"	; Character limit: 28

.here

;	Unit menu sorting categories pointers

	.section UnitMenuPointersSection

		.word <>menutextUnitMenuNameText
		.word <>menutextUnitMenuClassText
		.word <>menutextUnitMenuLevelText
		.word <>menutextUnitMenuExPText
		.word <>menutextUnitMenuHPText
		.word <>menutextUnitMenuMHPText
		.word <>menutextUnitMenuEquipText
		.word <>menutextUnitMenuAttackText
		.word <>menutextUnitMenuHitText
		.word <>menutextUnitMenuAvoidText
		.word <>menutextUnitMenuStrText
		.word <>menutextUnitMenuMagicText
		.word <>menutextUnitMenuSkillText
		.word <>menutextUnitMenuSpeedText
		.word <>menutextUnitMenuLuckText
		.word <>menutextUnitMenuDefText
		.word <>menutextUnitMenuConText
		.word 0
		.word 0
		.word 0
		.word 0
		.word 0
		.word <>menutextUnitMenuStatusText
		.word 0
		.word <>menutextUnitMenuMoveText
		.word 0
		.word 0
		.word 0
		.word 0
		.word 0
		.word 0
		.word 0
		.word 0
		.word 0
		.word 0
		.word <>menutextUnitMenuSkillsText
		.word <>menutextUnitMenuFatgText
		.word <>menutextUnitMenuTrvlrText
		.word 0

	.endsection UnitMenuPointersSection



;	Unit menu sorting categories text
;	Character limit: 6


	.section UnitMenuTextSection

		menutextUnitMenuNameText
			.text "+Na[me\n"
		
		menutextUnitMenuClassText
			.text "Class \n"
		
		menutextUnitMenuLevelText
			.text "Level \n"
		
		menutextUnitMenuExPText
			.text "{E}{X}{P}\n"
		
		menutextUnitMenuHPText
			.text "  {H}{P}\n"
		
		menutextUnitMenuMHPText
			.text "{M}{H}{P}\n"
		
		menutextUnitMenuEquipText
			.text "Equip \n"
		
		menutextUnitMenuAttackText
			.text "Attack\n"
		
		menutextUnitMenuHitText
			.text "Hit \n"
		
		menutextUnitMenuAvoidText
			.text "Avoid \n"
		
		menutextUnitMenuStrText
			.text "Str \n"
		
		menutextUnitMenuMagicText
			.text "(Mag\n"
		
		menutextUnitMenuSkillText
			.text "Skl \n"
		
		menutextUnitMenuSpeedText
			.text "Spd \n"
		
		menutextUnitMenuLuckText
			.text "Lck \n"
		
		menutextUnitMenuDefText
			.text "Def \n"
		
		menutextUnitMenuConText
			.text "Con \n"
		
		menutextUnitMenuMoveText
			.text "(Mov\n"
		
		menutextUnitMenuFatgText
			.text "Fatg\n"
		
		menutextUnitMenuStatusText
			.text "Cond\n"
		
		menutextUnitMenuTrvlrText
			.text "Trvlr \n"
		
		menutextUnitMenuSkillsText
			.text "Skills\n"

	.endsection UnitMenuTextSection
