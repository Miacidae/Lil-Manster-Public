;	Controls text pointers

* = $07E7FB
.logical lorom($07E7FB, 1)
.byte `menutextSoundRoomTitle
.here

* = $07E7FF
.logical lorom($07E7FF, 1)
.word <>menutextSoundRoomTitle
.here

* = $07E824
.logical lorom($07E824, 1)
.byte `menutextSoundRoomAButton
.here

* = $07E828
.logical lorom($07E828, 1)
.word <>menutextSoundRoomAButton
.here

* = $07E847
.logical lorom($07E847, 1)
.byte `menutextSoundRoomBButton
.here

* = $07E84B
.logical lorom($07E84B, 1)
.word <>menutextSoundRoomBButton
.here

* = $07E86A
.logical lorom($07E86A, 1)
.byte `menutextSoundRoomStartButton
.here

* = $07E86E
.logical lorom($07E86E, 1)
.word <>menutextSoundRoomStartButton
.here

;	Controls text

* = $475580
.logical lorom($475580, 1)

menutextSoundRoomTitle
.text "     Sound Roo{m}\n"		; Character limit: 18. Use spaces to center it.

menutextSoundRoomAButton
.text "{A} to play\n"			; Character limit: 25

menutextSoundRoomBButton
.text "{B} to stop\n"			; Character limit: 25

menutextSoundRoomStartButton
.text "Start to exit \n"		; Character limit: 25

.here

;	Categories pointers


	.section SoundRoomCategoryTextPointersSection

		.word	<>menutextSoundRoomCategory00
		.word	<>menutextSoundRoomCategory01
		.word	<>menutextSoundRoomCategory02
		.word	<>menutextSoundRoomCategory03
		.word	<>menutextSoundRoomCategory04
		.word	<>menutextSoundRoomCategory05
		.word	<>menutextSoundRoomCategory06
		.word	<>menutextSoundRoomCategory07

	.endsection SoundRoomCategoryTextPointersSection

;	Categories text
;	Character limit: 25. An ending space to complete the last tile doesn't count as a character.


	.section SoundRoomCatrgoryTextSection

		menutextSoundRoomCategory00
			.text "Thracia {7}{7}{6}\n"
		
		menutextSoundRoomCategory01
			.text "Leif's Search for Victory \n"
		
		menutextSoundRoomCategory02
			.text "Pressing Threat \n"
		
		menutextSoundRoomCategory03
			.text "Serving Justice \n"
		
		menutextSoundRoomCategory04
			.text "A[midst the Battle\n"
		
		menutextSoundRoomCategory05
			.text "Chapter End \n"
		
		menutextSoundRoomCategory06
			.text "(Mid Chapter\n"
		
		menutextSoundRoomCategory07
			.text "Finale\n"

	.endsection SoundRoomCatrgoryTextSection




;	Track name pointers

	.section SoundRoomDataTrackPointersSection

		.word	<>aSoundRoomDataTrack01
		.word	<>aSoundRoomDataTrack02
		.word	<>aSoundRoomDataTrack03
		.word	<>aSoundRoomDataTrack04
		.word	<>aSoundRoomDataTrack05
		.word	<>aSoundRoomDataTrack06
		.word	<>aSoundRoomDataTrack07
		.word	<>aSoundRoomDataTrack08
		.word	<>aSoundRoomDataTrack09
		.word	<>aSoundRoomDataTrack10
		.word	<>aSoundRoomDataTrack11
		.word	<>aSoundRoomDataTrack12
		.word	<>aSoundRoomDataTrack13
		.word	<>aSoundRoomDataTrack14
		.word	<>aSoundRoomDataTrack15
		.word	<>aSoundRoomDataTrack16
		.word	<>aSoundRoomDataTrack17
		.word	<>aSoundRoomDataTrack18
		.word	<>aSoundRoomDataTrack19
		.word	<>aSoundRoomDataTrack20
		.word	<>aSoundRoomDataTrack21
		.word	<>aSoundRoomDataTrack22
		.word	<>aSoundRoomDataTrack23
		.word	<>aSoundRoomDataTrack24
		.word	<>aSoundRoomDataTrack25
		.word	<>aSoundRoomDataTrack26
		.word	<>aSoundRoomDataTrack27
		.word	<>aSoundRoomDataTrack28
		.word	<>aSoundRoomDataTrack29
		.word	<>aSoundRoomDataTrack30
		.word	<>aSoundRoomDataTrack31
		.word	<>aSoundRoomDataTrack32
		.word	<>aSoundRoomDataTrack33
		.word	<>aSoundRoomDataTrack34
		.word	<>aSoundRoomDataTrack35
		.word	<>aSoundRoomDataTrack36
		.word	<>aSoundRoomDataTrack37
		.word	<>aSoundRoomDataTrack38
		.word	<>aSoundRoomDataTrack39
		.word	<>aSoundRoomDataTrack40
		.word	<>aSoundRoomDataTrack41
		.word	<>aSoundRoomDataTrack42
		.word	<>aSoundRoomDataTrack43
		.word	<>aSoundRoomDataTrack44
		.word	<>aSoundRoomDataTrack45
		.word	<>aSoundRoomDataTrack46
		.word	<>aSoundRoomDataTrack47
		.word	<>aSoundRoomDataTrack48
		.word	<>aSoundRoomDataTrack49
		.word	<>aSoundRoomDataTrack50
		.word	<>aSoundRoomDataTrack51
		.word	<>aSoundRoomDataTrack52
		.word	<>aSoundRoomDataTrack53
		.word	<>aSoundRoomDataTrack54
		.word	<>aSoundRoomDataTrack55
		.word	<>aSoundRoomDataTrack56
		.word	<>aSoundRoomDataTrack57
		.word	<>aSoundRoomDataTrack58
		.word	<>aSoundRoomDataTrack59

	.endsection SoundRoomDataTrackPointersSection

;	Track names
;	Character limit: 25. An ending space to complete the last tile doesn't count as a character.

	.section SoundRoomDataTracksSection

		aSoundRoomDataTrack01
			.byte $00		; Category
			.byte $21		; Music track number
			.text "Begins\n"
		
		aSoundRoomDataTrack02
			.byte $00		; Category
			.byte $23		; Music track number
			.text "Fire E[mble[m The[me\n"
		
		aSoundRoomDataTrack03
			.byte $00		; Category
			.byte $29		; Music track number
			.text "(Map  {A}\n"
		
		aSoundRoomDataTrack04
			.byte $00		; Category
			.byte $2B		; Music track number
			.text "(Map  {B}\n"
		
		aSoundRoomDataTrack05
			.byte $00		; Category
			.byte $2C		; Music track number
			.text "(Map  {C}\n"
		
		aSoundRoomDataTrack06
			.byte $00		; Category
			.byte $2D		; Music track number
			.text "Sally Forth \n"
		
		aSoundRoomDataTrack07
			.byte $01		; Category
			.byte $01		; Music track number
			.text "Base\n"
		
		aSoundRoomDataTrack08
			.byte $01		; Category
			.byte $02		; Music track number
			.text "Assault {A}\n"
		
		aSoundRoomDataTrack09
			.byte $01		; Category
			.byte $03		; Music track number
			.text "Assault {B}\n"
		
		aSoundRoomDataTrack10
			.byte $01		; Category
			.byte $04		; Music track number
			.text "Adversity \n"
		
		aSoundRoomDataTrack11
			.byte $01		; Category
			.byte $05		; Music track number
			.text "The Cusp of Victory \n"
		
		aSoundRoomDataTrack12
			.byte $01		; Category
			.byte $06		; Music track number
			.text "The Edge of Defeat\n"
		
		aSoundRoomDataTrack13
			.byte $01		; Category
			.byte $07		; Music track number
			.text "Reconnoissance\n"
		
		aSoundRoomDataTrack14
			.byte $01		; Category
			.byte $08		; Music track number
			.text "Leif\n"
		
		aSoundRoomDataTrack15
			.byte $02		; Category
			.byte $09		; Music track number
			.text "Base  {A}\n"
		
		aSoundRoomDataTrack16
			.byte $02		; Category
			.byte $0A		; Music track number
			.text "Base  {B}\n"
		
		aSoundRoomDataTrack17
			.byte $02		; Category
			.byte $0B		; Music track number
			.text "Assault \n"
		
		aSoundRoomDataTrack18
			.byte $02		; Category
			.byte $0C		; Music track number
			.text "Dark Bishops\n"
		
		aSoundRoomDataTrack19
			.byte $02		; Category
			.byte $0D		; Music track number
			.text "Reconnoissance\n"
		
		aSoundRoomDataTrack20
			.byte $02		; Category
			.byte $0E		; Music track number
			.text "Endga[me\n"
		
		aSoundRoomDataTrack21
			.byte $03		; Category
			.byte $11		; Music track number
			.text "Attack\n"
		
		aSoundRoomDataTrack22
			.byte $03		; Category
			.byte $12		; Music track number
			.text "Defense \n"
		
		aSoundRoomDataTrack23
			.byte $03		; Category
			.byte $13		; Music track number
			.text "Recovery  {A}\n"
		
		aSoundRoomDataTrack24
			.byte $03		; Category
			.byte $14		; Music track number
			.text "Recovery  {B}\n"
		
		aSoundRoomDataTrack25
			.byte $03		; Category
			.byte $15		; Music track number
			.text "Dance \n"
		
		aSoundRoomDataTrack26
			.byte $03		; Category
			.byte $16		; Music track number
			.text "Class Change\n"
		
		aSoundRoomDataTrack27
			.byte $03		; Category
			.byte $1E		; Music track number
			.text "Boss Battle \n"
		
		aSoundRoomDataTrack28
			.byte $03		; Category
			.byte $18		; Music track number
			.text "Against Raydrik \n"
		
		aSoundRoomDataTrack29
			.byte $03		; Category
			.byte $19		; Music track number
			.text "Against Veld\n"
		
		aSoundRoomDataTrack30
			.byte $03		; Category
			.byte $1A		; Music track number
			.text "Arena Battle\n"
		
		aSoundRoomDataTrack31
			.byte $03		; Category
			.byte $1B		; Music track number
			.text "Level Up  {A}\n"
		
		aSoundRoomDataTrack32
			.byte $03		; Category
			.byte $1C		; Music track number
			.text "Level Up  {B}\n"
		
		aSoundRoomDataTrack33
			.byte $04		; Category
			.byte $31		; Music track number
			.text "Crisis\n"
		
		aSoundRoomDataTrack34
			.byte $04		; Category
			.byte $32		; Music track number
			.text "Assault \n"
		
		aSoundRoomDataTrack35
			.byte $04		; Category
			.byte $33		; Music track number
			.text "Destiny \n"
		
		aSoundRoomDataTrack36
			.byte $04		; Category
			.byte $39		; Music track number
			.text "Battalion {A}\n"
		
		aSoundRoomDataTrack37
			.byte $04		; Category
			.byte $3F		; Music track number
			.text "Battalion {B}\n"
		
		aSoundRoomDataTrack38
			.byte $04		; Category
			.byte $3A		; Music track number
			.text "Bandits \n"
		
		aSoundRoomDataTrack39
			.byte $04		; Category
			.byte $3D		; Music track number
			.text "Thracia \n"
		
		aSoundRoomDataTrack40
			.byte $04		; Category
			.byte $3C		; Music track number
			.text "Loptrians {A}\n"
		
		aSoundRoomDataTrack41
			.byte $04		; Category
			.byte $3E		; Music track number
			.text "Loptrians {B}\n"
		
		aSoundRoomDataTrack42
			.byte $04		; Category
			.byte $3B		; Music track number
			.text "Raydrik \n"
		
		aSoundRoomDataTrack43
			.byte $05		; Category
			.byte $41		; Music track number
			.text "Victory \n"
		
		aSoundRoomDataTrack44
			.byte $05		; Category
			.byte $42		; Music track number
			.text "(Minor Victory\n"
		
		aSoundRoomDataTrack45
			.byte $05		; Category
			.byte $43		; Music track number
			.text "August Speaks {A}\n"
		
		aSoundRoomDataTrack46
			.byte $05		; Category
			.byte $44		; Music track number
			.text "August Speaks {B}\n"
		
		aSoundRoomDataTrack47
			.byte $05		; Category
			.byte $45		; Music track number
			.text "Go, Leif, Go! \n"
		
		aSoundRoomDataTrack48
			.byte $05		; Category
			.byte $46		; Music track number
			.text "Conquest\n"
		
		aSoundRoomDataTrack49
			.byte $06		; Category
			.byte $4A		; Music track number
			.text "Recruit[ment\n"
		
		aSoundRoomDataTrack50
			.byte $06		; Category
			.byte $4B		; Music track number
			.text "(Meetings and Reunions\n"
		
		aSoundRoomDataTrack51
			.byte $06		; Category
			.byte $4C		; Music track number
			.text "Co[mic Relief \n"
		
		aSoundRoomDataTrack52
			.byte $06		; Category
			.byte $4D		; Music track number
			.text "Church\n"
		
		aSoundRoomDataTrack53
			.byte $06		; Category
			.byte $4E		; Music track number
			.text "Sorro12 \n"
		
		aSoundRoomDataTrack54
			.byte $06		; Category
			.byte $4F		; Music track number
			.text "Sara\n"
		
		aSoundRoomDataTrack55
			.byte $06		; Category
			.byte $50		; Music track number
			.text "Eyvel \n"
		
		aSoundRoomDataTrack56
			.byte $07		; Category
			.byte $24		; Music track number
			.text "Results \n"
		
		aSoundRoomDataTrack57
			.byte $07		; Category
			.byte $25		; Music track number
			.text "Epilogue\n"
		
		aSoundRoomDataTrack58
			.byte $07		; Category
			.byte $26		; Music track number
			.text "Ballad\n"
		
		aSoundRoomDataTrack59
			.byte $07		; Category
			.byte $27		; Music track number
			.text "(Music Box\n"
		
	.endsection SoundRoomDataTracksSection
