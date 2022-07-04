; Pointers
* = $A59E7
.logical lorom($A59E7,1)
.long NewGame
.here

* = $A2FE1
.logical lorom($A2FE1,1)
.long ReloadChapter
.long SaveChapter
.long CopySave
.long DeleteSave
.long NewGame
.here

* = $A596B
.logical lorom($A596B,1)
.long ConfirmCancel
.here

* = $A59D5
.logical lorom($A59ED,1)
.long ParagonMode
.here

* = $A59ED
.logical lorom($A59ED,1)
.long ReloadChapter
.here

* = $A59F3
.logical lorom($A59F3,1)
.long ResumeChapter
.here

* = $A59F9
.logical lorom($A59F9,1)
.long CopySave
.here

* = $A59FF
.logical lorom($A59FF,1)
.long DeleteSave
.here

* = $A596E
.logical lorom($A596E,1)
.long ConfirmCancel
.long ConfirmCancel
.here

; Text
* = $2D7EFB
.logical lorom($2D7EFB,1)

; Spaces and §_ characters are for centering purposes.
; A regular space is 4-pixels-wide.
; A §_ is a 1-pixel space.

NewGame
.text "§_§_New Game"
.byte EndText


ReloadChapter
.text "Load Game"
.byte EndText

CopySave
.text "Copy Save File"
.byte EndText


DeleteSave
.text " Delete Save File"
.byte EndText

SaveChapter
.text "§_Save Chapter"
.byte EndText

ConfirmCancel
.text "Confirm      Cancel"
.byte EndText

ParagonMode
.text "§_Paragon Mode"
.byte EndText

ResumeChapter
.text " §_Resume Chapter"
.byte EndText

.here

* = $8008A
.logical lorom($8008A,1)
.text " --NO DATA--"
.byte EndText
.here

* = $800A0
.logical lorom($800A0,1)
.text ""
.byte EndText
.here

* = $A59CF
.logical lorom($A59CF,1)
.long SRButton
.here

* = $475550
.logical lorom($475550,1)

SRButton
.text "Sound Room"
.byte EndText

.here