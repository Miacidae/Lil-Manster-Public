
.cpu "65816"

.include "SizeHelpersStart.h"

.include "Constants.inc"
.include "Macros.inc"
.include "VoltEdge.h"
.include "WRAMAdditions.inc"

DisassemblySize	 := 0
DSizeStarts		   := []
DSizeEnds		     := []

.include "asm/BaseRom.asm"


; Note: "Ullr"- item name, dialogue in Ch8 still has "Ullur"



; Files with sections

.include "asm/_ASMInstaller.asm"
.include "events/_EventInstaller.asm"
.include "asm/QoL/_QoLInstaller.asm"

* = $000000

.include "text_dialogues/_DialogueTextInstaller.asm"
.include "text_menus/_MenuTextInstaller.asm"
.include "text_menus/tilemaps/_TilemappedTextInstaller.asm"

.include "graphics/_GraphicsInstaller.asm"
.include "graphics/portraits/_PortraitInstaller.asm"
.include "graphics/battle_animations/_BattlePaletteInstaller.asm"
.include "graphics/battle_animations/_UnitsInstaller.asm"
.include "graphics/battle_animations/_WeaponsInstaller.asm"
.include "graphics/battle_animations/_ShieldsInstaller.asm"





  * = $000000
  .logical $808000
  
    startCode
  
      .include "asm/Break.asm"
      .include "asm/Joypad.asm"
      .include "asm/BufferCopy.asm"
      .include "asm/VBlankAndIRQ.asm"
      .include "asm/ClearSprites.asm"
      .include "asm/DMAByPushedPointer.asm"
      .include "asm/OAMBuffer.asm"
      .include "asm/Reset.asm"
      .include "asm/SoundSystem.asm"
  
      ; 809753
  
      .fill $809B00 - *, $FF
  
      .include "asm/Code809B00.asm"
      .include "asm/Math.asm"
      .include "asm/Fade.asm"
      .include "asm/DMA.asm"
      .include "asm/DecompByList.asm"
      .include "asm/Code80B04B.asm"
      .include "asm/RNG.asm"
      .include "asm/PrepareBlockCopyRAM.asm"
      .include "asm/Code80B231.asm"
      .include "asm/BlockOperations.asm"
      .include "asm/Decompressor.asm"
      .include "asm/Code80B88F.asm"
  
      ; 80DD77
  
      .fill $80DE00 - *, $FF
  
      .include "asm/RangePath.asm"
  
      ; 80EB28
  
      .fill $80FFB0 - *, $FF
  
      ; Old Header and Vectors
  
      .fill $80FFE0 - *, ?
  
      .include "tables/Vectors.asm"
  
    endCode
  
  .here
  
  * = $008000
  .logical $818000
  
    startCode
  
      .include "asm/ActiveSpriteEngine.asm"
  
      ; 818B13
  
      .fill $81A800 - *, $FF
  
      .include "asm/UpdateMaps.asm"
      .include "asm/PhaseGraphics.asm"
      .include "asm/PROCS/PhaseGraphics.asm"
      .include "asm/PROCS/Unknown81B941.asm"
      .include "asm/Code81B982.asm"
      .include "asm/PROCS/Unknown81BAC5.asm"
      .include "asm/Code81BB21.asm"
      .include "asm/PROCS/Unknown81BDA3.asm"
      .include "asm/PROCS/Unknown81BE18.asm"
      .include "asm/BattleForecast.asm"
      .include "asm/PROCS/PrepScreenMapScroll.asm"
      .include "asm/SoundIfNotMuted.asm"
      .include "asm/ObjectiveMarkers.asm"
      .include "asm/Code81C466.asm"
      .include "asm/PROCS/FadeInClearJoypad.asm"
      .include "asm/Save.asm"
  
      ; 81CB33
  
      .fill $81CE55 - *, $FF
  
      .include "asm/Inventory.asm"
      .include "asm/GetLeaderString.asm"
  
      .dsection PrepItemSection1
      .dsection PrepItemsLabels
      .dsection PrepItemSection2
  
      .include "asm/PROCS/ItemInfo.asm"
      .include "asm/PROCS/SkillInfo.asm"
  
      .dsection SkillTypeTextPointersSection
  
      .fill $81FA24 - *, $FF
  
      .include "asm/InventoryInfoWindows.asm"
      .include "asm/PROCS/TradeItemInfoWindow.asm"
  
      .dsection InventoryItemStatLabelsSection
  
      ; 81FFDD
  
      .fill $81FFFF - *, $FF
  
    endCode
  
  .here
  
  * = $010000
  .logical $828000
  
    startCode
  
      .include "asm/PROCS/EventTest.asm"
      .include "asm/PROCS/MapSwitch.asm"
      .include "asm/PROCS/NP.asm"
      .include "asm/PROCS/Dialogue.asm"
      .include "asm/PROCS/ME.asm"
      .include "asm/PROCS/DialogueWithBG.asm"
      .include "asm/PROCS/MusicEvent.asm"
      .include "asm/PROCS/EventPause.asm" 
      .include "asm/PROCS/EventFade.asm"
      .include "asm/PROCS/Unknown828F09.asm"  
      .include "asm/PROCS/MapScroll.asm"
      .include "asm/PROCS/UnitAction.asm" 
      .include "asm/PROCS/Portraits.asm"
      .include "asm/ProcEngine.asm"
      .include "asm/ProcCode.asm"
      .include "asm/PROCS/Fade.asm"
      .include "asm/PROCS/Decompress.asm"
      .include "asm/PROCS/SoundByte.asm"
      .include "asm/HDMAArrayEngine.asm"
      .include "asm/HDMAArrayCode.asm"
      .include "asm/IRQArrayEngine.asm"
      .include "asm/UnknownChecksumChecker.asm"
      .include "asm/Code82A989.asm"
    
    endCode
    startMenuText

      .dsection SkillTypeTextSection

    endMenuText

      ; 82B8DD
  
      ; Vanilla death and retreat quotes,
      ; the WM text and the event debug dialogue pointers
      ; aka lots of free space

      ;.fill $82FFFF - *, $FF

  .here

  * = $018000
  .logical $838000
  
    startCode 
  
      .include "asm/Code838000.asm"

    endCode

    ; 83B6C8
  
  .here
  
  * = $01CE08
  .logical $83CE08
  
    startData
  
      aAnimationOverrideTable .include "tables/BATTLE/AnimationOverridesTable.casm"
  
    endData  
  
  .here


  * = $01CE64
  .logical $83CE64

    .dsection ActionStructSingleSection
    .dsection ActionStructUnknown83CEAESection
    .dsection ActionStructCombatStructsSection
    .dsection ActionStructGetBaseStatsSection
    .dsection ActionStructClearActionStructSection
    .dsection ActionStructCopyStartingStatsSection
    .dsection ActionStructTrySetUnitCoordinatesSection
    .dsection ActionStructWeaponInfoSection
    .dsection ActionStructAdjustNihilSkillsSection
    .dsection ActionStructGetTerrainBonusesAndDistanceSection
    .dsection ActionStructGetCoreStatsSection
    .dsection ActionStructRoundSection
    .dsection ActionStructUnknown83DA13Section
    .dsection ActionStructWriteLevelUpActionStructSection
    .dsection ActionStructTryUpdateRoundCaptureFlagSection
    .dsection ActionStructWeaponTriangleSection
    .dsection ActionStructAdjustVantageRoundOrderSection
    .dsection ActionStructUnknown83DC31Section
    .dsection ActionStructLevelUpSection
    .dsection ActionStructCalculateWeaponTriangleBonusSection
    .dsection ActionStructWeaponEffectSection
    .dsection ActionStructRollGainsSection
    .dsection ActionStructCalculateHitAvoidBonusSection
    .dsection ActionStructHalveStatsSection
    .dsection ActionStructZeroCombatStatsSection
    .dsection ActionStructSetGainedWEXPSection
    .dsection ActionStructEXPSection
    .dsection ActionStructGetSupportBonusSection
    .dsection ActionStructUnknownSetCallbackSection
    .dsection ActionStructGetItemBonusesSection
    .dsection ActionStructWinsLossesSection
    .dsection ActionStructGetCombatStatTotalSection
    .dsection ActionStructGetStatTotalDifferenceTierSection
    .dsection ActionStructMarkSelectableTargetSection
    .dsection ActionStructGetDanceEXPSection
    .dsection ActionStructTryGetGainedWeaponRankSection
    .dsection ActionStructDanceSection
    .dsection ActionStructClearOpponentWeaponIfUsingLongRangeSection
    .dsection ActionStructGetTerrainTileSection
    .dsection ActionStructStaffSection
    .dsection HealingStaffTargetEffectSection
    .dsection FortifyTargetEffectSection
    .dsection SilenceStaffTargetEffectSection
    .dsection BerserkStaffTargetEffectSection
    .dsection SleepStaffTargetEffectSection
    .dsection StatusStaffCallbackSection
    .dsection RestoreTargetEffectSection
    .dsection WarpTargetEffectSection
    .dsection RewarpTargetEffectSection
    .dsection BarrierTargetEffectSection
    .dsection RescueStaffTargetEffectSection
    .dsection TorchStaffTargetEffectSection
    .dsection HammerneTargetEffectSection
    .dsection ThiefStaffTargetEffectSection
    .dsection ActionStructStaffGetEXPByCostSection
    .dsection ActionStructSetGainedEXPSection
    .dsection ActionStructGetStaffInfoSection
    .dsection ReturnStaffTargetEffectSection
    .dsection ActionStructStaffGetClosestTileSection
    .dsection ActionStructStaffRollHitSection
    .dsection ActionStructStaffRollDoublingSection
    .dsection ActionStructStaffTryGetClosestTileSection
    .dsection ActionStructStaffGetPowerSection
    .dsection UnlockTargetEffectSection
    .dsection WatchTargetEffectSection
    .dsection KiaTargetEffectSection
    .dsection ActionStructStaffGetGainedWEXPSection

    ; 83F44E

  .endlogical

  * = $02004A
  .logical $84804A
  
    startData
  
      aChapterDataTable .include "tables/CHAPTERS/ChapterDataTable.casm"
      .include "tables/MAP/TilesetAnimations.asm"
  
    endData
  
    ; 8488FA
  
  .here
  
  * = $029A31
  .logical $859A31
  
    startMenuText
    
      .dsection RangeTextSection
  
    endMenuText
  
    ; 859A5F
  
  .here

  * = $029D6B
  .logical $859D6B
  
    startData
    
      .include "tables/ITEMS/PreparationsShopItems.asm"
  
    endData
  
    ; 859D7B
  
  .here
  
  * = $02CDC2
  .logical $85CDC2
  
    startData
    
      aPreparationsMenuSortingTextPointers .dsection PreparationsMenuSortingTextPointersSection
  
    endData
    startMenuText

      aPreparationsMenuSortingText .dsection PreparationsMenuSortingTextSection

    endMenuText
    
    ; 85CDF2

  .here

  * = $02D280
  .logical $85D280
  
    startData
    
      .dsection OptionsMenuTintPointersSection
  
    endData
  
    ; 85D28E
  
  .here


  * = $02EF13
  .logical $85EF13
  
    startData
  
      .include "tables/ARENA/ArenaWeaponsTable.asm"
      .include "tables/ARENA/ArenaClassTable.asm"
  
    endData
  
    ; 85EF88
  
  .here

  * = $030000
  .logical $868000
  
    startData
  
      aClassData .include "tables/UNITS/ClassData.casm"
      .include "tables/UNITS/MovementType.casm"
      .include "tables/TERRAIN/TerrainHitAvoid.casm"
      .include "tables/TERRAIN/TerrainAvoid.casm"
      .include "tables/TERRAIN/TerrainDefense.casm"
      aTerrainMagicTable .include "tables/TERRAIN/TerrainMagic.casm"
  
    endData
  
    ; 869484
  
  .here

  * = $031A2D
  .logical $869A2D
  
    startData
      
      aCharacterData .include "tables/UNITS/CharacterData.casm"
      aUnitNamePointers .dsection UnitNamePointersSection

    endData
    startMenuText
      
      aUnitNameText .dsection UnitNameTextSection
    
    endMenuText
    
    ; 86E2E9
  
  .here

  * = $0363AD
  .logical $86E3AD
  
    startData
  
      aMapSpriteIndexTable
        .include "tables/MAP/NormalMapSpriteIndexes.casm"
        .include "tables/MAP/TallMapSpriteIndexes.casm"
  
      .include "asm/PROCS/InventoryFullConvoyMenu.asm"
  
    endData
  
    ; 86E6AD
  
  .here
  

  * = $038000
  .logical $878000
  
    startData
  
      aMenuCommandPointers .dsection MenuCommandPointersSection
  
    endData
  
    ; 87803C

  .here

  * = $039205
  .logical $879205
  
    startData
  
      aAnimationCommandPointers .dsection AnimationCommandPointersSection
      .dsection AnimationCommandDataSection

    endData
  
    ; 87923D

  .here

  * = $03AD56
  .logical $87AD56
  
    startData
  
      aDiscardCommandPointers .dsection DiscardCommandPointersSection
      .dsection DiscardCommandDataSection

    endData
  
    ; 87AD8E

  .here

  * = $03E952
  .logical $87E952
  
    startData
  
      aMenuCommandData .dsection MenuCommandDataSection
      aItemUseCommandData .dsection ItemUseCommandDataSection

    endData
  
    ; 87ECD2

  .here

  * = $03AAD1
  .logical $87AAD1
  
    startData

      .dsection ItemUseCommandPointersSection

    endData
  
    ; 87AAD7

  .here

  * = $040000
  .logical $888000
  
    startData
  
      .include "tables/UNITS/MountDismountTables.asm"
  
    endData
  
   ; 888038
  
  .here
  
  * = $040054
  .logical $888054
  
    startData
  
      aScrollBonusesTable .include "tables/ITEMS/ScrollBonusesTable.casm"
      .byte 0
      aSupportsTable  .include "tables/UNITS/SupportsTable.casm"
  
    endData
  
    ; 888221
  
  .here
  
  * = $040223
  .logical $888223
  
    startData
  
      .include "tables/ITEMS/TransformingItemTables.asm"
      .include "tables/UNITS/AutolevelSchemePointers.asm"
      .include "tables/UNITS/AutolevelData.casm"
  
    endData
  
    ; 888297
  
  .here
  
  * = $0402F1
  .logical $8882F1
  
    startData
  
      aPromotionTable .include "tables/UNITS/PromotionTable.casm"
  
    endData
  
    ; 888354
  
  .here

  * = $048000
  .logical $898000
  
    startData

      aClassNamePointers .dsection ClassNamePointersSection
      aClassNames .dsection ClassNamesSection

    endData
  
    ; 89839C
  
    .fill $89894E - *, $FF

  .here

  * = $048C4C
  .logical $898C4C

    startData

      aBattleAnimationClassGenders  .include "tables/BATTLE/BattleAnimationClassGenders.casm"

    endData

    ; 898CC6

  .here
  
  * = $048E58
  .logical $898E58

    startData

      .include "tables/BATTLE/BAShieldsInstaller.asm"
      aBattleAnimationShieldPointers    .include "tables/BATTLE/BattleAnimationShieldPointers.casm"
      aBattleAnimationRangedWeaponUnknown .include "tables/BATTLE/BattleAnimationRangedWeaponUnknown.casm"
        .sint -1
      aMagicAnimations          .include "tables/BATTLE/MagicAnimations.asm"
        .sint -1
      aBattleAnimationWeaponType      .include "tables/BATTLE/BattleAnimationWeaponType.casm"

    endData

    ; 8990FF

  .here

  * = $049403
  .logical $899403

    startData

      .include "tables/BATTLE/BattleAnimationWeaponPointers.casm"
      .include "tables/BATTLE/BattleAnimationWeapons.casm"

    endData

    ; 8995E7

  .here

  * = $0502E7
  .logical $8A82E7

    startData

      .dsection MapMenuCommandPointersSection
      .dsection MapMenuCommandDataSection

    endData

    ; 8A8A81

  .here


  * = $050588
  .logical $8A8588

    startData

      aPreparationsMenuOptionPointers .dsection PreparationsMenuOptionPointersSection

    endData

    ; 8A8596

  .here

  * = $050A17
  .logical $8A8A17

    startData

      .include "tables/MAP/MapMovementSounds.casm"

    endData

    ; 8A8A81

  .here

  * = $0568E2
  .logical $8AE8E2

    startData

      aPreparationsMenuOptionData .dsection PreparationsMenuOptionDataSection

    endData

    ; 8AE986

  .here

  * = $054FCA
  .logical $8ACFCA

    startData

      aBAProjectileBowTable   .include "tables/BATTLE/BattleAnimationProjectileBowTable.casm"
        .sint -1
      aBAProjectileAxeTable   .include "tables/BATTLE/BattleAnimationProjectileAxeTable.casm"
        .sint -1
      aBAProjectileLanceTable .include "tables/BATTLE/BattleAnimationProjectileLanceTable.casm"
        .sint -1

    endData

    ; 8AD0C0

  .here

  * = $0554A5
  .logical $8AD4A5

    startData

      aBattleAnimationDynamicSpriteTable	.include "tables/BATTLE/BattleAnimationDynamicSpriteTable.casm"
	  aBattleAnimationDynamicSpriteData		.include "tables/BATTLE/BattleAnimationDynamicSpriteData.casm"
	  .byte 0
	  aBattleAnimationStaticSpriteTable    	.include "tables/BATTLE/BattleAnimationStaticSpriteTable.casm"
	  aBattleAnimationStaticSpriteData    	.include "tables/BATTLE/BattleAnimationStaticSpriteData.casm"
	  .byte 0
	  aBattleAnimationPaletteTable      	.include "tables/BATTLE/BattleAnimationPaletteTable.casm"
      aBattleAnimationPaletteData       	.include "tables/BATTLE/BattleAnimationPaletteData.casm"
      aBattleAnimationCharacterPalettes 	.include "tables/BATTLE/BattleAnimationCharacterPalettes.casm"
	  .sint -1
	  .byte 3
	  aBattleAnimationScriptTable      		.include "tables/BATTLE/BattleAnimationScriptTable.casm"
      aBattleAnimationScriptData       		.include "tables/BATTLE/BattleAnimationScriptData.casm"

    endData

    ; 8ADE74

  .here

  * = $055FF6
  .logical $8ADFF6

    startData

      aBattleAnimationDefinitions .include "tables/BATTLE/BattleAnimationDefinitions.casm"

    endData

    ; 8AE89E

  .here
  
  * = $060000
  .logical $8C8000
    
    startCode

      .include "asm/EventEngine.asm"
  
    endCode
    startData

      aPortraitTable .include "tables/UNITS/PortraitTable.casm"

    endData
    startCode
  
      .include "asm/Code8CD50E.asm"
  
    endCode
    startData

      aChapterEventPointers .include "tables/CHAPTERS/ChapterEventPointers.casm" 

    endData

    ; 8CD999

  .here
  
  * = $06599B
  .logical $8CD99B

    startData

      .include "tables/CHAPTERS/WorldMapEventPointers.asm"

    endData

    ; 8CDA07

  .here

  * = $065A07
  .logical $8CDA07

    startData

      aBattleQuoteTable   .include "tables/DIALOGUE/BattleQuoteTable.casm" 
        .word 0
      aDeathQuoteTable    .include "tables/DIALOGUE/DeathQuoteTable.casm" 
        .word 0
      aReleaseQuoteTable  .include "tables/DIALOGUE/ReleaseQuoteTable.casm" 
        .word 0
      aRetreatQuoteTable  .include "tables/DIALOGUE/RetreatQuoteTable.casm" 
        .word 00
      aBattleMusicTable   .include "tables/BATTLE/BattleMusicTable.casm" 
        .word 0, 0
      aBattleBannerTable  .include "tables/BATTLE/BattleBannerTable.casm"
        .word 0, 0

    endData
    startEventScenes

      .dsection Chapter03EventsSection
      .dsection Chapter09EventsSection
      .dsection Chapter22EventsSection

    endEventScenes

    ; 8CFFF4

  .endlogical

  * = $07EB69
  .logical $8FEB69

    startData

      .dsection SoundRoomDataTrackPointersSection
      .dsection SoundRoomDataTracksSection

    endData

    ; 8FEF33

  .here

  * = $07F253
  .logical $8FF253

    startData

      .dsection SoundRoomCategoryTextPointersSection

    endData
    startMenuText

      .dsection SoundRoomCatrgoryTextSection

    endMenuText

    ; 8FF2EB

  .here


  * = $080A66
  .logical $908A66

    startData

      .include "tables/MAP/MapAnimationItemGraphicsInfo.casm"

    endData

    ; 908D54

  .here
  
  * = $0855EA
  .logical $90D5EA

    startData

      .dsection UnitMenuPointersSection

    endData
    startMenuText

      .dsection UnitMenuTextSection

    endMenuText

    ; 90D6D2

  .here

  * := $08CCEA
  .logical $91CCEA

    .dsection AS_ASMCDrawSpecialMarkerSection
    .dsection AS_ASMCDrawSpecialMarkerDataSection

      .fill mapped($088000) + $8000 - *, $FF

  .here

  * = $0B046C
  .logical $96846C

    startData

      .include "tables/BATTLE/BattleAnimationsOnMusicTable.asm"

    endData

    ; 9684F4

  .here

  * = $0B372E
  .logical $96B72E

    startData

      aSpellGraphicsOffsets .include "tables/BATTLE/SpellGraphicsOffsets.casm"

    endData

    ; 96BC92

  .here

  * = $0B8000
  .logical $978000

    startData

      aChapterObjectiveMarkers  .include "tables/CHAPTERS/ChapterObjectiveMarkers.asm"

    endData
    startEventScenes

      .dsection Chapter02xEventsSection
      .dsection Chapter08xEventsSection
      .dsection Chapter24xEventsSection

    endEventScenes

    ; 978EC5

  .endlogical

  * := $0C6C70
  .logical $98EC70

    startCode

    .dsection GetEffectiveMoveSection

    .dsection GetMovingMapSpriteMovementSpeedSection

    .dsection GetPossibleAnimationModeSection

    .dsection TalkDisplaySection
    .dsection GetChapterTalkTargetTablePointerSection
    .dsection VanillaChapterTalkTableSection
    .dsection ProcTalkDisplaySection

    .dsection KillEquippedItemPreviewProcSection
    .dsection DrawEquippedItemPreviewSection
    .dsection ProcEquippedItemPreviewSection
    .dsection DMAEquippedItemIconSection
    .dsection BurstWindowTilemapSection
    .dsection ClearBurstWindowTilemapLayerSection
    .dsection BurstWindowTilesSection

    .dsection TryRegisterHPBarSection
    .dsection RenderTallMapSpriteAndStatusLoopSection
    .dsection MissSpriteFrameSection
    .dsection ObjectiveMarkerHPBarEditsSection

    endCode

    ; 98FD73
      
  .here

  * = $0C8000
  .logical $998000

    startData

      .include "tables/CHAPTERS/CapturedUnitRescueChapterTable.asm"
      .include "events/QuoteHandlers.event"

    endData

    ; 99814F

  .here

  * := $0C81B4
  .logical $9981B4

    startEventScenes

      .dsection Chapter02EventsSection
      .dsection Chapter04EventsSection
      .dsection Chapter05EventsSection
      .dsection Chapter06EventsSection
      .dsection Chapter07EventsSection
      .dsection Chapter08EventsSection
      .dsection Chapter10EventsSection
      .dsection Chapter11EventsSection
      .dsection Chapter11xEventsSection
      .dsection Chapter12EventsSection
      .dsection Chapter13EventsSection
      .dsection Chapter16BEventsSection

    endEventScenes
    startEventData

      .dsection Chapter24DataSection
      .dsection Chapter24xDataSection
      .dsection ChapterFinalDataSection

    endEventData

    ; 99FEE9

  .endlogical

  * = $0D1C3C
  .logical $9A9C3C
  
    startCode
  
      .include "asm/GetWarpTileTargetCoords.asm"

    endCode

    ; 9A9D67
  
  .here

  * = $0D6134
  .logical $9AE134

    startEventScenes

      .dsection ChapterDemo1EventsSection

    endEventScenes
    startCode

      .include "asm/PROCS/DemoRain.asm"

    endCode
    startData

        .include "tables/BATTLE/ScriptedBattles.asm"

    endData

    ; 9AE936

  .endlogical

  * = $0D6936
  .logical $9AE936

    startEventData

      .dsection ChapterDemo1DataSection

    endEventData
    startEventScenes

      .dsection ChapterDemo2EventsSection

    endEventScenes
    startEventData

      .dsection ChapterDemo2DataSection

    endEventData

    ; 9AEC7B

  .endlogical

  * = $0DB523
  .logical $9BB523

    startCode
  
      .dsection Unknown9BB523Section

    endCode

    ; 9BB54C

  .endlogical

  * = $0DB61B
  .logical $9BB61B

    startCode
  
      .dsection Unknown9BB61BSection

    endCode

    ; 9BB6FB

  .endlogical

  * = $0DB79B
  .logical $9BB79B

    startCode
  
      .dsection Unknown9BB79BSection

    endCode

    ; 9BB7D1

  .endlogical

  * = $180000
  .logical $B08000

    startData

      aItemBonuses .include "tables/ITEMS/ItemStatBonuses.asm"
      ItemEffectivenesses .binclude "tables/ITEMS/ItemEffectiveness.asm"
      aItemData .include "tables/ITEMS/ItemData.casm"
      aItemNamePointers .dsection ItemNamePointerSection

    endData
    startMenuText

      aItemNames .dsection ItemNameSection

    endMenuText

    ; B09923

  .here

  * = $1819D6
  .logical $B099D6

    startData

      WeaponLocks .binclude "tables/ITEMS/WeaponLocks.asm"

    endData
    startMenuText

      .dsection ItemDescriptionTextSection

    endMenuText

    ; B0BC2C

    ; .fill $B0FFFF - *, $FF

  .here

  * := $188000
  .logical $B18000

    startEventData

      .dsection Chapter23DataSection
      .dsection Chapter22DataSection
      .dsection Chapter21xDataSection
      .dsection Chapter21DataSection
      .dsection Chapter20DataSection
      .dsection Chapter19DataSection
      .dsection Chapter18DataSection
      .dsection Chapter17BDataSection
      .dsection Chapter16BDataSection
      .dsection Chapter17ADataSection
      .dsection Chapter16ADataSection
      .dsection Chapter15DataSection
      .dsection Chapter14xDataSection
      .dsection Chapter14DataSection
      .dsection Chapter13DataSection
      .dsection Chapter12xDataSection
      .dsection Chapter12DataSection
      .dsection Chapter11xDataSection
      .dsection Chapter11DataSection
      .dsection Chapter10DataSection
      .dsection Chapter09DataSection
      .dsection Chapter08xDataSection
      .dsection Chapter08DataSection
      .dsection Chapter07DataSection
      .dsection Chapter06DataSection
      .dsection Chapter05DataSection
      .dsection Chapter04xDataSection
      .dsection Chapter04DataSection
      .dsection Chapter03DataSection
      .dsection Chapter02xDataSection
      .dsection Chapter02DataSection
      .dsection Chapter01DataSection

    endEventData

    ; B1FD6D

  .endlogical

  * = $1CB000
  .logical mapped($1CB000)

    startEventScenes

      .dsection Chapter24EventsSection
      .dsection ChapterFinalEventsSection

    endEventScenes

    ; B9BFA0

  .endlogical

  * = $2DA0BE
  .logical $DBA0BE

    startData

      aSpellSounds .include "tables/BATTLE/InstrumentsSpells.asm"
      aClassSounds .include "tables/BATTLE/InstrumentsClasses.asm"

    endData

    ; DBA28C

  .here

  * = $338000
  .logical mapped($338000)

    startEventScenes

      .dsection Chapter18EventsSection

    endEventScenes

    ; E78BDF

  .endlogical


  * := $33E010
  .logical mapped($33E010)

    startEventScenes

      .dsection Chapter01WorldMapEventsSection
      .dsection Chapter02WorldMapEventsSection
      .dsection Chapter03WorldMapEventsSection
      .dsection Chapter04WorldMapEventsSection
      .dsection Chapter07WorldMapEventsSection
      .dsection Chapter08WorldMapEventsSection
      .dsection Chapter09WorldMapEventsSection
      .dsection Chapter10WorldMapEventsSection
      .dsection Chapter11WorldMapEventsSection
      .dsection Chapter12WorldMapEventsSection
      .dsection Chapter13WorldMapEventsSection
      .dsection Chapter15WorldMapEventsSection
      .dsection Chapter16AWorldMapEventsSection
      .dsection Chapter17AWorldMapEventsSection
      .dsection Chapter16BWorldMapEventsSection
      .dsection Chapter17BWorldMapEventsSection
      .dsection Chapter18WorldMapEventsSection
      .dsection Chapter19WorldMapEventsSection
      .dsection Chapter20WorldMapEventsSection
      .dsection Chapter21WorldMapEventsSection
      .dsection Chapter22WorldMapEventsSection
      .dsection Chapter23WorldMapEventsSection
      .dsection Chapter24WorldMapEventsSection

    endEventScenes

    ; E7F67D

  .endlogical

  * := $3E8000
  .logical mapped($3E8000)

    startEventScenes

      .dsection Chapter01EventsSection
      .dsection Chapter04xEventsSection
      .dsection Chapter12xEventsSection
      .dsection Chapter14EventsSection
      .dsection Chapter14xEventsSection
      .dsection Chapter15EventsSection
      .dsection Chapter16AEventsSection
      .dsection Chapter17AEventsSection
      .dsection Chapter17BEventsSection
      .dsection Chapter19EventsSection
      .dsection Chapter20EventsSection
      .dsection Chapter21EventsSection
      .dsection Chapter21xEventsSection
      .dsection Chapter23EventsSection

    endEventScenes

    ; FDFDD1

  .endlogical

  * = $407FB0
  .logical $00FFB0

    startData

    .include "tables/Header.asm"

    endData

    ; 00FFE0

  .here

  * = $408000
  .logical $018000

    startDialogue

      .enc "DialogueCharacters"

      .include "text_dialogues/Chapter01Dialogue.asm"
      .include "text_dialogues/Chapter02Dialogue.asm"
      .include "text_dialogues/ShopDialogue.asm"
      .include "text_dialogues/ArenaDialogue.asm"
      .include "text_dialogues/ChapterNames.asm"
      .include "text_dialogues/Objectives.asm"
      .include "text_dialogues/BattleQuotes.asm"
      .include "text_dialogues/DeathQuotes.asm"
      .include "text_dialogues/LeifDeathReactions.asm"

    endDialogue

    ; 01EE9D

  .here

  * = $410020       ; Screw whoever didnt put all the dialogue at the start of the banks - Ultimage
  .logical $028020

    startDialogue

      .include "text_dialogues/Chapter02xDialogue.asm"
      .include "text_dialogues/Chapter03Dialogue.asm"
      .include "text_dialogues/Chapter04Dialogue.asm"
      .include "text_dialogues/RetreatQuotes.asm"
      .include "text_dialogues/ReleaseQuotes.asm"

    endDialogue

    ; 02FBD8

  .here

  * = $418030
  .logical $038030

    startDialogue

      .include "text_dialogues/Chapter04xDialogue.asm"
      .include "text_dialogues/Chapter05Dialogue.asm"
      .include "text_dialogues/Chapter06Dialogue.asm"

    endDialogue

    ; 03EC4C

  .here


  * = $420040
  .logical $048040

    startDialogue

      .include "text_dialogues/Chapter07Dialogue.asm"
      .include "text_dialogues/Chapter08Dialogue.asm"
      .include "text_dialogues/Chapter08xDialogue.asm"

    endDialogue

    ; 04F53C

  .here

  * = $428040
  .logical $058040

    startDialogue

      .include "text_dialogues/Chapter09Dialogue.asm"
      .include "text_dialogues/Chapter10Dialogue.asm"
      .include "text_dialogues/Chapter11Dialogue.asm"

    endDialogue

    ; 05E9DF

  .here

  * = $430020
  .logical $068020

    startDialogue

      .include "text_dialogues/Chapter11xDialogue.asm"
      .include "text_dialogues/Chapter12Dialogue.asm"
      .include "text_dialogues/Chapter12xDialogue.asm"

    endDialogue

    ; 06F90A

  .here

  * = $438040
  .logical $078040

    startDialogue

      .include "text_dialogues/Chapter13Dialogue.asm"
      .include "text_dialogues/Chapter14Dialogue.asm"
      .include "text_dialogues/Chapter14xDialogue.asm"

    endDialogue

    ; 07FD02

  .here

  * = $440030
  .logical $088030

    startDialogue

      .include "text_dialogues/Chapter15Dialogue.asm"
      .include "text_dialogues/Chapter16ADialogue.asm"

    endDialogue

    ; 08E660

  .here

  * = $448020
  .logical $098020

    startDialogue

      .include "text_dialogues/Chapter17ADialogue.asm"
      .include "text_dialogues/Chapter16BDialogue.asm"
      .include "text_dialogues/Chapter17BDialogue.asm"

    endDialogue

    ; 09EE23

  .here

  * = $450030
  .logical $0A8030

    startDialogue

      .include "text_dialogues/Chapter18Dialogue.asm"
      .include "text_dialogues/Chapter19Dialogue.asm"
      .include "text_dialogues/Chapter20Dialogue.asm"

    endDialogue

    ; 0AEB4B

  .here

  * = $458040
  .logical $0B8040

    startDialogue

      .include "text_dialogues/Chapter21Dialogue.asm"
      .include "text_dialogues/Chapter21xDialogue.asm"
      .include "text_dialogues/Chapter22Dialogue.asm"

    endDialogue

    ; 0BC369

  .here

  * = $460020
  .logical $0C8020

    startDialogue

      .include "text_dialogues/Chapter23Dialogue.asm"
      .include "text_dialogues/Chapter24Dialogue.asm"

    endDialogue

    ; 0CE7D3

  .here

  * = $468030
  .logical $0D8030

    startDialogue

      .include "text_dialogues/Chapter24xDialogue.asm"
      .include "text_dialogues/Chapter25Dialogue.asm"

    endDialogue

    ; 0DE5CD

  .here

  * = $470040
  .logical $0E8040

    startDialogue

      .include "text_dialogues/EpilogueDescriptions.asm"
      .include "text_dialogues/EpilogueTitles.asm"
      .include "text_dialogues/IntroDialogue.asm"
      .include "text_dialogues/EndingWhite.asm"
      .include "text_dialogues/Ranking.asm"

    endDialogue

    ; 0ED464

  .here

  * = $475520
  .logical $0ED520

    startCode

      .dsection HostageCSection

    endCode

    ; 0ED53D

  .here

  * = $475A10
  .logical $0EDA10

    startCode

      .dsection FixShopSection

    endCode

    ; 0EDA22

  .here

  * = $475A80
  .logical $0EDA80

    startData

      aTerrainTextPointers .dsection TerrainTextPointersSection

    endData
    startMenuText

      aTerrainTextData .dsection TerrainTextDataSection

    endMenuText

    ; 0EDBF6

  .here


  * = $476300
  .logical $0EE300

    startCode

      .dsection GlobalRangeDisplaySection

    endCode

    ; 0EE6E3

  .here


  * = $476700
  .logical $0EE700

    startData

      aStatusTextPointers .dsection StatusTextPointersSection
      aStatusTextData .dsection StatusTextDataSection

    endData

    ; 0EE744

  .here

  * = $47E700
  .logical $0FE700

    startData

      aFactionLeaderPointers .dsection FactionLeaderPointersSection

    endData
    startMenuText

      aFactionLeaderText .dsection FactionLeaderTextSection

    endMenutext

    ; 0FEA40

  .here

  * = $47EC00
  .logical $0FEC00

    startData

      aBattleAnimationMovementDataDefinitionTable .include "tables/BATTLE/BattleAnimationMovementDataDefinition.casm"
      .char -1
      aBattleAnimationMovementDataTable     .include "tables/BATTLE/BattleAnimationMovementData.casm"

    endData

    ; 0FF00F

  .here

  * = $480500
  .logical $108500

    startMenuText

      GrowthLabels .dsection GrowthWindowLabelsSection

    endMenuText

    ; 108580

  .here

  * = $484E09
  .logical $10CE09

    startData

      aSkillNamePointers .dsection SkillNamePointersSection
      aSkillDescriptionPointers .dsection SkillDescriptionPointersSection

    endData

    ; 10CE55

  .here

  * = $480B13
  .logical $108B13

    startMenuText

      .dsection SkillNamesSection
      .dsection SkillDescriptionsSection

    endMenuText

    ; 109081

  .here

  * = $48CED2
  .logical $11CED2

    startData

      aOptionsMenuPointers .dsection OptionsMenuPointers
      .dsection OptionMenuDataSection

    endData
    startMenuText

      .dsection OptionMenuTextSection

    endMenuText
    startData

      .dsection OptionMenuGettersSaversSection
      .dsection OptionMenuHighlightSection

    endData
    startMenutext

      .dsection OptionMenuTintTextSection

    endMenuText

    ; 11D43D

  .here


 .include "SizeHelpersEnd.h"