
.cpu "65816"

.include "definitions/general-macros.asm"

.include "Constants.inc"
.include "Macros.inc"
.include "Registers.inc"
.include "SRAM.inc"
.include "WRAM.inc"

DisassemblySize	:= 0
DSizeStarts		:= []
DSizeEnds		:= []

* = $000000

.binary "base_rom/fe5.sfc"


* = $000000

.include "text_dialogues/_DialogueTextInstaller.asm"
.include "text_menus/_MenuTextInstaller.asm"
.include "text_menus/tilemaps/_TilemappedTextInstaller.asm"
.include "asm/_ASMInstaller.asm"
.include "tables/_TablesInstaller.asm"
.include "events/_EventsInstaller.asm"

.include "graphics/_GraphicsInstaller.asm"
.include "graphics/portraits/_PortraitInstaller.asm"
.include "graphics/battle_animations/_BattlePaletteInstaller.asm"
.include "graphics/battle_animations/_WeaponsInstaller.asm"
.include "graphics/battle_animations/_ShieldsInstaller.asm"

.include "asm/QoL/_QOLInstaller.asm"


; End of hacky hex edits

* = $600000





