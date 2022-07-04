* = $D60DA
.logical lorom($D60DA, 1)
.byte $00, $26
.byte EndText
.byte $09
.text " Turns"
.byte $01
.here

* = $D3B8C
.logical lorom($D3B8C, 1)
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
.logical lorom($D3B97, 1)
.byte $00, $26
.byte EndText
.byte $09
.text "EXP"
.byte $01
.here

* = $0A6D3F
.logical lorom($0A6D3F, 1)

.word <>killeddeathtext

.here

* = $475600
.logical lorom($475600,1)

captureddeathtext
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

killeddeathtext
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

