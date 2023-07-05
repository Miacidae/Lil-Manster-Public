
structHDMAArrayCodeSleep .struct Count
	.word <>rsHDMAArrayCodeSleep
	.word \Count
	.ends

structHDMAArrayCodeEnd .struct
	.word <>rsHDMAArrayCodeEnd
	.ends

structHDMAArrayCodeHaltSleep .struct
	.word <>rsHDMAArrayCodeHaltSleep
	.ends

structHDMAArrayCodeHalt .struct
	.word <>rsHDMAArrayCodeHalt
	.ends

structHDMAArrayCodeCall .struct Routine
	.word <>rsHDMAArrayCodeCallRoutine
	.long \Routine
	.ends

structHDMAArrayCodeSetOnCycle .struct Routine
	.word <>rsHDMAArrayCodeSetOnCycle
	.word <>\Routine
	.ends

structHDMAArrayCodeJump .struct Position
	.word <>rsHDMAArrayCodeJump
	.word <>\Position
	.ends

structHDMAArrayCodeSetUnknownTimer .struct Count
	.word <>rsHDMAArrayCodeJumpWhileUnknownTimer
	.word \Count
	.ends

structHDMAArrayCodeJumpIfBitUnset .struct Position, Bits
	.word <>rsHDMAArrayCodeJumpIfBitUnset
	.word <>\Position
	.word \Bits
	.ends

structHDMAArrayCodeJumpIfBitSet .struct Position, Bits
	.word <>rsHDMAArrayCodeJumpIfBitSet
	.word <>\Position
	.word \Bits
	.ends

structHDMAArrayCodeSetTableBank .struct Bank
	.word <>rsHDMAArrayCodeSetTableBank
	.byte \Bank
	.ends
