* = $02E9F4
.logical lorom($02E9F4, 1)

	.mansiz
	.al
	.xl
	lda @w#$0001
	sta $05FD,x
	lda #(arena_text._intro)>>8
	sta $30
	lda #<>arena_text._intro
	sta $2F
	lda #$0400
	sta $0B
	lda @w#$0000
	sta $0D
	ldx #$020B
	lda @w#$0000
	sta $0F
	lda @w#$00E0
	sta $11
	jsl $94CC3D
	rtl 

	stz $05FD,x
	lda #$EA2E
	sta $05BD,x
	jsl $85E93E
	rtl 

	lda @w#$0001
	sta $05FD,x
	lda #(arena_text._good_luck)>>8
	sta $30
	lda #<>arena_text._good_luck
	sta $2F
	lda #$0400
	sta $0B
	lda @w#$0000
	sta $0D
	ldx #$020B
	lda @w#$0000
	sta $0F
	lda @w#$00E0
	sta $11
	jsl $94CC3D
	rtl 

	stz $05FD,x
	lda #$EA68
	sta $05BD,x
	jsl $85E93E
	rtl 

	lda @w#$0001
	sta $05FD,x
	lda #(arena_text._surrender)>>8
	sta $30
	lda #<>arena_text._surrender
	sta $2F
	lda #$0400
	sta $0B
	lda @w#$0000
	sta $0D
	ldx #$020B
	lda @w#$0000
	sta $0F
	lda @w#$00E0
	sta $11
	jsl $94CC3D
	rtl 

	stz $05FD,x
	lda #$EAA2
	sta $05BD,x
	jsl $85E93E
	rtl 

	lda @w#$0001
	sta $05FD,x
	lda #(arena_text._leave)>>8
	sta $30
	lda #<>arena_text._leave
	sta $2F
	lda #$0400
	sta $0B
	lda @w#$0000
	sta $0D
	ldx #$020B
	lda @w#$0000
	sta $0F
	lda @w#$00E0
	sta $11
	jsl $94CC3D
	rtl 

	stz $05FD,x
	lda #$EADC
	sta $05BD,x
	jsl $85E93E
	rtl 

	lda @w#$0001
	sta $05FD,x
	lda #(arena_text._surrendered)>>8
	sta $30
	lda #<>arena_text._surrendered
	sta $2F
	lda #$0400
	sta $0B
	lda @w#$0000
	sta $0D
	ldx #$020B
	lda @w#$0000
	sta $0F
	lda @w#$00E0
	sta $11
	jsl $94CC3D
	rtl 

	stz $05FD,x
	lda #$EB16
	sta $05BD,x
	jsl $85E93E
	rtl 

	lda @w#$0001
	sta $05FD,x
	lda #(arena_text._lost)>>8
	sta $30
	lda #<>arena_text._lost
	sta $2F
	lda #$0400
	sta $0B
	lda @w#$0000
	sta $0D
	ldx #$020B
	lda @w#$0000
	sta $0F
	lda @w#$00E0
	sta $11
	jsl $94CC3D
	rtl 

	stz $05FD,x
	lda #$EB50
	sta $05BD,x
	jsl $85E93E
	rtl 

	lda @w#$0001
	sta $05FD,x
	lda #(arena_text._broke)>>8
	sta $30
	lda #<>arena_text._broke
	sta $2F
	lda #$0400
	sta $0B
	lda @w#$0000
	sta $0D
	ldx #$020B
	lda @w#$0000
	sta $0F
	lda @w#$00E0
	sta $11
	jsl $94CC3D
	rtl 

	stz $05FD,x
	lda #$EB8A
	sta $05BD,x
	jsl $85E93E
	rtl 

	lda @w#$0001
	sta $05FD,x
	lda #(arena_text._draw)>>8
	sta $30
	lda #<>arena_text._draw
	sta $2F
	lda #$0400
	sta $0B
	lda @w#$0000
	sta $0D
	ldx #$020B
	lda @w#$0000
	sta $0F
	lda @w#$00E0
	sta $11
	jsl $94CC3D
	rtl 

	stz $05FD,x
	lda #$EBC4
	sta $05BD,x
	jsl $85E93E
	rtl 

	lda @w#$0001
	sta $05FD,x
	lda $7EA93D
	sta $7E4598
	lda #$8500
	sta $30
	lda #$EBE1
	sta $2F
	jsl $94CBA2
	rtl 

.here


* = $02EBE1
.logical lorom($02EBE1, 1)
.long arenawager
.byte 11, 2
.word $0400
.byte $00, $00
.word $00E0
.here


* = $02EBEC
.logical lorom($02EBEC, 1)
.long arenayesno
.byte 20, 6
.word $0800
.byte $01, 00
.word $0000, $0000
.here



;	Note to whoever may come after me: don't bake hex edits into your source rom, for the love of god. - Miacis
* = $02EC18
.logical lorom($02EC18, 1)
.byte `arenawin
.here

* = $02EC1C
.logical lorom($02EC1C, 1)
.word <>arenawin
.here
