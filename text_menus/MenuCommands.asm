; Unit action command pointers
; Reorder these pointers to change the action command order


	.section MenuCommandPointersSection

		.word    <>aMenuCommandSeize
		.word    <>aMenuCommandArrive
		.word    <>aMenuCommandTalk
		.word    <>aMenuCommandAttack
		.word    <>aMenuCommandCapture
		.word    <>aMenuCommandStaff
		.word    <>aMenuCommandSteal
		.word    <>aMenuCommandDance
		.word    <>aMenuCommandVisit
		.word    <>aMenuCommandChest
		.word    <>aMenuCommandBridge
		.word    <>aMenuCommandDoor
		.word    <>aMenuCommandSupply
		.word    <>aMenuCommandArmory
		.word    <>aMenuCommandVendor
		.word    <>aMenuCommandSecret
		.word    <>aMenuCommandArena
		.word    <>aMenuCommandRescue
		.word    <>aMenuCommandDrop
		.word    <>aMenuCommandTransfer
		.word    <>aMenuCommandTransfer2
		.word    <>aMenuCommandItem
		.word    <>aMenuCommandTrade
		.word    <>aMenuCommandRelease
		.word    <>aMenuCommandRetreat
		.word    <>aMenuCommandMount
		.word    <>aMenuCommandDismount
		.word    <>aMenuCommandAnimation
		.word    <>aMenuCommandWait
		.word    0

	.endsection MenuCommandPointersSection


;	Unit action command names
;	Character limit: 12, counting the two spaces
;	However, the textboxes can be extended at the end of this file.

	.section MenuCommandDataSection

		aMenuCommandSeize
			.long $878570
			.long 0
			.long 0
			.long $878EE0
			.long $87846C
			.long 0
			.text "  Seize \n"
		
		aMenuCommandRetreat
			.long $8785B3
			.long 0
			.long 0
			.long $878F08
			.long $87846C
			.long 0
			.text "  Escape\n"
		
		aMenuCommandArrive
			.long $8785E5
			.long 0
			.long 0
			.long $878F08
			.long $87846C
			.long 0
			.text "  Arrive\n"
		
		aMenuCommandTalk
			.long $878557
			.long 0
			.long 0
			.long $878BA6
			.long $87846C
			.long 0
			.text "  Talk\n"
		
		aMenuCommandAttack
			.long $8786D8
			.long 0
			.long 0
			.long $8784F8
			.long $87846C
			.long 0
			.text "  Attack\n"
		
		aMenuCommandCapture
			.long $879B37
			.long 0
			.long 0
			.long $878517
			.long $87846C
			.long 0
			.text "  Capture \n"
		
		aMenuCommandSteal
			.long $8799B7
			.long 0
			.long 0
			.long $879A7A
			.long $87846C
			.long 0
			.text "  Steal \n"
		
		aMenuCommandArena
			.long $87915C
			.long 0
			.long 0
			.long $8791B4
			.long $87846C
			.long 0
			.text "  Arena \n"
		
		aMenuCommandArmory
			.long $878AE9
			.long 0
			.long 0
			.long $878536
			.long $87846C
			.long 0
			.text "  Ar[mory \n"
		
		aMenuCommandDoor
			.long $878F14
			.long 0
			.long 0
			.long $878F7E
			.long $87846C
			.long 0
			.text "  Door\n"
		
		aMenuCommandSecret
			.long $878B59
			.long 0
			.long 0
			.long $878536
			.long $87846C
			.long 0
			.text "  Secret\n"
		
		aMenuCommandVisit
			.long $87861F
			.long 0
			.long 0
			.long $878CDA
			.long $87846C
			.long 0
			.text "  Visit \n"
		
		aMenuCommandSupply
			.long $879D78
			.long 0
			.long 0
			.long $879DB0
			.long $87846C
			.long 0
			.text "  Supply\n"
		
		aMenuCommandVendor
			.long $878B21
			.long 0
			.long 0
			.long $878536
			.long $87846C
			.long 0
			.text "  Vendor\n"
		
		aMenuCommandBridge
			.long $878FF6
			.long 0
			.long 0
			.long $879063
			.long $87846C
			.long 0
			.text "  Bridge\n"
		
		aMenuCommandChest
			.long $8790DB
			.long 0
			.long 0
			.long $879130
			.long $87846C
			.long 0
			.text "  Chest \n"
		
		aMenuCommandDance
			.long $8793AB
			.long 0
			.long 0
			.long $8793CC
			.long $87846C
			.long 0
			.text "  Dance \n"
		
		aMenuCommandWait
			.long $87963A
			.long 0
			.long 0
			.long $8784CB
			.long $87846C
			.long 0
			.text "  )Wait \n"
		
		aMenuCommandStaff
			.long $87A31E
			.long 0
			.long 0
			.long $87A2F9
			.long $87846C
			.long 0
			.text "  Staff \n"
		
		aMenuCommandItem
			.long $87A8FA
			.long 0
			.long 0
			.long $87A90F
			.long $87846C
			.long 0
			.text "  Ite[m \n"
		
		aMenuCommandRescue
			.long $87988E
			.long 0
			.long 0
			.long $8798A7
			.long $87846C
			.long 0
			.text "  Rescue\n"
		
		aMenuCommandDrop
			.long $879667
			.long 0
			.long 0
			.long $8796F4
			.long $87846C
			.long 0
			.text "  Drop\n"
		
		aMenuCommandRelease
			.long $879CF4
			.long 0
			.long 0
			.long $879D12
			.long $87846C
			.long 0
			.text "  Release \n"
		
		aMenuCommandTransfer
			.long $879DDD
			.long 0
			.long 0
			.long $879E87
			.long $87846C
			.long 0
			.text "  Give\n"
		
		aMenuCommandTransfer2
			.long $87A03E
			.long 0
			.long 0
			.long $87A0E6
			.long $87846C
			.long 0
			.text "  Take\n"
		
		aMenuCommandTrade
			.long $878D0D
			.long 0
			.long 0
			.long $878DEC
			.long $87846C
			.long 0
			.text "  Trade \n"
		
		aMenuCommandMount
			.long $879474
			.long 0
			.long 0
			.long $879532
			.long $87846C
			.long 0
			.text "  (Mount\n"
		
		aMenuCommandDismount
			.long $8794CF
			.long 0
			.long 0
			.long $879549
			.long $87846C
			.long 0
			.text "  Dis[mount \n"
		
		aMenuCommandAnimation
			.long AnimationByUnitMenuCommandFix
			.long 0
			.long 0
			.long $8791EC
			.long $87846C
			.long 0
			.text "  An{im}ation \n"

	.endsection MenuCommandDataSection



;	Item action command names
;	Character limit: 8, counting the two spaces
;	However, the textboxes can be extended at the end of this file.

	.section ItemUseCommandDataSection

		aItemUseCommandUse
			.long $87AC25
			.long 0
			.long 0
			.long $87AC90
			.long $87ABEE
			.long 0
			.text "  Use \n"
		
		aItemUseCommandEquip
			.long $87AC51
			.long 0
			.long 0
			.long $87ACE9
			.long $87ABEE
			.long 0
			.text "  Equip \n"
		
		aItemUseCommandDiscard
			.long $87AC76
			.long 0
			.long 0
			.long $87AD23
			.long $87ABEE
			.long 0
			.text "  Drop\n"
		
	.endsection ItemUseCommandDataSection


;	Item action command pointers


	.section ItemUseCommandPointersSection

		.word <>aItemUseCommandUse
		.word <>aItemUseCommandEquip
		.word <>aItemUseCommandDiscard

	.endsection ItemUseCommandPointersSection



;	Discard Yes-No command pointers

	.section DiscardCommandPointersSection

		.word <>aDiscardCommandYes
		.word <>aDiscardCommandNo

	.endsection DiscardCommandPointersSection


;	Discard Yes-No command names
;	Character limit: 8, counting the two spaces

	.section DiscardCommandDataSection

		aDiscardCommandYes
			.long 0
			.long 0
			.long 0
			.long $8A877A
			.long $8A8788
			.long 0
			.text "  Yes \n"
		
		aDiscardCommandNo
			.long 0
			.long 0
			.long 0
			.long $8A8788
			.long $8A8788
			.long 0
			.text "  +No \n"

	.endsection DiscardCommandDataSection

;	Animation command pointers

	.section AnimationCommandPointersSection

		.word <>aAnimationCommandNormal
		.word <>aAnimationCommandMap
		.word 0

	.endsection AnimationCommandPointersSection

;	Animation command names
;	Character limit: 8, counting the two spaces

	.section AnimationCommandDataSection

		aAnimationCommandNormal
			.long 0
			.long 0
			.long 0
			.long $8792D3
			.long $8792FF
			.long 0
			.text "  On\n"
		
		aAnimationCommandMap
			.long 0
			.long 0
			.long 0
			.long $87930B
			.long $8792FF
			.long 0
			.text "  Off \n"

	.endsection AnimationCommandDataSection

;	Select/R global command pointers


	.section MapMenuCommandPointersSection

		.word	<>aMapMenuCommandUnit
		.word	<>aMapMenuCommandStatus
		.word	<>aMapMenuCommandOptions
		.word	<>aMapMenuCommandSuspend
		.word	<>aMapMenuCommandEnd
		.word	0

	.endsection MapMenuCommandPointersSection

;	Select/R global command names
;	Character limit: 10, counting the two spaces
;	However, the textboxes can be extended at the end of this file.

	.section MapMenuCommandDataSection

		aMapMenuCommandUnit
			.long 0
			.long 0
			.long 0
			.long $8A84D4
			.long $8A84BD
			.long 0
			.text "  Unit"
			.word $0000
		
		aMapMenuCommandStatus
			.long 0
			.long 0
			.long 0
			.long $8A84FF
			.long $8A84BD
			.long 0
			.text "  Status"
			.word $0000
		
		aMapMenuCommandOptions
			.long 0
			.long 0
			.long 0
			.long $8A8555
			.long $8A84BD
			.long 0
			.text "  Options "
			.word $0000
		
		aMapMenuCommandSuspend
			.long 0
			.long 0
			.long 0
			.long $8A86D1
			.long $8A84BD
			.long 0
			.text "  Suspend "
			.word $0000
		
		aMapMenuCommandEnd
			.long 0
			.long 0
			.long 0
			.long $8A848F
			.long $8A84BD
			.long 0
			.text "  End "
			.word $0000

	.endsection MapMenuCommandDataSection





;	Extending text boxes

* = $038388
.logical mapped($038388)
.byte $08 ; Unit action commands
.here

* = $0503D9
.logical mapped($0503D9)
.byte $07 ; Select global commands
.here

* = $050430
.logical mapped($050430)
.byte $07 ; R global commands (when all units have moved)
.here

;	Moving boxes to fit size changes

* = $038370
.logical mapped($038370)
.byte $17 ; Unit action commands
.here

* = $050400
.logical mapped($050400)
.byte $17 ; Select global commands
.here

* = $05045D
.logical mapped($05045D)
.byte $17 ; R global commands
.here
