;	Remove double-tap for on-map boss and death quotes - Ai

;	Vanilla Thracia doesn't have a WaitForA at the end
;	of its boss, death and release quotes.
;	In combat, that means the textbox closes after it is
;	done displaying text (or after the unit's death animation).
;	Outside of combat, the game's code adds a WaitForA
;	to all of these quotes.

;	This removes said part of the game's code, as Lil' Manster
;	has a WaitForA at the end of every quote for ease of reading.

;	If you want to go back to vanilla's system, simply remove
;	this file, and remove all the WaitForAs at the end
;	of the quotes in text_dialogues.


* = $0C8048
.byte $05

* = $0C805A
.byte $05

* = $0C806C
.byte $05