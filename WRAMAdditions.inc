
  ; Structs so the tablebuilder works fine

    structEventHandlerPointer .struct Pointer
      Pointer .addr \Pointer
      .ends
    
    structWMMarkerEntry .struct Script, Init
      .word \Script
      .word \Init
      .ends


    structWeaponEffectEntry .struct Pointer
      Pointer .word \Pointer
      .ends

    structWeaponEffectOffsetEntry .struct Offset
      Offset .word \Offset
      .ends


  ; For Zanes macroScriptedStone, because I don't want
  ; to edit stuff in VoltEdge everytime
  
    Stone           = $65

  ; Also a VoltEdge macro

    macroECDrawbridge .segment EventFlag, Coordinates, EventPointer
      EVENT \EventFlag, \EventPointer
        CMP_BYTE wActiveTileUnitParameter1, \Coordinates[0]
        CMP_BYTE wActiveTileUnitParameter2, \Coordinates[1]
      END_DEFINITION
    .endsegment







  .virtual $0004EC

    wUnknown0004EC              .word ?   ; $0004EC
    wUnknown0004EE              .word ?   ; $0004EE

  .endvirtual

  .virtual $0004F2

    wUnknown0004F2              .word ?   ; $0004F2
    wUnknown0004F4              .word ?   ; $0004F4
    wUnknown0004F6              .word ?   ; $0004F6
    wUnknown0004F8              .word ?   ; $0004F8
    wUnknown0004FA              .word ?   ; $0004FA
    bUnknown0004FC              .byte ?   ; $0004FC

  .endvirtual

  .virtual $000502

    wUnknown000502              .word ?   ; $000502
    wUnknown000504              .word ?   ; $000504
    wUnknown000506              .word ?   ; $000506
    wUnknown000508              .word ?   ; $000508
    wUnknown00050A              .word ?   ; $00050A

  .endvirtual

  .virtual $000510

    wUnknown000510              .word ?   ; $000510
    wUnknown000512              .word ?   ; $000512
    wUnknown000514              .word ?   ; $000514
    bUnknown000516              .byte ?   ; $000516
    bUnknown000517              .byte ?   ; $000517
    wUnknown000518              .word ?   ; $000518
    wUnknown00051A              .word ?   ; $00051A
    wUnknown00051C              .word ?   ; $00051C
    wUnknown00051E              .word ?   ; $00051E
    wUnknown000520              .word ?   ; $000520
    wUnknown000522              .word ?   ; $000522
    wUnknown000524              .word ?   ; $000524

  .endvirtual


  .virtual $000A84

    aUnknownSpriteArray .fill size(structUnknownSpriteEntryRAM) * 32 ; $000A84

    wUnknown000C04                  .word ?   ; $000C04

  .endvirtual

  .virtual $000C16

    wUnknown000C16                  .word ?   ; $000C16

  .endvirtual

  .virtual $000C64

    wUnknownSpriteArraySize             .word ?   ; $000C64
    wUnknownSpriteArrayCount            .word ?   ; $000C66
    lSpriteRendererPointer              .long ?   ; $000C68
    wUnknown000C6B                  .word ?   ; $000C6B

  .endvirtual

  .virtual $000D15

    .union
      aIRQArraySpace                  .fill $8B ; $000D15
      .struct
        wIRQArrayFlag                 .word ?   ; $000D15
        wIRQArrayUnknownIndex1        .word ?   ; $000D17
        wIRQArrayUnknownIndex2        .word ?   ; $000D19
        wIRQArrayIndex                .word ?   ; $000D1B
        lIRQArrayCodePointer          .long ?   ; $000D1D
        aIRQArrayTypeOffset           .fill 2 * 8 ; $000D20
        aIRQArrayTypeBank             .fill 2 * 8 ; $000D30
        aIRQArrayBitfield             .fill 2 * 8 ; $000D40
        aIRQArrayHTimerSetting        .fill 2 * 8 ; $000D50
        aIRQArrayVTimerSetting        .fill 2 * 8 ; $000D60
        aIRQArrayOnCycle              .fill 2 * 8 ; $000D70
        aIRQArrayCodeOffset           .fill 2 * 8 ; $000D80
        aIRQArraySleepTimer           .fill 2 * 8 ; $000D90
      .ends
    .endu

  .endvirtual


  .virtual $000E5D

    wMoveDestTileIndex                .word ?   ; $000E5D
    wMoveStartTileIndex               .word ?   ; $000E5F
    wSelectedUnitXCoord               .word ?   ; $000E61
    wSelectedUnitYCoord               .word ?   ; $000E63
    wUnknown000E65                  .word ?   ; $000E65

  .endvirtual

  .virtual $000E6B

    wDisplayRangeFlag               .word ?   ; $000E6B
    wForcedMapScrollFlag        .word ?   ; $000E6D

  .endvirtual

  .virtual $001038

    .union
      aRangePathArray               .fill $500  ; $001038
      .struct
        aRangePathArray1            .fill $280  ; $001038
        aRangePathArray2            .fill $280  ; $0012B8
      .ends
    .endu

  .endvirtual

  .virtual $001538

    wMenuType                   .word ?   ; $001538
    aUnknown00153A                  .fill $20 ; $00153A
    aUnknown00155A                  .fill $20 ; $00155A
    s16UnknownSpriteXModifier           .sint ?   ; $00157A
    bUnknown00157C                  .byte ?   ; $00157C
    s16UnknownSpriteYModifier           .sint ?   ; $00157D
    bUnknown00157F                  .byte ?   ; $00157F
    bUnknown001580                  .byte ?   ; $001580
    bUnknown001581                  .byte ?   ; $001581
    bUnknown001582                  .byte ?   ; $001582
    bUnknown001583                  .byte ?   ; $001583
    bUnknown001584                  .byte ?   ; $001584
    bUnknown001585                  .byte ?   ; $001585
    wUnknown001586                  .word ?   ; $001586
    wUnknown001588                  .word ?   ; $001588
    wUnknown00158A                  .word ?   ; $00158A
    wUnknown00158C                  .word ?   ; $00158C
    wUnknown00158E                  .word ?   ; $00158E
    wUnknown001590                  .word ?   ; $001590
    wUnknown001592                  .word ?   ; $001592
    wUnknown001594                  .word ?   ; $001594
    wUnknown001596                  .word ?   ; $001596
    wUnknown001598                  .word ?   ; $001598
    wUnknown00159A                  .word ?   ; $00159A
    wUnknown00159C                  .word ?   ; $00159C
    lUnknown00159E                  .long ?   ; $00159E

  .endvirtual

  .virtual $0015E9

    aUnknown0015E9                  .fill 4   ; $0015E9
    aUnknown0015ED                  .fill 4   ; $0015ED
    aUnknown0015F1                  .fill 4   ; $0015F1
    aUnknown0015F5                  .fill 4   ; $0015F5
    aUnknown0015F9                  .fill 4   ; $0015F9
    aUnknown0015FD                  .fill 4   ; $0015FD
    aUnknown001601                  .fill 4   ; $001601
    aUnknown001605                  .fill 4   ; $001605
    aUnknown001609                  .fill 4   ; $001609
    aUnknown00160D                  .fill 4   ; $00160D
    wUnknown001611                  .word ?   ; $001611
    wUnknown001613                  .word ?   ; $001613
    wUnknown001615                  .word ?   ; $001615
    wUnknown001617                  .word ?   ; $001617
    wUnknown001619                  .word ?   ; $001619
    aUnknown00161B                  .fill $20 ; $00161B
    aUnknown00163B                  .fill $20 ; $00163B
    wUnknown00165B                  .word ?   ; $00165B
    wUnknown00165D                  .word ?   ; $00165D
    wUnknown00165F                  .word ?   ; $00165F
    wUnknown001661                  .word ?   ; $001661
    wUnknown001663                  .word ?   ; $001663
    wUnknown001665                  .word ?   ; $001665
    wUnknown001667                  .word ?   ; $001667
    bUnknown001669                  .byte ?   ; $001669
    bUnknown00166A                  .byte ?   ; $00166A
    wUnknown00166B                  .word ?   ; $00166B
    wUnknown00166D                  .word ?   ; $00166D
    wUnknown00166F                  .word ?   ; $00166F
    wUnknown001671                  .word ?   ; $001671
    wUnknown001673                  .word ?   ; $001673
    wUnknown001675                  .word ?   ; $001675
    wUnknown001677                  .word ?   ; $001677
    wUnknown001679                  .word ?   ; $001679
    bUnknown00167B                  .byte ?   ; $00167B
    bUnknown00167C                  .byte ?   ; $00167C
    bUnknown00167D                  .byte ?   ; $00167D
    bUnknown00167E                  .byte ?   ; $00167E
    
    ; Unknown
    .fill $A1
    
    wUnknown001720                  .word ?   ; $001720
    wUnknown001722                  .word ?   ; $001722
    wUnknown001724                  .word ?   ; $001724
    lUnknown001726                  .long ?   ; $001726
    lUnknown001729                  .long ?   ; $001729

  .endvirtual

  .virtual $00179C

    lEventEngineEventDefinitionPointer        .long ?   ; $00179C
    aEventEngineActiveProcs             .fill $20 ; $00179F
    aUnknown0017BF                  .fill 8   ; $0017BF
    aUnknown0017C7                  .fill 8   ; $0017C7
    aUnknown0017CF                  .fill 8   ; $0017CF
    wUnknown0017D7                  .word ?   ; $0017D7
    wUnknown0017D9                  .word ?   ; $0017D9
    wUnknown0017DB                  .word ?   ; $0017DB
    wUnknown0017DD                  .word ?   ; $0017DD
    wUnknown0017DF                  .word ?   ; $0017DF
    aUnknown0017E1                  .fill 4   ; $0017E1
    aUnknown0017E5                  .fill 4   ; $0017E5

  .endvirtual

  .virtual $0017ED

    wUnknown0017ED                  .word ?   ; $0017ED
    wUnknown0017EF                  .word ?   ; $0017EF
    wUnknown0017F1                  .word ?   ; $0017F1
    wUnknown0017F3                  .word ?   ; $0017F3
    wUnknown0017F5                  .word ?   ; $0017F5
    wUnknown0017F7                  .word ?   ; $0017F7

  .endvirtual

  .virtual $001800

    wUnknown001800                  .word ?   ; $001800
    wUnknown001802                  .word ?   ; $001802

  .endvirtual

  .virtual $001832

    wUnknown001832                  .word ?   ; $001832
    wUnknown001834                  .word ?   ; $001834
    wUnknown001836                  .word ?   ; $001836
    wUnknown001838                  .word ?   ; $001838
    bUnknown00183A                  .byte ?   ; $00183A
    wUnknown00183B                  .word ?   ; $00183B
    bUnknown00183D                  .byte ?   ; $00183D
    lUnknown00183E                  .long ?   ; $00183E
    bUnknown001841                  .byte ?   ; $001841
    wUnknown001842                  .word ?   ; $001842
    bUnknown001844                  .byte ?   ; $001844
    bUnknown001845                  .byte ?   ; $001845
    wUnknown001846                  .word ?   ; $001846
    wUnknown001848                  .word ?   ; $001848
    
    .fill 4 ; Unknown
    
    bUnknown00184E                  .byte ?   ; $00184E
    bUnknown00184F                  .byte ?   ; $00184F
    
    .fill $13 ; Unknown
    
    bUnknown001863                  .byte ?   ; $001863
    
    .fill $42 ; Unknown
    
    bUnknown0018A6                  .byte ?   ; $0018A6

  .endvirtual

  .virtual $001AD1

    wUnknown001AD1                  .word ?   ; $001AD1
    lUnknown001AD3                  .long ?   ; $001AD3
    wUnknown001AD6                  .word ?   ; $001AD6

    .fill 6

    wUnknown001ADE                  .word ?   ; $001ADE
    aUnknown001AE0                  .fill $16 ; $001AE0

  .endvirtual

  .virtual $7E497F

    aRandomizedItems            .fill 2 * 2 * 16  ; $7E497F
    aRandomizedNumbers                .fill 32  ; $7E49BF

  .endvirtual


  .virtual $7E4E06

    wInventoryActionIndex             .word ?   ; $7E4E06

  .endvirtual

  .virtual $7E4E0A

    wPrepItemsActionIndex             .word ?   ; $7E4E0A
    wInventoryScrolledFlag              .word ?   ; $7E4E0C

  .endvirtual

  .virtual $7E4E10
  
    wPrepItemsListSortMethod          .word ?   ; $7E4E10

  .endvirtual

  .virtual $7E4FB8

    wLastSavedSlot                  .word ?   ; $7E4FB8

  .endvirtual

  .virtual $7E4FCA

    wTurnEndXCoordinate               .word ?   ; $7E4FCA
    wTurnEndYCoordinate               .word ?   ; $7E4FCC

  .endvirtual

  .virtual $7E4FD0

    aConvoy                   .fill 2 * 128 ; $7E4FD0

  .endvirtual


  .virtual $7E50D2

    aUNITEntryBuffer        .dstruct structUNITEntry  ; $7E50D2

  .endvirtual

  .virtual $7E5142

    aMapTileRowIndexes              .fill 2 * 64  ; $7E5142
    wPreviousMapTileRowAmount           .word ?   ; $7E51C2
    wNextMapTileAmount                .word ?   ; $7E51C4
    wNextMapTileRowAmount             .word ?   ; $7E51C6
    wPreviousMapTileAmount              .word ?   ; $7E51C8
    wPlayerUnitTargetFlag             .word ?   ; $7E51CA

  .endvirtual

  .virtual $7E51CE

    wCurrentRegisteringMapSpriteArrayIndex      .word ?   ; $7E51CE
    wCurrentRegisteringMapSpriteVRAMOffset      .word ?   ; $7E51D0
                            .word ?   ; $7E51D2
    
    wAttackItemSelectionHighestMight        .word ?   ; $7E51D4
    wAttackItemSelectionHighestHit          .word ?   ; $7E51D6
    wAttackItemSelectionHighestAvoid        .word ?   ; $7E51D8
    wAttackItemSelectionHighestCrit         .word ?   ; $7E51DA
    
    wMapScrollHorizontalReturnDirectionFlag     .word ?   ; $7E51DC
    wMapScrollVerticalReturnDirectionFlag     .word ?   ; $7E51DE
    dwMapScrollReturnXStart             .fill 4   ; $7E51E0
    dwMapScrollReturnYStart             .fill 4   ; $7E51E4
    wMapScrollReturnRemainingPixelDistance      .word ?   ; $7E51E8
    wMapScrollReturnXDistance           .word ?   ; $7E51EA
    wMapScrollReturnYDistance           .word ?   ; $7E51EC
    wMapScrollReturnVerticalDominantFlag      .word ?   ; $7E51EE
    wMapScrollReturnStepIndex           .word ?   ; $7E51F0

    bUnknown7E51F2                  .byte ?   ; $7E51F2
    wUnknown7E51F3                  .word ?   ; $7E51F3
    bUnknown7E51F5                  .byte ?   ; $7E51F5
    wUnknown7E51F6                  .word ?   ; $7E51F6
    bUnknown7E51F8                  .byte ?   ; $7E51F8
    wUnknown7E51F9                  .word ?   ; $7E51F9
    bUnknown7E51FB                  .byte ?   ; $7E51FB

  .endvirtual

  .virtual $7E520A
    
    wEnemyUnitTargetFlag              .word ?   ; $7E520A

  .endvirtual

  .virtual $7E524A

    wNPCUnitTargetFlag                .word ?   ; $7E524A

  .endvirtual




  .virtual $7E9FCB
  
    aCameraPanStepArray               .fill $100  ; $7E9FCB

  .endvirtual




  .virtual $7EA7AD

    wPhaseChangeHPEffectArrayOffset         .word ?   ; $7EA7AD
    aPhaseChangeHPEffectArray         .fill 2 * 68  ; $7EA7AF
    aMapTilemapLeftTileScrollBuffer     .fill 2 * 2 * 16  ; $7EA837
    aMapTilemapRightTileScrollBuffer    .fill 2 * 2 * 16  ; $7EA877
    aRangeTilemapLeftTileScrollBuffer   .fill 2 * 2 * 16  ; $7EA8B7
    aRangeTilemapRightTileScrollBuffer    .fill 2 * 2 * 16  ; $7EA8F7

  .endvirtual


  .virtual $7EA937

    aFadingPaletteSpace         .fill 8 * $120  ; $7EA937

    .fill ($7EB71D - *)

    aFadingBGPaletteBands     .fill 2 * 3 * $60 ; $7EB71D
    aFadingOAMPaletteBands      .fill 2 * 3 * $40 ; $7EB95D

  .endvirtual

  .virtual $7EA937

    aRandomizedItemCreationArray  .fill 2 * 2 * 16  ; $7EA937

  .endvirtual


  .virtual $7EACE2

    aFullInventoryConvoyBuffer .block         ; $7EACE2
      wItem1                          .word ? ; $7EACE2
      wItem2                          .word ? ; $7EACE4
      wItem3                          .word ? ; $7EACE6
      wItem4                          .word ? ; $7EACE8
      wItem5                          .word ? ; $7EACEA
      wItem6                          .word ? ; $7EACEC
      wItem7                          .word ? ; $7EACEE
      wItemNew                        .word ? ; $7EACF0
    .endblock

  .endvirtual










  .virtual $7EAF63

    wSaveSlotTempCurrentChapter       .word ?   ; $7EAF63
    wSaveSlotTempCurrentTurn        .word ?   ; $7EAF65
    wSaveSlotTempUnknown          .word ?   ; $7EAF67
    wSaveSlotTempUnknown2         .word ?   ; $7EAF69
    wSaveSlotTempUnknown3         .word ?   ; $7EAF6B
    wSaveSlotTempUnknown4         .word ?   ; $7EAF6D
    wSaveSlotTempTileSettingIndex     .word ?   ; $7EAF6F

  .endvirtual


  .virtual $7EB5AF

    wInventoryScrollingStep               .word ?   ; $7EB5AF
    wInventoryItemInfoWindowOffset        .word ?   ; $7EB5B1
    wInventorySkillInfoWindowIndex        .word ?   ; $7EB5B3
    wInventorySkillInfoWindowArrayOffset  .word ?   ; $7EB5B5
    aInventorySkillInfoWindowIconArray    .fill 32  ; $7EB5B7
    aInventorySkillInfoWindowTypeArray    .fill 32  ; $7EB5D7

  .endvirtual

  .virtual $7EB603

    aPrepDeploymentSlots        .fill (2 * $60) ; $7EB603
    wPrepDeploymentSlotsOffset        .word ?   ; $7EB6C3
    wPrepUnitListColumn           .word ?   ; $7EB6C5
    wPrepUnitListRow            .word ?   ; $7EB6C7
    wPrepMinimumDeployableUnits       .word ?   ; $7EB6C9
    wPrepMaximumDeployableUnits       .word ?   ; $7EB6CB
    wPrepSelectedDeployableUnits      .word ?   ; $7EB6CD
    wPrepTotalDeployableUnits       .word ?   ; $7EB6CF

    .fill ($7EB6DB - *)

    wPrepUnitListTextCoordinateBase     .word ?   ; $7EB6DB
    wPrepUnitListSpriteVerticalOffset   .word ?   ; $7EB6DD
    wPrepUnitListMovingFlag         .word ?   ; $7EB6DF
                        .word ?   ; $7EB6E1
    wPrepScrollDirectionIncrement     .word ?   ; $7EB6E3
    wPrepScrollDirectionStep        .word ?   ; $7EB6E5
    wPrepListCursorXCoordinate        .word ?   ; $7EB6E7
    wPrepListCursorYCoordinate        .word ?   ; $7EB6E9
    wPrepItemsSelectedOption        .word ?   ; $7EB6EB
    wPrepItemsDiscardIndex          .word ?   ; $7EB6ED
    wPrepItemsDiscardLength         .word ?   ; $7EB6EF
    wPrepUnitListLastSelectedColumn     .word ?   ; $7EB6F1
    wPrepUnitListLastSelectedRow      .word ?   ; $7EB6F3
    wPrepUnitListLastScrollOffset     .word ?   ; $7EB6F5
    wPrepUnitListLastScrolledMenuLine   .word ?   ; $7EB6F7

  .endvirtual