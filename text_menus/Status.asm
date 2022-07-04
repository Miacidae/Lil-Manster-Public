;	Status text pointers

* = $476700
.logical lorom($476700, 1)

status_text_pointers			.block

.word <>status_text._NoStatus
.word <>status_text._SleepStatus
.word <>status_text._PoisonStatus
.word <>status_text._SilenceStatus
.word <>status_text._BerserkStatus
.word <>status_text._StoneStatus

.bend

;	Status text
;	Character limit: 14

status_text						.block

_NoStatus
	.text "{-}{-}{-}{-}  "
.word $0000

_SleepStatus
	.text "Sleep "
.word $0000

_PoisonStatus
	.text "Poison"
.word $0000

_SilenceStatus
	.text "Silence "
.word $0000

_BerserkStatus
	.text "Berserk "
.word $0000

_StoneStatus
	.text "Stone "
.word $0000

.bend

.here