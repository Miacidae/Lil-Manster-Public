
.cpu "65816"

; Constants

ev_ptr_start	= $065561

current_chapter	= $000E11
current_turn	= $000E13
current_phase	= $000E15
current_x_coord	= $000E4D
current_y_coord	= $000E4F
current_char	= $000E6F

player_phase	= $0000
enemy_phase		= $0040
other_phase		= $0080

; Event pointer table defs

opening_events				=  1
turn_events					=  2
talk_events					=  3
location_events				=  4
before_action_events		=  5
shop_events					=  6
battle_events				=  7
ending_events				=  8
after_action_events			=  9
prep_events					= 10

; Event definitions

; inputs are assumed to be mapped
; so map them when writing the events

event_pointer	.macro address, poin_num, chapter

dist = (\chapter - 1) * 30
poin_dist = (\poin_num - 1) * 3

* = ev_ptr_start + dist + poin_dist

.long \address

.endm

; Event conditions

; Condition $00 is the same as $01

check_chars		.macro char1, char2

; Returns true if characters
; interracting are equal to inputs
; Order does matter here

.byte $01

.word \char1

.word \char2

.endm

check_one_char	.macro char

; Returns true if character
; interracting is equal to input

.byte $02

.word \char

.endm

; Condition $03 unknown

cmp_bits		.macro address, bits

; compare bits with data at a given address.
; Returns true if bits are set.

.byte $04

.long \address

.word \bits

.endm

cmp_byte		.macro address, byte

; Compare a byte to data at given address.
; Returns true if equal

.byte $05

.long \address

.byte \byte

.endm

cmp_short		.macro address, short

; Compare a short to data at given address.
; Returns true if equal

.byte $06

.long \address

.word \short

.endm

cmp_long		.macro address, long

; Compare a long to data at given address.
; Returns true if equal

.byte $07

.long \address

.long \long

.endm

cmp_short_false	.macro address, short

; Compare a short to data at given address.
; Returns true if not equal

.byte $08

.long \address

.word \short

.endm

cmp_byte_at		.macro address, long

; Compares bytes at the given
; addresses. Returns true if equal.

.byte $09

.long \address

.long \long

.endm

cmp_short_at	.macro address, long

; Compares shorts at the given
; addresses. Returns true if equal.

.byte $0A

.long \address

.long \long

.endm

cmp_range_byte	.macro address, min, max

; Returns true if data at address
; is between the min and max bytes.

.byte $0B

.long \address

.byte \min

.byte \max

.endm

cmp_range_short	.macro address, min, max

; Returns true if data at address
; is between the min and max shorts.

.byte $0C

.long \address

.word \min

.word \max

.endm

test_id_set		.macro id

; Yields if id is set

.byte $0D

.byte \id

.endm

test_id_unset	.macro id

; Yields if id is unset

.byte $0E

.byte \id

.endm

run_asm			.macro address

; Runs asm at given address

.byte $0F

.long \address

.endm

; Condition $10 unknown

; Condition $11 unknown

; Condition $12 unknown

; Condition $13 unknown

; Condition $14 unknown

; Condition $15 unknown

; Condition $16 unknown

check_num_units	.macro char, number

; Counts the number of units
; of the input char short. 
; Returns true if number matches
; input number.

.byte $17

.word \char

.byte \number

.endm


; Condition $18 unknown

; Condition $19 unknown

check_dead		.macro char

; Returns true if the unit is dead

.byte $1A

.word \char

.endm


; Condition $1B unknown



; Event definitions, raw

yield_unk		.macro

; Difference between this
; and $FC is unknown

.byte $00

.endm

ev_jump			.macro offset

; Changes event execution
; position.

.byte $02

.word <>\offset

.endm

ev_jump_true	.macro offset

; Changes event execution
; position if $00174B is $01

.byte $03

.word <>\offset

.endm

ev_jump_false	.macro offset

; Changes event execution
; position if $00174B is $00

.byte $04

.word <>\offset

.endm

; Event $05 unknown

; Event $06 unknown

; Event $07 unknown

; Event $08 unknown

; Event $09 unknown

; Event $0A unknown

; Event $0B unknown

set_id			.macro id

; Sets an event ID.
; Permanent IDs have
; their upper bit set.

.byte $0C

.byte \id

.endm

; test id set

; test id unset

str_byte		.macro address, byte

; Stores the given byte to the address.

.byte $0F

.long \address

.byte \byte

.endm

str_short		.macro address, short

; Stores the given short to the address.

.byte $10

.long \address

.word \short

.endm

str_long		.macro address, long

; Stores the given long to the address.

.byte $11

.long \address

.long \long

.endm

; Event $12 unknown

; Event $13 unknown

; Event $14 unknown

; Event $15 unknown

add_short		.macro address, short

; Adds the given short to the data
; at the given address

.byte $16

.long \address

.word \short

.endm


; Event $18 unknown

; Event $19 unknown

; Event $1A unknown

call_asm_1B		.macro address, inputshort=$0000

; Calls an asm routine with a short as input.
; difference between event codes $1B and $1D not
; known.

.byte $1B

.long \address

.word \inputshort

.endm

call_asm_1C		.macro address, inputlong

; Calls an asm routine with a long as input.

.byte $1C

.long \address

.long \inputlong

.endm

call_asm_1D		.macro address, inputshort=$0000

; Calls an asm routine with a short as input.
; difference between event codes $1B and $1D not
; known.

.byte $1D

.long \address

.word \inputshort

.endm

pause			.macro time

; Yields event execution for a given time.
; Unit of time is unknown.

.byte $1E

.word \time

.endm

; Event $1F unknown

; Event $20 unknown

; Event $21 unknown

loop_byte		.macro address, byte

; Loops until equal?
; Unknown difference between
; this and $24

.byte $22

.long \address

.byte \byte

.endm

; Event $23 unknown

wait_byte		.macro address, byte

; Yields event execution until byte
; at address matches given byte.

.byte $24

.long \address

.byte \byte

.endm

wait_short		.macro address, short

; Yields event execution until short
; at address matches given short.

.byte $25

.long \address

.word \short

.endm

unk_trans_1		.macro byte

; Used when switching maps?
; Seen values:
; 04

.byte $26

.byte \byte

.endm

unk_trans_2		.macro byte

; Used when switching maps?
; usually part of a large block
; of stuff. Seen values:
; 01 - takes to main menu
; 02 takes to map

.byte $27

.byte \byte

.endm

; Event $28 unknown

; Event $29 unknown

; Event $2A unknown

dialogue		.macro address

; Creates a scene using data at address.
; Usually followed by a yield.

.byte $2B

.long \address

.endm

; Event $2C unknown

; Event $2D unknown

; Event $2E unknown

; Event $2F unknown

; Event $30 unknown

set_music		.macro musbyte


; Sets current music to the index
; specified. Usually followed by a 
; yield.

.byte $31

.byte \musbyte

.endm

; Event $32 unknown

; Event $33 unknown

play_sound_byte	.macro soundbyte

; Plays the sound given by
; the input byte

.byte $34

.byte \soundbyte

.endm

play_sound		.macro sound

; Plays the sound given by 
; index specified.

.byte $35

.word \sound

.endm

; Event $36 unknown

; Event $37 unknown

reset_camera	.macro

; Sets camera position
; to the coordinates given
; by set_cam_default.

.byte $38

.endm

set_cam_default	.macro x, y

; Sets default camera position.
; Even numbers only?

.byte $39

.byte \x

.byte \y

.endm

; Event $3A unknown

; Event $3B unknown

; Event $3C unknown

Scroll_cam_spd	.macro x, y, speed

; Scroll camera to coordinates
; at given speed. Speeds:
; 1 - slowest
; 3 - standared

.byte $3D

.byte \x

.byte \y

.byte \speed

.endm

; Event $3E unknown

; Event $3F unknown

; Event $40 unknown

move_unit		.macro char, xtarg, ytarg, xmove, ymove, speed, movestring=$000000

; Moves a unit.
; The unit can be selected either
; by specifying a character by their 
; char number, or by the xtarg and ytarg
; as coordinates. The unit will then 
; move to xmove, ymove at speed speed.
; You can also specify a bytestring 
; to control movement by giving a 
; movestring. Movestrings are 
; null-terminated.

; Either the char short or the
; x/y  targs need to be 0. Only one
; targeting method is allowed.
; Also, the movestring is 0 if not used.

; It'd be easier to use a macro

.byte $41

.word \char

.byte \xtarg

.byte \ytarg

.byte \xmove

.byte \ymove

.byte \speed

.long \movestring

.byte $00

.endm

load_unit		.macro address

; Spawns (a) unit(s) given by
; address.

.byte $42

.long \address

.endm

load_2		.macro address

; difference between this and
; $42 unknown

.byte $43

.long \address

.endm

scroll_camera	.macro address

; Move camera to position based
; on coordinates at given address.
; Usually followed by a yield.

.byte $44

.long \address

.endm

wait_move		.macro

; Waits for previous unit command
; to complete, such as spawning
; or movement. Usually followed by
; a yield.

.byte $45

.endm

; Event $46 unknown

; Event $47 unknown

yield			.macro

; Pauses event execution and
; runs queued code.

.byte $FC

.endm

end_FF			.macro

; Signifies the end of an
; event block?

.byte $FF

.endm

end_set			.macro

; Ends a set, such as 
; opening events or 
; location events.

.word $FFFF

.endm

end_FE			.macro

; Signifies the end of 
; a subset?

.byte $FE

.endm

end_FD			.macro

; Signifies the end of 
; a subset, giving player 
; control?

.byte $FD

.endm

; Event Macros

chapter_name	.macro address

; Causes the text at the
; address to appear briefly
; in the center of the screen.

str_long $000530, \address

str_short $00052F, <>\address

str_long $00006D, lorom($0D014C, 1)

call_asm_1B lorom($0603E7, 1)

yield

.endm

wait_fade		.macro time=$0F

; Fade in to desired brightness
; Alias of wait_byte

wait_byte $00007B, \time

.endm

silence			.macro time=$0020

; Kills music for a time

play_sound $00E0

pause \time

.endm

remove_unit		.macro unit

; Removes a unit from the map

str_short $001736, \unit

call_asm_1D lorom($062343, 1), $0000

.endm

move_char		.macro unit, xdest, ydest, speed=$01, datapoin=$000000

; Moves a unit, targeting by character number

move_unit \unit, $00, $00, \xdest, \ydest, \speed, \datapoin

.endm

event_set		.macro evid, offset

; For use calling a set
; of events, such as using
; this in the opening event
; to call the beginning scene.
; Followed by a comparison
; to determine if the set
; should be run.
; Sets given event ID

.byte \evid

.long \offset

.endm






























