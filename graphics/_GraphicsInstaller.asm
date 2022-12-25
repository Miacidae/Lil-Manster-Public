.cpu "65816"

;---- Translated graphics ----

; Title Screen

* = $1D42CA
.logical lorom($1D42CA, 1)

.binary "TitleScreen.4bpp.fe4"

.here

* = $1D04B8
.logical lorom($1D04B8, 1)

.binary "TitleScreen_palette.pal"

.here


; Intro crawl

* = $1F6B29
.logical lorom($1F6B29, 1)

.binary "intro_crawl/IntroText1.4bpp.fe4"

.here

* = $10C000
.logical lorom($10C000, 1)

.binary "intro_crawl/IntroText2.4bpp.fe4"

.here

* = $1F7F3D
.logical lorom($1F7F3D, 1)

.binary "intro_crawl/IntroTilemap1.bin.fe4"

.here

* = $1F8195
.logical lorom($1F8195, 1)

.binary "intro_crawl/IntroTilemap2.bin.fe4"

.here

* = $1F8469
.logical lorom($1F8469, 1)

.binary "intro_crawl/IntroTilemap3.bin.fe4"

.here


; World Map

* = $3CE117
.logical lorom($3CE117, 1)

.binary "WorldMap.4bpp.fe4"

.here

* = $3DCA18
.logical lorom($3DCA18, 1)

.binary "WorldMapTilemap.dat.fe4"

.here


; Inventory

* = $00CF01
.logical lorom($00CF01, 1)

.word <>statlabels

.here

* = $00CEFD
.logical lorom($00CEFD, 1)

.byte `statlabels

.here

* = $00D646
.logical lorom($00D646, 1)

.byte	$18

.here

* = $00D64B
.logical lorom($00D64B, 1)

.byte	$01

.here

* = $0F066A
.logical lorom($0F066A, 1)

.word	$739C

.here

* = $456BA0
.logical lorom($456BA0, 1)

statlabels .binary "InventoryBrownBars.4bpp.fe4"

InventoryBrownBars  .binary "InventoryBrownBarsTilemap1.bin.fe4"
InventoryBrownBars2 .binary "InventoryBrownBarsTilemap2.bin.fe4"

BattleStats 		.binary "BattleStats.4bpp.fe4"
BattleStatsLevel 	.binary "BattleStatsLevel.4bpp"
BattleStatsLevelIncluded 	.binary "BattleStatsLevelIncluded.4bpp.fe4"

.here


; Trade brown bars
* = $0F70AC
.logical lorom($0F70AC, 1)

.binary "TradeBrownBars.4bpp.fe4"

.here


; Moved battle stats

* = $0D997E
.logical $9B997E

	.as
	.databank 0

	ldx #<>BattleStats
	stx lDecompSource
	lda #`BattleStats
	sta lDecompSource+2

.here


; Level up Stats (Combat)

* = $0B3C98
.logical lorom($0B3C98, 1)

.long levelupwithanim

.here

* = $475830
.logical lorom($475830, 1)

levelupwithanim

.binary "LVStatsCombat.4bpp.fe4"

.here


;  Level up Tilemap (Combat) 
* = $2374F8
.logical lorom($2374F8, 1)

.binary "LVStatsCombatTilemap.bin.fe4"

.here


; Level up Stats (Map)

* = $102680
.logical lorom($102680, 1)

.binary "LVStatsMap.2bpp"

.here


; Unit menu header graphics

* = $0FB1C0
.logical lorom($0FB1C0, 1)

.binary "UnitMenuHeaders.2bpp"

.here


; Unit menu graphics tilemap
; See text_menus/tilemaps/UnitMenuTilemap to change the tilemap of these graphics
; Insertion handled by _TilemappedTextInstaller.asm in said folder.


; Options graphics

* = $0F1DA7
.logical lorom($0F1DA7, 1)

.binary "Options.4bpp.fe4"

.here



;---- QoL/Improvements ----

; New Options graphics

* = $475F80
.logical lorom($475F80, 1)
AdditionalOptionGraphics .binary "OptionsAdditional.4bpp"

.here


; Unused spell restoration

.include "unused/Aura_scripting.asm"
.include "unused/Bolganone_scripting.asm"
.include "unused/Loptous_scripting.asm"
.include "unused/Mjolnir_scripting.asm"
.include "unused/Valflame_scripting.asm"
.include "unused/Naga_scripting.asm"

* = $490000
.logical lorom($490000, 1)

graphics_aura	.binary "unused/Aura.4bpp.fe4"
graphics_aura_tilemap1	.binary "unused/AuraTilemap1.bin.fe4"
graphics_aura_tilemap2BG	.binary "unused/AuraTilemap2BG.bin.fe4"

graphics_bolganone_flame	.binary "unused/BolganoneFlame.4bpp.fe4"
graphics_bolganone_ground	.binary "unused/BolganoneGround.2bpp.fe4"
graphics_bolganone_flame_tilemap	.binary "unused/BolganoneFlameTilemap.bin.fe4"
graphics_bolganone_ground_tilemap	.binary "unused/BolganoneGroundTilemap.bin.fe4"

graphics_loptous_dragon	.binary "unused/LoptousDragon.4bpp.fe4"
graphics_loptous_dragon_tilemap	.binary "unused/LoptousDragonTilemap.bin.fe4"

graphics_mjolnir_static	.binary "unused/MjolnirStatic.4bpp.fe4"
graphics_mjolnir_bolts	.binary "unused/MjolnirBolts.2bpp.fe4"
graphics_mjolnir_static_tilemap	.binary "unused/MjolnirStaticTilemap.bin.fe4"
graphics_mjolnir_bolts_tilemap	.binary "unused/MjolnirBoltsTilemap.bin.fe4"

.here

* = $498000
.logical lorom($498000, 1)

graphics_valflame_lines	.binary "unused/ValflameLines.4bpp.fe4"
graphics_valflame_sun	.binary "unused/ValflameSun.4bpp.fe4"
graphics_valflame_triangle	.binary "unused/ValflameTriangle.2bpp.fe4"
graphics_valflame_lines_tilemap	.binary "unused/ValflameLinesTilemap.bin.fe4"
graphics_valflame_sun_tilemap1	.binary "unused/ValflameSunTilemap1.bin.fe4"
graphics_valflame_sun_tilemap2	.binary "unused/ValflameSunTilemap2.bin.fe4"
graphics_valflame_triangle_tilemap	.binary "unused/ValflameTriangleTilemap.bin.fe4"

graphics_naga_dragon	.binary "unused/NagaDragon.4bpp.fe4"
graphics_naga_square	.binary "unused/NagaSquare.2bpp.fe4"
graphics_naga_shine_tilemap	.binary "unused/NagaShineTilemap.bin.fe4"
graphics_naga_dragon_tilemap	.binary "unused/NagaDragonTilemap.bin.fe4"
graphics_naga_square_tilemap	.binary "unused/NagaSquareTilemap.bin.fe4"

.here

; Map unused animation fixes

* = $081908
.logical lorom($081908, 1)

.word $80DA

.here

* = $0819A7
.logical lorom($0819A7, 1)

.byte $76

.here

* = $0819B3
.logical lorom($0819B3, 1)

.byte $CA

.here

* = $081A8B
.logical lorom($081A8B, 1)

.word $FC1B
.byte $FC

.here

* = $3E7C1B
.logical lorom($3E7C1B, 1)

.binary "unused/MapAnim.4bpp.fe4"

.here


; Leif pixel fix

* = $38C800
.logical lorom($38C800, 1)

.binary "LeifPixelFix.4bpp"

.here



;----- Translatable graphics for non-English languages -----

;	"13 years later" intro graphic

* = $1E8D85
.logical lorom($1E8D85, 1)

.binary "13YearsLater.4bpp.fe4"

.here

; Arena entrance tilemap

* = $0F3DA5
.logical lorom($0F3DA5, 1)

.binary "Arena.bin.fe4"

.here

;	"Level up!" map graphic

* = $102200
.logical lorom($102200, 1)

.binary "LvUpMap.4bpp"

.here

;	"LVUP!" battle graphic

* = $237371
.logical lorom($237371, 1)

.binary "LvUpCombat.4bpp.fe4"

.here

;	Player Phase graphics

* = $396780
.logical lorom($396780, 1)

.binary "Phase1.4bpp"

.here

* = $3A6000
.logical lorom($3A6000, 1)

.binary "Phase2.4bpp"

.here


;---- Graphics for modding ----

; Nintendo logo

* = $1CE357
.logical lorom($1CE357, 1)

.byte `nintendo_logo

.here

* = $1CE35B
.logical lorom($1CE35B, 1)

.word <>nintendo_logo

.here

* = $48E000
.logical lorom($48E000, 1)

nintendo_logo
.binary "intro_crawl/NintendoLogo.4bpp.fe4"

.here

* = $204AC3
.logical lorom($204AC3, 1)

.binary "intro_crawl/NintendoLogo.pal"

.here

; Intro pictures

* = $1E0EAE
.logical lorom($1E0EAE, 1)

.binary "intro_crawl/IntroPicture1.4bpp.fe4"

.here

* = $1E2760
.logical lorom($1E2760, 1)

.binary "intro_crawl/IntroPicture2.4bpp.fe4"

.here

* = $1E3BEC
.logical lorom($1E3BEC, 1)

.binary "intro_crawl/IntroPicture3.4bpp.fe4"

.here

* = $1E54B2
.logical lorom($1E54B2, 1)

.binary "intro_crawl/IntroPicture4.4bpp.fe4"

.here

* = $1E67CE
.logical lorom($1E67CE, 1)

.binary "intro_crawl/IntroPicture5.4bpp.fe4"

.here

* = $1E79BF
.logical lorom($1E79BF, 1)

.binary "intro_crawl/IntroPicture6.4bpp.fe4"

.here

; Misc Graphics (Item, Weapon rank and Skill icons)

* = $390000
.logical lorom($390000, 1)

.binary "MiscGraphics.4bpp"

.here

; Map Weapon graphics (see tables/MAP/MapAnimationItemGraphicsInfo.csv and asm/constants/MapAnimations.inc)

* = $102BE0
.logical lorom($102BE0, 1)

.binary "map_animations/Weapons.2bpp"

.here








