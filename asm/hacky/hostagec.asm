; Hostage C, the little boy in ch18, is named Chris in Lil' Manster, for the Xavier adjutant puzzle.
; Since he shows up again in ch19, this makes sure that his name displays instead as "Civilian" in it.
; If you don't have such a problem in your FE5 mod or translation, do not include this file
; and revert the edits in Code838000.asm, line 3247.

	.section HostageCSection

		HookCh19HostageC

		.al
		
		sta		lR18+1
		pla
		
		; Has Unit ID in A
		tax
		cmp		#Civilian11
		bne 	_Exit
		
		lda 	@l wCurrentChapter
		cmp 	#Chapter19
		beq 	_ChangeToCivilian
		
		txa
		
		_Exit
		asl
		jml		rlGetCharacterNamePointer._HookCh19HostageCReturn
		
		_ChangeToCivilian
		lda		#$00A5 ; Civilian2Name
		bra 	_Exit

	.endsection HostageCSection
