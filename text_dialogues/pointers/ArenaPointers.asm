* = $02E9F4
.logical mapped($02E9F4)

	.databank `aProcSystem

	.al
	.xl

	lda @w#$0001
	sta $05FD,x
	lda #(dialogueArenaIntro)>>8
	sta $30
	lda #<>dialogueArenaIntro
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
	lda #(dialogueArenaGoodLuck)>>8
	sta $30
	lda #<>dialogueArenaGoodLuck
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
	lda #(dialogueArenaSurrender)>>8
	sta $30
	lda #<>dialogueArenaSurrender
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
	lda #(dialogueArenaLeave)>>8
	sta $30
	lda #<>dialogueArenaLeave
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
	lda #(dialogueArenaSurrendered)>>8
	sta $30
	lda #<>dialogueArenaSurrendered
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
	lda #(dialogueArenaLost)>>8
	sta $30
	lda #<>dialogueArenaLost
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
	lda #(dialogueArenaNoMoney)>>8
	sta $30
	lda #<>dialogueArenaNoMoney
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
	lda #(dialogueArenaDraw)>>8
	sta $30
	lda #<>dialogueArenaDraw
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
.logical mapped($02EBE1)
.long dialogueArenaWager
.byte 11, 2
.word $0400
.byte $00, $00
.word $00E0
.here


* = $02EBEC
.logical mapped($02EBEC)
.long dialogueArenaYesNo
.byte 20, 6
.word $0800
.byte $01, 00
.word $0000, $0000
.here



;	Note to whoever may come after me: don't bake hex edits into your source rom, for the love of god. - Miacis
* = $02EC18
.logical mapped($02EC18)
.byte `dialogueArenaWin
.here

* = $02EC1C
.logical mapped($02EC1C)
.word <>dialogueArenaWin
.here
