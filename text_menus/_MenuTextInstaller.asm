; Text includes

.include "textformatter/output/MenuText.asm"
.include "Options.asm"
.include "Classes.asm"
.include "ClassNamesOrder.asm"
.include "Factions.asm"
.include "ItemDescriptions.asm"
.include "ItemNames.asm"
.include "ItemNamesOrder.asm"
.include "MenuCommands.asm"
.include "MiscMenus.asm"
.include "PopUpBoxes.asm"
.include "Preparations.asm"
.include "Skills.asm"
.include "SoundRoom.asm"
.include "Status.asm"
.include "Suspend.asm"
.include "Terrain.asm"
.include "UnitNames.asm"

;	Menu font graphics

* = $39CC80
.logical mapped($39CC80)

text_image_1
.binary "textformatter/output/MenuTextFont.2bpp"

.here

* = $3A6800
.logical mapped($3A6800)

text_image_2
.binary "textformatter/output/MenuTextSupplement.2bpp"

.here

; 	Menu text table setup

* = $03E79C
.logical mapped($03E79C)

text_type_skip					; Always use text table
	bra		mapped($03E81D)

.here

* = $03E825						; setting up text to use new table
.logical mapped($03E825)

.long text_table

.here

* = $03E83E
.logical mapped($03E83E)

.long text_table + $02

.here

* = $03E850
.logical mapped($03E850)

.long text_table + $04

.here

* = $03E831
.logical mapped($03E831)

.word $0EB8

.here

* = $03E923				; Force battles to use text table
.logical mapped($03E923)

battlefix
	.mansiz
	.xl
	.al
	ldx	#0

_loop
	cmp	text_table,x	; Compare text to table
	beq	_found
	inx		
	inx		
	inx		
	inx		
	inx		
	inx		
	cpx	#$0EB8			; Max number of entries
	bcc	_loop
	bra	_none			; If not in table, end

_found					; Get tiles
	lda	text_table+$02,x
	sta	wR10
	lda	text_table+$04,x
	sta	wR11

_end
	plx
	plp
	plb
	rtl

_none
	stz	wR10
	stz	wR11
	bra	_end

.here

* = $03E8E8
.logical mapped($03E8E8)

.byte $80				; Change branch to unconditional, always use text table

.here

* = $03E81D
.logical $87E81D
	.al
	.xl
	.autsiz
    .databank 0

    phx
    lda @w $0000,x
    jsl find_offset
	bcs $87E837
	bra $87E85A

.here

* = $1FB704				; Said table
.logical mapped($1FB704)

text_table		.binary "textformatter/output/MenuTextTable.bin"
table_offsets	.binary "textformatter/output/MenuTextOffsets.bin"

find_offset
    phy
    tay
    xba
    and #$00ff
    asl
    tax
    lda table_offsets+2,x
    sta wR1
    lda table_offsets,x
    sta wR0
    bra +

	-   
	sta wR1

begin
    lda wR0
	
	+
    cmp wR1
    beq failed
	
	-   
	adc wR1
    lsr
    pha
    asl
    adc $01,s
    asl
    tax
    tya
    cmp @l text_table,x
    beq found

    pla
    bcc --

    inc a
    sta wR0 
    cmp wR1
    bne -

failed
    clc
    bra +

found
    pla
	
	+   
	ply
    rtl

.here

; 	Force battles to read from ROM

* = $0E0201
.logical mapped($0E0201)

.byte $F3				; Text image bank

.here

* = $0E020C
.logical mapped($0E020C)

.word $CC80				; Text image offset

.here

* = $0E022B
.logical mapped($0E022B)

.word $CC80				; Text image offset

.here

* = $0E0260
.logical mapped($0E0260)

.byte $F3				; Text image bank

.here

* = $0E026B
.logical mapped($0E026B)

.word $CC80				; Text image offset

.here

* = $0E0289
.logical mapped($0E0289)

.word $CC80				; Text image offset

.here

; 	Box extension when using items

* = $03A52C
.logical mapped($03A52C)

.byte $0C ; Width

.here

* = $03A53B
.logical mapped($03A53B)

.byte $10 ; Height, needs research on BG problem

.here

* = $03A5CA
.logical mapped($03A5CA)

.byte $10 ; And here's the fix to the BG problem - Ultimage

.here

; 	Create a new blank description with new size

* = $03A7D0
.logical mapped($03A7D0)

.word <>menuTextBlankDescription

.here

* = $03A7D5
.logical mapped($03A7D5)

.word menuTextBlankDescription>>8

.here

* = $0366AD
.logical mapped($0366AD)

menuTextBlankDescription

.text "                    \n"
.text "                    \n"
.text "                    \n"
.text "                    \n"
.text "                    \n"
.text "                    \n"
.text "                    \n"
.text "\n"

.here