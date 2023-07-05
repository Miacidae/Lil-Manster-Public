;	Preparations menu pointers

	.section PreparationsMenuOptionPointersSection

		.word <>aPreparationsMenuOptionMap
		.word <>aPreparationsMenuOptionItems
		.word <>aPreparationsMenuOptionPickUnits
		.word <>aPreparationsMenuOptionUnitList
		.word <>aPreparationsMenuOptionOptions
		.word <>aPreparationsMenuOptionSave
		.word 0

	.endsection PreparationsMenuOptionPointersSection

;	Preparations menu text
;	Character limit: 8

	.section PreparationsMenuOptionDataSection

		aPreparationsMenuOptionMap
			.long $8A86FE
			.long 0
			.long 0
			.long $8A870B
			.long $8A870B
			.long 0
			.word $2020
			.text "(Map\n"
		
		aPreparationsMenuOptionItems
			.long 0
			.long 0
			.long 0
			.long $8A86C4
			.long $8A870B
			.long 0
			.word $2020
			.text "Ite[ms\n"
		
		aPreparationsMenuOptionPickUnits
			.long 0
			.long 0
			.long 0
			.long $8A86B7
			.long $8A870B
			.long 0
			.word $2020
			.text "Deploy\n"
		
		aPreparationsMenuOptionSave
			.long 0
			.long 0
			.long 0
			.long $8A87D6
			.long $8A870B
			.long 0
			.word $2020
			.text "Save\n"
		
		aPreparationsMenuOptionUnitList
			.long 0
			.long 0
			.long 0
			.long $8A86DE
			.long $8A870B
			.long 0
			.word $2020
			.text "Unit\n"
		
		aPreparationsMenuOptionOptions
			.long 0
			.long 0
			.long 0
			.long $8A86EB
			.long $8A870B
			.long 0
			.word $2020
			.text "Options \n"

	.endsection PreparationsMenuOptionDataSection



;	Deploy menu pointers

* = $02F955
.logical lorom($02F955, 1)

lda #<>menutextPreparationsFatigued
sta lR18
lda #(>`menutextPreparationsFatigued)
sta lR18+1
rts
lda #<>menutextPreparationsSDrink
sta lR18
lda #(>`menutextPreparationsSDrink)
sta lR18+1

.here

;	Deploy menu text
;	Character limit: 10 characters

* = $056A00
.logical lorom($056A00, 1)

menutextPreparationsFatigued
.text "Fatigued\n"

menutextPreparationsSDrink
.text "S Drink \n"

.here

;	Preps Items menu pointers


	.section PrepItemsLabels

		aPrepItemsDescriptionPointers ; 81/F391
	
	  _MainDescription 		.addr menutextPrepItemsOrganizeItem, 				menutextPrepItemsSelectToReturn
		_List 						.addr menutextPrepItemsSelectItemFromList, 	menutextPrepItemsSpace
		_Trade 						.addr menutextPrepItemsTrade, 				menutextPrepItemsSpace
		_Supply 					.addr menutextPrepItemsSupply, 				menutextPrepItemsSpace
		_Discard 					.addr menutextPrepItemsDiscard, 			menutextPrepItemsSpace
		_ListActive 				.addr menutextPrepItemsSortAndOwner, 		menutextPrepItemsOwner
		_Shop		 				.addr menutextPrepItemsShop, 				menutextPrepItemsSpace
	
		;	Preps Items menu text
		;	Character limit: 28 each. 168 total.
	
		menutextPrepItemsOrganizeItem
		.text "Arrange ite[ms"
		menutextPrepItemsOwner
		menutextPrepItemsSpace
		.text "\n"
	
		menutextPrepItemsSelectToReturn
		.text "              {SEL1}{SEL2}Exit [menu\n"
	
		menutextPrepItemsSelectItemFromList
		menutextPrepItemsSortAndOwner
		.text "Pick ite[ms fro[m a list\n"
		
		menutextPrepItemsTrade
		.text "Trade ite[ms a[mong units \n"
		
		menutextPrepItemsShop
		.text "Visit the shop\n"
		
		menutextPrepItemsSupply
		.text "Visit the Supply\n"
		
		menutextPrepItemsDiscard
		.text "Discard ite[ms\n"

    .fill $81F457 - *, $FF

	.endsection PrepItemsLabels




;	Sorting categories pointers

	.section PreparationsMenuSortingTextPointersSection

		.word <>aPreparationsMenuSortingTypeOrder
		.word <>aPreparationsMenuSortingKanaOrder
		.word <>aPreparationsMenuSortingPossessionOrder

	.endsection PreparationsMenuSortingTextPointersSection

;	Sorting categories text
;	Character limit: 8 each, not counting the Select icon.

	.section PreparationsMenuSortingTextSection

		aPreparationsMenuSortingTypeOrder
		.text "{SEL1}{SEL2}Type    \n"
		
		aPreparationsMenuSortingKanaOrder
		.text "{SEL1}{SEL2}Alphabet\n"
		
		aPreparationsMenuSortingPossessionOrder
		.text "{SEL1}{SEL2}Holder  \n"

	.endsection PreparationsMenuSortingTextSection





;	Discard prompts

; See PrepItems.asm menutextPrepItemsDiscardPrompt and menutextPrepItemsDiscardOptions






;	Discard from Supply

* = $02CAAF
.logical lorom($02CAAF, 1)

.text "Discard ite[m?      \n"		; Character limit: 26
.text "    Yes       +No       \n"	; Character COUNT: 24
.text "\n"

.here