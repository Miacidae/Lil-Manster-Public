
.weak
  WARNINGS :?= "None"
.endweak

GUARD_ZQOL_GUARD_AI_DISPLAY :?= false
.if (GUARD_ZQOL_GUARD_AI_DISPLAY && (WARNINGS == "Strict"))

  .warn "File included more than once."

.elsif (!GUARD_ZQOL_GUARD_AI_DISPLAY)
  GUARD_ZQOL_GUARD_AI_DISPLAY := true

  ; Definitions

    .weak

      rlCopyCharacterDataToBufferByDeploymentNumber :?= address($83901C)
      rlCopyExpandedCharacterDataBufferToBuffer     :?= address($83905C)
      rlCombineCharacterDataAndClassBases           :?= address($8390BE)
      rlGetEffectiveConstitution                    :?= address($83A855)

      ; This list of 2-tuples has the format
      ; (offset in character struct word, two AI bytes list)
      ; in case more stationary AI settings are
      ; discovered.

      ZQOL_GUARD_AI_LIST := [(aTemporaryActionStruct.AI1, [$01, $03]), (aTemporaryActionStruct.AI1, [$02, $03])]

    .endweak

  ; Fixed location inclusions

    * := $0187D5
    .logical $8387D5

      rlGetEffectiveMove ; 83/87D5

        .autsiz
        .databank ?

        ; Given a short pointer to
        ; a filled character data buffer
        ; in wR14, return effective move
        ; in A.

        ; Inputs:
        ; wR14: Short pointer to character buffer

        ; Outputs:
        ; A: Effective move

        ; Replacement is larger than
        ; original, repointing.

        jsl rlGetEffectiveMoveReplacement
        rtl

        .checkfit $838853

        .databank 0

    .here

  ; Freespace inclusions

  .section GetEffectiveMoveSection

    rlGetEffectiveMoveReplacement

      .autsiz
      .databank ?

      ; Given a short pointer to
      ; a filled character data buffer
      ; in wR14, return effective move
      ; in A.

      ; Inputs:
      ; wR14: Short pointer to character buffer

      ; Outputs:
      ; A: Effective move

      php
      phb

      sep #$20

      lda #$7E
      pha

      rep #$20

      plb

      .databank `$7E

      phx
      phy

      ; Copy unit, combine with class data

      lda wR14
      sta wR0

      lda #<>aTemporaryActionStruct
      sta wR1

      jsl rlCopyExpandedCharacterDataBufferToBuffer
      jsl rlCombineCharacterDataAndClassBases

      ; Fetch move, set to zero if
      ; AI is guard.

      lda aTemporaryActionStruct.Movement,b
      and #$00FF
      sta wR2

      ; Do not set for player units.

      lda aTemporaryActionStruct.DeploymentNumber
      and #AllAllegiances
      beq _NotGuard

      ; Check for guard AI combinations.

      .for AISetting in ZQOL_GUARD_AI_LIST

        lda AISetting[0],b ; AI offset in character struct
        cmp #pack(AISetting[1]) ; Two AI setting bytes
        beq _Guard

      .next

        bra _NotGuard

        ; else AI is guard.
        _Guard

        ; check if unit with guard AI is trying to escape with captured unit or if guard AI units has no weapons/items
        lda aTemporaryActionStruct.Unknown3F
        bit #$1000
        bne _NotGuard 

        lda aOptions.wTerrainWindowOption
        and #$0F00
        cmp #$0200
        bcs +

        bra _NotGuard 

        + ; only show guard display when on option "2" or "3"
        stz wR2
        jmp _End

      _NotGuard
      ; AI is not guard, check if rescuing.

      lda aSelectedCharacterBuffer.TurnStatus,b
      bit #TurnStatusRescuing
      beq _End

        ; Unit is rescuing, check if
        ; rescuee slows them down.

        lda lR18
        pha
        lda lR18+1
        pha

        lda wR0
        pha
        lda wR1
        pha
        lda wR3
        pha

        lda aTemporaryActionStruct.Rescue,b
        sta wR0

        lda #<>aTemporaryActionStruct
        sta wR1

        jsl rlCopyCharacterDataToBufferByDeploymentNumber
        jsl rlCombineCharacterDataAndClassBases

        lda aTemporaryActionStruct.Constitution,b
        and #$00FF
        asl a
        sta wR3

        lda wR14
        sta wR1

        jsl rlGetEffectiveConstitution

        cmp wR3
        bge +

          ; Halve move if rescuee's Constitution
          ; is at least half of rescuer's.

          lda wR2
          lsr a
          sta wR2

        +
        pla
        sta wR3
        pla
        sta wR1
        pla
        sta wR0

        pla
        sta lR18+1
        pla
        sta lR18

      _End
      lda wR2

      ply
      plx

      plb
      plp
      rtl

      .databank 0

  .send GetEffectiveMoveSection

.endif ; GUARD_ZQOL_GUARD_AI_DISPLAY
