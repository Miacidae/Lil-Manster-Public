; Expands the text refresh range in the shop screen.



* = $00F814
.logical mapped($00F814)

.al
.xl

	.byte	$0a
	
.here

* = $00F819
.logical mapped($00F819)

	.byte	$0d
	
.here


	.section FixShopSection
		
		fixshop

			pha
			lda		aProcSystem.wInput0,b
			cmp		#$0001
			bne		+

			stz		aProcSystem.wInput0,b

			+
			pla
			clc
			adc		aProcSystem.wInput0,b
			rtl
		
		
		.databank 0

	.endsection FixShopSection

