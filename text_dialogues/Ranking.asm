top_part
	.byte $09
	.text "—Complete Military Record—"
	.byte EndText

total_turns
	.byte $09
	.text "Total Turns:      "
	.byte $00, $26
	.byte EndText
	.text " "
	.byte EndText

survivors
	.byte $09
	.text "Surviving Units:"
	.byte $00, $26
	.byte EndText
	.text " "
	.byte EndText
	
rank
	.byte $09
	.text "Overall Rank"
	.byte EndText