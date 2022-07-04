; Fixes softlocks for Epilogue slides of dead/captured characters

* = $0A726C
.logical lorom($0A726D, 1)
	.as
	.xl
	.mansiz
	
	.byte	$3A
	
.here

* = $0A7273
.logical lorom($0A7273, 1)

	iny
	lda		#$02
	sta		[$32],y
	lda		($2f),y
	cmp		#$20
	beq		is_space
	inc		$32
	dey
	
is_space

	iny
	.byte	$80
	.byte	$06
	
.here