
structCharacterNamePointer .struct Pointer
	Pointer .addr \Pointer
	.ends

structSupports .struct Getter, Giver, Support
	Getter		.word \Getter
	Giver		.word \Giver
	Support		.byte \Support
	.ends

structPromotion .struct Character, Promotion
	Character	.word \Character
	Promotion	.byte \Promotion
	.ends