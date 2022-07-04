
.weak
  WARNINGS :?= "None"
.endweak

GUARD_ZQOL_SWAP_ANIMATION_MODE :?= false
.if (GUARD_ZQOL_SWAP_ANIMATION_MODE && (WARNINGS == "Strict"))

  .warn "File included more than once."

.elsif (!GUARD_ZQOL_SWAP_ANIMATION_MODE)
  GUARD_ZQOL_SWAP_ANIMATION_MODE := true

  ; Definitions

    rsUnknown83CDC8 :?= address($83CDC8)
    rlUnknown83CE1E :?= address($83CE1E)
    rlUnknown83CE4F :?= address($83CE4F)
    rlUnknown83E7BE :?= address($83E7BE)
    rlUnknown84B719 :?= address($84B719)
    rlUnknown8593EB :?= address($8593EB)
    rlUnknown8EA5C0 :?= address($8EA5C0)

  ; Fixed location inclusions

    * := $01CD3E
    .logical $83CD3E

      rlSelectBattleAnimationMode ; 83/CD3E

        .al
        .autsiz
        .databank `aOptions.wAnimationOption

        ; Unknown, seems to deal with
        ; invisible units?

        jsl rlUnknown8EA5C0
        bcc +

          jmp _Goto

        +

        ; Clear HDMA?

        jsl rlUnknown8593EB

        ; Seems to count units using
        ; certain staves?

        jsr rsUnknown83CDC8
        lda wR0

        cmp #1
        beq _Map

        cmp #2
        beq _Normal

        ; Check if both units are the same faction?

        jsl rlUnknown83CE1E
        bcs _Map

        ; Else jump to our custom check
        ; because it doesn't fit inline.

        jsl rlGetPossibleAnimationMode
        bcc _Map

        _Normal

        lda #$000E
        sta wUnknown000E25,b

        lda #1
        sta wUnknownMapBattleFlag

        inc wUnknown7E524E

        jsl rlUnknown83CE4F
        jsl rlUnknown80D2CE

        rtl

        _Map

        stz wUnknownMapBattleFlag

        inc wUnknown7E524E

        jsl rlUnknown83E7BE
        jsl rlUnknown84B719

        rtl

        _Goto
        lda lUnknown7EA4EC
        sta lR18
        lda lUnknown7EA4EC+1
        sta lR18+1
        phk
        pea <>(+)-1
        jmp [lR18]

        +
        rtl

        .checkfit $83CDC8

        .databank 0

    .here

  ; Freespace inclusions

    .section GetPossibleAnimationModeSection

      rlGetPossibleAnimationMode

        .al
        .xl
        .autsiz
        .databank `aOptions.wAnimationOption

        lda aOptions.wAnimationOption
        and #$000F ; from options rework
        cmp #1
        beq _Map

        cmp #0
        beq _Normal

        ; Keep individual settings

        ldx #<>aActionStructUnit1
        lda aActionStructUnit1.DeploymentNumber
        and #AllAllegiances
        beq _CheckIndividual

        ldx #<>aActionStructUnit2
        lda aActionStructUnit2.DeploymentNumber
        and #AllAllegiances
        beq _CheckIndividual

        ; Default to map animations if
        ; no player units.

        bra _Map

        _CheckIndividual

        lda structActionStructEntry.TurnStatus,b,x
        bit #TurnStatusMapAnim
        bne _Map

        _Normal

        sec
        bra +

        _Map

        clc

        +

        ; Check if holding L,
        ; swap carry if holding.

        php

        lda wJoy1Input
        bit #JoypadL
        beq +

          sep #$20
          pla
          eor #$01
          pha
          rep #$20

        +

        plp
        rtl

        .databank 0

    .send GetPossibleAnimationModeSection

.endif ; GUARD_ZQOL_SWAP_ANIMATION_MODE
