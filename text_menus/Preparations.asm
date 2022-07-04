;	Preparations menu pointers

* = $050588
.logical lorom($050588, 1)

prep_option_pointers			.block

.word <>prep_option_text._PrepMapOption
.word <>prep_option_text._PrepItemsOption
.word <>prep_option_text._PrepPickUnitsOption
.word <>prep_option_text._PrepUnitListOption
.word <>prep_option_text._PrepOptionsOption
.word <>prep_option_text._PrepSaveOption
.word $0000

.bend
.here

;	Preparations menu text
;	Character limit: 8

* = $0568E2
.logical lorom($0568E2, 1)

prep_option_text				.block

_PrepMapOption
	.long lorom($506FE, 1)
	.long $000000
	.long $000000
	.long lorom($5070B, 1)
	.long lorom($5070B, 1)
	.long $000000
	.word $2020
	.text "(Map"
.word $0000

_PrepItemsOption
	.long $000000
	.long $000000
	.long $000000
	.long lorom($506C4, 1)
	.long lorom($5070B, 1)
	.long $000000
	.word $2020
	.text "Ite[ms"
.word $0000

_PrepPickUnitsOption
	.long $000000
	.long $000000
	.long $000000
	.long lorom($506B7, 1)
	.long lorom($5070B, 1)
	.long $000000
	.word $2020
	.text "Deploy"
.word $0000

_PrepSaveOption
	.long $000000
	.long $000000
	.long $000000
	.long lorom($507D6, 1)
	.long lorom($5070B, 1)
	.long $000000
	.word $2020
	.text "Save"
.word $0000

_PrepUnitListOption
	.long $000000
	.long $000000
	.long $000000
	.long lorom($506DE, 1)
	.long lorom($5070B, 1)
	.long $000000
	.word $2020
	.text "Unit"
.word $0000

_PrepOptionsOption
	.long $000000
	.long $000000
	.long $000000
	.long lorom($506EB, 1)
	.long lorom($5070B, 1)
	.long $000000
	.word $2020
	.text "Options "
.word $0000

.bend
.here

;	Deploy menu pointers

* = $02F955
.logical lorom($02F955, 1)

lda #<>fatigued_text
sta lR18
lda #(>`fatigued_text)
sta lR18+1
rts
lda #<>use_drink_text
sta lR18
lda #(>`use_drink_text)
sta lR18+1

.here

;	Deploy menu text
;	Character limit: 10 characters

* = $056A00
.logical lorom($056A00, 1)

fatigued_text
.text "Fatigued"
.word $0000

use_drink_text
.text "S Drink "
.word $0000

.here

;	Preps Items menu pointers

* = $00F391
.logical lorom($00F391, 1)

prep_item_options_pointers		.block

.word <>prep_item_options_text._OrganizeItemText
.word <>prep_item_options_text._SelectToReturnText
.word <>prep_item_options_text._SelectItemFromListText
.word <>prep_item_options_text._SpaceText
.word <>prep_item_options_text._TradeText
.word <>prep_item_options_text._SpaceText
.word <>prep_item_options_text._SupplyText
.word <>prep_item_options_text._SpaceText
.word <>prep_item_options_text._DiscardText
.word <>prep_item_options_text._SpaceText
.word <>prep_item_options_text._SortAndOwnerText
.word <>prep_item_options_text._OwnerText
.word <>prep_item_options_text._ShopText
.word <>prep_item_options_text._SpaceText

.bend

;	Preps Items menu text
;	Character limit: 28 each. 168 total.

prep_item_options_text			.block

_OrganizeItemText
.text "Arrange ite[ms"
_OwnerText
_SpaceText
.word $0000

_SelectToReturnText
.text "              {SEL1}{SEL2}Exit [menu"
.word $0000

_SelectItemFromListText
_SortAndOwnerText
.text "Pick ite[ms fro[m a list"
.word $0000

_TradeText
.text "Trade ite[ms a[mong units "
.word $0000

_ShopText
.text "Visit the shop"
.word $0000

_SupplyText
.text "Visit the Supply"
.word $0000

_DiscardText
.text "Discard ite[ms"
.word $0000

.bend
.here

;	Sorting categories pointers

* = $02CDC2
.logical lorom($02CDC2, 1)

sort_type_pointers			.block

.word <>sort_type_text._TypeOrder
.word <>sort_type_text._KanaOrder
.word <>sort_type_text._PossessionOrder

.bend

;	Sorting categories text
;	Character limit: 8 each, not counting the Select icon.

sort_type_text				.block

_TypeOrder
.text "{SEL1}{SEL2}Type    "
.word $0000

_KanaOrder
.text "{SEL1}{SEL2}Alphabet"
.word $0000

_PossessionOrder
.text "{SEL1}{SEL2}Holder  "
.word $0000

.bend
.here

;	Discard prompts

* = $00F20B
.logical lorom($00F20B, 1)

.text "Discard ite[m?"		; Character limit: 26
.word $0000

.here

* = $00F234
.logical lorom($00F234, 1)

.text "Yes       +No "		; Character limit: 22
.word $0000

.here

;	Discard from Supply

* = $02CAAF
.logical lorom($02CAAF, 1)

.text "Discard ite[m?      "		; Character limit: 26
.word $0000
.text "    Yes       +No       "	; Character COUNT: 24
.word $0000
.word $0000

.here