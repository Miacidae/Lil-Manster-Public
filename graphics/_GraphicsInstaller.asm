.cpu "65816"

;---- Translated graphics ----

; Title Screen

* = $1D42CA
.logical mapped($1D42CA)

.binary "TitleScreen.4bpp.fe4"

.here

* = $1D04B8
.logical mapped($1D04B8)

.binary "TitleScreen_palette.pal"

.here


; Intro crawl

* = $1F6B29
.logical mapped($1F6B29)

.binary "intro_crawl/IntroText1.4bpp.fe4"

.here

* = $10C000
.logical mapped($10C000)

.binary "intro_crawl/IntroText2.4bpp.fe4"

.here

* = $1F7F3D
.logical mapped($1F7F3D)

	.crossbank.start *, "intro_crawl/IntroTilemap1.bin.fe4"

.here


* = $1F8000
.logical mapped($1F8000)

	.crossbank.end

.here











* = $1F8195
.logical mapped($1F8195)

.binary "intro_crawl/IntroTilemap2.bin.fe4"

.here

* = $1F8469
.logical mapped($1F8469)

.binary "intro_crawl/IntroTilemap3.bin.fe4"

.here


; World Map

* = $3CE117
.logical mapped($3CE117)

	.crossbank.start *, "WorldMap.4bpp.fe4"

.here

* = $3D0000
.logical mapped($3D0000)

	.crossbank.end

.here














* = $3DCA18
.logical mapped($3DCA18)

.binary "WorldMapTilemap.dat.fe4"

.here


; Inventory





* = $0F066A
.logical mapped($0F066A)

.word	$739C

.here

* = $456BA0
.logical lorom($456BA0,1)

statlabels .binary "InventoryBrownBars.4bpp.fe4"

InventoryBrownBars  .binary "InventoryBrownBarsTilemap1.bin.fe4"
InventoryBrownBars2 .binary "InventoryBrownBarsTilemap2.bin.fe4"

BattleStats 		.binary "BattleStats.4bpp.fe4"
BattleStatsLevel 	.binary "BattleStatsLevel.4bpp"
BattleStatsLevelIncluded 	.binary "BattleStatsLevelIncluded.4bpp.fe4"

.here


; Trade brown bars
* = $0F70AC
.logical mapped($0F70AC)

.binary "TradeBrownBars.4bpp.fe4"

.here


; Moved battle stats

* = $0D997E
.logical $9B997E

	.as
	.databank 0

	ldx #<>BattleStats
	stx DecompressionVariables.lSource
	lda #`BattleStats
	sta DecompressionVariables.lSource+2

.here


; Level up Stats (Combat)

* = $0B3C98
.logical mapped($0B3C98)

.long levelupwithanim

.here

* = $475830
.logical lorom($475830,1)

levelupwithanim

.binary "LVStatsCombat.4bpp.fe4"

.here


;  Level up Tilemap (Combat) 
* = $2374F8
.logical mapped($2374F8)

.binary "LVStatsCombatTilemap.bin.fe4"

.here


; Level up Stats (Map)

* = $102680
.logical mapped($102680)

.binary "LVStatsMap.2bpp"

.here


; Unit menu header graphics

* = $0FB1C0
.logical mapped($0FB1C0)

.binary "UnitMenuHeaders.2bpp"

.here


; Unit menu graphics tilemap
; See text_menus/tilemaps/UnitMenuTilemap to change the tilemap of these graphics
; Insertion handled by _TilemappedTextInstaller.asm in said folder.


; Options graphics

* = $0F1DA7
.logical mapped($0F1DA7)

.binary "Options.4bpp.fe4"

.here



;---- QoL/Improvements ----

; New Options graphics

* = $475F80
.logical lorom($475F80,1)
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
.logical lorom($490000,1)

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
.logical lorom($498000,1)

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
.logical mapped($081908)

.word $80DA

.here

* = $0819A7
.logical mapped($0819A7)

.byte $76

.here

* = $0819B3
.logical mapped($0819B3)

.byte $CA

.here

* = $081A8B
.logical mapped($081A8B)

.word $FC1B
.byte $FC

.here

* = $3E7C1B
.logical mapped($3E7C1B)

.binary "unused/MapAnim.4bpp.fe4"

.here


; Leif pixel fix

* = $38C800
.logical mapped($38C800)

.binary "LeifPixelFix.4bpp"

.here



;----- Translatable graphics for non-English languages -----

;	"13 years later" intro graphic

* = $1E8D85
.logical mapped($1E8D85)

.binary "13YearsLater.4bpp.fe4"

.here

; Arena entrance tilemap

* = $0F3DA5
.logical mapped($0F3DA5)

.binary "Arena.bin.fe4"

.here

;	"Level up!" map graphic

* = $102200
.logical mapped($102200)

.binary "LvUpMap.4bpp"

.here

;	"LVUP!" battle graphic

* = $237371
.logical mapped($237371)

.binary "LvUpCombat.4bpp.fe4"

.here

;	Player Phase graphics

* = $396780
.logical mapped($396780)

.binary "Phase1.4bpp"

.here

* = $3A6000
.logical mapped($3A6000)

.binary "Phase2.4bpp"

.here


;---- Graphics for modding ----

; Nintendo logo

* = $1CE357
.logical mapped($1CE357)

.byte `nintendo_logo

.here

* = $1CE35B
.logical mapped($1CE35B)

.word <>nintendo_logo

.here

* = $48E000
.logical lorom($48E000,1)

nintendo_logo
.binary "intro_crawl/NintendoLogo.4bpp.fe4"

.here

* = $204AC3
.logical mapped($204AC3)

.binary "intro_crawl/NintendoLogo.pal"

.here

; Intro pictures

* = $1E0EAE
.logical mapped($1E0EAE)

.binary "intro_crawl/IntroPicture1.4bpp.fe4"

.here

* = $1E2760
.logical mapped($1E2760)

.binary "intro_crawl/IntroPicture2.4bpp.fe4"

.here

* = $1E3BEC
.logical mapped($1E3BEC)

.binary "intro_crawl/IntroPicture3.4bpp.fe4"

.here

* = $1E54B2
.logical mapped($1E54B2)

.binary "intro_crawl/IntroPicture4.4bpp.fe4"

.here

* = $1E67CE
.logical mapped($1E67CE)

.binary "intro_crawl/IntroPicture5.4bpp.fe4"

.here

* = $1E79BF
.logical mapped($1E79BF)

	.crossbank.start *, "intro_crawl/IntroPicture6.4bpp.fe4"

.here


* = $1E8000
.logical mapped($1E8000)

	.crossbank.end

.here




















; Misc Graphics (Item, Weapon rank and Skill icons)

* = $390000
.logical mapped($390000)

.binary "MiscGraphics.4bpp"

.here

; Map Weapon graphics (see tables/MAP/MapAnimationItemGraphicsInfo.csv and asm/constants/MapAnimations.inc)

* = $102BE0
.logical mapped($102BE0)

.binary "map_animations/Weapons.2bpp"

.here








