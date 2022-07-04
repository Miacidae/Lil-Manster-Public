;	Terrain repoints

* = $021FC8
.logical lorom($021FC8, 1)

.word	>`terrain_names

.here

* = $021FD8
.logical lorom($021FD8, 1)

.long	terrain_name_pointers

.here

;	Terrain pointers

* = $475A80
.logical lorom($475A80, 1)

terrain_name_pointers		.block

.word	<>terrain_names._None_name
.word	<>terrain_names._Peak_name
.word	<>terrain_names._Thicket_name
.word	<>terrain_names._Cliff_name
.word	<>terrain_names._Plain_name
.word	<>terrain_names._Forest_name
.word	<>terrain_names._Sea_name
.word	<>terrain_names._River_name
.word	<>terrain_names._Mountain_name
.word	<>terrain_names._Sand_name
.word	<>terrain_names._Castle_name			; Unused
.word	<>terrain_names._Fort_name
.word	<>terrain_names._HouseOpen_name
.word	<>terrain_names._Gate_name
.word	<>terrain_names._ImpassableOutdoors_name
.word	<>terrain_names._Desert_name
.word	<>terrain_names._Bridge_name
.word	<>terrain_names._Lake_name
.word	<>terrain_names._Village_name			; Unused
.word	<>terrain_names._Ruins_name
.word	<>terrain_names._ImpassableUnused_name	; Unused
.word	<>terrain_names._ImpassableHidden_name
.word	<>terrain_names._Supply_name
.word	<>terrain_names._ChurchOpen_name
.word	<>terrain_names._HouseClosed_name		; Just "House" in vanilla FE5
.word	<>terrain_names._Road_name
.word	<>terrain_names._Armory_name
.word	<>terrain_names._Vendor_name
.word	<>terrain_names._Arena_name
.word	<>terrain_names._Floor_name
.word	<>terrain_names._ImpassableIndoors_name
.word	<>terrain_names._Throne_name
.word	<>terrain_names._Door_name
.word	<>terrain_names._ChestIndoors_name
.word	<>terrain_names._Exit_name				; Unused, but exists in multiple tilesets.
.word	<>terrain_names._Pillar_name
.word	<>terrain_names._Drawbridge_name
.word	<>terrain_names._Secret_name			; Unused
.word	<>terrain_names._ImpassableCrack_name
.word	<>terrain_names._SandySoil_name			; Unused
.word	<>terrain_names._Altar_name				; Just "Floor" in vanilla FE5
.word	<>terrain_names._Seal_name				; Just "Floor" in vanilla FE5
.word	<>terrain_names._ChurchClosed_name		; Just "Church" in vanilla FE5
.word	<>terrain_names._ChestOutdoors_name

.bend
.here

;	Terrain names
;	Character limit: 10

* = $0475B00
.logical lorom($0475B00, 1)

terrain_names		.block

_None_name
_ImpassableOutdoors_name
_ImpassableUnused_name
_ImpassableHidden_name
_ImpassableIndoors_name
_ImpassableCrack_name
	.text "{-}{-}"
	.word $0000

_Peak_name
	.text "Peak"
	.word $0000

_Thicket_name
	.text "Thicket "
	.word $0000

_Cliff_name
	.text "Cliff "
	.word $0000

_Plain_name
	.text "Plain "
	.word $0000

_Forest_name
	.text "Forest"
	.word $0000

_Sea_name
	.text "Sea "
	.word $0000

_River_name
	.text "River "
	.word $0000

_Mountain_name
	.text "(Mountain "
	.word $0000

_Sand_name
	.text "Sand"
	.word $0000
	
_Castle_name
	.text "Castle"
	.word $0000

_Fort_name
	.text "Fort"
	.word $0000

_HouseOpen_name
	.text "House "
	.word $0000

_Gate_name
	.text "Gate"
	.word $0000

_Desert_name
_SandySoil_name
	.text ")Wasteland"
	.word $0000

_Bridge_name
	.text "Bridge"
	.word $0000

_Lake_name
	.text "Lake"
	.word $0000

_Village_name
	.text "Village "
	.word $0000

_Ruins_name
	.text "Ruins "
	.word $0000

_Supply_name
	.text "Supply"
	.word $0000

_ChurchOpen_name
	.text "Church"
	.word $0000

_HouseClosed_name
_ChurchClosed_name
	.text "Closed"
	.word $0000

_Road_name
	.text "Road"
	.word $0000

_Armory_name
	.text "Ar[mory "
	.word $0000

_Vendor_name
	.text "Vendor"
	.word $0000

_Arena_name
	.text "Arena "
	.word $0000

_Floor_name
	.text "Floor "
	.word $0000

_Throne_name
	.text "Throne"
	.word $0000

_Door_name
	.text "Door"
	.word $0000

_ChestIndoors_name
_ChestOutdoors_name
	.text "Chest "
	.word $0000

_Exit_name
	.text "Exit"
	.word $0000

_Pillar_name
	.text "Pillar"
	.word $0000

_Drawbridge_name
	.text "Dra]wbridge "
	.word $0000

_Secret_name
	.text "Secret"
	.word $0000

_Altar_name
	.text "Altar "
	.word $0000

_Seal_name
	.text "Seal"
	.word $0000

.bend
.here