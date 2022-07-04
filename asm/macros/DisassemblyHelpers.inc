segmentStart .segment Pointer=*
	DSizeStarts ..= [\Pointer]
	.endm

segmentEnd .segment Pointer=*
	DSizeEnds ..= [\Pointer]
	.endm

GetShiftAmount .function Number
	; Given a number, return how far left
	; the uppermost bit is shifted
	Result := 0
	.if (Number != 0)
		Result := -1
		.for i=Number, i!=0, i>>=1
			Result += 1
		.next
	.endif
	.endf Result

Modify .function Entry, Value, List
	List := List[:Entry] .. [Value] .. List[Entry+1:]
	.endf List

byte .struct Value
  .byte \Value
.ends

char .struct Value
  .char \Value
.ends

word .struct Value
  .word \Value
.ends

sint .struct Value
  .sint \Value
.ends

addr .struct Value
  .addr \Value
.ends

rta .struct Value
  .rta \Value
.ends

long .struct Value
  .long \Value
.ends

lint .struct Value
  .lint \Value
.ends

dword .struct Value
  .dword \Value
.ends

dint .struct Value
  .dint \Value
.ends

checkfit .macro Offset
  .cerror (* > \Offset), format("$%06X", *)
.endm

pack .function Iterable, Width=2
  Iterable := list(Iterable)
  .if ((len(Iterable) & 1) == 1)
    Iterable ..= [0]
  .endif
.endf (Iterable[0::2] | (Iterable[1::2] << (4 * Width)))
