dialogueArenaIntro

	.text "This 'ere's an arena."
	.byte NewLine
	.text "You up for some bloodsport, mate?"
.byte EndTextNoPortraitFade

dialogueArenaGoodLuck

	.text "Good luck."
	.byte NewLine
	.text "Don't get yourself killed, eh?"
.byte EndTextNoPortraitFade

dialogueArenaSurrender

	.text "The fight's to the death, but you"
	.byte NewLine
	.text "can [press B] to yield."
.byte EndTextNoPortraitFade

dialogueArenaLeave

	.text "If you ain't payin', you ain't stayin'."
	.byte NewLine
	.text "Get lost."
.byte EndTextNoPortraitFade

dialogueArenaSurrendered

	.text "Givin' up already?"
	.byte NewLine
	.text "Guess I'll be pocketin' yer wager."
.byte EndTextNoPortraitFade

dialogueArenaLost

	.text "Tch..."
	.byte NewLine
	.text "Dyin' ain't no way to make a livin'."
.byte EndTextNoPortraitFade

dialogueArenaNoMoney

	.text "Short on coin? Beat it, then."
.byte EndTextNoPortraitFade

dialogueArenaDraw

	.text "Nothing's more boring than a tie..."
	.byte NewLine
	.text "Well, here's yer coin back."
.byte EndTextNoPortraitFade

dialogueArenaWager
	.text "You up fer wagerin'"
	.byte NewLine
	.byte $00, $24 ; display number?
	.text " gold?"
.byte EndTextNoPortraitFade


dialogueArenaYesNo
	.text "Yes        No"
.byte EndTextNoPortraitFade

dialogueArenaWin
	.text "Quite the sight. Here's yer reward:"
	.byte NewLine
	.byte $00, $24 ; display number?
	.text " gold."
.byte EndTextNoPortraitFade