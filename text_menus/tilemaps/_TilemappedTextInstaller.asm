
.include "PrepsItemsTilemap.asm"

;	Inventory

* = $0F5D58
.logical lorom($0F5D58, 1)

InventoryTextTilemap1 .binary "InventoryTextTilemap1.bin.fe4"

.here



;	Unit

* = $0FAA40
.logical lorom($0FAA40, 1)

.binary "UnitMenuTilemap.bin"

.here

* = $0850DF
.logical lorom($0850DF, 1)

.include "UnitMenuCursorPositions.asm"

.here



;	Status

* = $2D38F
.logical lorom($2D38F, 1)
lda #(`status_screen)<<8
sta $30
lda #<>status_screen

.here

* = $53936
.logical lorom($53936, 1)
lda #(`status_screen)<<8
sta $30
lda #<>status_screen

.here

* = $475D00
.logical lorom($475D00, 1)

status_screen .binary "StatusScreenTilemap.bin.fe4"
InventoryTextTilemap2 .binary "InventoryTextTilemap2.bin.fe4"
.here



;	Supply

* = $0F1C45
.logical lorom($0F1C45, 1)

.binary "SupplyTilemap.bin.fe4"

.here



;	Deploy

* = $397DE8
.logical lorom($397DE8, 1)

.binary "DeployTilemap.bin"

.here



; Shop

; This tilemap is located at asm/QoL/ShopBG3TilemapEdited.bin



;	Battle forecast

* = $38FA80
.logical lorom($38FA80, 1)

.binary "ForecastTilemap.bin"

.here



;	Skip special text width check

* = $0A87F1
.logical lorom($0A87F1, 1)

bra $958824 ;	was bne

.here