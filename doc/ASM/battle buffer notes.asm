batlbuf_single_flag = #$0004
batlbuf_entry_status = $A681

batlbuf_unit1 = $A4EF
batlbuf_unit2 = $A560

batlbuf_targ_dist = $A4DE

batlbuf_entry_len = $0070

argword1 = $0B
argword2 = $0D

argpoin1_lower = $2F
argpoin1_middle = $30
argpoin1_upper = $31

copy_char_data_index = $83901C
copy_char_data_ptr = $83905C

copy_class_data = $8393E0
get_map_tile_index = $838E76

rescuing = $20

class = $0002
xpos = $0003
ypos = $0004
turnstatus = $0005

level = $0007
curxp = $0008
maxhp = $0009
curhp = $000A
str_b = $000B
mag_b = $000C
skl_b = $000D
spd_b = $000E
def_b = $000F
luk_b = $0010
con_b = $0011
rescuee = $0012
mov_b = $0013
fatigue = $0014
status = $0015
mag_bonus = $0016

skills1 = $001C
skills2 = $001D
skills3 = $001E
inventory = $001F

equipped_item_id = $004D
equipped_item_id_2 = $004E
equipped_item_max_uses = $004F
equipped_item_index = $0050
equipped_item_atk_type = $0051
equipped_item_abilities = $0052
terrain = $0053
terrain_avo = $0054
terrain_def = $0055
terrain_avo_hit = $0056

sleep = $01
stone = $05

class_table = $868000

terrain_map = $7E7BCB

class_buf_terrain_avo = $7E50FF
class_buf_terrain_def = $7E5101
class_buf_terrain_avo_hit = $7E5103

class_buf_str = $7E50E7
class_buf_mag = $7E50E8
class_buf_skl = $7E50E9
class_buf_spd = $7E50EA
class_buf_def = $7E50EB
class_buf_con = $7E50EC
class_buf_mov = $7E50ED

buf_mag_bonus = $7E513B

terrain_mag_bonus_table = $869458

chardata_table = $869A2D
chardata_entry_len = $0030

multiplication_routine = $80AA27

chardata_buf = $7E510A

copy_item_data = $83B00D

test_item_equippable = $83965E


write_batlbuf_single
; $83CE64 ($01CE64)

83/CE64:	08      	php 
83/CE65:	8B      	phb 
83/CE66:	E220    	sep #$20
83/CE68:	A97E    	lda #$7E
83/CE6A:	48      	pha 
83/CE6B:	C220    	rep #$20
83/CE6D:	AB      	plb 
83/CE6E:	A90400  	lda batlbuf_single_flag
83/CE71:	8D81A6  	sta batlbuf_entry_status
83/CE74:	20EDCF  	jsr batlbuf_char_copy
83/CE77:	E220    	sep #$20
83/CE79:	A92D    	lda #$2D
83/CE7B:	8D62A5  	sta batlbuf_unit2 + class
83/CE7E:	C220    	rep #$20
83/CE80:	20F3D1  	jsr batlbuf_terrain_and_range
83/CE83:	E220    	sep #$20
83/CE85:	A9FF    	lda #$FF
83/CE87:	8DDEA4  	sta batlbuf_targ_dist
83/CE8A:	C220    	rep #$20
83/CE8C:	2085D0  	jsr $D085
83/CE8F:	A2EFA4  	ldx #batlbuf_unit1
83/CE92:	A060A5  	ldy #batlbuf_unit2
83/CE95:	AD30A5  	lda $A530
83/CE98:	29C000  	and #$00C0
83/CE9B:	D005    	bne _CEA2
83/CE9D:	AD290E  	lda $0E29
83/CEA0:	D006    	bne _CEA8

_CEA2
83/CEA2:	20AED2  	jsr $D2AE
83/CEA5:	AB      	plb 
83/CEA6:	28      	plp 
83/CEA7:	6B      	rtl 

_CEA8
83/CEA8:	2095D2  	jsr $D295
83/CEAB:	AB      	plb 
83/CEAC:	28      	plp 
83/CEAD:	6B      	rtl 



batlbuf_char_copy
; $83CFED ($01CFED)

83/CFED:	A9EFA4  	lda #batlbuf_unit1
83/CFF0:	852F    	sta argpoin1_lower
83/CFF2:	2024D0  	jsr batlbuf_entry_clear
83/CFF5:	A50D    	lda argword2
83/CFF7:	48      	pha 
83/CFF8:	A9EFA4  	lda #batlbuf_unit1
83/CFFB:	850D    	sta argword2
83/CFFD:	225C9083	jsl copy_char_data_ptr
83/D001:	2037D0  	jsr batlbuf_copy_static_stats
83/D004:	68      	pla 
83/D005:	850B    	sta argword1
83/D007:	AD81A6  	lda batlbuf_entry_status
83/D00A:	C90400  	cmp batlbuf_single_flag
83/D00D:	F014    	beq _D023
83/D00F:	A960A5  	lda #batlbuf_unit2
83/D012:	852F    	sta argpoin1_lower
83/D014:	2024D0  	jsr batlbuf_entry_clear
83/D017:	A960A5  	lda #batlbuf_unit2
83/D01A:	850D    	sta argword2
83/D01C:	221C9083	jsl copy_char_data_index
83/D020:	2037D0  	jsr batlbuf_copy_static_stats

_D023
83/D023:	60      	rts 

batlbuf_entry_clear
; $83D024 ($01D024)

83/D024:	E220    	sep #$20
83/D026:	A07000  	ldy batlbuf_entry_len
83/D029:	A900    	lda #$00

_D02B
83/D02B:	912F    	sta (argpoin1_lower),y
83/D02D:	88      	dey 
83/D02E:	10FB    	bpl _D02B
83/D030:	C230    	rep #$30
83/D032:	60      	rts 



batlbuf_copy_static_stats
; $83D037 ($01D037)

83/D037:	08      	php 
83/D038:	E220    	sep #$20
83/D03A:	A60D    	ldx argword2
83/D03C:	BD0900  	lda maxhp,x
83/D03F:	9D5D00  	sta $005D,x
83/D042:	BD0A00  	lda curhp,x
83/D045:	9D5E00  	sta $005E,x
83/D048:	BD0700  	lda level,x
83/D04B:	9D5F00  	sta $005F,x
83/D04E:	BD0800  	lda curxp,x
83/D051:	9D5B00  	sta $005B,x
83/D054:	BD0200  	lda class,x
83/D057:	9D6000  	sta $0060,x
83/D05A:	BD1500  	lda status,x
83/D05D:	9D7000  	sta $0070,x
83/D060:	9E5C00  	stz $005C,x
83/D063:	9E4D00  	stz $004D,x
83/D066:	A9FF    	lda #$FF
83/D068:	9D6D00  	sta $006D,x
83/D06B:	28      	plp 
83/D06C:	60      	rts 





83/D085:	A9EFA4  	lda #batlbuf_unit1
83/D088:	850D    	sta argword2
83/D08A:	22BE9083	jsl batlbuf_combine_class_bases
83/D08E:	2039E4  	jsr $E439
83/D091:	ADEFA4  	lda batlbuf_unit1
83/D094:	221A9483	jsl batlbuf_chartable_copy
83/D098:	A9EFA4  	lda #batlbuf_unit1
83/D09B:	850D    	sta argword2
83/D09D:	20F6D0  	jsr $D0F6
83/D0A0:	A2EFA4  	ldx #batlbuf_unit1
83/D0A3:	224BE683	jsl $83E64B
83/D0A7:	A90400  	lda #$0004
83/D0AA:	CD81A6  	cmp batlbuf_entry_status
83/D0AD:	F040    	beq $D0EF
83/D0AF:	A960A5  	lda #batlbuf_unit2
83/D0B2:	850D    	sta argword2
83/D0B4:	22BE9083	jsl batlbuf_combine_class_bases
83/D0B8:	AD60A5  	lda batlbuf_unit2
83/D0BB:	221A9483	jsl batlbuf_chartable_copy
83/D0BF:	A960A5  	lda #batlbuf_unit2
83/D0C2:	850D    	sta argword2
83/D0C4:	201FD1  	jsr $D11F
83/D0C7:	AD75A5  	lda $A575
83/D0CA:	29FF00  	and #$00FF
83/D0CD:	C90100  	cmp #$0001
83/D0D0:	F005    	beq $D0D7
83/D0D2:	C90500  	cmp #$0005
83/D0D5:	D00D    	bne $D0E4
83/D0D7:	E220    	sep #$20
83/D0D9:	9CAEA5  	stz $A5AE
83/D0DC:	9CAFA5  	stz $A5AF
83/D0DF:	9CB0A5  	stz $A5B0
83/D0E2:	C230    	rep #$30
83/D0E4:	2057E9  	jsr $E957
83/D0E7:	A260A5  	ldx #batlbuf_unit2
83/D0EA:	224BE683	jsl $83E64B
83/D0EE:	60      	rts 








batlbuf_terrain_and_range
; $83D1F3 ($01D1F3)

83/D1F3:	A2EFA4  	ldx #batlbuf_unit1
83/D1F6:	2205D283	jsl batlbuf_terrain_bonus_getter
83/D1FA:	A260A5  	ldx #batlbuf_unit2
83/D1FD:	2205D283	jsl batlbuf_terrain_bonus_getter
83/D201:	2067D2  	jsr batlbuf_targ_dist_getter
83/D204:	60      	rts 



batlbuf_terrain_bonus_getter
; $83D205 ($01D205)

83/D205:	08      	php 
83/D206:	8B      	phb 
83/D207:	E220    	sep #$20
83/D209:	A97E    	lda #$7E
83/D20B:	48      	pha 
83/D20C:	C220    	rep #$20
83/D20E:	AB      	plb 
83/D20F:	A98086  	lda #class_table>>8
83/D212:	8530    	sta argpoin1_middle
83/D214:	BD0200  	lda class,x
83/D217:	22E09383	jsl copy_class_data
83/D21B:	BD0300  	lda xpos,x
83/D21E:	29FF00  	and #$00FF
83/D221:	850B    	sta argword1
83/D223:	BD0400  	lda ypos,x
83/D226:	29FF00  	and #$00FF
83/D229:	850D    	sta argword2
83/D22B:	22768E83	jsl get_map_tile_index
83/D22F:	A8      	tay 
83/D230:	B9CB7B  	lda <>terrain_map,y
83/D233:	29FF00  	and #$00FF
83/D236:	9D5300  	sta terrain,x
83/D239:	A8      	tay 
83/D23A:	ADFF50  	lda <>class_buf_terrain_avo
83/D23D:	852F    	sta argpoin1_lower
83/D23F:	B72F    	lda [argpoin1_lower],y
83/D241:	E220    	sep #$20
83/D243:	9D5400  	sta terrain_avo,x
83/D246:	C220    	rep #$20
83/D248:	AD0151  	lda <>class_buf_terrain_def
83/D24B:	852F    	sta argpoin1_lower
83/D24D:	B72F    	lda [argpoin1_lower],y
83/D24F:	E220    	sep #$20
83/D251:	9D5500  	sta terrain_def,x
83/D254:	C220    	rep #$20
83/D256:	AD0351  	lda <>class_buf_terrain_avo_hit
83/D259:	852F    	sta argpoin1_lower
83/D25B:	B72F    	lda [argpoin1_lower],y
83/D25D:	E220    	sep #$20
83/D25F:	9D5600  	sta terrain_avo_hit,x
83/D262:	C220    	rep #$20
83/D264:	AB      	plb 
83/D265:	28      	plp 
83/D266:	6B      	rtl 


batlbuf_targ_dist_getter
; $83D267 ($01D267)


83/D267:	08      	php 
83/D268:	E220    	sep #$20
83/D26A:	A902    	lda #$02
83/D26C:	CD81A6  	cmp batlbuf_entry_status
83/D26F:	ADF2A4  	lda batlbuf_unit1 + xpos
83/D272:	38      	sec 
83/D273:	ED63A5  	sbc batlbuf_unit2 + xpos
83/D276:	1003    	bpl _D27B
83/D278:	49FF    	eor #$FF
83/D27A:	1A      	inc 

_D27B
83/D27B:	850B    	sta argword1
83/D27D:	ADF3A4  	lda batlbuf_unit1 + ypos
83/D280:	38      	sec 
83/D281:	ED64A5  	sbc batlbuf_unit2 + ypos
83/D284:	1003    	bpl _D289
83/D286:	49FF    	eor #$FF
83/D288:	1A      	inc 

_D289
83/D289:	18      	clc 
83/D28A:	650B    	adc argword2
83/D28C:	8DDEA4  	sta batlbuf_targ_dist
83/D28F:	28      	plp 
83/D290:	60      	rts 


batlbuf_combine_class_bases
; $8390BE ($0190BE)

83/90BE:	08      	php 
83/90BF:	8B      	phb 
83/90C0:	E220    	sep #$20
83/90C2:	A97E    	lda #$7E
83/90C4:	48      	pha 
83/90C5:	AB      	plb 
83/90C6:	DA      	phx 
83/90C7:	5A      	phy 
83/90C8:	A40D    	ldy argword2
83/90CA:	7B      	tdc 
83/90CB:	994200  	sta $0042,y
83/90CE:	994300  	sta $0043,y
83/90D1:	B90200  	lda class,y
83/90D4:	22E09383	jsl copy_class_data
83/90D8:	ADE750  	lda <>class_buf_str
83/90DB:	18      	clc 
83/90DC:	790B00  	adc str_b,y
83/90DF:	C914    	cmp #20
83/90E1:	9002    	bcc _90E5
83/90E3:	A914    	lda #20

_90E5
83/90E5:	990B00  	sta str_b,y
83/90E8:	ADE850  	lda <>class_buf_mag
83/90EB:	18      	clc 
83/90EC:	790C00  	adc mag_b,y
83/90EF:	C914    	cmp #20
83/90F1:	9002    	bcc _90F5
83/90F3:	A914    	lda #20

_90F5
83/90F5:	990C00  	sta mag_b,y
83/90F8:	ADE950  	lda <>class_buf_skl
83/90FB:	18      	clc 
83/90FC:	790D00  	adc skl_b,y
83/90FF:	C914    	cmp #20
83/9101:	9002    	bcc _9105
83/9103:	A914    	lda #20

_9105
83/9105:	990D00  	sta skl_b,y
83/9108:	ADEA50  	lda <>class_buf_spd
83/910B:	18      	clc 
83/910C:	790E00  	adc spd_b,y
83/910F:	C914    	cmp #20
83/9111:	9002    	bcc _9115
83/9113:	A914    	lda #20

_9115
83/9115:	990E00  	sta spd_b,y
83/9118:	ADEB50  	lda <>class_buf_def
83/911B:	18      	clc 
83/911C:	790F00  	adc def_b,y
83/911F:	C914    	cmp #20
83/9121:	9002    	bcc _9125
83/9123:	A914    	lda #20

_9125
83/9125:	990F00  	sta def_b,y
83/9128:	ADEC50  	lda <>class_buf_con
83/912B:	18      	clc 
83/912C:	791100  	adc con_b,y
83/912F:	C914    	cmp #20
83/9131:	9002    	bcc _9135
83/9133:	A914    	lda #20

_9135
83/9135:	991100  	sta con_b,y
83/9138:	ADED50  	lda <>class_buf_mov
83/913B:	18      	clc 
83/913C:	791300  	adc mov_b,y
83/913F:	C914    	cmp #20
83/9141:	9002    	bcc _9145
83/9143:	A914    	lda #20

_9145
83/9145:	991300  	sta mov_b,y
83/9148:	A60D    	ldx argword2
83/914A:	BD0500  	lda turnstatus,x
83/914D:	8920    	bit #rescuing
83/914F:	F004    	beq _9155
83/9151:	2248E483	jsl batlbuf_halve_status_stats

_9155
83/9155:	BD1500  	lda status,x
83/9158:	C901    	cmp #sleep
83/915A:	F004    	beq _9160
83/915C:	C905    	cmp #stone
83/915E:	D004    	bne _9164

_9160
83/9160:	22ACE483	jsl batlbuf_clear_status_stats

_9164
83/9164:	BD1600  	lda mag_bonus,x
83/9167:	8D3B51  	sta <>buf_mag_bonus
83/916A:	18      	clc 
83/916B:	7D0C00  	adc mag_b,x
83/916E:	9D0C00  	sta mag_b,x
83/9171:	207991  	jsr _9179
83/9174:	7A      	ply 
83/9175:	FA      	plx 
83/9176:	AB      	plb 
83/9177:	28      	plp 
83/9178:	6B      	rtl 

_9179
83/9179:	DA      	phx 
83/917A:	C230    	rep #$30
83/917C:	BD0300  	lda xpos,x
83/917F:	29FF00  	and #$00FF
83/9182:	850B    	sta argword1
83/9184:	BD0400  	lda ypos,x
83/9187:	29FF00  	and #$00FF
83/918A:	850D    	sta argword2
83/918C:	22768E83	jsl get_map_tile_index
83/9190:	AA      	tax 
83/9191:	BDCB7B  	lda <>terrain_map,x
83/9194:	29FF00  	and #$00FF
83/9197:	AA      	tax 
83/9198:	E220    	sep #$20
83/919A:	BF589486	lda terrain_mag_bonus_table,x
83/919E:	850B    	sta argword1
83/91A0:	FA      	plx 
83/91A1:	AD3B51  	lda <>buf_mag_bonus
83/91A4:	18      	clc 
83/91A5:	650B    	adc argword1
83/91A7:	8D3B51  	sta <>buf_mag_bonus
83/91AA:	BD0C00  	lda mag_b,x
83/91AD:	18      	clc 
83/91AE:	650B    	adc argword1
83/91B0:	9D0C00  	sta mag_b,x
83/91B3:	60      	rts 




batlbuf_halve_status_stats
; $83E448 ($01E448)

83/E448:	08      	php 
83/E449:	E220    	sep #$20
83/E44B:	BD0B00  	lda str_b,x
83/E44E:	4A      	lsr 
83/E44F:	9D0B00  	sta str_b,x
83/E452:	BD0C00  	lda mag_b,x
83/E455:	4A      	lsr 
83/E456:	9D0C00  	sta mag_b,x
83/E459:	BD0D00  	lda skl_b,x
83/E45C:	4A      	lsr 
83/E45D:	9D0D00  	sta skl_b,x
83/E460:	BD0E00  	lda spd_b,x
83/E463:	4A      	lsr 
83/E464:	9D0E00  	sta spd_b,x
83/E467:	BD0F00  	lda def_b,x
83/E46A:	4A      	lsr
83/E46B:	9D0F00  	sta def_b,x
83/E46E:	28      	plp 
83/E46F:	6B      	rtl 



batlbuf_clear_status_stats
; $83E4AC ($01E4AC)

83/E4AC:	08      	php 
83/E4AD:	E220    	sep #$20
83/E4AF:	9E0B00  	stz str_b,x
83/E4B2:	9E0C00  	stz mag_b,x
83/E4B5:	9E0D00  	stz skl_b,x
83/E4B8:	9E0E00  	stz spd_b,x
83/E4BB:	9E0F00  	stz def_b,x
83/E4BE:	28      	plp 
83/E4BF:	6B      	rtl 




83/E439:	ADEAA4  	lda $A4EA
83/E43C:	F009    	beq _E447
83/E43E:	A9EFA4  	lda #batlbuf_unit1
83/E441:	850D    	sta argword2
83/E443:	2270E483	jsr $83E470

_E447
83/E447:	60      	rts 




83/E470:	08      	php 
83/E471:	8B      	phb 
83/E472:	E220    	sep #$20
83/E474:	A97E    	lda #$7E
83/E476:	48      	pha 
83/E477:	C220    	rep #$20
83/E479:	AB      	plb 
83/E47A:	DA      	phx 
83/E47B:	5A      	phy 
83/E47C:	A60D    	ldx argword2
83/E47E:	A90100  	lda #$0001
83/E481:	CD81A6  	cmp batlbuf_entry_status
83/E484:	D014    	bne _E49A
83/E486:	BD4100  	lda $0041,x
83/E489:	29C000  	and #$00C0
83/E48C:	C94000  	cmp #$0040
83/E48F:	D009    	bne _E49A
83/E491:	E220    	sep #$20
83/E493:	BD0D00  	lda $000D,x
83/E496:	0A      	asl 
83/E497:	9D0D00  	sta $000D,x

_E49A
83/E49A:	2248E483	jsr batlbuf_halve_status_stats
83/E49E:	7A      	ply 
83/E49F:	FA      	plx 
83/E4A0:	AB      	plb 
83/E4A1:	28      	plp 
83/E4A2:	6B      	rtl 


batlbuf_chartable_copy
; $83941A ($01941A)

83/941A:	08      	php 
83/941B:	8B      	phb 
83/941C:	C230    	rep #$30
83/941E:	DA      	phx 
83/941F:	5A      	phy 
83/9420:	3A      	dec 
83/9421:	851F    	sta $1F
83/9423:	A93000  	lda #chardata_entry_len
83/9426:	8521    	sta $21
83/9428:	2227AA80	jsl multiplication_routine
83/942C:	A523    	lda $23
83/942E:	18      	clc 
83/942F:	692D9A  	adc #<>chardata_table
83/9432:	AA      	tax 
83/9433:	A00A51  	ldy #<>chardata_buf
83/9436:	A92F00  	lda #chardata_entry_len-1
83/9439:	547E86  	mvn $7E,$86
83/943C:	7A      	ply 
83/943D:	FA      	plx 
83/943E:	AB      	plb 
83/943F:	28      	plp 
83/9440:	6B      	rtl 




83/D0F6:	08      	php 
83/D0F7:	C230    	rep #$30
83/D0F9:	A62D    	ldx $2D
83/D0FB:	3010    	bmi _D10D
83/D0FD:	DA      	phx 
83/D0FE:	BD0EA5  	lda $A50E,x
83/D101:	220DB083	jsl copy_item_data
83/D105:	68      	pla 
83/D106:	A2EFA4  	ldx #batlbuf_unit1
83/D109:	E220    	sep #$20
83/D10B:	8021    	bra _D12E

_D10D
83d10d 					lda #batlbuf_unit1
83d110 					sta argword2
83d112 					jsl get_equipped_item_index
83/D116:	A50D    	lda argword2
83/D118:	A2EFA4  	ldx #batlbuf_unit1
83/D11B:	E220    	sep #$20
83/D11D:	800F    	bra _D12E
83/D11F:	08      	php 
83/D120:	C230    	rep #$30
83/D122:	A60D    	ldx argword2
83/D124:	862D    	stx $2D
83/D126:	22059783	jsr get_equipped_item_index
83/D12A:	A50D    	lda argword2
83/D12C:	E220    	sep #$20

_D12E
83/D12E:	9D5000  	sta equipped_item_index,x
83/D131:	AD520F  	lda $0F52
83/D134:	9D4D00  	sta equipped_item_id,x
83/D137:	AD3F0F  	lda $0F3F
83/D13A:	9D4F00  	sta equipped_item_max_uses,x
83/D13D:	C230    	rep #$30
83/D13F:	BD1D00  	lda skills2,x
83/D142:	0D4E0F  	ora $0F4E
83/D145:	9D1D00  	sta skills2,x
83/D148:	ADDEA4  	lda batlbuf_targ_dist
83/D14B:	2204B183	jsl batlbuf_check_targ_in_range
83/D14F:	B00F    	bcs _D160
83/D151:	AD3B0F  	lda $0F3B
83/D154:	48      	pha 
83/D155:	A90000  	lda #$0000
83/D158:	220DB083	jsl copy_item_data
83/D15C:	68      	pla 
83/D15D:	8D3B0F  	sta $0F3B

_D160
83/D160:	E220    	sep #$20
83/D162:	AD500F  	lda $0F50
83/D165:	8902    	bit #$02
83/D167:	F019    	beq _D182
83/D169:	A901    	lda #$01
83/D16B:	CDDEA4  	cmp batlbuf_targ_dist
83/D16E:	F012    	beq _D182
83/D170:	AD3B0F  	lda $0F3B
83/D173:	4A      	lsr 
83/D174:	4A      	lsr 
83/D175:	4A      	lsr 
83/D176:	4A      	lsr 
83/D177:	8D3B0F  	sta $0F3B
83/D17A:	AD500F  	lda $0F50
83/D17D:	0908    	ora #$08
83/D17F:	8D500F  	sta $0F50

_D182
83/D182:	AD520F  	lda $0F52
83/D185:	9D4E00  	sta equipped_item_id_2,x
83/D188:	AD3B0F  	lda $0F3B
83/D18B:	290F    	and #$0F
83/D18D:	9D5100  	sta equipped_item_atk_type,x
83/D190:	AD500F  	lda $0F50
83/D193:	9D5200  	sta equipped_item_abilities,x
83/D196:	5A      	phy 
83/D197:	7B      	tdc 
83/D198:	AD3B0F  	lda $0F3B
83/D19B:	290F    	and #$0F
83/D19D:	A8      	tay 
83/D19E:	B92851  	lda $5128,y
83/D1A1:	9D6F00  	sta $006F,x
83/D1A4:	9E6E00  	stz $006E,x
83/D1A7:	C230    	rep #$30
83/D1A9:	8A      	txa 
83/D1AA:	18      	clc 
83/D1AB:	692D00  	adc #$002D
83/D1AE:	850B    	sta $0B
83/D1B0:	B10B    	lda ($0B),y
83/D1B2:	29FF00  	and #$00FF
83/D1B5:	850B    	sta $0B
83/D1B7:	B9EF50  	lda $50EF,y
83/D1BA:	29FF00  	and #$00FF
83/D1BD:	18      	clc 
83/D1BE:	650B    	adc $0B
83/D1C0:	C9FA00  	cmp #$00FA
83/D1C3:	9003    	bcc _D1C8
83/D1C5:	A9FA00  	lda #$00FA

_D1C8
83/D1C8:	E220    	sep #$20
83/D1CA:	9D6D00  	sta $006D,x
83/D1CD:	7A      	ply 
83/D1CE:	28      	plp 
83/D1CF:	60      	rts 


get_equipped_item_index
; $839705 ($019705)

83/9705:	08      	php 
83/9706:	C230    	rep #$30
83/9708:	5A      	phy 
83/9709:	A00700  	ldy #$0007
83/970C:	A50D    	lda argword2
83/970E:	18      	clc 
83/970F:	691F00  	adc #inventory
83/9712:	850B    	sta argword1
83/9714:	640F    	stz $0F

_9716
83/9716:	B20B    	lda (argword1)
83/9718:	E60B    	inc argword1
83/971A:	E60B    	inc argword1
83/971C:	88      	dey 
83/971D:	3018    	bmi _9737
83/971F:	220DB083	jsl copy_item_data
83/9723:	AD500F  	lda $0F50
83/9726:	890400  	bit #$0004
83/9729:	F006    	beq _9731
83/972B:	225E9683	jsl test_item_equippable
83/972F:	B00D    	bcs _973E

_9731
83/9731:	E60F    	inc $0F
83/9733:	E60F    	inc $0F
83/9735:	80DF    	bra _9716

_9737
83/9737:	A90000  	lda #$0000
83/973A:	220DB083	jsl copy_item_data

_973E
83/973E:	A50F    	lda $0F
83/9740:	850D    	sta argword2
83/9742:	7A      	ply 
83/9743:	28      	plp 
83/9744:	6B      	rtl 


batlbuf_check_targ_in_range
; $83B104

83/B104:	08      	php 
83/B105:	C230    	rep #$30
83/B107:	29FF00  	and #$00FF
83/B10A:	C9FF00  	cmp #$00FF
83/B10D:	F01C    	beq _B12B
83/B10F:	850B    	sta $0B
83/B111:	AD410F  	lda $0F41
83/B114:	290F00  	and #$000F
83/B117:	C50B    	cmp $0B
83/B119:	F002    	beq _B11D
83/B11B:	B011    	bcs _B12E

_B11D
83/B11D:	AD410F  	lda $0F41
83/B120:	4A      	lsr 
83/B121:	4A      	lsr 
83/B122:	4A      	lsr 
83/B123:	4A      	lsr 
83/B124:	290F00  	and #$000F
83/B127:	C50B    	cmp $0B
83/B129:	9003    	bcc _B12E

_B12B
83/B12B:	28      	plp 
83/B12C:	38      	sec 
83/B12D:	6B      	rtl 

_B12E
83/B12E:	28      	plp 
83/B12F:	18      	clc 
83/B130:	6B      	rtl 