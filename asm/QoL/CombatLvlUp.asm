* = $485000
.logical $10D000

StickyStats .binary "StickyStats.bin"

.here

* = $0E1083
.logical $9C9083

jsl CombatLvlUp

.here

* = $0F0787
.logical $9E8787


CombatLvlUp

  .as

lda $7E4494
cmp #$0053		; $0053 last frame where stat ups are displayed
beq +

rtl

+

PHX
PHY

sep #$20
phb
lda #$7E 			; set bank to 7F
pha
plb
rep #$20

  .al

; do it in fe5s order (first row down, then 2nd row down) instead of fe4 (left to right)
lda $7E448E 		; coordinates of stat increase
cmp #$A890
beq level_up_hp
cmp #$B090
beq level_up_str
cmp #$B890
beq level_up_mgc
cmp #$C090
beq level_up_skl
cmp #$A8E8
beq level_up_spd
cmp #$B0E8
beq level_up_luk
cmp #$B8E8
beq level_up_def
cmp #$C0E8
beq level_up_con


level_up_hp:
ldx #$CFA0
bra level_up_address_saved
level_up_str:
ldx #$CFE0
bra level_up_address_saved
level_up_mgc:
ldx #$D020
bra level_up_address_saved
level_up_skl:
ldx #$D060
bra level_up_address_saved
level_up_spd:
ldx #$CFB6
bra level_up_address_saved
level_up_luk:
ldx #$CFF6
bra level_up_address_saved
level_up_def:
ldx #$D036
bra level_up_address_saved
level_up_con:
ldx #$D076
bra level_up_address_saved


level_up_address_saved:
lda $7E4490
and #$00FF
clc
adc #$1FE0
sta $7F0004,x 		; tilemap + or -

lda $7E4492
and #$00FF
clc
adc #$1FF6  		;shortcut to making a tile out of the value
sta $7F0006,x 		; tilemap stat


lda $7F0000,x
and #$00FF
cmp #$004A
bcs level_up_skip_first_digit
clc
adc #$200A
sta $7F0000,x

level_up_skip_first_digit:
lda $7F0002,x
and #$00FF
cmp #$004A
bcs level_up_done_converting
clc
adc #$200A
sta $7F0002,x

level_up_done_converting:

sep #$20
plb
rep #$20

ply
plx

phx
phy
lda wR0
pha
lda wR1
pha
lda lR18
pha
lda lR18+1
pha

; sticky stats graphic

lda #$02C0 					; count
sta wR0

lda #>`StickyStats + $3C0		 
sta lR18+1
lda #<>StickyStats + $3C0	; source
sta lR18

lda #$73E0 					; destination, E7C0 in vram
sta wR1

jsl rlDMAByPointer

; sticky stats tilemap

lda #$00E0 					; count
sta wR0

lda #>`$7FCFA0	
sta lR18+1
lda #<>$7FCFA0  			; source
sta lR18

lda #$6BD0 					; destination, D7A0 in vram
sta wR1

jsl rlDMAByPointer


pla
sta lR18+1
pla
sta lR18
pla
sta wR1
pla
sta wR0
ply
plx


; previous code 

lda $7E4494
tax 

rtl

.here