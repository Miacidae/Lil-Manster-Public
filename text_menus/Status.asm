;	Status text pointers

	.section StatusTextPointersSection

		.word <>menutextNoStatus
		.word <>menutextSleepStatus
		.word <>menutextPoisonStatus
		.word <>menutextSilenceStatus
		.word <>menutextBerserkStatus
		.word <>menutextStoneStatus

	.endsection StatusTextPointersSection

;	Status text
;	Character limit: 14

	.section StatusTextDataSection
		
		menutextNoStatus
			.text "{-}{-}{-}{-}  \n"
		
		menutextSleepStatus
			.text "Sleep \n"
		
		menutextPoisonStatus
			.text "Poison\n"
		
		menutextSilenceStatus
			.text "Silence \n"
		
		menutextBerserkStatus
			.text "Berserk \n"
		
		menutextStoneStatus
			.text "Stone \n"

	.endsection StatusTextDataSection