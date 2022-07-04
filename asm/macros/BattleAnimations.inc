structAnimationMovementData .struct BA_EdgeDistance, BA_SpriteHeight, BA_AttackDistance, BA_AttackSpeed, BA_CritSpeed, Unknown1, BA_OpponentDistance, Unknown2
	.byte \BA_EdgeDistance
	.byte \BA_SpriteHeight
	.byte \BA_AttackDistance
	.byte \BA_AttackSpeed
	.byte \BA_CritSpeed
	.byte \Unknown1
	.byte \BA_OpponentDistance
	.byte \Unknown2
	.ends

structAnimationMovementDataDefinition .struct Class, BA_WeaponType, BA_MovementData
	Class			.byte \Class
	BA_WeaponType	.byte \BA_WeaponType
	BA_MovementData	.byte \BA_MovementData
	.ends
	
structBattleAnimationDefinitions .struct Class, BA_WeaponType, Character, Gender, BA_AnimationScript, BA_DynamicSprite, BA_StaticSprite, BA_Palette

	.byte \Class
	.byte \BA_WeaponType
	.byte \Character
	.byte \Gender
	.byte \BA_AnimationScript
	.byte \BA_DynamicSprite
	.byte \BA_StaticSprite
	.byte \BA_Palette
	.ends
	
structBattleAnimationCharacterPalettes .struct Character, Class, BA_Palette

	.word \Character
	.byte \Class
	.byte \BA_Palette
	.ends
		
structBattleAnimationClassGenders .struct Gender

	.byte \Gender
	.ends

structAnimationWeaponType .struct BA_WeaponType, BA_WeaponAnimationType
	.byte (\BA_WeaponType << 4) | (\BA_WeaponAnimationType)
	.ends

structBattleAnimationPaletteTable .struct BA_Palette_Index

	.byte \BA_Palette_Index
	.ends
	

structBattleAnimationPaletteData .struct Offset, Size

	.long \Offset
	.byte \Size
	.ends
	
StructBattleAnimationWeapons .struct BA_WeaponIndex, BA_WeaponPaletteIndex

	.byte \BA_WeaponIndex
	.byte \BA_WeaponPaletteIndex
	.ends
	
StructBattleAnimationWeaponPointers .struct Offset

	.long \Offset
	.ends
	
structBAProjectileBow .struct Class, Xcoord, Ycoord

	Class		.word \Class
	Xcoord		.byte \Xcoord
	Ycoord		.byte \Ycoord
	.ends
	
structBAProjectileAxe .struct Class, Xcoord, Ycoord

	Class		.word \Class
	Xcoord		.byte \Xcoord
	Ycoord		.byte \Ycoord
	.ends
	
structBAProjectileLance .struct Class, Xcoord, Ycoord

	Class		.word \Class
	Xcoord		.byte \Xcoord
	Ycoord		.byte \Ycoord
	.ends

structAnimationRangedWeaponUnknown .struct Item, Unknown1, Unknown2

	.byte \Item
	.byte \Unknown1
	.byte \Unknown2
	.ends

structBattleAnimationShieldDefinitionEntry .struct Class, Offset
  .if (type(\Class) == gap)
    Class .byte ?
    Offset .sint ?
  .else
    Class .byte \Class
    Offset .sint \Offset
  .endif
.endstruct

structBattleAnimationShieldEntry .struct Character, GraphicsIndex, PaletteIndex
  .if (type(\Character) == gap)
    Character .sint ?
    GraphicsIndex .byte ?
    PaletteIndex .byte ?
  .else
    Character .sint \Character
    GraphicsIndex .byte \GraphicsIndex
    PaletteIndex .byte \PaletteIndex
  .endif
.endstruct
	
StructBattleAnimationShieldPointers .struct Pointer

	.long \Pointer
	.ends