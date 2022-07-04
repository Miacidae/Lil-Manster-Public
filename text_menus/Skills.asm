; Skills

;	Messy repoint of Skill text

* = $00F98A
.byte $10

* = $00F999
.byte $10

* = $00F9AD
.byte $10

* = $00F9BC
.byte $10

* = $484E09
.logical $10CE09

.databank 0

;	Skill name pointers

skill_name_pointers				.block

.word <>skill_name_text._WrathName
.word <>skill_name_text._AnchorName
.word <>skill_name_text._AdeptName
.word <>skill_name_text._PaviseName
.word <>skill_name_text._CharmName
.word <>skill_name_text._NoncombatantName	; used to be Acrobat
.word <>skill_name_text._NihilName
.word <>skill_name_text._MiracleName
.word <>skill_name_text._MiraclePlusName
.word <>skill_name_text._VantageName
.word <>skill_name_text._AccostName
.word <>skill_name_text._AstraName
.word <>skill_name_text._LunaSkillName
.word <>skill_name_text._SolName
.word <>skill_name_text._RenewalName
.word <>skill_name_text._ParagonName
.word <>skill_name_text._StealName
.word <>skill_name_text._DanceName
.word <>skill_name_text._BargainName

.bend

;	Skill description pointers

skill_desc_pointers				.block

.word <>skill_desc_text._WrathDesc
.word <>skill_desc_text._AnchorDesc
.word <>skill_desc_text._AdeptDesc
.word <>skill_desc_text._PaviseDesc
.word <>skill_desc_text._CharmDesc
.word <>skill_desc_text._NoncombatantDesc	; used to be Acrobat
.word <>skill_desc_text._NihilDesc
.word <>skill_desc_text._MiracleDesc
.word <>skill_desc_text._MiraclePlusDesc
.word <>skill_desc_text._VantageDesc
.word <>skill_desc_text._AccostDesc
.word <>skill_desc_text._AstraDesc
.word <>skill_desc_text._LunaSkillDesc
.word <>skill_desc_text._SolDesc
.word <>skill_desc_text._RenewalDesc
.word <>skill_desc_text._ParagonDesc
.word <>skill_desc_text._StealDesc
.word <>skill_desc_text._DanceDesc
.word <>skill_desc_text._BargainDesc

.bend
.here

;	Skill name text
;	Character limit: 16 (counting the two leading spaces)

* = $480B13
.logical lorom($480B13, 1)

skill_name_text				.block

_WrathName
	.text "  )Wrath"
.word $0000
	
_AnchorName
	.text "  Anchor"
.word $0000

_AdeptName
	.text "  Adept "
.word $0000

_PaviseName
	.text "  Pavise"
.word $0000

_CharmName
	.text "  Char{m}"
.word $0000

_NoncombatantName
	.text "  +Nonco[mbatant"
.word $0000

_NihilName
	.text "  +Nihil"
.word $0000

_MiracleName
	.text "  (Miracle"
.word $0000

_MiraclePlusName
	.text "  (Miracle{+}"
.word $0000

_VantageName
	.text "  Vantage "
.word $0000

_AccostName
	.text "  Accost"
.word $0000

_AstraName
	.text "  Astra "
.word $0000

_LunaSkillName
	.text "  Luna"
.word $0000

_SolName
	.text "  Sol "
.word $0000

_RenewalName
	.text "  Rene]wal"
.word $0000

_ParagonName
	.text "  Paragon "
.word $0000

_StealName
	.text "  Steal "
.word $0000

_DanceName
	.text "  Dance "
.word $0000

_BargainName
	.text "  Bargain "
.word $0000

.bend

;	Skill description text
;	Character limit: 20
;	Line limit: 4

skill_desc_text				.block

_WrathDesc
	.text "If ene[my attacks "
	.word $0000
	.text "first, the user's "
	.word $0000
	.text "counterattack ]will "
	.word $0000
	.text "be a critical hit "
	.word $0000
	.word $0000

_AnchorDesc
	.text "Prevents unit fro[m "
	.word $0000
	.text "being captured"
	.word $0000
.word $0000

_AdeptDesc
	.text "{A}{S}{%} chance "
	.word $0000
	.text "to perfor[m a "
	.word $0000
	.text "consecutive attack"
	.word $0000
.word $0000

_PaviseDesc
	.text "{L}{V}{%} chance "
	.word $0000
	.text "to negate ene[my's"
	.word $0000
	.text "attack"
	.word $0000
.word $0000

_CharmDesc
	.text "Gives {+}{1}{0} Hit and"
	.word $0000
	.text "Avoid to allies "
	.word $0000
	.text "]within {3} tiles"
	.word $0000
	.text "of the user "
	.word $0000
.word $0000

_NoncombatantDesc
	.text "Prevents unit fro[m "
	.word $0000
	.text "being attacked"
	.word $0000
.word $0000

_NihilDesc
	.text "+Negates all ene[my "
	.word $0000
	.text "co[mbat skills"
	.word $0000
	.text "except for"
	.word $0000
	.text "+Nihil itself "
	.word $0000
.word $0000

_MiracleDesc
	.text "{(}Lck x {3}{)}{%}"
	.word $0000
	.text "chance to avoid all "
	.word $0000
	.text "fatal da[mage for "
	.word $0000
	.text "the rest of co[mbat "
	.word $0000
.word $0000

_MiraclePlusDesc
	.text "+Nullifies ene[my "
	.word $0000
	.text "staves and status "
	.word $0000
	.text "conditions. Avoids"
	.word $0000
	.text "all fatal da[mage "
	.word $0000
.word $0000

_VantageDesc
	.text "User attacks first"
	.word $0000
	.text "]when the ene[my"
	.word $0000
	.text "initiates co[mbat "
	.word $0000
.word $0000

_AccostDesc
	.text "If user's {H}{P} and"
	.word $0000
	.text "{A}{S} are higher than"
	.word $0000
	.text "the ene[my's, adds"
	.word $0000
	.text "one round of co[mbat"
	.word $0000
.word $0000

_AstraDesc
	.text "Skl {%} chance "
	.word $0000
	.text "to attack five"
	.word $0000
	.text "consecutive ti[mes"
	.word $0000
.word $0000

_LunaSkillDesc
	.text "Skl {%} chance "
	.word $0000
	.text "for attack to ignore"
	.word $0000
	.text "ene[my's defense"
	.word $0000
.word $0000

_SolDesc
	.text "Skl {%} chance "
	.word $0000
	.text "for attack to heal"
	.word $0000
	.text "for da[mage dealt "
	.word $0000
.word $0000

_RenewalDesc
	.text "Recover {5}{~}{1}{0}{%}"
	.word $0000
	.text "of [maxi[mu[m {H}{P}"
	.word $0000
	.text "every turn"
	.word $0000
.word $0000

_ParagonDesc
	.text "Doubles experience"
	.word $0000
	.text "gained by the user"
	.word $0000
.word $0000

_StealDesc
	.text "If user outspeeds a "
	.word $0000
	.text "target, can Steal an"
	.word $0000
	.text "ite[m ]with less )Wt"
	.word $0000
	.text "than the user's Con "
	.word $0000
.word $0000

_DanceDesc
	.text "Use Dance co{mm}nand"
	.word $0000
	.text "to grant an ally"
	.word $0000
	.text "another action"
	.word $0000
.word $0000

_BargainDesc
	.text "Allo]ws user to "
	.word $0000
	.text "buy fro[m shops "
	.word $0000
	.text "at half price "
	.word $0000
.word $0000

.bend
.here

;	Skill label pointers

* = $00F9F4
.logical $81F9F4

skill_type_text				.block

	.word <>class_skill_text
	.word <>personal_skill_text
	.word <>weapon_skill_text

.bend

.here

;	Skill label text
;	Character limit: 20

* = $016556
.logical lorom($016556, 1)

class_skill_text
	.text "Class Skill "
.word $0000

personal_skill_text
	.text "Personal Skill"
.word $0000

weapon_skill_text
	.text ")Weapon Skill "
.word $0000
.word $0000

.here

;	Skill icon table

* = $001770
.logical lorom($001770, 1)

skillicontable
.word $0000, $0001, $00C2	;Dance1
.word $0000, $0002, $00C1	;Steal1
.word $0000, $0080, $00B6	;Noncombattant1	(was Acrobat icon)
.word $0000, $0008, $00C3	;Bargain1
.word $0001, $0002, $00B5	;Charm2
.word $0001, $0001, $00B3	;Adept2
.word $0001, $0008, $00B8	;Miracle2
.word $0001, $0010, $00BA	;Vantage2
.word $0001, $0020, $00BB	;Accost2
.word $0001, $0040, $00B4	;Pavise2
.word $0001, $0080, $00B7	;Nihil2
.word $0001, $0100, $00B1	;Wrath3
.word $0001, $0200, $00BC	;Astra3
.word $0001, $0400, $00BD	;Luna3
.word $0001, $0800, $00BE	;Sol3
.word $0001, $1000, $00C0	;Paragon3
.word $0000, $0010, $00BF	;Renewal1
.word $0001, $0004, $00B2	;Anchor1		(was Pursuit icon)
.word $0001, $8000, $00B9	;Immortal3		(was Critical icon)

.word $FFFF

.here

* = $00D918
.logical lorom($00D918, 1)

.long skillicontable

.here

* = $00D92B
.logical lorom($00D92B, 1)

.long skillicontable+2

.here

* = $00D934
.logical lorom($00D934, 1)

.long skillicontable+4

.here

* = $00D9A3
.logical lorom($00D9A3, 1)

.long skillicontable

.here

* = $00D9AA
.logical lorom($00D9AA, 1)

.long skillicontable+2

.here

* = $00D9B2
.logical lorom($00D9B2, 1)

.long skillicontable+2

.here