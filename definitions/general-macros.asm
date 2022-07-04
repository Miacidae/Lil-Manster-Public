
.cpu "65816"

; Macro definitions

repointer	.macro find, replace



.for i = $0, i < $400000-3, i+= 1
	.if \find == ROM[i+2]*65536+ROM[i+1]*256+ROM[i]
		*= i
		.long \replace
	.else
	.endif
.next

.endm

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

padtext		.macro text

.text \text

.if (len(\text) & $01) != 0

.byte $20

.else

.endif

.endm





