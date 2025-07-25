dialogueDemo1

.byte Right_Slot
.word LoadPortrait
.word dagdar_portrait

.byte Left_Slot
.word LoadPortrait
.word tanya_portrait
.text "Papa, the fighting's started already!"
.word PauseDialogue
.byte $5A

.byte Right_Slot
.text "Ain't no good way to go about this"
.byte NewLine
.text "damned battle..."
.word PauseDialogue
.byte $5A
.byte ScrollText
.text "Don't matter how good Eyvel is, there's only"
.byte NewLine
.text "one of her an' over a dozen of them."
.byte NewLine
.text "We need to hurry."
.word PauseDialogue
.byte $5A

.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Left_Slot
.byte ScrollText
.word ClearPortrait
.word RetractBox

.word PauseDialogue
.byte $3C

.byte Right_Slot
.word LoadPortrait
.word marty_portrait
.text "Oh, fer cryin' out loud!"
.byte NewLine
.text "Not again..."
.word PauseDialogue
.byte $5A

.byte EndText


dialogueDemo2

.byte Right_Slot
.word LoadPortrait
.word eyvel_portrait

.byte Left_Slot
.word LoadPortrait
.word leif_portrait
.text "Commander, over here!"
.byte NewLine
.text "That village is being raided!"
.word PauseDialogue
.byte $5A

.byte Right_Slot
.text "Hmm... That's Lifis' crew, by the look of it."
.byte NewLine
.word PlayMusic
.byte $23
.text "They've been quiet as a mouse for a while,"
.byte NewLine
.text "but I guess they move fast."
.word PauseDialogue
.byte $5A

.byte Left_Slot
.byte ScrollText
.text "And we have to move faster!"
.byte NewLine
.text "We cannot stand by and allow this to happen!"
.word PauseDialogue
.byte $5A

.byte EndText


dialogueDemoRaydrik

.byte Right_Slot
.word LoadPortrait
.word weissman_portrait

.byte Left_Slot
.word LoadPortrait
.word raydrik_portrait
.text "You're certain this is the village, Weismann?"
.word PauseDialogue
.byte $5A

.byte Right_Slot
.text "Quite certain, milord."
.byte NewLine
.text "There can be no mistake."
.word PauseDialogue
.byte $5A

.byte Left_Slot
.byte ScrollText
.text "Then what are you waiting for?"
.byte NewLine
.text "Find the prince!"
.byte NewLine
.text "I want him in chains within the hour!"
.word PauseDialogue
.byte $5A

.byte EndText


dialogueDemoOsian
.word $1400
.byte $00
.text "You're on, Halvan!"
.word PauseDialogue
.byte $5A

.byte EndText


dialogueDemoHalvan

.text "Not bad!"
.byte NewLine
.text "But you've got a long way to go"
.byte NewLine
.text "before you can beat me!"
.word PauseDialogue
.byte $5A

.byte EndText