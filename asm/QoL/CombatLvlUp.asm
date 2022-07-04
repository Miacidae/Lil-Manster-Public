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


; do it in fe5s order (first row down, then 2nd row down) instead of fe4 (left to right)
LDA $7E448E 		; coordinates of stat increase
CMP #$A890
BEQ level_up_hp
CMP #$B090
BEQ level_up_str
CMP #$B890
BEQ level_up_mgc
CMP #$C090
BEQ level_up_skl
CMP #$A8E8
BEQ level_up_spd
CMP #$B0E8
BEQ level_up_luk
CMP #$B8E8
BEQ level_up_def
CMP #$C0E8
BEQ level_up_con


level_up_hp:
LDX #$CFA0
BRA level_up_address_saved
level_up_str:
LDX #$CFE0
BRA level_up_address_saved
level_up_mgc:
LDX #$D020
BRA level_up_address_saved
level_up_skl:
LDX #$D060
BRA level_up_address_saved
level_up_spd:
LDX #$CFB6
BRA level_up_address_saved
level_up_luk:
LDX #$CFF6
BRA level_up_address_saved
level_up_def:
LDX #$D036
BRA level_up_address_saved
level_up_con:
LDX #$D076
BRA level_up_address_saved


level_up_address_saved:
LDA $7E4490
AND #$00FF
CLC
ADC #$1FE0
STA $7F0004,x 		; tilemap + or -

LDA $7E4492
AND #$00FF
CLC
ADC #$1FF6  		;shortcut to making a tile out of the value
STA $7F0006,x 		; tilemap stat


LDA $7F0000,x
AND #$00FF
CMP #$004A
BCS level_up_skip_first_digit
CLC
ADC #$200A
STA $7F0000,x

level_up_skip_first_digit:
LDA $7F0002,x
AND #$00FF
CMP #$004A
BCS level_up_done_converting
CLC
ADC #$200A
STA $7F0002,x

level_up_done_converting:

sep #$20
plb
rep #$20

PLY
PLX

PHX
PHY
LDA wR0
PHA
LDA wR1
PHA
LDA lR18
PHA
LDA lR18+1
PHA

; sticky stats graphic

LDA #$02C0 					; count
sta wR0

LDA #>`StickyStats + $3C0		 
sta lR18+1
LDA #<>StickyStats + $3C0	; source
sta lR18

LDA #$73E0 					; destination, E7C0 in vram
sta wR1

jsl rlDMAByPointer

; sticky stats tilemap

LDA #$00E0 					; count
sta wR0

LDA #>`$7FCFA0	
sta lR18+1
LDA #<>$7FCFA0  			; source
sta lR18

LDA #$6BD0 					; destination, D7A0 in vram
sta wR1

jsl rlDMAByPointer


PLA
STA lR18+1
PLA
STA lR18
PLA
STA wR1
PLA
STA wR0
PLY
PLX


; previous code 

lda $7E4494
tax 

RTL

.here