* = $D60DA
.logical mapped($D60DA)
.byte $00, $26
.byte EndText
.byte $09
.text " Turns"
.byte $01
.here

* = $D3B8C
.logical mapped($D3B8C)
.byte $00, $26
.byte $03
.byte $09
.text "W"
.byte $00, $27
.byte $03
.byte $09
.text "L"
.byte $01
.here

* = $D3B97
.logical mapped($D3B97)
.byte $00, $26
.byte EndText
.byte $09
.text "EXP"
.byte $01
.here

* = $475600
.logical lorom($475600,1)

dialogueEpilogueCaptured
.byte $09
.word $1200
.byte $04
.text "Missing in action"
.byte NewLine
.text "as of the above mission."
.word PauseDialogue
.byte $5A
.byte $0F
.byte $40
.byte $01

.here

* = $475680
.logical lorom($475680,1)

dialogueEpilogueKilled
.byte $09
.word $1200
.byte $04
.text "Killed in action"
.byte NewLine
.text "during the above mission."
.word PauseDialogue
.byte $5A
.byte $0F
.byte $40
.byte $01

.here

