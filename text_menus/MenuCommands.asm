; Unit action command pointers
; Reorder these pointers to change the action command order

* = $038000
.logical lorom($038000, 1)

menu_command_pointers		.block

.word    <>menu_commands._Seize_command
.word    <>menu_commands._Arrive_command
.word    <>menu_commands._Talk_command
.word    <>menu_commands._Attack_command
.word    <>menu_commands._Capture_command
.word    <>menu_commands._Staff_command
.word    <>menu_commands._Steal_command
.word    <>menu_commands._Dance_command
.word    <>menu_commands._Visit_command
.word    <>menu_commands._Chest_command
.word    <>menu_commands._Bridge_command
.word    <>menu_commands._Door_command
.word    <>menu_commands._Supply_command
.word    <>menu_commands._Armory_command
.word    <>menu_commands._Vendor_command
.word    <>menu_commands._Secret_command
.word    <>menu_commands._Arena_command
.word    <>menu_commands._Rescue_command
.word    <>menu_commands._Drop_command
.word    <>menu_commands._Transfer_command
.word    <>menu_commands._Transfer2_command
.word    <>menu_commands._Item_command
.word    <>menu_commands._Trade_command
.word    <>menu_commands._Release_command
.word    <>menu_commands._Retreat_command
.word    <>menu_commands._Mount_command
.word    <>menu_commands._Dismount_command
.word    <>menu_commands._Animation_command
.word    <>menu_commands._Wait_command
.word    $0000

.bend
.here

;	Unit action command names
;	Character limit: 12, counting the two spaces
;	However, the textboxes can be extended at the end of this file.

* = $03E952
.logical lorom($03E952, 1)

menu_commands		.block

_Seize_command
	.long lorom($038570, 1)
	.long $000000
	.long $000000
	.long lorom($038EE0, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Seize "
	.word $0000

_Retreat_command
	.long lorom($0385B3, 1)
	.long $000000
	.long $000000
	.long lorom($038F08, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Escape"
	.word $0000

_Arrive_command
	.long lorom($0385E5, 1)
	.long $000000
	.long $000000
	.long lorom($038F08, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Arrive"
	.word $0000

_Talk_command
	.long lorom($038557, 1)
	.long $000000
	.long $000000
	.long lorom($038BA6, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Talk"
	.word $0000

_Attack_command
	.long lorom($0386D8, 1)
	.long $000000
	.long $000000
	.long lorom($0384F8, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Attack"
	.word $0000

_Capture_command
	.long lorom($039B37, 1)
	.long $000000
	.long $000000
	.long lorom($038517, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Capture "
	.word $0000

_Steal_command
	.long lorom($0399B7, 1)
	.long $000000
	.long $000000
	.long lorom($039A7A, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Steal "
	.word $0000

_Arena_command
	.long lorom($03915C, 1)
	.long $000000
	.long $000000
	.long lorom($0391B4, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Arena "
	.word $0000

_Armory_command
	.long lorom($038AE9, 1)
	.long $000000
	.long $000000
	.long lorom($038536, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Ar[mory "
	.word $0000

_Door_command
	.long lorom($038F14, 1)
	.long $000000
	.long $000000
	.long lorom($038F7E, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Door"
	.word $0000

_Secret_command
	.long lorom($038B59, 1)
	.long $000000
	.long $000000
	.long lorom($038536, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Secret"
	.word $0000

_Visit_command
	.long lorom($03861F, 1)
	.long $000000
	.long $000000
	.long lorom($038CDA, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Visit "
	.word $0000

_Supply_command
	.long lorom($039D78, 1)
	.long $000000
	.long $000000
	.long lorom($039DB0, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Supply"
	.word $0000

_Vendor_command
	.long lorom($038B21, 1)
	.long $000000
	.long $000000
	.long lorom($038536, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Vendor"
	.word $0000

_Bridge_command
	.long lorom($038FF6, 1)
	.long $000000
	.long $000000
	.long lorom($039063, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Bridge"
	.word $0000

_Chest_command
	.long lorom($0390DB, 1)
	.long $000000
	.long $000000
	.long lorom($039130, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Chest "
	.word $0000

_Dance_command
	.long lorom($0393AB, 1)
	.long $000000
	.long $000000
	.long lorom($0393CC, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Dance "
	.word $0000

_Wait_command
	.long lorom($03963A, 1)
	.long $000000
	.long $000000
	.long lorom($0384CB, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  )Wait "
	.word $0000

_Staff_command
	.long lorom($03A31E, 1)
	.long $000000
	.long $000000
	.long lorom($03A2F9, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Staff "
	.word $0000

_Item_command
	.long lorom($03A8FA, 1)
	.long $000000
	.long $000000
	.long lorom($03A90F, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Ite[m "
	.word $0000

_Rescue_command
	.long lorom($03988E, 1)
	.long $000000
	.long $000000
	.long lorom($0398A7, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Rescue"
	.word $0000

_Drop_command
	.long lorom($039667, 1)
	.long $000000
	.long $000000
	.long lorom($0396F4, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Drop"
	.word $0000

_Release_command
	.long lorom($039CF4, 1)
	.long $000000
	.long $000000
	.long lorom($039D12, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Release "
	.word $0000

_Transfer_command
	.long lorom($039DDD, 1)
	.long $000000
	.long $000000
	.long lorom($039E87, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Give"
	.word $0000

_Transfer2_command
	.long lorom($03A03E, 1)
	.long $000000
	.long $000000
	.long lorom($03A0E6, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Take"
	.word $0000

_Trade_command
	.long lorom($038D0D, 1)
	.long $000000
	.long $000000
	.long lorom($038DEC, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Trade "
	.word $0000

_Mount_command
	.long lorom($039474, 1)
	.long $000000
	.long $000000
	.long lorom($039532, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  (Mount"
	.word $0000

_Dismount_command
	.long lorom($0394CF, 1)
	.long $000000
	.long $000000
	.long lorom($039549, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  Dis[mount "
	.word $0000

_Animation_command
	.long AnimationByUnitMenuCommandFix ; vanilla: $0391DC
	.long $000000
	.long $000000
	.long lorom($0391EC, 1)
	.long lorom($03846C, 1)
	.long $000000
	.text "  An{im}ation "
	.word $0000

.bend

;	Item action command names
;	Character limit: 8, counting the two spaces
;	However, the textboxes can be extended at the end of this file.

item_command_text				.block

_use_command
	.long lorom($03AC25, 1)
	.long $000000
	.long $000000
	.long lorom($03AC90, 1)
	.long lorom($03ABEE, 1)
	.long $000000
	.text "  Use "
.word $0000

_equip_command
	.long lorom($03AC51, 1)
	.long $000000
	.long $000000
	.long lorom($03ACE9, 1)
	.long lorom($03ABEE, 1)
	.long $000000
	.text "  Equip "
.word $0000

_discard_command
	.long lorom($03AC76, 1)
	.long $000000
	.long $000000
	.long lorom($03AD23, 1)
	.long lorom($03ABEE, 1)
	.long $000000
	.text "  Drop"
.word $0000

.bend
.here

;	Item action command pointers

* = $03AAD1
.logical lorom($03AAD1, 1)

item_command_pointers			.block

.word <>item_command_text._use_command
.word <>item_command_text._equip_command
.word <>item_command_text._discard_command

.bend
.here

;	Discard Yes-No command pointers

* = $03AD56
.logical lorom($03AD56, 1)

discard_pointers				.block

.word <>discard_text._discard_yes
.word <>discard_text._discard_no

.bend

;	Discard Yes-No command names
;	Character limit: 8, counting the two spaces

discard_text					.block

_discard_yes
	.long $000000
	.long $000000
	.long $000000
	.long lorom($05077A, 1)
	.long lorom($050788, 1)
	.long $000000
	.text "  Yes "
.word $0000

_discard_no
	.long $000000
	.long $000000
	.long $000000
	.long lorom($050788, 1)
	.long lorom($050788, 1)
	.long $000000
	.text "  +No "
.word $0000

.bend
.here

;	Animation command pointers

* = $039205
.logical lorom($039205, 1)

animation_command_pointers			.block

.word <>animation_command_text._normal
.word <>animation_command_text._map
.word $0000

.bend

;	Animation command names
;	Character limit: 8, counting the two spaces

animation_command_text				.block

_normal
	.long $000000
	.long $000000
	.long $000000
	.long lorom($392D3, 1)
	.long lorom($392FF, 1)
	.long $000000
	.text "  On"
.word $0000

_map
	.long $000000
	.long $000000
	.long $000000
	.long lorom($3930B, 1)
	.long lorom($392FF, 1)
	.long $000000
	.text "  Off "
.word $0000

.bend
.here

;	Select/R global command pointers

* = $0502E7
.logical lorom($0502E7, 1)

menu_command_2_pointers		.block

.word	<>menu_commands_2._Unit_command
.word	<>menu_commands_2._Status_command
.word	<>menu_commands_2._Options_command
.word	<>menu_commands_2._Suspend_command
.word	<>menu_commands_2._End_command
.word	$0000

.bend

;	Select/R global command names
;	Character limit: 10, counting the two spaces
;	However, the textboxes can be extended at the end of this file.

menu_commands_2				.block

_Unit_command
	.long $000000
	.long $000000
	.long $000000
	.long lorom($0504D4, 1)
	.long lorom($0504BD, 1)
	.long $000000
	.text "  Unit"
	.word $0000

_Status_command
	.long $000000
	.long $000000
	.long $000000
	.long lorom($0504FF, 1)
	.long lorom($0504BD, 1)
	.long $000000
	.text "  Status"
	.word $0000

_Options_command
	.long $000000
	.long $000000
	.long $000000
	.long lorom($050555, 1)
	.long lorom($0504BD, 1)
	.long $000000
	.text "  Options "
	.word $0000

_Suspend_command
	.long $000000
	.long $000000
	.long $000000
	.long lorom($0506D1, 1)
	.long lorom($0504BD, 1)
	.long $000000
	.text "  Suspend "
	.word $0000

_End_command
	.long $000000
	.long $000000
	.long $000000
	.long lorom($05048F, 1)
	.long lorom($0504BD, 1)
	.long $000000
	.text "  End "
	.word $0000

.bend
.here

;	Extending text boxes

* = $038388
.logical lorom($038388, 1)
.byte $08 ; Unit action commands
.here

* = $0503D9
.logical lorom($0503D9, 1)
.byte $07 ; Select global commands
.here

* = $050430
.logical lorom($050430, 1)
.byte $07 ; R global commands (when all units have moved)
.here

;	Moving boxes to fit size changes

* = $038370
.logical lorom($038370, 1)
.byte $17 ; Unit action commands
.here

* = $050400
.logical lorom($050400, 1)
.byte $17 ; Select global commands
.here

* = $05045D
.logical lorom($05045D, 1)
.byte $17 ; R global commands
.here
