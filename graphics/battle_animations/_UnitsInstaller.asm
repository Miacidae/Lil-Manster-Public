* = $232A84
.logical $C6AA84

	aBADynSprite_Berserker						.binary "units/DynSprite_Berserker.4bpp.fe4"

	; There's a slew of combat backgrounds and UI elements after this. Skipped over them.
.here

* = $237BFD
.logical $C6FBFD

	aBADynSprite_Cleric                         .crossbank.start *, "units/DynSprite_Cleric.4bpp.fe4"

.here

* = $238000
.logical $C70000
	.crossbank.end
.here


* = $2388AC
.logical $C788AC

	aBAStaSprite_Cleric_Shadow                                                .binary "units/StaSprite_Cleric_Shadow.4bpp.fe4"
	aBAStaSprite_DismountedClasses_JuniorLord_Slash                           .binary "units/StaSprite_DismountedClasses_JuniorLord_Slash.4bpp.fe4"
	aBADynSprite_DismountedMageKnightM_Sword                                  .binary "units/DynSprite_DismountedMageKnightM_Sword.4bpp.fe4"
	aBAStaSprite_DismountedMageKnight_Slash                                   .binary "units/StaSprite_DismountedMageKnight_Slash.4bpp.fe4"
	aBADynSprite_DismountedMageKnightM_Magic                                  .binary "units/DynSprite_DismountedMageKnightM_Magic.4bpp.fe4"
	aBAStaSprite_SageF_DismountedMageKnt_Shadow                               .binary "units/StaSprite_SageF_DismountedMageKnt_Shadow.4bpp.fe4"
	aBADynSprite_DismountedMageKnightF_Sword                                  .binary "units/DynSprite_DismountedMageKnightF_Sword.4bpp.fe4"
	aBAStaSprite_UnusedC7D0EC_Slash                                           .binary "units/StaSprite_UnusedC7D0EC_Slash.4bpp.fe4"
	aBADynSprite_DismountedMageKnightF_MagicStaff                             .binary "units/DynSprite_DismountedMageKnightF_MagicStaff.4bpp.fe4"
	aBADynSprite_Lord_Prince_DismountedLordKnight                             .binary "units/DynSprite_Lord_Prince_DismountedLordKnight.4bpp.fe4"
	aBAStaSprite_Lord_Prince_Dismounted_KntLord_PalF_MstKntF_Falcon_Slash     .binary "units/StaSprite_Lord_Prince_Dismounted_KntLord_PalF_MstKntF_Falcon_Slash.4bpp.fe4"
	aBADynSprite_DismountedPaladinF_DismountedMasterKnightF_Sword             .crossbank.start *, "units/DynSprite_DismountedPaladinF_DismountedMasterKnightF_Sword.4bpp.fe4"

.here

* = $240000
.logical $C80000
	.crossbank.end
.here

* = $2414CF
.logical $C894CF

	aBAStaSprite_UnusedC894CF_Slash                   .binary "units/StaSprite_UnusedC894CF_Slash.4bpp.fe4"
	aBADynSprite_DismountedPaladinF_DismountedMasterKnightF_Staff             .binary "units/DynSprite_DismountedPaladinF_DismountedMasterKnightF_Staff.4bpp.fe4"
	aBAStaSprite_UnusedC89E72_Slash                   .binary "units/StaSprite_UnusedC89E72_Slash.4bpp.fe4"
	aBADynSprite_Dancer                               .binary "units/DynSprite_Dancer.4bpp.fe4"
	aBAStaSprite_Dancer_Slash                         .binary "units/StaSprite_Dancer_Slash.4bpp.fe4"
	aBADynSprite_Dancer_Dance                         .binary "units/DynSprite_Dancer_Dance.4bpp.fe4"
	aBAStaSprite_Dancer_Dance_Shadow                  .binary "units/StaSprite_Dancer_Dance_Shadow.4bpp.fe4"
	aBADynSprite_Priest                               .binary "units/DynSprite_Priest.4bpp.fe4"
	aBAStaSprite_Priest_Priestess_Shadow              .binary "units/StaSprite_Priest_Priestess_Shadow.4bpp.fe4"
	aBADynSprite_Priestess                            .binary "units/DynSprite_Priestess.4bpp.fe4"
	aBAStaSprite_UnusedC8D189_Shadow                  .binary "units/StaSprite_UnusedC8D189_Shadow.4bpp.fe4"
	aBAStaSprite_Mage_Shadow                          .binary "units/StaSprite_Mage_Shadow.4bpp.fe4"
	aBADynSprite_Mage_LoptrianMageMagic               .binary "units/DynSprite_Mage_LoptrianMageMagic.4bpp.fe4"
	aBAStaSprite_UnusedC8E085_Shadow                  .binary "units/StaSprite_UnusedC8E085_Shadow.4bpp.fe4"
	aBADynSprite_Mage_LoptrianMageStaff               .binary "units/DynSprite_Mage_LoptrianMageStaff.4bpp.fe4"
	aBAStaSprite_LoptrianMage_Magic_Shadow            .binary "units/StaSprite_LoptrianMage_Magic_Shadow.4bpp.fe4"
	aBADynSprite_ThunderMageM                         .binary "units/DynSprite_ThunderMageM.4bpp.fe4"
	aBAStaSprite_ThunderMage_Shadow                   .binary "units/StaSprite_ThunderMage_Shadow.4bpp.fe4"
	aBADynSprite_ThunderMageF                         .crossbank.start *, "units/DynSprite_ThunderMageF.4bpp.fe4"

.here

* = $248000
.logical $C90000
	.crossbank.end
.here

* = $2485D4
.logical $C985D4
	
	aBADynSprite_WindMageM                            .binary "units/DynSprite_WindMageM.4bpp.fe4"
	aBAStaSprite_WindMage_Shadow                      .binary "units/StaSprite_WindMage_Shadow.4bpp.fe4"
	aBADynSprite_WindMageF                            .binary "units/DynSprite_WindMageF.4bpp.fe4"
	aBAStaSprite_HighPriest_HighPriestess_Shadow      .binary "units/StaSprite_HighPriest_HighPriestess_Shadow.4bpp.fe4"
	aBADynSprite_High_Priest                          .binary "units/DynSprite_High_Priest.4bpp.fe4"
	aBADynSprite_High_Priestess                       .binary "units/DynSprite_High_Priestess.4bpp.fe4"
	aBADynSprite_Bishop                               .binary "units/DynSprite_Bishop.4bpp.fe4"
	aBAStaSprite_Bishop_Shadow                        .binary "units/StaSprite_Bishop_Shadow.4bpp.fe4"
	aBAStaSprite_Bard_Shadow                          .binary "units/StaSprite_Bard_Shadow.4bpp.fe4"
	aBADynSprite_Bard                                 .binary "units/DynSprite_Bard.4bpp.fe4"
	aBAStaSprite_UnusedC9E091_Shadow                  .binary "units/StaSprite_UnusedC9E091_Shadow.4bpp.fe4"
	aBADynSprite_Sorcerer                             .binary "units/DynSprite_Sorcerer.4bpp.fe4"
	aBAStaSprite_Sorcerer_Shadow                      .binary "units/StaSprite_Sorcerer_Shadow.4bpp.fe4"
	aBADynSprite_DarkBishop                           .crossbank.start *, "units/DynSprite_DarkBishop.4bpp.fe4"

.here

* = $250000
.logical $CA0000
	.crossbank.end
.here

* = $250481
.logical $CA8481

	aBAStaSprite_DarkBishop_Shadow                    .binary "units/StaSprite_DarkBishop_Shadow.4bpp.fe4"
	aBADynSprite_SageM                                .binary "units/DynSprite_SageM.4bpp.fe4"
	aBADynSprite_SageF                                .binary "units/DynSprite_SageF.4bpp.fe4"
	aBAStaSprite_SageM_Shadow                         .binary "units/StaSprite_SageM_Shadow.4bpp.fe4"
	aBADynSprite_Pegasus_Falcon                       .binary "units/DynSprite_Pegasus_Falcon.4bpp.fe4"
	aBAStaSprite_PegasusRider_Body                    .binary "units/StaSprite_PegasusRider_Body.4bpp.fe4"
	aBAStaSprite_PegKnt_FalconKnt_DracoKntF_Body      .binary "units/StaSprite_PegKnt_FalconKnt_DracoKntF_Body.4bpp.fe4"
	aBADynSprite_Dracorider                           .binary "units/DynSprite_Dracorider.4bpp.fe4"
	aBAStaSprite_DracoRiderM_DragonMaster_Body        .binary "units/StaSprite_DracoRiderM_DragonMaster_Body.4bpp.fe4"
	aBADynSprite_Dracoknight_Dragonmaster             .crossbank.start *, "units/DynSprite_Dracoknight_Dragonmaster.4bpp.fe4"

.here

* = $258000
.logical $CB0000
	.crossbank.end
.here

* = $258C2D
.logical $CB8C2D
	
	aBAStaSprite_DracoKnightM_Body                    .binary "units/StaSprite_DracoKnightM_Body.4bpp.fe4"
	aBAStaSprite_DracoRiderF_Body                     .binary "units/StaSprite_DracoRiderF_Body.4bpp.fe4"
	aBAStaSprite_Berserker_Slash                      .binary "units/StaSprite_Berserker_Slash.4bpp.fe4"
	aBADynSprite_Brigand                              .binary "units/DynSprite_Brigand.4bpp.fe4"
	aBAStaSprite_Brigand_Slash                        .binary "units/StaSprite_Brigand_Slash.4bpp.fe4"
	aBADynSprite_BrigandAlt_WarrorAxes                .binary "units/DynSprite_BrigandAlt_WarrorAxes.4bpp.fe4"
	aBAStaSprite_BrigandAlt_Warrior_Slash             .binary "units/StaSprite_BrigandAlt_Warrior_Slash.4bpp.fe4"
	aBADynSprite_WarriorBow                           .binary "units/DynSprite_WarriorBow.4bpp.fe4"
	aBAStaSprite_Warrior_Quiver                       .binary "units/StaSprite_Warrior_Quiver.4bpp.fe4"
	aBADynSprite_Hunter                               .binary "units/DynSprite_Hunter.4bpp.fe4"
	aBAStaSprite_Hunter_Quiver                        .binary "units/StaSprite_Hunter_Quiver.4bpp.fe4"
	aBADynSprite_PirateAxes                           .crossbank.start *, "units/DynSprite_PirateAxes.4bpp.fe4"

.here

* = $260000
.logical $CC0000
	.crossbank.end
.here

* = $261390
.logical $CC9390

	aBAStaSprite_FighterThrown_HeroThrown_Pirate_Slash      .binary "units/StaSprite_FighterThrown_HeroThrown_Pirate_Slash.4bpp.fe4"
	aBADynSprite_ArcherM                                    .binary "units/DynSprite_ArcherM.4bpp.fe4"
	aBAStaSprite_Infantry_Archer_Quiver                     .binary "units/StaSprite_Infantry_Archer_Quiver.4bpp.fe4"
	aBADynSprite_ArcherF_DismountedBowKnightF               .binary "units/DynSprite_ArcherF_DismountedBowKnightF.4bpp.fe4"
	aBADynSprite_MyrmidonM_DismountedSwordKnight            .binary "units/DynSprite_MyrmidonM_DismountedSwordKnight.4bpp.fe4"
	aBAStaSprite_Infantry_Melee_Slash                       .binary "units/StaSprite_Infantry_Melee_Slash.4bpp.fe4"
	aBADynSprite_MyrmidonF                                  .binary "units/DynSprite_MyrmidonF.4bpp.fe4"
	aBADynSprite_SwordmasterM                               .binary "units/DynSprite_SwordmasterM.4bpp.fe4"
	aBAStaSprite_Promoted_Infantry_Melee_Slash              .binary "units/StaSprite_Promoted_Infantry_Melee_Slash.4bpp.fe4"
	aBADynSprite_SwordmasterF                               .binary "units/DynSprite_SwordmasterF.4bpp.fe4"
	aBADynSprite_GeneralSwordAxes                           .crossbank.start *, "units/DynSprite_GeneralSwordAxes.4bpp.fe4"

.here

* = $268000
.logical $CD0000
	.crossbank.end
.here

* = $268517
.logical $CD8517

	aBADynSprite_GeneralLances                        .binary "units/DynSprite_GeneralLances.4bpp.fe4"
	aBADynSprite_GeneralBow                           .binary "units/DynSprite_GeneralBow.4bpp.fe4"
	aBAStaSprite_General_Emperor_Slashes              .binary "units/StaSprite_General_Emperor_Slashes.4bpp.fe4"
	aBADynSprite_Emperor_BaronSwordAxesStaffMagic     .binary "units/DynSprite_Emperor_BaronSwordAxesStaffMagic.4bpp.fe4"
	aBADynSprite_BaronLances                          .binary "units/DynSprite_BaronLances.4bpp.fe4"
	aBADynSprite_BaronBow                             .binary "units/DynSprite_BaronBow.4bpp.fe4"
	aBAStaSprite_Baron_Slashes                        .binary "units/StaSprite_Baron_Slashes.4bpp.fe4"
	aBADynSprite_ArmorSwordAxes                       .binary "units/DynSprite_ArmorSwordAxes.4bpp.fe4"
	aBAStaSprite_MeleeArmor_Slashes                   .binary "units/StaSprite_MeleeArmor_Slashes.4bpp.fe4"
	aBADynSprite_ArmorLances                          .crossbank.start *, "units/DynSprite_ArmorLances.4bpp.fe4"

.here

* = $270000
.logical $CE0000
	.crossbank.end
.here

* = $270646
.logical $CE8646

	aBADynSprite_ArmorBow                             .binary "units/DynSprite_ArmorBow.4bpp.fe4"
	aBAStaSprite_BowArmor_Quiver                      .binary "units/StaSprite_BowArmor_Quiver.4bpp.fe4"
	aBADynSprite_Paladin                              .binary "units/DynSprite_Paladin.4bpp.fe4"
	aBAStaSprite_Generic_PaladinM_Body                .binary "units/StaSprite_Generic_PaladinM_Body.4bpp.fe4"
	aBAStaSprite_Generic_PaladinF_Body                .binary "units/StaSprite_Generic_PaladinF_Body.4bpp.fe4"
	aBAStaSprite_UnusedCEB57C_Empty                   .binary "units/StaSprite_UnusedCEB57C_Empty.4bpp.fe4"
	aBAStaSprite_UnusedCEB583_Slashes                 .binary "units/StaSprite_UnusedCEB583_Slashes.4bpp.fe4"
	aBADynSprite_SniperM                              .binary "units/DynSprite_SniperM.4bpp.fe4"
	aBAStaSprite_Promoted_Infantry_Archer_Quiver      .binary "units/StaSprite_Promoted_Infantry_Archer_Quiver.4bpp.fe4"
	aBADynSprite_SniperF_DismountedArchKnightF        .binary "units/DynSprite_SniperF_DismountedArchKnightF.4bpp.fe4"
	aBAStaSprite_UnusedCEC624_Slashes                 .binary "units/StaSprite_UnusedCEC624_Slashes.4bpp.fe4"
	aBADynSprite_ThiefM                               .binary "units/DynSprite_ThiefM.4bpp.fe4"
	aBAStaSprite_Thief_ThiefRogue_Slash               .binary "units/StaSprite_Thief_ThiefRogue_Slash.4bpp.fe4"
	aBADynSprite_ThiefF                               .binary "units/DynSprite_ThiefF.4bpp.fe4"
	aBADynSprite_RogueM                               .binary "units/DynSprite_RogueM.4bpp.fe4"
	aBAStaSprite_Rogue_Slash                          .binary "units/StaSprite_Rogue_Slash.4bpp.fe4"
	aBADynSprite_RogueF                               .crossbank.start *, "units/DynSprite_RogueF.4bpp.fe4"

.here

* = $278000
.logical $CF0000
	.crossbank.end
.here

* = $2780DA
.logical $CF80DA

	aBADynSprite_UnusedCF80DA_ThunderMageF_Repeat     .binary "units/DynSprite_UnusedCF80DA_ThunderMageF_Repeat.4bpp.fe4"
	aBAStaSprite_UnusedCF8E98_Shadow                  .binary "units/StaSprite_UnusedCF8E98_Shadow.4bpp.fe4"
	aBADynSprite_UnusedCF8EB6_FE4Warrior              .binary "units/DynSprite_UnusedCF8EB6_FE4Warrior.4bpp.fe4"
	aBADynSprite_MeleeCavs                            .binary "units/DynSprite_MeleeCavs.4bpp.fe4"
	aBAStaSprite_Generic_MeleeCav_Body                .binary "units/StaSprite_Generic_MeleeCav_Body.4bpp.fe4"
	aBADynSprite_BowKnight                            .binary "units/DynSprite_BowKnight.4bpp.fe4"
	aBAStaSprite_Generic_SwordCav_Body                .binary "units/StaSprite_Generic_SwordCav_Body.4bpp.fe4"
	aBAStaSprite_Generic_Troubadour_Body              .binary "units/StaSprite_Generic_Troubadour_Body.4bpp.fe4"
	aBADynSprite_LordKnight_DukeKnight                .binary "units/DynSprite_LordKnight_DukeKnight.4bpp.fe4"
	aBAStaSprite_KnightLord_Generic_DukeKnight_Body   .binary "units/StaSprite_KnightLord_Generic_DukeKnight_Body.4bpp.fe4"
	aBAStaSprite_Player_Mounted_Body                  .binary "units/StaSprite_Player_Mounted_Body.4bpp.fe4"
	aBAStaSprite_ArchKnightM_Body                     .binary "units/StaSprite_ArchKnightM_Body.4bpp.fe4"
	aBAStaSprite_BowKnightM_Body                      .binary "units/StaSprite_BowKnightM_Body.4bpp.fe4"
	aBADynSprite_ArchKnight                           .crossbank.start *, "units/DynSprite_ArchKnight.4bpp.fe4"

.here

* = $280000
.logical $D00000
	.crossbank.end
.here

* = $280793
.logical $D08793

	aBADynSprite_Ranger_MasterKnight                  .binary "units/DynSprite_Ranger_MasterKnight.4bpp.fe4"
	aBAStaSprite_Generic_Ranger_Body                  .binary "units/StaSprite_Generic_Ranger_Body.4bpp.fe4"
	aBADynSprite_MageKnight                           .binary "units/DynSprite_MageKnight.4bpp.fe4"
	aBAStaSprite_Generic_MageKnight_Body              .binary "units/StaSprite_Generic_MageKnight_Body.4bpp.fe4"
	aBADynSprite_GreatKnight                          .binary "units/DynSprite_GreatKnight.4bpp.fe4"
	aBAStaSprite_Generic_GreatKnight_Body             .binary "units/StaSprite_Generic_GreatKnight_Body.4bpp.fe4"
	aBADynSprite_Ballistician_KillerBallistician_VeninBallistician         .binary "units/DynSprite_Ballistician_KillerBallistician_VeninBallistician.4bpp.fe4"
	aBAStaSprite_Ballistician_KillerBallistician_VeninBallistician_Body    .binary "units/StaSprite_Ballistician_KillerBallistician_VeninBallistician_Body.4bpp.fe4"
	aBADynSprite_IronBallistician                     .binary "units/DynSprite_IronBallistician.4bpp.fe4"
	aBAStaSprite_IronBallistician_Body                .binary "units/StaSprite_IronBallistician_Body.4bpp.fe4"

.here


* = $2B9630
.logical $D79630

	aBADynSprite_Dismounted_PegRider_DracoriderF                        .binary "units/DynSprite_Dismounted_PegRider_DracoriderF.4bpp.fe4"
	aBADynSprite_Dismounted_DracoKntF_DracoMstF_PegKnt_FalconKntSword   .binary "units/DynSprite_Dismounted_DracoKntF_DracoMstF_PegKnt_FalconKntSword.4bpp.fe4"
	aBADynSprite_FighterAxe                                             .binary "units/DynSprite_FighterAxe.4bpp.fe4"
	aBADynSprite_FighterThrownAxe                                       .binary "units/DynSprite_FighterThrownAxe.4bpp.fe4"
	aBADynSprite_HeroM_Sword                                            .binary "units/DynSprite_HeroM_Sword.4bpp.fe4"
	aBADynSprite_HeroM_Axe                                              .binary "units/DynSprite_HeroM_Axe.4bpp.fe4"
	aBADynSprite_HeroM_ThrownAxe                                        .binary "units/DynSprite_HeroM_ThrownAxe.4bpp.fe4"
	aBADynSprite_HeroF_Axe                                              .binary "units/DynSprite_HeroF_Axe.4bpp.fe4"
	aBADynSprite_HeroF_ThrownAxe                                        .binary "units/DynSprite_HeroF_ThrownAxe.4bpp.fe4"
	aBADynSprite_DismountedRanger_DismountedDracoknightM_HeroFE4M       .crossbank.start *, "units/DynSprite_DismountedRanger_DismountedDracoknightM_HeroFE4M.4bpp.fe4"

.here

* = $2C0000
.logical $D80000
	.crossbank.end
.here

* = $2C1203
.logical $D89203

	aBADynSprite_HeroFE4M_Axe                         .binary "units/DynSprite_HeroFE4M_Axe.4bpp.fe4"
	aBADynSprite_HeroFE4M_ThrownAxe                   .binary "units/DynSprite_HeroFE4M_ThrownAxe.4bpp.fe4"
	aBADynSprite_HeroF_HeroFE4F                       .binary "units/DynSprite_HeroF_HeroFE4F.4bpp.fe4"
	aBADynSprite_DismountedBowKnightM                 .binary "units/DynSprite_DismountedBowKnightM.4bpp.fe4"
	aBADynSprite_DismountedArchKnightM                .binary "units/DynSprite_DismountedArchKnightM.4bpp.fe4"
	aBADynSprite_JuniorLord_Dismounted_PromotedMeleeCavs_MasterKnightM_Dracorider_Dragonmaster		.binary "units/DynSprite_JuniorLord_Dismounted_PromotedMeleeCavs_MasterKnightM_Dracorider_Dragonmaster.4bpp.fe4"
	aBADynSprite_Dismounted_MeleeCavs                 .binary "units/DynSprite_Dismounted_MeleeCavs.4bpp.fe4"
	aBADynSprite_DismountedTroubadour_Sword           .crossbank.start *, "units/DynSprite_DismountedTroubadour_Sword.4bpp.fe4"

.here

* = $2C8000
.logical $D90000
	.crossbank.end
.here

* = $2C848A
.logical $D9848A

	aBADynSprite_DismountedTroubadour_Staff                                   .binary "units/DynSprite_DismountedTroubadour_Staff.4bpp.fe4"
	aBADynSprite_Dismounted_FalconKntStaff                                    .binary "units/DynSprite_Dismounted_FalconKntStaff.4bpp.fe4"
	aBADynSprite_ArcherEnemy                                                  .binary "units/DynSprite_ArcherEnemy.4bpp.fe4"
	aBADynSprite_Soldier                                                      .binary "units/DynSprite_Soldier.4bpp.fe4"
	aBAStaSprite_Robert_BowKnightM_Body                                       .binary "units/StaSprite_Robert_BowKnightM_Body.4bpp.fe4"
	aBAStaSprite_Robert_ArchKnightM_Body                                      .binary "units/StaSprite_Robert_ArchKnightM_Body.4bpp.fe4"
	aBAStaSprite_Generic_MageKnightF_Body                                     .binary "units/StaSprite_Generic_MageKnightF_Body.4bpp.fe4"
	aBAStaSprite_ArchKnightF_Body                                             .binary "units/StaSprite_ArchKnightF_Body.4bpp.fe4"
	aBAStaSprite_BowKnightF_Body                                              .binary "units/StaSprite_BowKnightF_Body.4bpp.fe4"
	aBAStaSprite_Dean_DracoKnight_Finn_DracoRider_Body                        .binary "units/StaSprite_Dean_DracoKnight_Finn_DracoRider_Body.4bpp.fe4"
	aBAStaSprite_BowKnightM_Alt1                                              .binary "units/StaSprite_BowKnightM_Alt1.4bpp.fe4"
	aBAStaSprite_BowKnightM_Alt2                                              .binary "units/StaSprite_BowKnightM_Alt2.4bpp.fe4"
	aBAStaSprite_Ilios_MageKnight_Body                                        .binary "units/StaSprite_Ilios_MageKnight_Body.4bpp.fe4"

.here