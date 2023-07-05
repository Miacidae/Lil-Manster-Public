
  .section Unknown9BB523Section

    rlUnknown9BB523 ; 9B/B523

      .al
      .xl
      .autsiz
      .databank ?

      phx
      cpx #0
      bne +

      lda bBattleAnimationUnit1MovementDataIndex
      bra ++
      
      +
      lda bBattleAnimationUnit2MovementDataIndex
      
      +
      and #$00FF
      sta wR10

      lda #8
      sta wR11
      jsl rlUnsignedMultiply16By16

      ldx wR12
      lda aBattleAnimationMovementDataTable,x
      and #$00FF
      plx
      rtl

      .databank 0

  .endsection Unknown9BB523Section


  .section Unknown9BB61BSection

    rlUnknown9BB61B ; 9B/B61B

      .al
      .xl
      .autsiz
      .databank ?

      phx
      lda bBattleDistance
      cmp #2
      bcc _B63E
      
      cpx #0
      bne +

      lda aBattleAnimationUnit1Info.wWeapon,b
      bra ++
      
      +
      lda aBattleAnimationUnit2Info.wWeapon,b
      
      +
      jsl $9BB6FB
      bcc _B63E

      lda #$00C8
      jmp _End
      
      _B63E
      lda bBattleDistance
      cmp #2
      bcs _B686

      cpx #0
      bne _B66A

      lda aBattleAnimationUnit1Info.bWeaponStyle,b
      and #$000F
      cmp #5
      bne _B686

      lda aBattleAnimationUnit2Info.bWeaponStyle,b
      and #$000F
      cmp #5
      beq _B686

      jsl $9C9F1E
      bcs _B6D2 
      bra _B686

      
      _B66A
      lda aBattleAnimationUnit2Info.bWeaponStyle,b
      and #$000F
      cmp #5
      bne _B686

      lda aBattleAnimationUnit1Info.bWeaponStyle,b
      and #$000F
      cmp #5
      beq _B686

      jsl $9C9F1E
      bcs _B6D2
      

      _B686
      cpx #0
      bne  +

      lda aBattleAnimationUnit1Info.wWeapon,b
      bra ++
      
      +
      lda aBattleAnimationUnit2Info.wWeapon,b
      
      +
      cmp #$006B
      beq +

      cmp #$006F
      beq +

      cmp #$007B
      beq +

      cmp #$0070
      beq +

      cmp #$0071
      beq +

      cmp #$0077
      beq +
      bra ++
      
      +
      lda bBattleDistance
      cmp #2
      bne +

      lda #$00E0
      bra _End
      
      +
      cpx #0
      bne +

      lda bBattleAnimationUnit1MovementDataIndex
      bra ++
      
      +
      lda bBattleAnimationUnit2MovementDataIndex
      
      +
      bra _B6E1

      _B6D2
      cpx #0
      bne +

      lda bBattleAnimationUnit2MovementDataIndex
      bra _B6E1
      
      +
      lda bBattleAnimationUnit1MovementDataIndex
      
      _B6E1
      and #$00FF
      sta wR10

      lda #8
      sta wR11

      jsl rlUnsignedMultiply16By16

      ldx wR12
      lda aBattleAnimationMovementDataTable+6,x
      and #$00FF
      asl
      
      _End
      plx
      rtl

    .databank 0  

  .endsection Unknown9BB61BSection

  .section Unknown9BB79BSection

    rsUnknown9BB79B ; 9B/B79B

      .al
      .xl
      .autsiz
      .databank ?

      phx
      ldx #0
      sta wR0
      sep #$20
      
      -
      lda aBattleAnimationMovementDataDefinitionTable,x
      cmp #$FF
      beq ++

      cmp wR0
      bne +

      lda wR0+1
      cmp #9
      beq _B7C7

      cmp aBattleAnimationMovementDataDefinitionTable+1,x
      beq _B7C7

      +
      inc x
      inc x
      inc x
      bra -

      +
      rep #$20
      lda #0
      bra +
      
      _B7C7
      rep #$20
      inc x
      inc x
      lda aBattleAnimationMovementDataDefinitionTable,x

      +
      plx
      rts

    .databank 0

  .endsection Unknown9BB79BSection
