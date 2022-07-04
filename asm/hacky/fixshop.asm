; Expands the text refresh range in the shop screen.

* = $00F60E
.logical lorom($00F60E, 1)

	.al
	.xl
	.mansiz
	
	jsl		fixshop
	
.here

* = $00F814
.logical lorom($00F814, 1)

	.byte	$0a
	
.here

* = $00F819
.logical lorom($00F819, 1)

	.byte	$0d
	
.here

* = $475A10
.logical lorom($475A10, 1)

.databank $0E

fixshop

	pha
	lda		$052d,b
	cmp		#$0001
	bne		return
	stz		$052d,b
	
return

	pla
	clc
	adc		$052d,b
	rtl


.databank 0
.here
