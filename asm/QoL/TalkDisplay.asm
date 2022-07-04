
.weak
  WARNINGS :?= "None"
.endweak

GUARD_ZQOL_TALK_DISPLAY :?= false
.if (GUARD_ZQOL_TALK_DISPLAY && (WARNINGS == "Strict"))

  .warn "File included more than once."

.elsif (!GUARD_ZQOL_TALK_DISPLAY)
  GUARD_ZQOL_TALK_DISPLAY := true

  ; Definitions

    .weak

      rlPushToOAMBuffer                             :?= address($808881)
      rlDMAByStruct                                 :?= address($80AE2E)
      rlGetPixelDistanceFromScreenEdge              :?= address($81B544)
      rlProcEngineCreateProc                        :?= address($829BF1)
      rsUnknown838764                               :?= address($838764)
      rlGetMapTileIndexByCoords                     :?= address($838E76)
      rlCopyCharacterDataToBufferByDeploymentNumber :?= address($83901C)
      rlSearchForUnitAndWriteTargetToBuffer         :?= address($83976E)
      rlClearJoyNewInputs                           :?= address($839B7F)
      rlUnknown83CD2B                               :?= address($83CD2B)
      procBMenu                                     :?= address($8A82D7)
      rlCheckAvailableTalks                         :?= address($8C9C59)
      g4bppExclamationBubble                        :?= address($A0E060)

      ; These are for writing talk target tables, see
      ; VanillaChapterTalkTableSection for more info.

      ZQOL_TALK_ENTRY .macro Initiator, TargetList=[]
        .word \Initiator
        .word len(\TargetList) * size(word)
        .word \TargetList
      .endmacro

      ZQOL_END_TALK_CHAPTER_Val := -1

      ZQOL_END_TALK_CHAPTER .macro
        .sint ZQOL_END_TALK_CHAPTER_Val
      .endm

      ; Slightly hacky workaround for
      ; defining a redefinable local label.

      rlUpdateBurstWindow .namespace

        _ClearWindow :?= address($84A125)

      .endn

    .endweak

  ; Fixed location inclusions

    * := $0186A4
    .logical $8386A4

      rsDrawMovementRangeOrBMenu ; 83/86A4

        .al
        .autsiz
        .databank `aPlayerVisibleUnitMap

        jsl rlClearJoyNewInputs

        lda #-1
        sta wTerrainWindowTerrain

        jsl rlUpdateBurstWindow._ClearWindow

        ; If the player can't see
        ; the unit at that tile, draw
        ; B menu

        ldx wCursorTileIndex,b
        lda aPlayerVisibleUnitMap,x
        and #$00FF
        beq _BMenu

          ; Otherwise get unit data
          ; and check if unit is
          ; selectable

          sta wR0

          lda #<>aSelectedCharacterBuffer
          sta wR1

          jsl rlCopyCharacterDataToBufferByDeploymentNumber

          lda aSelectedCharacterBuffer.TurnStatus,b
          and #TurnStatusGrayed
          bne _BMenu

            ; Lastly, check if unit is asleep.

            lda aSelectedCharacterBuffer.Status,b
            and #$00FF
            cmp #StatusSleep
            beq _BMenu

              ; Draw unit's range

              jsr rsUnknown838764

              ; Originally recopied menu tiles,
              ; replaced with talk display hook.

              ; jsl rlUnknown83CD2B

              jsl rlTalkDisplay

              rts

        _BMenu

        ; Seems like some redundant actions
        ; but it's possible that some other
        ; routine enters here.

        jsl rlClearJoyNewInputs

        lda #-1
        sta wTerrainWindowTerrain

        jsl rlUpdateBurstWindow._ClearWindow

        lda #0
        sta wUnknown000E25,b

        phx

        lda #(`procBMenu)<<8
        sta lR43+1
        lda #<>procBMenu
        sta lR43
        jsl rlProcEngineCreateProc

        plx

        rts

        .checkfit $848708

        .databank 0

    .endlogical

  ; Freespace inclusions

    .section TalkDisplaySection

      rlTalkDisplay

        .al
        .xl
        .autsiz
        .databank `aPlayerVisibleUnitMap

        ; Inputs:
        ; aSelectedCharacterBuffer: initiator

        ; Outputs:
        ; procTalkDisplay or nothing

        ; Holdover from rsDrawMovementRangeOrBMenu

        jsl rlUnknown83CD2B

        lda aOptions.wTerrainWindowOption
        and #$0F00
        cmp #$0200
        bcs +
        rtl 
        
        + ; only show talk display when on option "2" or "3"

        ; Get chapter's potential talk table.

        jsl rlGetChapterTalkTargetTablePointer
        bcs +

          rtl

        +

        ldy #0

        ; For each entry in the table, for the end
        ; of the table or the initiator.

        _InitiatorLoop

          lda [lR18],y

          cmp #+ZQOL_END_TALK_CHAPTER_Val
          bne +

            jmp _End

          +
          cmp aSelectedCharacterBuffer.Character,b
          beq +

            jmp _NextInitiator

          +
            ; Get potential target count

            inc y
            inc y

            lda [lR18],y
            tax

            inc y
            inc y

            ; Now, loop through all targets in entry.

            _TargetLoop

              lda [lR18],y

              ; Check if the target is on the map.

              phx
              phy

              sta wR0
              lda #<>aBurstWindowCharacterBuffer
              sta wR1
              jsl rlSearchForUnitAndWriteTargetToBuffer

              ply
              plx

              ; Check if unit was not found.

              ora #$0000
              bne _NextTarget

              ; Check if unit is on the map and is visible.

              lda aBurstWindowCharacterBuffer.TurnStatus,b
              bit #(TurnStatusDead | TurnStatusUnknown1 | TurnStatusHidden | TurnStatusInvisible | TurnStatusCaptured)
              bne _NextTarget

              phx

              lda aBurstWindowCharacterBuffer.X,b
              and #$00FF
              sta wR0

              lda aBurstWindowCharacterBuffer.Y,b
              and #$00FF
              sta wR1

              jsl rlGetMapTileIndexByCoords

              tax
              lda aPlayerVisibleUnitMap,x

              plx

              and #$00FF
              beq _NextTarget

              ; Check if initiator and target have a talk available.

              lda aSelectedCharacterBuffer.Character,b
              sta wR0
              lda aBurstWindowCharacterBuffer.Character,b
              sta wR1

              lda aBurstWindowCharacterBuffer.DeploymentNumber,b
              and #$00FF
              pha

              pei lR18
              pei lR18+size(byte)
              phx
              phy
              jsl rlCheckAvailableTalks
              ply
              plx
              pla
              sta lR18+size(byte)
              pla
              sta lR18
              pla
              bcc _NextTarget

                ; Finally, we can make our talk bubble.

                sta wR0

                lda #<>aBurstWindowCharacterBuffer
                sta wR1

                jsl rlCopyCharacterDataToBufferByDeploymentNumber


                lda aBurstWindowCharacterBuffer.X,b
                and #$00FF
                sta wProcInput0,b

                lda aBurstWindowCharacterBuffer.Y,b
                and #$00FF
                sta wProcInput1,b

                phx
                phy

                lda #(`procTalkDisplay)<<8
                sta lR43+size(byte)
                lda #<>procTalkDisplay
                sta lR43

                jsl rlProcEngineCreateProc

                ply
                plx

                ; Fall though to the next target.

              _NextTarget

                inc y
                inc y
                dec x
                dec x
                beq +

                  jmp _TargetLoop

                +
                ; Out of targets, move to next initiator.

                jmp _InitiatorLoop

          _NextInitiator

            ; Skip over character word, add to target
            ; list size, loop.

            inc y
            inc y

            tya

            clc
            adc [lR18],y

            ; Add size of list size word, too.

            clc
            adc #size(word)

            tay

            jmp _InitiatorLoop

          _End

          rtl

          .databank 0

    .endsection TalkDisplaySection

    .section GetChapterTalkTargetTablePointerSection

      rlGetChapterTalkTargetTablePointer

        .autsiz
        .databank ?

        ; Inputs:
        ; None

        ; Outputs:
        ; lR18: long pointer to talk target table
        ; Carry set if chapter has talk targets else
        ;   carry clear.

        ; Gets the current chapter's talk target table.

        php
        phb

        sep #$20

        lda #`aChapterTalkTargetTablePointers
        pha

        rep #$30

        plb

        .databank `aChapterTalkTargetTablePointers

        ; aChapterTalkTargetTablePointers + (wCurrentChapter * size(long))

        lda wCurrentChapter,b
        asl a
        clc
        adc wCurrentChapter,b

        tax
        lda aChapterTalkTargetTablePointers,x
        sta lR18
        lda aChapterTalkTargetTablePointers+size(byte),x
        sta lR18+size(byte)

        lda lR18
        ora lR18+size(byte)
        beq _NoTalks

          plb
          plp
          sec
          rtl

        _NoTalks
        plb
        plp
        clc
        rtl

        .databank 0

    .endsection GetChapterTalkTargetTablePointerSection

    .section VanillaChapterTalkTableSection

        ; This data is for specifying talk partners for
        ; vanilla talk events. Each chapter gets a long
        ; pointer in aChapterTalkTargetTablePointers. This
        ; points to a set of ZQOL_TALK_ENTRY macros terminated
        ; by a ZQOL_END_TALK_CHAPTER macro. To specify
        ; your own tables, set QOL_USE_VANILLA_TALKS to
        ; false, and construct aChapterTalkTargetTablePointers
        ; and your chapters' tables elsewhere.

        ; This is a pointer table, indexed by chapter.
        ; A null pointer means that the chapter has no talks.

        aChapterTalkTargetTablePointers
          .long aChapter1TalkTargetTable
          .long None
          .long aChapter2xTalkTargetTable
          .long None
          .long aChapter4TalkTargetTable
          .long aChapter4xTalkTargetTable
          .long None
          .long None
          .long aChapter7TalkTargetTable
          .long aChapter8TalkTargetTable
          .long aChapter8xTalkTargetTable
          .long aChapter9TalkTargetTable
          .long None
          .long None
          .long aChapter11xTalkTargetTable
          .long None
          .long aChapter12xTalkTargetTable
          .long aChapter13TalkTargetTable
          .long None
          .long None
          .long aChapter15TalkTargetTable
          .long aChapter16ATalkTargetTable
          .long aChapter17ATalkTargetTable
          .long aChapter16BTalkTargetTable
          .long None
          .long aChapter18TalkTargetTable
          .long aChapter19TalkTargetTable
          .long None
          .long None
          .long None
          .long aChapter22TalkTargetTable
          .long aChapter23TalkTargetTable
          .long aChapter24TalkTargetTable
          .long aChapter24xTalkTargetTable
          .long None

        ; These are a series of initiators and their
        ; potential targets. Each initiator, target combo
        ; will be chacked against the chapter's talk
        ; event definitions. These are not a replacement
        ; for the chapter talk event definitions.

        aChapter1TalkTargetTable
          ZQOL_TALK_ENTRY Eyvel, [Dagdar]
          ZQOL_TALK_ENTRY Osian, [Tanya]
        ZQOL_END_TALK_CHAPTER

        aChapter2xTalkTargetTable
          ZQOL_TALK_ENTRY Leif, [Eyvel]
        ZQOL_END_TALK_CHAPTER

        aChapter4TalkTargetTable
          ZQOL_TALK_ENTRY Leif, [Dalsin]
          ZQOL_TALK_ENTRY Lifis, [Dalsin]
        ZQOL_END_TALK_CHAPTER

        aChapter4xTalkTargetTable
          ZQOL_TALK_ENTRY Asbel, [Leif]
          ZQOL_TALK_ENTRY Leif, [Asbel]
          ZQOL_TALK_ENTRY Karin, [CedChp4x]
        ZQOL_END_TALK_CHAPTER

        aChapter7TalkTargetTable
          ZQOL_TALK_ENTRY Safy, [Shiva]
          ZQOL_TALK_ENTRY Leif, [Finn]
          ZQOL_TALK_ENTRY Nanna, [Finn]
        ZQOL_END_TALK_CHAPTER

        aChapter8TalkTargetTable
          ZQOL_TALK_ENTRY Osian, [Marty]
          ZQOL_TALK_ENTRY Halvan, [Marty]
        ZQOL_END_TALK_CHAPTER

        aChapter8xTalkTargetTable
          ZQOL_TALK_ENTRY Osian, [Tanya]
          ZQOL_TALK_ENTRY Leif, [Dagdar]
        ZQOL_END_TALK_CHAPTER

        aChapter9TalkTargetTable
          ZQOL_TALK_ENTRY Leif, [Selphina]
          ZQOL_TALK_ENTRY Selphina, [Finn]
          ZQOL_TALK_ENTRY Callion, [Selphina]
        ZQOL_END_TALK_CHAPTER

        aChapter11xTalkTargetTable
          ZQOL_TALK_ENTRY Leif, [Olwen]
          ZQOL_TALK_ENTRY Fred, [Olwen]
        ZQOL_END_TALK_CHAPTER

        aChapter12xTalkTargetTable
          ZQOL_TALK_ENTRY Salem, [Perne]
          ZQOL_TALK_ENTRY Lifis, [Perne]
          ZQOL_TALK_ENTRY Lara, [Perne]
          ZQOL_TALK_ENTRY Perne, [Trude]
          ZQOL_TALK_ENTRY Safy, [Tina]
        ZQOL_END_TALK_CHAPTER

        aChapter13TalkTargetTable
          ZQOL_TALK_ENTRY Finn, [Glade]
          ZQOL_TALK_ENTRY Selphina, [Glade]
          ZQOL_TALK_ENTRY Leif, [Glade]
        ZQOL_END_TALK_CHAPTER

        aChapter15TalkTargetTable
          ZQOL_TALK_ENTRY Leif, [Ralph]
          ZQOL_TALK_ENTRY Mareeta, [Shannam]
        ZQOL_END_TALK_CHAPTER

        aChapter16ATalkTargetTable
          ZQOL_TALK_ENTRY Olwen, [Kempf]
          ZQOL_TALK_ENTRY Karin, [Ilios]
        ZQOL_END_TALK_CHAPTER

        aChapter17ATalkTargetTable
          ZQOL_TALK_ENTRY Karin, [Misha]
        ZQOL_END_TALK_CHAPTER

        aChapter16BTalkTargetTable
          ZQOL_TALK_ENTRY Homer, [Shannam]
          ZQOL_TALK_ENTRY Salem, [Sara]
          ZQOL_TALK_ENTRY Leif, [Sara]
        ZQOL_END_TALK_CHAPTER

        aChapter18TalkTargetTable
          ZQOL_TALK_ENTRY Xavier, [Leif]
          ZQOL_TALK_ENTRY Leif, [Xavier]
          ZQOL_TALK_ENTRY Civilian9, [XavierArmor1]
          ZQOL_TALK_ENTRY Civilian10, [XavierArmor2]
          ZQOL_TALK_ENTRY Civilian11, [XavierArmor3]
          ZQOL_TALK_ENTRY Civilian12, [XavierArmor4]
          ZQOL_TALK_ENTRY Civilian13, [XavierArmor5]
          ZQOL_TALK_ENTRY Civilian14, [XavierArmor6]
          ZQOL_TALK_ENTRY Civilian15, [XavierArmor7]
          ZQOL_TALK_ENTRY Civilian16, [XavierArmor8]
        ZQOL_END_TALK_CHAPTER

        aChapter19TalkTargetTable
          ZQOL_TALK_ENTRY Miranda, [Conomor]
          ZQOL_TALK_ENTRY Schroff, [Amalda]
        ZQOL_END_TALK_CHAPTER

        aChapter22TalkTargetTable
          ZQOL_TALK_ENTRY Olwen, [Reinhardt]
        ZQOL_END_TALK_CHAPTER

        aChapter23TalkTargetTable
          ZQOL_TALK_ENTRY Leif, [CedChp23, Saias]
        ZQOL_END_TALK_CHAPTER

        aChapter24TalkTargetTable
          ZQOL_TALK_ENTRY Mareeta, [Galzus]
        ZQOL_END_TALK_CHAPTER

        aChapter24xTalkTargetTable
          ZQOL_TALK_ENTRY Leif, [Eyvel]
          ZQOL_TALK_ENTRY Mareeta, [Eyvel]
        ZQOL_END_TALK_CHAPTER

    .endsection VanillaChapterTalkTableSection

    .section ProcTalkDisplaySection

      procTalkDisplay .dstruct structProcInfo, "TK", rlProcTalkDisplayInit, rlProcTalkDisplayOnCycle, None

      rlProcTalkDisplayInit

        .autsiz
        .databank ?

        ; Copy coordinates into proc body.

        lda wProcInput0,b
        sta aProcBody0,b,x

        lda wProcInput1,b
        sta aProcBody1,b,x

        rtl

        .databank 0

      rlProcTalkDisplayOnCycle

        .al
        .xl
        .autsiz
        .databank ?

        ; Wait until we're free to DMA

        lda bDMAArrayFlag,b
        ora bDecompListFlag,b
        bne +

          jsl rlDMAByStruct

          _UpperTiles .dstruct structDMAToVRAM, g4bppExclamationBubble, (size(Tile4bpp) * 2), VMAIN_Setting(true), $2880

          jsl rlDMAByStruct

          _LowerTiles .dstruct structDMAToVRAM, g4bppExclamationBubble+$200, (size(Tile4bpp) * 2), VMAIN_Setting(true), $2A80

          ldx wProcIndex,b

          lda #<>rlProcTalkDisplayOnCycle2
          sta aProcHeaderOnCycle,b,x

        +

        lda #1
        sta aProcHeaderSleepTimer,b,x

        rtl

        .databank 0

      rlProcTalkDisplayOnCycle2

        .al
        .autsiz
        .databank ?

        ; Kill proc if not displaying range.

        lda wUnknown000E25,b
        cmp #$0002
        beq +

          stz aProcHeaderTypeOffset,b,x
          rtl

        +
        ; Otherwise display sprite.

        php
        phb

        sep #$20

        lda #`_Sprite
        pha

        rep #$30

        plb

        .databank `_Sprite

        lda aProcBody0,b,x
        sta wR0

        lda aProcBody1,b,x
        sta wR1

        jsl rlGetPixelDistanceFromScreenEdge

        ; Check if sprite is onscreen.
        lda wR0
        cmp #256
        bge +

        lda wR1
        cmp #224
        bge +

        ora wR0
        bmi +

        stz wR4
        stz wR5

        ldy #<>_Sprite

        jsl rlPushToOAMBuffer

        +
        plb
        plp

        rtl

        _Sprite  ;.structSpriteArray [[[0, -16], $00, SpriteLarge, $144, 3, 4, false, false]]
        .byte $01, $00, $00, $80, $F0, $44, $39

        .databank 0

    .endsection ProcTalkDisplaySection

.endif ; GUARD_ZQOL_TALK_DISPLAY
