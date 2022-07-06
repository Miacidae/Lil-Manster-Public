* = $407FB0
.logical $00FFB0
	.include "Header.asm"
.here

* = $007FE0
.logical $80FFE0
	.include "Vectors.asm"
.here




* = $02004A
.logical $84804A
	aChapterDataTable .include "CHAPTERS/ChapterDataTable.casm"
.here

* = $0207CE
.logical lorom($0207CE, 1)
	.include "MAP/TilesetAnimations.asm"
.here

* = $029D6B
.logical lorom($029D6B, 1)
	.include "ITEMS/PreparationsShopItems.asm"
.here

* = $02EF13
.logical lorom($02EF13, 1)
	.include "ARENA/ArenaWeaponsTable.asm"
	.include "ARENA/ArenaClassTable.asm"
.here

* = $030000
.logical $868000
	aClassData .include "UNITS/ClassData.casm"
	.include "UNITS/MovementType.casm"
	.include "TERRAIN/TerrainHitAvoid.casm"
	.include "TERRAIN/TerrainAvoid.casm"
	.include "TERRAIN/TerrainDefense.casm"
	aTerrainMagicTable .include "TERRAIN/TerrainMagic.casm"
.here

* = $031A2D
.logical $869A2D
	aCharacterData .include "UNITS/CharacterData.casm"
.here

* = $0363AD
.logical $86E3AD
	aMapSpriteIndexTable
	.include "MAP/NormalMapSpriteIndexes.casm"
	.include "MAP/TallMapSpriteIndexes.casm"
.here

* = $040000
.logical $888000
	segmentStart
	.include "UNITS/MountDismountTables.asm"
	segmentEnd
.here

* = $040054
.logical $888054
	aScrollBonusesTable	.include "ITEMS/ScrollBonusesTable.casm"
	.byte $00
	aSupportsTable	.include "UNITS/SupportsTable.casm"
.here

* = $040223
.logical $888223
	segmentStart
	.include "ITEMS/TransformingItemTables.asm"
	.include "UNITS/AutolevelSchemePointers.asm"
	.include "UNITS/AutolevelData.casm"
	segmentEnd
.here

* = $0402F1
.logical $8882F1
	aPromotionTable	.include "UNITS/PromotionTable.casm"
.here

* = $048C4C
.logical lorom($048C4C, 1)
	aBattleAnimationClassGenders	.include "BATTLE/BattleAnimationClassGenders.casm"
.here

* = $048E58
.logical $898E58
					.include "BATTLE/BAShieldsInstaller.asm"
	aBattleAnimationShieldPointers		.include "BATTLE/BattleAnimationShieldPointers.casm"
	aBattleAnimationRangedWeaponUnknown	.include "BATTLE/BattleAnimationRangedWeaponUnknown.casm"
		.sint -1
	aMagicAnimations					.include "BATTLE/MagicAnimations.asm"
		.sint -1
	aBattleAnimationWeaponType			.include "BATTLE/BattleAnimationWeaponType.casm"
.here

* = $049403
.logical lorom($049403, 1)
	.include "BATTLE/BattleAnimationWeaponPointers.casm"
.here

* = $0494ED
.logical lorom($0494ED, 1)
	.include "BATTLE/BattleAnimationWeapons.casm"
.here

* = $050A17
.logical lorom($050A17, 1)
	.include "MAP/MapMovementSounds.casm"
.here

* = $054FCA
.logical lorom($054FCA, 1)
	segmentStart
	aBAProjectileBowTable		.include "BATTLE/BattleAnimationProjectileBowTable.casm"
		.sint -1
	aBAProjectileAxeTable		.include "BATTLE/BattleAnimationProjectileAxeTable.casm"
		.sint -1
	aBAProjectileLanceTable		.include "BATTLE/BattleAnimationProjectileLanceTable.casm"
		.sint -1
	segmentEnd
.here

* = $05590C
.logical lorom($05590C, 1)
	aBattleAnimationPaletteTable		.include "BATTLE/BattleAnimationPaletteTable.casm"
	aBattleAnimationPaletteData			.include "BATTLE/BattleAnimationPaletteData.casm"		; 0559D8
	aBattleAnimationCharacterPalettes	.include "BATTLE/BattleAnimationCharacterPalettes.casm"
.here
														; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<???
* = $055FF6
.logical lorom($055FF6, 1)
	aBattleAnimationDefinitions	.include "BATTLE/BattleAnimationDefinitions.casm"
.here

* = $06512A
.logical $8CD12A
	aPortraitTable .include "UNITS/PortraitTable.casm"
.here

* = $065561
.logical $8CD561
	aChapterEventPointers .include "CHAPTERS/ChapterEventPointers.casm" 
.here

* = $06599B
.logical $8CD99B
	.include "CHAPTERS/WorldMapEventPointers.asm"
.here

* = $065A07
.logical $8CDA07
	aBattleQuoteTable	.include "DIALOGUE/BattleQuoteTable.casm" 
		.word $0000
	aDeathQuoteTable	.include "DIALOGUE/DeathQuoteTable.casm" 
		.word $0000
	aReleaseQuoteTable	.include "DIALOGUE/ReleaseQuoteTable.casm" 
		.word $0000
	aRetreatQuoteTable	.include "DIALOGUE/RetreatQuoteTable.casm" 
		.word $0000
	aBattleMusicTable	.include "BATTLE/BattleMusicTable.casm" 
		.word $0000
		.word $0000
	aBattleBannerTable	.include "BATTLE/BattleBannerTable.casm"
		.word $0000
		.word $0000
.here

* = $080A66
.logical lorom($080A66, 1)
	.include "MAP/MapAnimationItemGraphicsInfo.casm"
.here

* = $0B046C
.logical $96846C
	.include "BATTLE/BattleAnimationsOnMusicTable.asm"
.here

* = $0B372E
.logical lorom($0B372E, 1)
	aSpellGraphicsOffsets	.include "BATTLE/SpellGraphicsOffsets.casm"
.here

* = $0B8000
.logical lorom($0B8000, 1)
	aChapterObjectiveMarkers	.include "CHAPTERS/ChapterObjectiveMarkers.asm"
.here

* = $0C8000
.logical $998000
	.include "CHAPTERS/CapturedUnitRescueChapterTable.asm"
.here

* = $0D6802
.logical lorom($0D6802, 1)
	ScriptedBattles .block
		.include "BATTLE/ScriptedBattles.asm"
	.bend
.here

* = $180000
.logical $B08000
	.include "ITEMS/ItemStatBonuses.asm"
	ItemEffectivenesses .block
		.include "ITEMS/ItemEffectiveness.asm"
	.bend
	aItemData .include "ITEMS/ItemData.casm"
.here

* = $1819D6
.logical $B099D6
	WeaponLocks .block
		.include "ITEMS/WeaponLocks.asm"
	.bend
.here

* = $2DA0BE
.logical lorom($2DA0BE, 1)
	aSpellSounds .include "BATTLE/InstrumentsSpells.asm"
	aClassSounds .include "BATTLE/InstrumentsClasses.asm"
.here

* = $47EC00
.logical lorom($47EC00, 1)
	aBattleAnimationMovementDataDefinitionTable	.include "BATTLE/BattleAnimationMovementDataDefinition.casm"
	.char -1
	aBattleAnimationMovementDataTable			.include "BATTLE/BattleAnimationMovementData.casm"
.here

; Repoints of the above two tables

* = $0DB7A4
.logical lorom($0DB7A4, 1)
    .long aBattleAnimationMovementDataDefinitionTable
.here

* = $0DB7B6
.logical lorom($0DB7B6, 1)
    .long aBattleAnimationMovementDataDefinitionTable+1
.here

* = $0DB7CC
.logical lorom($0DB7CC, 1)
    .long aBattleAnimationMovementDataDefinitionTable
.here

* = $0DB6F2
.logical lorom($0DB6F2, 1)
    .long aBattleAnimationMovementDataTable+6
.here

* = $0DB544
.logical lorom($0DB544, 1)
    .long aBattleAnimationMovementDataTable
.here
