;	Proccing a move level
;	Character limit: 18

* = $0266D0
.logical lorom($0266D0, 1)

.text "(Mov increased"
.word $0000

.here

;	Weapon rank increase
;	Character limit: ~50 (it's repointed and the box is stretchy)

* = $02676A
.logical lorom($02676A, 1)

.long weaponrankblank

.here

* = $026772
.logical lorom($026772, 1)

.long weaponranktext

.here

* = $475C90
.logical lorom($475C90, 1)

weaponranktext
.text ")Weapon level increased "
weaponrankblank
.word $0000

.here

;	Too many items message

* = $0364D5
.logical lorom($0364D5, 1)

.text "Too [many ite[ms. "	; Character limit: 22
.word $0000

.here

* = $0364FD
.logical lorom($0364FD, 1)

.text "Pick an ite[m to"	; Character limit: 24
.word $0000

.here

* = $03652B
.logical lorom($03652B, 1)

.text "send to Supply"	; Character limit: 16
.word $0000

.here

;	Enemy escaped message
;	Character limit: ~50 (it's repointed and the box is stretchy)

* = $01FAB8
.logical lorom($01FAB8, 1)

.long enemyesc

.here

* = $475500
.logical lorom($475500, 1)

enemyesc
.text "Unit escaped"
.word $0000

.here

;	Definitions for the commands used in the Item/Skill popup boxes

.weak

    POPUP_DRAW_ITEM_ICON .segment ItemPointer
      .byte $00
      .long \ItemPointer
    .endsegment

    POPUP_DRAW_SKILL .segment SkillPointer
      .byte $01
      .long \SkillPointer
    .endsegment

    POPUP_DRAW_ITEM_NAME .segment ItemPointer
      .byte $06
      .long \ItemPointer
    .endsegment

    POPUP_DRAW_TEXT .segment TextPointer
      .byte $02
      .long \TextPointer
    .endsegment

    POPUP_END .segment
      .byte $08
    .endsegment

.endweak

;	Instructions of the Item/Skill popup boxes.
;	By reordering the commands in the Instructions below, you can place the text before the item/skill names and icons.

;	Item obtained message
* = $0265DC
.logical lorom($0265DC, 1)

POPUP_DRAW_ITEM_ICON $7EF79B
POPUP_DRAW_ITEM_NAME $7EF79B
POPUP_DRAW_TEXT menutextItemObtained
POPUP_END

.here

;	Item stolen messages (Command & Staff)
* = $01F7B1
.logical lorom($01F7B1, 1)

POPUP_DRAW_ITEM_ICON $7EF79E
POPUP_DRAW_ITEM_NAME $7EF79E
POPUP_DRAW_TEXT menutextItemStolenStealCommand
POPUP_END

.here

* = $0A164A
.logical lorom($0A164A, 1)

POPUP_DRAW_ITEM_ICON $7EF79B
POPUP_DRAW_ITEM_NAME $7EF79B
POPUP_DRAW_TEXT menutextItemStolenThiefStaff
POPUP_END

.here

;	Item purchased message
* = $01F8B5
.logical lorom($01F8B5, 1)

POPUP_DRAW_ITEM_ICON $7EF79E
POPUP_DRAW_ITEM_NAME $7EF79E
POPUP_DRAW_TEXT menutextItemPurchased
POPUP_END

.here

;	Item exchanged message
* = $01F85D
.logical lorom($01F85D, 1)

POPUP_DRAW_ITEM_ICON $7EF79E
POPUP_DRAW_ITEM_NAME $7EF79E
POPUP_DRAW_TEXT menutextItemExchanged
POPUP_END

.here

;	Skill learned message
* = $026881
.logical lorom($026881, 1)

POPUP_DRAW_SKILL $7EF79E
POPUP_DRAW_TEXT menutextSkillLearned
POPUP_END

.here

;	Text of the Item/Skill popup boxes.
;	Character limit: 12

* = $0265E9
.logical lorom($0265E9, 1)

menutextItemObtained
.text " received "
.word $0000

.here

;	Item stolen message
;	Character limit: 12

* = $0A1657
.logical lorom($0A1657, 1)

menutextItemStolenStealCommand
.text " ]was stolen"
.word $0000

.here

* = $01F7BE
.logical lorom($01F7BE, 1)

menutextItemStolenThiefStaff
.text " ]was stolen"
.word $0000

.here

;	Enemy bought an item message
;	Character limit: 16

* = $01F8C2
.logical lorom($01F8C2, 1)

menutextItemPurchased
.text " purchased"
.word $0000

.here

;	Enemy traded an item message
;	Character limit: 12

* = $01F86A
.logical lorom($01F86A, 1)

menutextItemExchanged
.text " ]was taken "
.word $0000

.here

;	Learning a skill
;	Character limit: 12

* = $02683B
.logical lorom($02683B, 1)

.long skill_text_table

.here

* = $026843
.logical lorom($026843, 1)

.long skill_text_table+1

.here

* = $02688A
.logical lorom($02688A, 1)

menutextSkillLearned
.text " learned  "
.word $0000

skill_text_table
	.long skill_name_text._ParagonName
	.long skill_name_text._AccostName
	.long skill_name_text._BargainName
	.long skill_name_text._VantageName
	.long skill_name_text._WrathName
	.long skill_name_text._AdeptName
	.long skill_name_text._MiracleName
	.long skill_name_text._NihilName
	.long skill_name_text._SolName
	.long skill_name_text._LunaSkillName
	.long skill_name_text._AstraName

.here

;	Enemy used an item messages pointers

* = $0737D8
.logical lorom($0737D8, 1)

.byte    `VulneraryText

.here

* = $080766
.logical lorom($080766, 1)

.word    <>VulneraryText

.here

* = $08076A
.logical lorom($08076A, 1)

.word    <>PureWaterText

.here

* = $08076E
.logical lorom($08076E, 1)

.word    <>PoisonText

.here

* = $080776
.logical lorom($080776, 1)

.word    <>AntitoxinText

.here

* = $08077A
.logical lorom($08077A, 1)

.word    <>TorchText

.here

* = $08077E
.logical lorom($08077E, 1)

.word    <>BaileText

.here

* = $080782
.logical lorom($080782, 1)

.word    <>BrionacText

.here

;	Enemy used an item messages
;	Character limit: ~50 (it's repointed and the box is stretchy)

* = $475A50
.logical lorom($475A50, 1)
VulneraryText
.text "Vulnerary used"
.word $0000

.here

* = $475700
.logical lorom($475700, 1)
PureWaterText
.text "Pure )Water used"
.word $0000

.here

* = $475730
.logical lorom($475730, 1)
PoisonText
.text "Poisoned"
.word $0000

.here

* = $475760
.logical lorom($475760, 1)
TorchText
.text "Torch used"
.word $0000

.here

* = $475790
.logical lorom($475790, 1)
BaileText
.text "By Ethlyn used"
.word $0000

.here

* = $4757C0
.logical lorom($4757C0, 1)
BrionacText
.text "Brionac used"
.word $0000

.here

* = $475800
.logical lorom($475800, 1)
AntitoxinText
.text "Antitoxin used"
.word $0000

.here