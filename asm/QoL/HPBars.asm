
.weak
  WARNINGS :?= "None"
.endweak

GUARD_ZQOL_HP_BARS :?= false
.if (GUARD_ZQOL_HP_BARS && (WARNINGS == "Strict"))

  .warn "File included more than once."

.elsif (!GUARD_ZQOL_HP_BARS)
  GUARD_ZQOL_HP_BARS := true

  ; Definitions

    .weak

      aOAMUpperXBitTable            :?= address($808481)
      aOAMSizeBitTable              :?= address($808681)
      rlActiveSpriteEngineFindEntry :?= address($818187)
      rlUnknown81822E               :?= address($81822E)
      aDeploymentSlotTable          :?= address($838E98)
      rlUnsignedMultiply16By16      :?= address($80AA27)
      rlUnsignedDivide16By8         :?= address($80AAC3)

      structActiveSpriteFrame .struct Time, FramePointer
        .byte 0
        .byte \Time
        .addr \FramePointer
      .endstruct

      structActiveSpriteFrameEnd .struct
        .byte 1
      .endstruct

    .endweak

  ; Fixed location inclusions

    * := $00C318
    .logical $81C318

      rlNewRenderObjectiveMarkers ; 81/C318

        .xl
        .autsiz
        .databank ?

        jsl rlNewRenderObjectiveMarkersReplacement
        rtl

        .databank 0

    .endlogical

    * := $00C40D
    .logical $81C40D

      rsNewAppendObjectiveMarkerArray ; 81/C40D

        .al
        .xl
        .autsiz
        .databank `wObjectiveMarkerColorIndex

        jsl rlAppendObjectiveMarkerArrayReplacement
        rts

        .databank 0

    .endlogical

    * := $02698B
    .logical $84E98B

      rlUnknown84E98B ; 84/E98B

        .al
        .autsiz
        .databank ?

        ; Something to do with miss sprite rendering, see MissSpriteFrameSection

        stz aProcHeaderSleepTimer,b,x

        lda #(`aMissActionSpriteInfo)<<8
        sta lR43+size(byte)
        lda #<>aMissActionSpriteInfo
        sta lR43

        jsl rlActiveSpriteEngineFindEntry
        bcs +

          ldx wProcIndex,b
          lda #$0001
          sta aProcHeaderSleepTimer,b,x

        +
        rtl

        .databank 0

    .endlogical

    * := $0269A8
    .logical $84E9A8

      rlUnknown84E9A8 ; 84/E9A8

        .al
        .autsiz
        .databank ?

        ; Something to do with miss sprite rendering, see MissSpriteFrameSection

        phx
        phy

        ldx aMapBattleMapSpriteActiveOffsetArray,b

        lda aMapBattleTargetYCoordArray,b,x
        asl a
        asl a
        asl a
        asl a

        sec
        sbc wMapScrollHeightPixels,b

        clc
        adc #8

        tay

        lda aMapBattleTargetXCoordArray,b,x
        asl a
        asl a
        asl a
        asl a

        sec
        sbc wMapScrollWidthPixels,b

        clc
        adc #8

        tax

        lda #(`aMissActionSpriteInfo)<<8
        sta lR43+size(byte)
        lda #<>aMissActionSpriteInfo
        sta lR43

        lda wActiveSpriteIndex,b
        pha

        jsl rlUnknown81822E

        ldx wActiveSpriteIndex,b
        pla

        sta wActiveSpriteIndex,b

        lda #$0100
        sta aActiveSpriteSpriteBase,b,x

        ply
        plx

        rtl

    .endlogical

    * := $0405D1
    .logical $8885D1

      rlRegisterAllMapSpritesAndStatus ; 88/85D1

        .autsiz
        .databank ?

        ; Inputs:
        ; None

        ; Outputs:
        ; None

        php
        phb

        sep #$20

        lda #`aUpperMapSpriteAndStatusBuffer
        pha

        rep #$20

        plb

        .databank `aUpperMapSpriteAndStatusBuffer

        stz wR16 ; Counter for upper map sprites/status
        stz wR17 ; Counter for lower map sprites

        ; Regsiter sprites for all
        ; allegiances.

        lda #NewOAMTileAndAttr($000, 0, 2, False, False)
        sta wR9
        lda #((Player + 1) * size(word))
        sta wR6
        jsr rsRegisterMapSpriteAndStatus

        lda #NewOAMTileAndAttr($000, 1, 2, False, False)
        sta wR9
        lda #((Enemy + 1) * size(word))
        sta wR6
        jsr rsRegisterMapSpriteAndStatus

        lda #NewOAMTileAndAttr($000, 2, 2, False, False)
        sta wR9
        lda #((NPC + 1) * size(word))
        sta wR6
        jsr rsRegisterMapSpriteAndStatus

        ; Cap the end of the arrays.

        lda #-1
        ldy wR16
        sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.Y,y
        ldy wR17
        sta aLowerMapSpriteBuffer+structMapSpriteAndStatusEntry.Y,y

        plb
        plp

        rtl

        .databank 0

    .endlogical

    * := $040616
    .logical $888616

      rsRegisterMapSpriteAndStatus ; 88/8616

        .al
        .autsiz
        .databank `aUpperMapSpriteAndStatusBuffer

        ; Inputs:
        ; wR6: Starting deployment slot
        ; wR9: Base tile and attributes
        ; wR16: Current size of aUpperMapSpriteAndStatusBuffer
        ; wR17: Current size of aLowerMapSpriteBuffer

        ; Go through all units of an allegiance

        _Loop
        ldx wR6
        lda aDeploymentSlotTable,x
        cmp #-1
        beq _End

          tax
          lda structExpandedCharacterDataRAM.Character,b,x
          bne _Unit

        _Next
        inc wR6
        inc wR6
        bra _Loop

        _End
        rts

        _Unit

        ; We don't want to register dead/missing sprites

        lda structExpandedCharacterDataRAM.TurnStatus,b,x
        bit #TurnStatusRescued
        bne +

          bit #TurnStatusDead | TurnStatusUnknown1 | TurnStatusUnselectable | TurnStatusHidden | TurnStatusInvisible | TurnStatusCaptured
          bne _Next

        +

        ; Get coords and tile bases

        lda structExpandedCharacterDataRAM.X,b,x
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta wR7

        lda structExpandedCharacterDataRAM.Y,b,x
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta wR8

        ; Base tile, attributes

        lda wR9
        sta lR20

        ; Grayed units get the gray palette

        lda structExpandedCharacterDataRAM.TurnStatus,b,x
        bit #TurnStatusGrayed
        beq +

          lda #NewOAMTileAndAttr($000, 3, 2, False, False)
          sta lR20

        +

        ; If the unit is rescued, draw the
        ; rescue icon instead of a map sprite.

        lda structExpandedCharacterDataRAM.TurnStatus,b,x
        bit #TurnStatusRescued
        bne _Rescued

        ; If unit has a status, register
        ; that first.

        lda structExpandedCharacterDataRAM.Status,b,x
        and #$00FF
        beq _SetSprite

          bra _Status

        _SetSprite

        ; Hook into our HP bar
        ; registering function.

        jsl rlTryRegisterHPBar

        lda structExpandedCharacterDataRAM.SpriteInfo,b,x
        bit #$0080
        beq _ShortSprite

          jmp _TallSprite

        _ShortSprite

          ; Store coords, tile, etc and advance

          ldy wR17

          ; Combine with base coordinates.

          lda wR7
          sta aLowerMapSpriteBuffer+structMapSpriteAndStatusEntry.X,y

          lda wR8
          sta aLowerMapSpriteBuffer+structMapSpriteAndStatusEntry.Y,y

          ; Combine with palette.

          lda structExpandedCharacterDataRAM.SpriteInfo2,b,x
          ora lR20
          sta aLowerMapSpriteBuffer+structMapSpriteAndStatusEntry.TileAndAttr,y

          tya
          clc
          adc #size(structMapSpriteAndStatusEntry)
          sta wR17

          jmp _Next

        _Rescued

          ; Draw the rescue icon over anyone rescuing

          phx

          lda structExpandedCharacterDataRAM.Rescue,b,x
          and #$00FF
          asl a
          tax

          lda aDeploymentSlotTable,x
          tax

          lda structExpandedCharacterDataRAM.TurnStatus,b,x
          plx
          bit #TurnStatusUnselectable | TurnStatusHidden
          beq +

            jmp _Next

          +

          ldy wR16

          lda wR7
          clc
          adc #7
          sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.X,y

          lda wR8
          clc
          adc #7
          sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.Y,y

          lda #NewOAMTileAndAttr($114, 0, 0, False, False)
          ora wR9
          sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.TileAndAttr,y

          tya
          clc
          adc #size(structMapSpriteAndStatusEntry)
          sta wR16

          jmp _Next

        _Status

          ; Went from a set of cases
          ; to a table to save space.

          phx

          dec a
          asl a
          tax
          lda aStatusSpriteTable,x

          plx

          sta wR0

          ldy wR16

          ; Draw the tile for the status

          lda wR7
          clc
          adc #8
          sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.X,y

          lda wR8
          sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.Y,y
          lda wR0

          sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.TileAndAttr,y
          tya
          clc
          adc #size(structMapSpriteAndStatusEntry)
          sta wR16

          jmp _SetSprite

        _TallSprite
          ldy wR16

          lda wR7
          ora #$8000 ; Flag for nonstatus
          sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.X,y

          ; Offset 16px vertically

          lda wR8
          sec
          sbc #16
          sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.Y,y

          lda structExpandedCharacterDataRAM.SpriteInfo2,b,x
          inc a
          inc a
          ora lR20
          sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.TileAndAttr,y

          tya
          clc
          adc #size(structMapSpriteAndStatusEntry)
          sta wR16

          jmp _ShortSprite

        aStatusSpriteTable
          _Sleep .word NewOAMTileAndAttr($11F, 0, 2, False, False)
          _Berserk .word NewOAMTileAndAttr($12C, 0, 2, False, False)
          _Poison .word NewOAMTileAndAttr($12D, 1, 2, False, False)
          _Silence .word NewOAMTileAndAttr($13C, 0, 2, False, False)
          _Petrify .word NewOAMTileAndAttr($13D, 1, 2, False, False)

        .databank 0

    .endlogical

    * := $040755
    .logical $888755

      rsRenderMapSpritesAndStatus ; 88/8755

        .al
        .xl
        .autsiz
        .databank ?

        php
        phb

        sep #$20

        lda #`aUpperMapSpriteAndStatusBuffer
        pha

        rep #$20

        plb

        .databank `aUpperMapSpriteAndStatusBuffer

        lda wMapScrollWidthPixels,b
        sec
        sbc #16
        sta lR18+structMapSpriteAndStatusEntry.X
        sta lR18+structMapSpriteAndStatusEntry.HiddenStatusFlag

        lda wMapScrollHeightPixels,b
        sec
        sbc #16
        sta lR18+structMapSpriteAndStatusEntry.Y

        ; Flag whether status should be
        ; shown.

        lda wVBlankEnabledFramecount
        and #$0030
        bne +

          lda #$0400
          sta lR18+structMapSpriteAndStatusEntry.HiddenStatusFlag

        +
        jsr rsRenderTallMapSpriteAndStatusLoop
        jsr rsRenderMapSpriteLoop
        plb
        plp
        rtl

        .checkfit $888788

        .databank 0

    .endlogical

    * := $040788
    .logical $888788

      -

        .al
        .xl
        .autsiz
        .databank `aUpperMapSpriteAndStatusBuffer

        stx wNextFreeSpriteOffs,b
        rts

        .databank 0

      rsRenderTallMapSpriteAndStatusLoop ; 88/878C

        .al
        .xl
        .autsiz
        .databank `aUpperMapSpriteAndStatusBuffer

        jsl rlRenderTallMapSpriteAndStatusLoopReplacement
        rts

        .databank 0

    .endlogical

    * := $040818
    .logical $888818

      -

        .al
        .xl
        .autsiz
        .databank `aUpperMapSpriteAndStatusBuffer

        stx wNextFreeSpriteOffs,b
        rts

      rsRenderMapSpriteLoop ; 88/881C

        .al
        .xl
        .autsiz
        .databank `aUpperMapSpriteAndStatusBuffer

        ldx wNextFreeSpriteOffs,b
        ldy #$0000

        _Loop
          lda aLowerMapSpriteBuffer+structMapSpriteAndStatusEntry.Y,y
          bmi -

          sec
          sbc lR18+structMapSpriteAndStatusEntry.Y
          bit #$8700
          bne _Next

          sta wR5

          lda aLowerMapSpriteBuffer+structMapSpriteAndStatusEntry.X,y
          sec
          sbc lR18+structMapSpriteAndStatusEntry.X
          bmi _Next

          cmp #256 + 16
          bge _Next

          sec
          sbc #16

          sta aSpriteBuf+structPPUOAMEntry.X,b,x
          bpl +

            lda aOAMSizeBitTable,x
            sta wR0
            lda (wR0)
            ora aOAMSizeBitTable+2,x
            sta (wR0)
            bra _YAndAttr

          +
          lda aOAMSizeBitTable,x
          sta wR0
          lda (wR0)
          ora aOAMUpperXBitTable+2,x
          sta (wR0)

        _YAndAttr
          lda wR5
          sec
          sbc #16
          sta aSpriteBuf+structPPUOAMEntry.Y,b,x

          lda aLowerMapSpriteBuffer+structMapSpriteAndStatusEntry.TileAndAttr,y
          sta aSpriteBuf+structPPUOAMEntry.Index,b,x

          inc x
          inc x
          inc x
          inc x

        _Next
          tya
          clc
          adc #size(structMapSpriteAndStatusEntry)
          tay
          bra _Loop

        .databank 0

    .endlogical

    * := $38F080
    .logical $F1F080

      g4bppSystemIcons
        .if (false)
          .binary "SystemIconsHighContrast.4bpp"
        .else
          .binary "SystemIcons.4bpp"
        .endif

    .endlogical

  ; Freespace inclusions

    .section TryRegisterHPBarSection

      rlTryRegisterHPBar

        .al
        .xl
        .autsiz
        .databank `aUpperMapSpriteAndStatusBuffer

        ; Inputs:
        ; X: Short pointer to character struct
        ; wR7: X position of unit in pixels
        ; wR8: y position of unit in pixels
        ; wR16: Current size of aUpperMapSpriteAndStatusBuffer
        ; wR17: aLowerMapSpriteBuffer

        ; Outputs:
        ; None

        lda aOptions.wAnimationOption
        and #$00F0 ; if we are standing on detailed, draw HP bars
        beq +

        ; otherwise dont

          rtl

        +

        ; Check if unit has less than
        ; max HP.

        lda structExpandedCharacterDataRAM.CurrentHP,b,x
        and #$00FF
        sta wR10

        lda structExpandedCharacterDataRAM.MaxHP,b,x
        and #$00FF
        cmp wR10
        bne +

          rtl

        +

        lda structExpandedCharacterDataRAM.TurnStatus,b,x
        bit #(TurnStatusUnknown1 | TurnStatusRescued | TurnStatusRescuing | TurnStatusHidden | TurnStatusInvisible)
        beq +

          rtl

        +

        ; Check if there's a battle going on.

        lda wMapBattleFlag
        cmp #1
        bne +

          lda structExpandedCharacterDataRAM.Coordinates,b,x
          cmp aActionStructUnit2.Coordinates
          bne +

            rtl

        +

        ; Now it's time to determine
        ; how badly a unit is hurt.

        ; Current HP already in wR10, multiply by
        ; number of distinct bar settings.

        lda #13
        sta wR11

        jsl rlUnsignedMultiply16By16

        ; Divide by max HP.

        lda wR12
        sta wR13

        lda structExpandedCharacterDataRAM.MaxHP,b,x
        and #$00FF
        sta wR14

        jsl rlUnsignedDivide16By8

        ; wR13 contains which bar to use.
        ; Get sprites from table and register
        ; them individually.

        phx

        lda wR13
        asl a
        asl a
        tax

        lda aHPBarTable,x
        pha

        lda aHPBarTable+size(word),x
        ldx #1
        jsr rsRegisterHPBarSprite

        pla
        ldx #0
        jsr rsRegisterHPBarSprite

        plx

        rtl

        .databank 0

      rsRegisterHPBarSprite

        .al
        .xl
        .autsiz
        .databank `aUpperMapSpriteAndStatusBuffer

        ; Inputs:
        ; A: Sprite tile/attributes
        ; X: 0 for left half, 1 for right
        ; wR7: X position of unit in pixels
        ; wR8: y position of unit in pixels
        ; wR16: Current size of aUpperMapSpriteAndStatusBuffer
        ; wR17: aLowerMapSpriteBuffer

        ; Given sprite data in A,
        ; register sprite in aUpperMapSpriteAndStatusBuffer

        ; Get offset in aUpperMapSpriteAndStatusBuffer

        ldy wR16

        sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.TileAndAttr,y

        ; Get X coordinate, offset
        ; depending on which half
        ; of the bar we're registering.

        lda wR7
        cpx #0
        beq +

          ; Right half, add 8

          clc
          adc #8

        +
        ; Combine with flag for nonstatus, nontall
        ora #$4000

        sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.X,y

        ; Y coordinate

        lda wR8
        clc
        adc #8
        sta aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.Y,y

        ; Advance an entry

        tya
        clc
        adc #size(structMapSpriteAndStatusEntry)
        sta wR16

        rts

        .databank 0

      aHPBarTable
        .word NewOAMTileAndAttr($12A, 2, 2, false, false), NewOAMTileAndAttr($11E, 2, 2, false, false)
        .word NewOAMTileAndAttr($12B, 2, 2, false, false), NewOAMTileAndAttr($11E, 2, 2, false, false)
        .word NewOAMTileAndAttr($12E, 2, 2, false, false), NewOAMTileAndAttr($11E, 2, 2, false, false)
        .word NewOAMTileAndAttr($12F, 2, 2, false, false), NewOAMTileAndAttr($11E, 2, 2, false, false)
        .word NewOAMTileAndAttr($13E, 2, 2, false, false), NewOAMTileAndAttr($11E, 2, 2, false, false)
        .word NewOAMTileAndAttr($13F, 2, 2, false, false), NewOAMTileAndAttr($11E, 2, 2, false, false)
        .word NewOAMTileAndAttr($102, 2, 2, false, false), NewOAMTileAndAttr($11E, 2, 2, false, false)
        .word NewOAMTileAndAttr($102, 2, 2, false, false), NewOAMTileAndAttr($13B, 2, 2, false, false)
        .word NewOAMTileAndAttr($102, 2, 2, false, false), NewOAMTileAndAttr($13A, 2, 2, false, false)
        .word NewOAMTileAndAttr($102, 2, 2, false, false), NewOAMTileAndAttr($139, 2, 2, false, false)
        .word NewOAMTileAndAttr($102, 2, 2, false, false), NewOAMTileAndAttr($138, 2, 2, false, false)
        .word NewOAMTileAndAttr($102, 2, 2, false, false), NewOAMTileAndAttr($137, 2, 2, false, false)
        .word NewOAMTileAndAttr($102, 2, 2, false, false), NewOAMTileAndAttr($136, 2, 2, false, false)

    .endsection TryRegisterHPBarSection

    .section RenderTallMapSpriteAndStatusLoopSection

      -

        .al
        .xl
        .autsiz
        .databank `aUpperMapSpriteAndStatusBuffer

        stx wNextFreeSpriteOffs,b
        rtl

      rlRenderTallMapSpriteAndStatusLoopReplacement

        .al
        .xl
        .autsiz
        .databank `aUpperMapSpriteAndStatusBuffer

        ; Inputs:
        ; lR18: modified structMapSpriteAndStatusEntry

        ; Outputs:
        ; None

        ldx wNextFreeSpriteOffs,b
        ldy #$0000

        _Loop
        lda aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.Y,y
        bmi -

        sec
        sbc lR18+structMapSpriteAndStatusEntry.Y
        bit #$8700
        bne _Next

        sta wR5

        lda aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.X,y
        bmi _TallSpriteUpper

        ; Bit for HP bars

        bit #$4000
        beq +

          bra _HPBar

        +

        sec
        sbc lR18+structMapSpriteAndStatusEntry.HiddenStatusFlag
        bmi _Next

        cmp #256 + 16
        bge _Next

        _SmallContinue

        sec
        sbc #16
        sta aSpriteBuf+structPPUOAMEntry.X,b,x
        bpl _YAndAttr

          lda aOAMSizeBitTable,x
          sta wR0
          lda (wR0)
          ora aOAMUpperXBitTable,x
          sta (wR0)

        _YAndAttr
          lda wR5
          sec
          sbc #16
          sta aSpriteBuf+structPPUOAMEntry.Y,b,x

          lda aUpperMapSpriteAndStatusBuffer+structMapSpriteAndStatusEntry.TileAndAttr,y
          sta aSpriteBuf+structPPUOAMEntry.Index,b,x
          inc x
          inc x
          inc x
          inc x

        _Next
          tya
          clc
          adc #size(structMapSpriteAndStatusEntry)
          tay
          bra _Loop

        _TallSpriteUpper
          and #~$8000
          sec
          sbc lR18+structMapSpriteAndStatusEntry.X
          bmi _Next

          cmp #256 + 16
          bge _Next
          sec
          sbc #16
          sta aSpriteBuf+structPPUOAMEntry.X,b,x
          bpl +

            lda aOAMSizeBitTable,x
            sta wR0
            lda (wR0)
            ora aOAMSizeBitTable+2,x
            sta (wR0)
            bra _YAndAttr

          +
          lda aOAMSizeBitTable,x
          sta wR0
          lda (wR0)
          ora aOAMUpperXBitTable+2,x
          sta (wR0)
          bra _YAndAttr

        _HPBar
          and #~$4000
          sec
          sbc lR18+structMapSpriteAndStatusEntry.X
          bmi _Next

          cmp #256 + 16
          bge _Next

          bra _SmallContinue

        .databank 0

    .endsection RenderTallMapSpriteAndStatusLoopSection

    .section MissSpriteFrameSection

      ; The `miss` graphic that appears when a staff user
      ; misses during map battle animations has a tile that
      ; consists of a vertical line of black pixels. We can
      ; render a flipped copy of the `ss` part of the graphic
      ; behind the actual `ss`, shifted right a pixel, to
      ; mimic this tile and free the graphics space of HP bar
      ; graphics.

      MissSpriteFrameDefs := [(1, -4), (1, -7), (1, -9), (1, -11), (1, -13), (1, -15), (1, -17), (1, -18), (1, -19), (48, -20)]

      aMissSpriteFrames .bfor t in MissSpriteFrameDefs
        yCoord := t[1]

        MissSpriteFrame  := [[[ 0, yCoord], $00, SpriteSmall, $00F, 3, 0, False, False]]
        MissSpriteFrame ..= [[[-8, yCoord], $00, SpriteSmall, $00E, 3, 0, False, False]]
        MissSpriteFrame ..= [[[ 1, yCoord], $00, SpriteSmall, $00F, 3, 0, True, False]]

        .structNewSpriteArray MissSpriteFrame
      .endfor

      aMissActiveSpriteFrames
        .bfor f in range(len(MissSpriteFrameDefs))
          Time := MissSpriteFrameDefs[f][0]
          .structActiveSpriteFrame Time, aMissSpriteFrames[f]
        .endfor
      .structActiveSpriteFrameEnd

      aMissActionSpriteInfo .word None, None, <>aMissActiveSpriteFrames

    .endsection MissSpriteFrameSection

    .section ObjectiveMarkerHPBarEditsSection

      ; We shift the objective marker graphics by
      ; a pixel and render them as 4 small sprites instead
      ; of one large one in order to deduplicate two
      ; tiles per frame.

      rlNewRenderObjectiveMarkersReplacement

        .xl
        .autsiz
        .databank ?

        php
        phb
        sep #$20
        lda #`wObjectiveMarkerColorValue
        pha
        rep #$20
        plb

        .databank `wObjectiveMarkerColorValue

        stz wR17

        lda wObjectiveMarkerColorValue
        sta wR5

        inc wObjectiveMarkerFrame
        ldx wObjectiveMarkerFrame

        lda _FrameTable,x
        and #$00FF

        cmp #$00FF
        bne +

        stz wObjectiveMarkerFrame
        lda #0

        +
        sta wR6
        phb
        php
        phk
        plb

        .databank `*

        -
        ldx wR17
        lda aObjectiveMarkers+structObjectiveMarkerEntryRAM.X,x
        bmi _End

        sec
        sbc wMapScrollWidthPixels,b
        sta wR0

        lda aObjectiveMarkers+structObjectiveMarkerEntryRAM.Y,x
        sec
        sbc wMapScrollHeightPixels,b
        sta wR1

        lda aObjectiveMarkers+structObjectiveMarkerEntryRAM.Sprite,x

        tax
        lda _SpritePointers,x

        clc
        adc wR6
        tax

        lda 0,b,x
        tay

        stz wR4

        jsl rlPushToOAMBuffer

        lda wR17
        clc
        adc #size(structObjectiveMarkerEntryRAM)
        sta wR17
        bra -

        _End
        plp
        plb
        plb
        plp
        rtl

        _FrameTable
        .for n in range(3)
          .for i in range(12)
            .byte n * size(word)
          .next
        .next
        .char -1

        _SpritePointers
          .addr aOBJMLeftSprites
          .addr aOBJMRightSprites
          .addr aOBJMUpSprites
          .addr aOBJMDownSprites

        aOBJMLeftSprites
          .addr aOBJMLeftFrame0
          .addr aOBJMLeftFrame1
          .addr aOBJMLeftFrame2

        aOBJMRightSprites
          .addr aOBJMRightFrame0
          .addr aOBJMRightFrame1
          .addr aOBJMRightFrame2

        aOBJMUpSprites
          .addr aOBJMUpFrame0
          .addr aOBJMUpFrame1
          .addr aOBJMUpFrame2

        aOBJMDownSprites
          .addr aOBJMDownFrame0
          .addr aOBJMDownFrame1
          .addr aOBJMDownFrame2

        OBJMLeftFrame0Sprites  := [[[1, 0], $00, SpriteSmall, $120, 2, 0, False, False]]
        OBJMLeftFrame0Sprites ..= [[[1, 8], $00, SpriteSmall, $130, 2, 0, False, False]]
        OBJMLeftFrame0Sprites ..= [[[9, 0], $00, SpriteSmall, $123, 2, 0, False, False]]
        OBJMLeftFrame0Sprites ..= [[[9, 8], $00, SpriteSmall, $133, 2, 0, False, False]]

        aOBJMLeftFrame0 .structNewSpriteArray OBJMLeftFrame0Sprites

        OBJMLeftFrame1Sprites  := [[[1, 0], $00, SpriteSmall, $121, 2, 0, False, False]]
        OBJMLeftFrame1Sprites ..= [[[1, 8], $00, SpriteSmall, $131, 2, 0, False, False]]
        OBJMLeftFrame1Sprites ..= [[[9, 0], $00, SpriteSmall, $123, 2, 0, False, False]]
        OBJMLeftFrame1Sprites ..= [[[9, 8], $00, SpriteSmall, $133, 2, 0, False, False]]

        aOBJMLeftFrame1 .structNewSpriteArray OBJMLeftFrame1Sprites

        OBJMLeftFrame2Sprites  := [[[1, 0], $00, SpriteSmall, $122, 2, 0, False, False]]
        OBJMLeftFrame2Sprites ..= [[[1, 8], $00, SpriteSmall, $132, 2, 0, False, False]]
        OBJMLeftFrame2Sprites ..= [[[9, 0], $00, SpriteSmall, $123, 2, 0, False, False]]
        OBJMLeftFrame2Sprites ..= [[[9, 8], $00, SpriteSmall, $133, 2, 0, False, False]]

        aOBJMLeftFrame2 .structNewSpriteArray OBJMLeftFrame2Sprites

        OBJMRightFrame0Sprites  := [[[7, 0], $00, SpriteSmall, $120, 2, 0, True, False]]
        OBJMRightFrame0Sprites ..= [[[7, 8], $00, SpriteSmall, $130, 2, 0, True, False]]
        OBJMRightFrame0Sprites ..= [[[-1, 0], $00, SpriteSmall, $123, 2, 0, True, False]]
        OBJMRightFrame0Sprites ..= [[[-1, 8], $00, SpriteSmall, $133, 2, 0, True, False]]

        aOBJMRightFrame0 .structNewSpriteArray OBJMRightFrame0Sprites

        OBJMRightFrame1Sprites  := [[[7, 0], $00, SpriteSmall, $121, 2, 0, True, False]]
        OBJMRightFrame1Sprites ..= [[[7, 8], $00, SpriteSmall, $131, 2, 0, True, False]]
        OBJMRightFrame1Sprites ..= [[[-1, 0], $00, SpriteSmall, $123, 2, 0, True, False]]
        OBJMRightFrame1Sprites ..= [[[-1, 8], $00, SpriteSmall, $133, 2, 0, True, False]]

        aOBJMRightFrame1 .structNewSpriteArray OBJMRightFrame1Sprites

        OBJMRightFrame2Sprites  := [[[7, 0], $00, SpriteSmall, $122, 2, 0, True, False]]
        OBJMRightFrame2Sprites ..= [[[7, 8], $00, SpriteSmall, $132, 2, 0, True, False]]
        OBJMRightFrame2Sprites ..= [[[-1, 0], $00, SpriteSmall, $123, 2, 0, True, False]]
        OBJMRightFrame2Sprites ..= [[[-1, 8], $00, SpriteSmall, $133, 2, 0, True, False]]

        aOBJMRightFrame2 .structNewSpriteArray OBJMRightFrame2Sprites

        OBJMUpFrame0Sprites  := [[[0, 1], $00, SpriteSmall, $124, 2, 0, False, False]]
        OBJMUpFrame0Sprites ..= [[[8, 1], $00, SpriteSmall, $125, 2, 0, False, False]]
        OBJMUpFrame0Sprites ..= [[[0, 9], $00, SpriteSmall, $134, 2, 0, False, False]]
        OBJMUpFrame0Sprites ..= [[[8, 9], $00, SpriteSmall, $135, 2, 0, False, False]]

        aOBJMUpFrame0 .structNewSpriteArray OBJMUpFrame0Sprites

        OBJMUpFrame1Sprites  := [[[0, 1], $00, SpriteSmall, $126, 2, 0, False, False]]
        OBJMUpFrame1Sprites ..= [[[8, 1], $00, SpriteSmall, $127, 2, 0, False, False]]
        OBJMUpFrame1Sprites ..= [[[0, 9], $00, SpriteSmall, $134, 2, 0, False, False]]
        OBJMUpFrame1Sprites ..= [[[8, 9], $00, SpriteSmall, $135, 2, 0, False, False]]

        aOBJMUpFrame1 .structNewSpriteArray OBJMUpFrame1Sprites

        OBJMUpFrame2Sprites  := [[[0, 1], $00, SpriteSmall, $128, 2, 0, False, False]]
        OBJMUpFrame2Sprites ..= [[[8, 1], $00, SpriteSmall, $129, 2, 0, False, False]]
        OBJMUpFrame2Sprites ..= [[[0, 9], $00, SpriteSmall, $134, 2, 0, False, False]]
        OBJMUpFrame2Sprites ..= [[[8, 9], $00, SpriteSmall, $135, 2, 0, False, False]]

        aOBJMUpFrame2 .structNewSpriteArray OBJMUpFrame2Sprites

        OBJMDownFrame0Sprites  := [[[0, 7], $00, SpriteSmall, $124, 2, 0, False, True]]
        OBJMDownFrame0Sprites ..= [[[8, 7], $00, SpriteSmall, $125, 2, 0, False, True]]
        OBJMDownFrame0Sprites ..= [[[0, -1], $00, SpriteSmall, $134, 2, 0, False, True]]
        OBJMDownFrame0Sprites ..= [[[8, -1], $00, SpriteSmall, $135, 2, 0, False, True]]

        aOBJMDownFrame0 .structNewSpriteArray OBJMDownFrame0Sprites

        OBJMDownFrame1Sprites  := [[[0, 7], $00, SpriteSmall, $126, 2, 0, False, True]]
        OBJMDownFrame1Sprites ..= [[[8, 7], $00, SpriteSmall, $127, 2, 0, False, True]]
        OBJMDownFrame1Sprites ..= [[[0, -1], $00, SpriteSmall, $134, 2, 0, False, True]]
        OBJMDownFrame1Sprites ..= [[[8, -1], $00, SpriteSmall, $135, 2, 0, False, True]]

        aOBJMDownFrame1 .structNewSpriteArray OBJMDownFrame1Sprites

        OBJMDownFrame2Sprites  := [[[0, 7], $00, SpriteSmall, $128, 2, 0, False, True]]
        OBJMDownFrame2Sprites ..= [[[8, 7], $00, SpriteSmall, $129, 2, 0, False, True]]
        OBJMDownFrame2Sprites ..= [[[0, -1], $00, SpriteSmall, $134, 2, 0, False, True]]
        OBJMDownFrame2Sprites ..= [[[8, -1], $00, SpriteSmall, $135, 2, 0, False, True]]

        aOBJMDownFrame2 .structNewSpriteArray OBJMDownFrame2Sprites

        .databank 0

      rlAppendObjectiveMarkerArrayReplacement

        .al
        .xl
        .autsiz
        .databank `wObjectiveMarkerColorIndex

        ldx wR17 ; Loop counter

        ; Fetch tile from coordinates

        jsl rlGetMapTileIndexByCoords

        sta aObjectiveMarkers+structObjectiveMarkerEntryRAM.Tile,x

        ; Coordinates

        lda wR0
        asl a
        asl a
        asl a
        asl a
        sta aObjectiveMarkers+structObjectiveMarkerEntryRAM.X,x

        lda wR1
        asl a
        asl a
        asl a
        asl a
        sta aObjectiveMarkers+structObjectiveMarkerEntryRAM.Y,x

        ; Sprite

        txy
        lda wR2
        sta aObjectiveMarkers+structObjectiveMarkerEntryRAM.Sprite,y
        tya

        ; Advance, lay a terminator over next entry

        clc
        adc #size(structObjectiveMarkerEntryRAM)
        sta wR17

        tax

        lda #-1
        sta aObjectiveMarkers+structObjectiveMarkerEntryRAM.X,x
        sta aObjectiveMarkers+structObjectiveMarkerEntryRAM.Tile,x
        rtl

        .databank 0

    .endsection ObjectiveMarkerHPBarEditsSection

.endif ; GUARD_ZQOL_HP_BARS
