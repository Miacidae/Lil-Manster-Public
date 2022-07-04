; Text includes

.include "textformatter/output/MenuText.asm"
.include "Options.asm"
.include "Classes.asm"
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
.logical lorom($39CC80, 1)

text_image_1
.binary "textformatter/output/MenuTextFont.2bpp"

.here

* = $3A6800
.logical lorom($3A6800, 1)

text_image_2
.binary "textformatter/output/MenuTextSupplement.2bpp"

.here

; 	Menu text table setup

* = $03E79C
.logical lorom($03E79C, 1)

text_type_skip					; Always use text table
	bra		lorom($03E81D, 1)

.here

* = $03E825						; setting up text to use new table
.logical lorom($03E825, 1)

.long text_table

.here

* = $03E83E
.logical lorom($03E83E, 1)

.long text_table + $02

.here

* = $03E850
.logical lorom($03E850, 1)

.long text_table + $04

.here

* = $03E831
.logical lorom($03E831, 1)

.word $0EB8

.here

* = $03E923						; Force battles to use text table
.logical lorom($03E923, 1)

battlefix
	.mansiz
	.xl
	.al
	ldx		#$0000

_loop
	cmp		text_table,x	; Compare text to table
	beq		_found
	inx		
	inx		
	inx		
	inx		
	inx		
	inx		
	cpx		#$0EB8	; Max number of entries
	bcc		_loop
	bra		_none	; If not in table, end

_found				; Get tiles
	lda		text_table+$02,x
	sta		$1F
	lda		text_table+$04,x
	sta		$21

_end
	plx
	plp
	plb
	rtl

_none
	stz		$1F
	stz		$21
	bra		_end

.here

* = $03E8E8
.logical lorom($03E8E8, 1)

.byte $80						; Change branch to unconditional, always use text table

.here

* = $03E81D
.logical $87E81D
	.al
	.xl
	.autsiz

    phx
    lda @w $0000,x
    jsl find_offset
	bcs $87E837
	bra $87E85A

.here

* = $1FB704						; Said table
.logical lorom($1FB704, 1)

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
.logical lorom($0E0201, 1)

.byte $F3				; Text image bank

.here

* = $0E020C
.logical lorom($0E020C, 1)

.word $CC80				; Text image offset

.here

* = $0E022B
.logical lorom($0E022B, 1)

.word $CC80				; Text image offset

.here

* = $0E0260
.logical lorom($0E0260, 1)

.byte $F3				; Text image bank

.here

* = $0E026B
.logical lorom($0E026B, 1)

.word $CC80				; Text image offset

.here

* = $0E0289
.logical lorom($0E0289, 1)

.word $CC80				; Text image offset

.here

;	Moving staff descriptions over a tile

* = $00F693
.logical lorom($00F693, 1)

.word $03FF ; Lower numbers move left. Higher moves right

.here

; 	Box extension when using items

* = $03A52C
.logical lorom($03A52C, 1)

.byte $0C ; Width

.here

* = $03A53B
.logical lorom($03A53B, 1)

.byte $10 ; Height, needs research on BG problem

.here

* = $03A5CA
.logical lorom($03A5CA, 1)

.byte $10 ; And here's the fix to the BG problem - Ultimage

.here

; 	Create a new blank description with new size

* = $03A7D0
.logical lorom($03A7D0, 1)

.word <>blankdescription

.here

* = $03A7D5
.logical lorom($03A7D5, 1)

.word blankdescription>>8

.here

* = $0366AD
.logical lorom($0366AD, 1)

blankdescription
.word $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $0000
.word $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $0000
.word $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $0000
.word $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $0000
.word $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $0000
.word $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $0000
.word $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $4081, $0000
.word $0000

.here