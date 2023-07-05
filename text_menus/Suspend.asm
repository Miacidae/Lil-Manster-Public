;	Suspend pointers

* = $0D06E3
.logical lorom($0D06E3, 1)

.word <>menutextSuspendPrompt

.here

* = $0D0737
.logical lorom($0D0737, 1)

.word <>menutextSuspendParagraph

.here

;	Suspend prompt text
;	Character limit: 21 (but more than 19 will look off-center)

* = $0D074B
.logical lorom($0D074B, 1)

menutextSuspendPrompt

	.text "Suspend the ga[me?\n"
	.text "    Yes     +No \n"
	.text "\n"

;	Suspend paragraph text
;	Character limit: 20 (but more than 18 will look off-center)
;	Line limit: 4

menutextSuspendParagraph

	.text "You [may resu[me\n"
	.text "this chapter\n"
	.text "fro[m the [main \n"
	.text "[menu \n"
	.text "\n"

.here
