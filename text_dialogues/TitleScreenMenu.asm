; Pointers
* = $A59E7
.logical mapped($A59E7)
.long NewGame
.here

* = $A2FE1
.logical mapped($A2FE1)
.long ReloadChapter
.long SaveChapter
.long CopySave
.long DeleteSave
.long NewGame
.here

* = $A596B
.logical mapped($A596B)
.long ConfirmCancel
.here

* = $A59D5
.logical mapped($A59ED)
.long ParagonMode
.here

* = $A59ED
.logical mapped($A59ED)
.long ReloadChapter
.here

* = $A59F3
.logical mapped($A59F3)
.long ResumeChapter
.here

* = $A59F9
.logical mapped($A59F9)
.long CopySave
.here

* = $A59FF
.logical mapped($A59FF)
.long DeleteSave
.here

* = $A596E
.logical mapped($A596E)
.long ConfirmCancel
.long ConfirmCancel
.here

; Text
* = $2D7EFB
.logical mapped($2D7EFB)

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
.logical mapped($8008A)
.text " --NO DATA--"
.byte EndText
.here

* = $800A0
.logical mapped($800A0)
.text ""
.byte EndText
.here

* = $A59CF
.logical mapped($A59CF)
.long SRButton
.here

* = $475550
.logical lorom($475550,1)

SRButton
.text "Sound Room"
.byte EndText

.here