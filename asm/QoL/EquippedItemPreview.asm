
.weak
  WARNINGS :?= "None"
.endweak

GUARD_ZQOL_EQUIPPED_ITEM_PREVIEW :?= false
.if (GUARD_ZQOL_EQUIPPED_ITEM_PREVIEW && (WARNINGS == "Strict"))

  .warn "File included more than once."

.elsif (!GUARD_ZQOL_EQUIPPED_ITEM_PREVIEW)
  GUARD_ZQOL_EQUIPPED_ITEM_PREVIEW := true

  ; Definitions

    .weak

      rlPushToOAMBuffer                             :?= address($808881)
      rlDMAByStruct                                 :?= address($80AE2E)
      rlDMAByPointer                                :?= address($80AEF9)
      rlEnableBG1Sync                               :?= address($81B1FA)
      rlEnableBG3Sync                               :?= address($81B212)
      rlUnknown81B544                               :?= address($81B544)
      rlProcEngineCreateProc                        :?= address($829BF1)
      rlProcEngineFindProc                          :?= address($829CEC)
      rlProcEngineFreeProc                          :?= address($829D11)
      rlCopyCharacterDataToBufferByDeploymentNumber :?= address($83901C)
      rlCheckItemEquippable                         :?= address($83965E)
      rlGetEquippableItemInventoryOffset            :?= address($839705)
      rlCopyItemDataToBuffer                        :?= address($83B00D)
      rlActionStructSingleEntry                     :?= address($83CE64)
      rsGetBurstWindowPosition                      :?= address($84A1DA)
      rsGetBurstWindowCharacterName                 :?= address($84A20F)
      rsDrawBurstWindowStatus                       :?= address($84A23A)
      rsDrawBurstWindowHPIfNotStatus                :?= address($84A2C2)
      rsDrawBurstWindowHP                           :?= address($84A2CD)
      rlGetBurstWindowPalette                       :?= address($84A38A)
      rsClearBurstWindowTilemap                     :?= address($84A3AD)
      rlDrawTilemapPackedRect                       :?= address($84A3FF)
      IconSheet                                     :?= address($F28000)

    .endweak

    BurstWindowTilemapSize = (11, 5)

    BurstTilemap .function Index
      Column := int(Index) % (32 / BurstWindowTilemapSize[0])
      Column *= BurstWindowTilemapSize[0]
      Row := int(Index) / (32 / BurstWindowTilemapSize[0])
      Row *= BurstWindowTilemapSize[1]
    .endf ((Row * 32) + Column) * size(word)

  ; Fixed location inclusions

    * := $02209B
    .logical $84A09B

      rlUpdateBurstWindow ; 84/A09B

        .al
        .autsiz
        .databank `aOptions

        lda aOptions.wAnimationOption ; wBurstWindow
        bit #$0200
        bne _Disabled

        lda wBurstWindowDrawn
        bne _Drawn

          bra _NotDrawn

        _Disabled
        rtl

        _NotDrawn

        ; Only draw for visible units.

        ldx wCursorTileIndex,b
        lda aPlayerVisibleUnitMap,x
        and #$00FF
        sta wR17
        beq _DoNotDraw

        ; If there is a unit, begin a
        ; counter to draw the window
        ; after holding on this unit
        ; for 10 frames.

        cmp wBurstWindowTargetDeploymentNumber
        bne _DoNotDraw

          inc wBurstWindowDelayCounter
          lda wBurstWindowDelayCounter
          cmp #10
          beq _DrawWindow

            rtl

        _DoNotDraw

        ; Reset counter, target, coordinates.

        stz wBurstWindowDelayCounter

        lda wR17
        sta wBurstWindowTargetDeploymentNumber

        lda wCursorXCoord,b
        sta wBurstWindowTargetXCoordinate

        lda wCursorYCoord,b
        sta wBurstWindowTargetYCoordinate

        rtl

        _Drawn

        ; If already drawn, check if
        ; window needs to be cleared.

        lda wCursorXCoord,b
        cmp wBurstWindowTargetXCoordinate
        bne _ClearWindow

        lda wCursorYCoord,b
        cmp wBurstWindowTargetYCoordinate
        bne _ClearWindow

          ; While cursor is held on a
          ; unit, alternate between
          ; showing HP and status
          ; every 64 frames if the
          ; unit has a status.

          lda wVBlankEnabledFramecount
          and #$003F
          bne +

            lda wBurstWindowTargetDeploymentNumber
            sta wR0

            lda #<>aBurstWindowCharacterBuffer
            sta wR1

            jsl rlCopyCharacterDataToBufferByDeploymentNumber

            lda aBurstWindowCharacterBuffer.Status,b
            and #$00FF
            beq +

              lda wVBlankEnabledFramecount
              and #$007F
              beq _SwapHP

                bra _SwapStatus

          +
          rtl

        _SwapHP
        jsr rsDrawBurstWindowHP
        jsl rlEnableBG3Sync
        rtl

        _SwapStatus
        jsr rsDrawBurstWindowStatus
        jsl rlEnableBG3Sync
        rtl

        _ClearWindow
        sep #$20

        lda #T_Setting(true, true, true, false, true)
        sta bBuf_TM

        rep #$20

        lda wBurstWindowDrawn
        beq +

          jsr rsClearBurstWindowTilemap

          stz wBurstWindowTargetDeploymentNumber
          stz wBurstWindowDrawn

          ; Overwriting this jsl with a hook
          ; to our proc clearing routine.

          ; jsl rlEnableBG1Sync
          jsl rlKillEquippedItemPreviewProc
          jsl rlEnableBG3Sync

        +
        rtl

        _DrawWindow
        dec wBurstWindowDrawn

        lda wBurstWindowTargetDeploymentNumber
        sta wR0

        lda #<>aBurstWindowCharacterBuffer
        sta wR1

        jsl rlCopyCharacterDataToBufferByDeploymentNumber

        jsl rlGetBurstWindowPalette
        jsr rsGetBurstWindowStyle
        jsr rsGetBurstWindowPosition
        jsr rsGetBurstWindowCharacterName
        jsr rsDrawBurstWindowHPIfNotStatus
        jsr rsDrawBurstWindowTilemap

          ; Overwriting this jsl with a hook
          ; to our proc creating routine.

        ; jsl rlEnableBG1Sync
        jsl rlDrawEquippedItemPreview
        jsl rlEnableBG3Sync

        lda wCursorXCoord,b
        sta wBurstWindowTargetXCoordinate

        lda wCursorYCoord,b
        sta wBurstWindowTargetYCoordinate

        rtl

        .checkfit $84A17D

        .databank 0

    .here

    * := $02217D
    .logical $84A17D

      rlDMABurstWindowTiles ; 84/A17D

        .autsiz
        .databank ?

        jsl rlDMAByStruct

        .dstruct structDMAToVRAM, g4bppBurstWindowTiles, size(g4bppBurstWindowTiles)+size(g4bppRangeTiles), VMAIN_Setting(true), $4000

        rtl

        .checkfit $84A18B

        .databank 0

    .here

    * := $02218B
    .logical $84A18B

      rsGetBurstWindowStyle ; 84/A18B

        .autsiz
        .databank `aOptions.wAnimationOption

        ; There are 6 styles of burst window:
        ; Above the unit
        ; Above and to the right of the unit
        ; Above and to the left of the unit
        ; Below the unit
        ; Below and to the right of the unit
        ; Below and to the left of the unit

        ; Thus style+3 gives the lower window
        ; style+1 gives the right window
        ; style+2 gives the left window

        php
        rep #$30

        stz wBurstWindowStyle

        ; First we grab the pixel distance of the
        ; cursor from top left of the screen

        lda wCursorXCoord,b
        sta wR0
        lda wCursorYCoord,b
        sta wR1
        jsl rlUnknown81B544

        ; If there are 4 or fewer
        ; map tiles above the unit,
        ; use the lower window.

        lda wR1
        cmp #(4 * 16)
        beq _Lower
        bge +

        _Lower
        inc wBurstWindowStyle
        inc wBurstWindowStyle
        inc wBurstWindowStyle

        +

        ; If the unit is standing at
        ; the left edge of the map
        ; (with the 1-tile border),
        ; use the right window.

        lda wR0
        cmp #(1 * 16)
        beq _Right
        bge +

        _Right
        inc wBurstWindowStyle

        +

        ; If the unit is standing
        ; within two tiles of 
        ; the right edge of the map
        ; (with the 1-tile border),
        ; use the left window.

        cmp #256 - (3 * 16)
        blt +

        inc wBurstWindowStyle
        inc wBurstWindowStyle

        +

        ; Store the tile coordinates of the
        ; unit's origin relative to the screen

        lda wR0
        lsr a
        lsr a
        lsr a
        sta wBurstWindowOriginXTile

        lda wR1
        lsr a
        lsr a
        lsr a
        sta wBurstWindowOriginYTile

        plp
        rts

        .checkfit $84A1DA

        .databank 0

    .here

    * := $0221F7
    .logical $84A1F7

      aBurstWindowPositionTable .block ; 84/A1F7
        _UpperMiddle .sint [-4, -6]
        _UpperRight  .sint [-1, -6]
        _UpperLeft   .sint [-8, -6]
        _LowerMiddle .sint [-4,  3]
        _LowerRight  .sint [-1,  3]
        _LowerLeft   .sint [-8,  3]
      .bend

      .checkfit $84A20F

    .here

    * := $022346
    .logical $84A346

      rsDrawBurstWindowTilemap ; 84/A346

        .al
        .autsiz
        .databank `aOptions

        lda #>`aBurstWindowTilemaps
        sta lR18+1

        lda wBurstWindowStyle
        asl a
        tax
        lda aBurstWindowTilemapTable,x
        sta lR18

        lda wBurstWindowPositionYTile
        asl a
        asl a
        asl a
        asl a
        asl a

        clc
        adc wBurstWindowPositionXTile
        asl a

        clc
        adc #<>aBG1TilemapBuffer
        sta lR19

        lda #BurstWindowTilemapSize[0]
        sta wR0
        lda #BurstWindowTilemapSize[1]
        sta wR1

        lda #TilemapEntry($000, 1, 1, false, false)
        sta wUnknown000DE7,b

        jsl rlDrawTilemapPackedRect
        rts

        .checkfit $84A37E

        .databank 0

    .here

    * := $02237E
    .logical $84A37E

      aBurstWindowTilemapTable .block ; 84/A37E
        _UpperMiddle .word <>aBurstWindowTilemaps + BurstTilemap(0)
        _UpperRight  .word <>aBurstWindowTilemaps + BurstTilemap(1)
        _UpperLeft   .word <>aBurstWindowTilemaps + BurstTilemap(2)
        _LowerMiddle .word <>aBurstWindowTilemaps + BurstTilemap(3)
        _LowerRight  .word <>aBurstWindowTilemaps + BurstTilemap(4)
        _LowerLeft   .word <>aBurstWindowTilemaps + BurstTilemap(5)
      .bend

      .checkfit $84A38A

    .here

    * := $0223D3
    .logical $84A3D3

      rsClearBurstWindowTilemapLayer ; 84/A3D3

        .al
        .xl
        .autsiz
        .databank ?

        ; Replace with a hook.

        jsl rlClearBurstWindowTilemapLayerReplacement

        rts

        .checkfit $84A3FF

        .databank 0

    .here

  ; Freespace inclusions

    .section KillEquippedItemPreviewProcSection

      rlKillEquippedItemPreviewProc

        .al
        .autsiz
        .databank `aOptions

        ; Holdover from vanilla code

        jsl rlEnableBG1Sync

        ; Search for procEquippedItemPreview
        ; and kill it if found.

        lda #(`procEquippedItemPreview)<<8
        sta lR43+1
        lda #<>procEquippedItemPreview
        sta lR43

        phx

        jsl rlProcEngineFindProc
        bcc +

          jsl rlProcEngineFreeProc

        +
        plx
        rtl

        .databank 0

    .send KillEquippedItemPreviewProcSection

    .section DrawEquippedItemPreviewSection

      rlDrawEquippedItemPreview

        .al
        .autsiz
        .databank `aOptions

        ; Holdover from vanilla code.

        jsl rlEnableBG1Sync

        lda aOptions.wAnimationOption ; wBurstWindow
        and #$0F00 ; check if we are standing on detailed, draw items
        beq + 

        ; otherwise dotn
        rtl

        +

        ; Fill the action struct and
        ; see if the unit has a weapon
        ; equipped.

        lda #<>aBurstWindowCharacterBuffer
        sta wR0

        lda #-1
        sta wR17

        jsl rlActionStructSingleEntry

        lda #<>aActionStructUnit1
        sta wR1

        jsl rlGetEquippableItemInventoryOffset

        lda wR1
        cmp #size(aActionStructUnit1.Items)
        beq _StaffCheck

          tax
          lda aActionStructUnit1.Items,x
          bne +

            rtl

          +

          ; Otherwise aItemDataBuffer contains
          ; the equipped item's data.

          lda aItemDataBuffer.Icon,b
          and #$00FF

          jmp _EquippedItem

        _StaffCheck

        ; For each item in the unit's
        ; inventory, check if item is
        ; a usable staff.

        lda #<>aActionStructUnit1.Items
        sta wR0

        _StaffLoop

        lda (wR0)
        bne +

          bra _StaffNext

        +
        jsl rlCopyItemDataToBuffer

        lda #<>aActionStructUnit1
        sta wR1

        jsl rlCheckItemEquippable
        bcc _StaffNext

        lda aItemDataBuffer.Traits,b
        and #TraitStaff
        beq _StaffNext

        ; Staff found

        lda aItemDataBuffer.Icon
        and #$00FF

        jmp _EquippedItem

        _StaffNext

        inc wR0
        inc wR0

        lda wR0
        cmp #<>aActionStructUnit1.Items + size(aActionStructUnit1.Items) + size(word)
        bge +

          jmp _StaffLoop

        +

        ; Else no equipped item,
        ; return.

        rtl

        _EquippedItem

        ; Item icon index in A.

        sta wProcInput0,b

        lda #(`procEquippedItemPreview)<<8
        sta lR43+1
        lda #<>procEquippedItemPreview
        sta lR43

        jsl rlProcEngineCreateProc

        rtl

        .databank 0

    .send DrawEquippedItemPreviewSection

    .section ProcEquippedItemPreviewSection

      procEquippedItemPreview .dstruct structProcInfo, "EP", rlProcEquippedItemPreviewInit, rlProcEquippedItemPreviewOnCycle, None

      rlProcEquippedItemPreviewInit

        .al
        .autsiz
        .databank ?

        ; Icon index

        lda wProcInput0,b
        sta aProcBody0,b,x

        ; Turn tile coordinates into
        ; pixel coordinates.

        lda wBurstWindowPositionXTile
        clc
        adc #8
        asl a
        asl a
        asl a
        sta aProcBody1,b,x

        lda wBurstWindowNameYTile
        asl a
        asl a
        asl a
        sta aProcBody2,b,x

        rtl

        .databank 0

      rlProcEquippedItemPreviewOnCycle

        .al
        .autsiz
        .databank ?

        ; Wait until DMA/decompressions
        ; are done.

        lda bDMAArrayFlag,b
        ora bDecompListFlag,b
        bne +

          ; DMA icon

          lda aProcBody0,b,x
          sta wR0

          lda #($2800 >> 1)
          sta wR1

          jsl rlDMAEquippedItemIcon

          ldx wProcIndex,b

          lda #<>rlProcEquippedItemPreviewOnCycle2
          sta aProcHeaderOnCycle,b,x

        +

        lda #1
        sta aProcHeaderSleepTimer,b,x

        rtl

        .databank 0

      rlProcEquippedItemPreviewOnCycle2

        .al
        .xl
        .autsiz
        .databank ?

        ; While the minimap is shown, the
        ; burst window is not displayed but
        ; its drawn flag is not unset, so
        ; we use the terrain window's flag,
        ; which is unset.

        lda wTerrainWindowTerrain
        bpl +

          jsl rlProcEngineFreeProc
          rtl

        +

        php
        phb

        sep #$20

        lda #`_Sprite
        pha

        rep #$20

        plb

        .databank `_Sprite

        lda aProcBody1,b,x
        sta wR0

        lda aProcBody2,b,x
        sta wR1

        stz wR4
        stz wR5

        ldy #<>_Sprite

        jsl rlPushToOAMBuffer

        plb
        plp

        rtl

        _Sprite ;.structSpriteArray [[[0, 0], $00, SpriteLarge, $140, 3, 5, false, false]]
        .byte $01, $00, $00, $80, $00, $40, $3B
        
        ; keeps returning $FF as last byte otherwise, dont know why

        .databank 0

    .send ProcEquippedItemPreviewSection

    .section DMAEquippedItemIconSection

      rlDMAEquippedItemIcon

        .al
        .autsiz
        .databank ?

        ; This is basically rlDMASheetIconByVRAMOffset
        ; ($8A8286) but in parts to form a 16x16 object.

        ; Inputs:
        ; wR0: Item icon ID
        ; wR1: VRAM offset

        ; Outputs:
        ; None

        lda #>`IconSheet
        sta lR18+1

        lda wR0
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a

        clc
        adc #<>IconSheet

        ; Save these for second row.

        pha
        pei wR1

        sta lR18

        lda #size(Tile4bpp) * 2
        sta wR0

        jsl rlDMAByPointer

        pla
        clc
        adc #(size(Tile4bpp) * 16) >> 1
        sta wR1

        pla
        clc
        adc #size(Tile4bpp) * 2
        sta lR18

        lda #size(Tile4bpp) * 2
        sta wR0

        jsl rlDMAByPointer

        rtl

        .databank 0

    .send DMAEquippedItemIconSection

    .section BurstWindowTilemapSection

      aBurstWindowTilemaps .binary "BurstStyles.bin"

    .send BurstWindowTilemapSection

    .section ClearBurstWindowTilemapLayerSection

      rlClearBurstWindowTilemapLayerReplacement

        .al
        .xl
        .autsiz
        .databank ?

        ; Fill rows of tiles with value in A

        sta wR0
        ldy #BurstWindowTilemapSize[1]

        -
        lda wR0
        .for i in range(BurstWindowTilemapSize[0])
          sta i * size(word),b,x
        .next

        txa
        clc
        adc #(32 * size(word))
        tax
        dec y
        bpl -

        rtl

    .send ClearBurstWindowTilemapLayerSection

    .section BurstWindowTilesSection

      g4bppBurstWindowTiles .binary "BurstTiles.4bpp"
      g4bppRangeTiles .binary "RangeTiles.4bpp"

    .send BurstWindowTilesSection

.endif ; GUARD_ZQOL_EQUIPPED_ITEM_PREVIEW
