;	Proccing a move level
;	Character limit: 18

* = $0266D0
.logical lorom($0266D0, 1)

.text "(Mov increased\n"

.here

;	Weapon rank increase
;	Character limit: ~50 (it's repointed and the box is stretchy)

* = $02676A
.logical lorom($02676A, 1)

.long menutextPopUpWeaponLevelBlank

.here

* = $026772
.logical lorom($026772, 1)

.long menutextPopUpWeaponLevelIncreased

.here

* = $475C90
.logical lorom($475C90, 1)

menutextPopUpWeaponLevelIncreased
.text ")Weapon level increased "
menutextPopUpWeaponLevelBlank
.text "\n"

.here

;	Too many items message

; See InventoryFullConvoyMenu.asm



;	Enemy escaped message
;	Character limit: ~50 (it's repointed and the box is stretchy)

* = $01FAB8
.logical lorom($01FAB8, 1)

.long menutextPopUpEnemyEscaped

.here

* = $475500
.logical lorom($475500, 1)

menutextPopUpEnemyEscaped
.text "Unit escaped\n"

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

    POPUP_DRAW_TEXT .segment TextPointer
      .byte $02
      .long \TextPointer
    .endsegment

    POPUP_DRAW_ITEM_NAME .segment ItemPointer
      .byte $06
      .long \ItemPointer
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
POPUP_DRAW_TEXT menutextPopUpItemObtained
POPUP_END

.here

;	Item stolen messages (Command & Staff)
* = $01F7B1
.logical lorom($01F7B1, 1)

POPUP_DRAW_ITEM_ICON $7EF79E
POPUP_DRAW_ITEM_NAME $7EF79E
POPUP_DRAW_TEXT menutextPopUpItemStolenStealCommand
POPUP_END

.here

* = $0A164A
.logical lorom($0A164A, 1)

POPUP_DRAW_ITEM_ICON $7EF79B
POPUP_DRAW_ITEM_NAME $7EF79B
POPUP_DRAW_TEXT menutextPopUpItemStolenThiefStaff
POPUP_END

.here

;	Item purchased message
* = $01F8B5
.logical lorom($01F8B5, 1)

POPUP_DRAW_ITEM_ICON $7EF79E
POPUP_DRAW_ITEM_NAME $7EF79E
POPUP_DRAW_TEXT menutextPopUpItemPurchased
POPUP_END

.here

;	Item exchanged message
* = $01F85D
.logical lorom($01F85D, 1)

POPUP_DRAW_ITEM_ICON $7EF79E
POPUP_DRAW_ITEM_NAME $7EF79E
POPUP_DRAW_TEXT menutextPopUpItemExchanged
POPUP_END

.here

;	Skill learned message
* = $026881
.logical lorom($026881, 1)

POPUP_DRAW_SKILL $7EF79E
POPUP_DRAW_TEXT menutextPopUpSkillLearned
POPUP_END

.here

;	Text of the Item/Skill popup boxes.
;	Character limit: 12

* = $0265E9
.logical lorom($0265E9, 1)

menutextPopUpItemObtained
.text " received \n"

.here

;	Item stolen message
;	Character limit: 12

* = $0A1657
.logical lorom($0A1657, 1)

menutextPopUpItemStolenStealCommand
.text " ]was stolen\n"

.here

* = $01F7BE
.logical lorom($01F7BE, 1)

menutextPopUpItemStolenThiefStaff
.text " ]was stolen\n"

.here

;	Enemy bought an item message
;	Character limit: 16

* = $01F8C2
.logical lorom($01F8C2, 1)

menutextPopUpItemPurchased
.text " purchased\n"

.here

;	Enemy traded an item message
;	Character limit: 12

* = $01F86A
.logical lorom($01F86A, 1)

menutextPopUpItemExchanged
.text " ]was taken \n"

.here

;	Learning a skill
;	Character limit: 12

* = $02683B
.logical lorom($02683B, 1)

.long aPopUpBoxSkillNames

.here

* = $026843
.logical lorom($026843, 1)

.long aPopUpBoxSkillNames+1

.here

* = $02688A
.logical lorom($02688A, 1)

menutextPopUpSkillLearned
.text " learned  \n"

aPopUpBoxSkillNames
	.long menutextParagonName
	.long menutextAccostName
	.long menutextBargainName
	.long menutextVantageName
	.long menutextWrathName
	.long menutextAdeptName
	.long menutextMiracleName
	.long menutextNihilName
	.long menutextSolName
	.long menutextLunaSkillName
	.long menutextAstraName

.here

;	Enemy used an item messages pointers

* = $0737D8
.logical lorom($0737D8, 1)

.byte    `menutextPopUpVulneraryText

.here

* = $080766
.logical lorom($080766, 1)

.word    <>menutextPopUpVulneraryText

.here

* = $08076A
.logical lorom($08076A, 1)

.word    <>menutextPopUpPureWaterText

.here

* = $08076E
.logical lorom($08076E, 1)

.word    <>menutextPopUpPoisonText

.here

* = $080776
.logical lorom($080776, 1)

.word    <>menutextPopUpAntitoxinText

.here

* = $08077A
.logical lorom($08077A, 1)

.word    <>menutextPopUpTorchText

.here

* = $08077E
.logical lorom($08077E, 1)

.word    <>menutextPopUpBaileText

.here

* = $080782
.logical lorom($080782, 1)

.word    <>menutextPopUpBrionacText

.here

;	Enemy used an item messages
;	Character limit: ~50 (it's repointed and the box is stretchy)

* = $475A50
.logical lorom($475A50, 1)
menutextPopUpVulneraryText
.text "Vulnerary used\n"

.here

* = $475700
.logical lorom($475700, 1)
menutextPopUpPureWaterText
.text "Pure )Water used\n"

.here

* = $475730
.logical lorom($475730, 1)
menutextPopUpPoisonText
.text "Poisoned\n"

.here

* = $475760
.logical lorom($475760, 1)
menutextPopUpTorchText
.text "Torch used\n"

.here

* = $475790
.logical lorom($475790, 1)
menutextPopUpBaileText
.text "By Ethlyn used\n"

.here

* = $4757C0
.logical lorom($4757C0, 1)
menutextPopUpBrionacText
.text "Brionac used\n"

.here

* = $475800
.logical lorom($475800, 1)
menutextPopUpAntitoxinText
.text "Antitoxin used\n"

.here