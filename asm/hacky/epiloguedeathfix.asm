; Fixes softlocks for Epilogue slides of dead/captured characters

* = $0A726C
.logical mapped($0A726D)
	.as
	.xl
	.mansiz
	
	.byte	$3A
	
.here

* = $0A7273
.logical mapped($0A7273)

	iny
	lda		#$02
	sta		[lR19],y
	lda		(lR18),y
	cmp		#$20
	beq		is_space
	inc		lR19
	dey
	
is_space

	iny
	.byte	$80
	.byte	$06
	
.here