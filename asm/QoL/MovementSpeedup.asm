
.weak
  WARNINGS :?= "None"
.endweak

GUARD_ZQOL_MOVEMENT_SPEEDUP :?= false
.if (GUARD_ZQOL_MOVEMENT_SPEEDUP && (WARNINGS == "Strict"))

  .warn "File included more than once."

.elsif (!GUARD_ZQOL_MOVEMENT_SPEEDUP)
  GUARD_ZQOL_MOVEMENT_SPEEDUP := true

  ; Definitions

    aMapSpriteMovementSpeedTable           :?= address($8A8817)
    aMapSpriteLoadedUnitMovementSpeedTable :?= address($8A8917)
    rlCheckMapSpriteOffscreen              :?= address($8A9834)

  ; Fixed location inclusions

  * := $05197F
  .logical $8A997F

    rsGetMovingMapSpriteMovementSpeed ; 8A/997F

      .al
      .autsiz
      .databank ?

      jsl rlGetMovingMapSpriteMovementSpeedReplacement
      rts

      .checkfit $8A99DD

      .databank 0

  .here

  ; Freespace inclusions

  .section GetMovingMapSpriteMovementSpeedSection

    rlGetMovingMapSpriteMovementSpeedReplacement

      .al
      .xl
      .autsiz
      .databank ?

      ; Check if events are skippable?

      lda wEventEngineStatus,b
      bit #$8000
      bne +

        ; Check if player is holding A

        lda wJoy1Input
        bit #JoypadA
        bne _SpeedupMax

      +
      ; Else check if sprite is offscreen

      jsl rlCheckMapSpriteOffscreen
      bcs _SpeedupMax

      ; If the map sprite already has
      ; its speed set, use existing
      ; setting.

      lda aActiveMapSpriteMovementSpeedArray,x
      beq +

        tay
        bra _End

      +
      lda wEventEngineStatus,b
      bne _LoadedUnitMoving

        lda aActiveMapSpriteUnknownBitfield,x
        bit #$0001
        bne _SpeedupHalf

        lda aOptions.wTerrainWindowOption ; unit speed 
        and #$00F0
        bne _SpeedupHalf

          ; Otherwise get speed from table

          lda aActiveMapSpriteIndexArray,x
          asl a
          tax
          lda aMapSpriteMovementSpeedTable,x
          tay
          bra _End

      _LoadedUnitMoving

      lda aActiveMapSpriteIndexArray,x
      asl a
      tax
      lda aMapSpriteLoadedUnitMovementSpeedTable,x
      tay
      bra _End

      _SpeedupMax

      ldy #$0080
      bra _End

      _SpeedupHalf

      ldy #$0040

      _End

      rtl

      .databank 0

  .send GetMovingMapSpriteMovementSpeedSection

.endif ; GUARD_ZQOL_MOVEMENT_SPEEDUP
