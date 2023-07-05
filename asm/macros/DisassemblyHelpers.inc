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

lorom    .function address, shadow=0

set := (((address >> 16) * $20000) + (address & $FFFF)) + $8000

.if shadow = 1

    set += $800000
    set &= $FFFFFF

.else

.endif

.if (set & $FFFF) < $8000

     set += $8000

.else

.endif

.endf set