      aBattleAnimationShieldClassTable .block
        _BAShield_Cavalier              .structBattleAnimationShieldDefinitionEntry Cavalier,           	(aBattleAnimationShieldClassTable._CavalierShields - aBattleAnimationShieldClassTable)
        _BAShield_LanceKnight           .structBattleAnimationShieldDefinitionEntry LanceKnight,         	(aBattleAnimationShieldClassTable._LanceKnightShields - aBattleAnimationShieldClassTable)
        _BAShield_AxeKnight             .structBattleAnimationShieldDefinitionEntry AxeKnight,        		(aBattleAnimationShieldClassTable._AxeKnightShields - aBattleAnimationShieldClassTable)
        _BAShield_SwordKnight           .structBattleAnimationShieldDefinitionEntry SwordKnight,        	(aBattleAnimationShieldClassTable._SwordKnightShields - aBattleAnimationShieldClassTable)
        _BAShield_Troubadour            .structBattleAnimationShieldDefinitionEntry Troubadour,          	(aBattleAnimationShieldClassTable._TroubadourShields - aBattleAnimationShieldClassTable)
        _BAShield_KnightLord            .structBattleAnimationShieldDefinitionEntry KnightLord,          	(aBattleAnimationShieldClassTable._KnightLordShields - aBattleAnimationShieldClassTable)
        _BAShield_DukeKnight            .structBattleAnimationShieldDefinitionEntry DukeKnight,          	(aBattleAnimationShieldClassTable._DukeKnightShields - aBattleAnimationShieldClassTable)
        _BAShield_MasterKnight          .structBattleAnimationShieldDefinitionEntry MasterKnight,        	(aBattleAnimationShieldClassTable._MasterKnightShields - aBattleAnimationShieldClassTable)
        _BAShield_Paladin               .structBattleAnimationShieldDefinitionEntry Paladin,         		(aBattleAnimationShieldClassTable._PaladinShields - aBattleAnimationShieldClassTable)
        _BAShield_PaladinF              .structBattleAnimationShieldDefinitionEntry PaladinF,        		(aBattleAnimationShieldClassTable._PaladinShields - aBattleAnimationShieldClassTable)
        _BAShield_Ranger                .structBattleAnimationShieldDefinitionEntry Ranger,            		(aBattleAnimationShieldClassTable._RangerShields - aBattleAnimationShieldClassTable)
        _BAShield_MageKnightF           .structBattleAnimationShieldDefinitionEntry MageKnightF,       		(aBattleAnimationShieldClassTable._MageKnightShields - aBattleAnimationShieldClassTable)
        _BAShield_MageKnight            .structBattleAnimationShieldDefinitionEntry MageKnight,       		(aBattleAnimationShieldClassTable._MageKnightShields - aBattleAnimationShieldClassTable)
        _BAShield_GreatKnight           .structBattleAnimationShieldDefinitionEntry GreatKnight,        	(aBattleAnimationShieldClassTable._GreatKnightShields - aBattleAnimationShieldClassTable)
        _BAShield_General               .structBattleAnimationShieldDefinitionEntry General,            	(aBattleAnimationShieldClassTable._GeneralShields - aBattleAnimationShieldClassTable)
        _BAShield_Emperor               .structBattleAnimationShieldDefinitionEntry Emperor,           		(aBattleAnimationShieldClassTable._EmperorShields - aBattleAnimationShieldClassTable)
        _BAShield_Baron                 .structBattleAnimationShieldDefinitionEntry Baron,         			(aBattleAnimationShieldClassTable._BaronShields - aBattleAnimationShieldClassTable)
        _BAShield_ArmoredLance          .structBattleAnimationShieldDefinitionEntry ArmoredLance,        	(aBattleAnimationShieldClassTable._ArmoredLanceShields - aBattleAnimationShieldClassTable)
        _BAShield_ArmoredAxe            .structBattleAnimationShieldDefinitionEntry ArmoredAxe,         	(aBattleAnimationShieldClassTable._ArmoredAxeShields - aBattleAnimationShieldClassTable)
        _BAShield_ArmoredSword          .structBattleAnimationShieldDefinitionEntry ArmoredSword,      		(aBattleAnimationShieldClassTable._ArmoredSwordShields - aBattleAnimationShieldClassTable)
        _BAShield_Soldier               .structBattleAnimationShieldDefinitionEntry Soldier,        		(aBattleAnimationShieldClassTable._SoldierShields - aBattleAnimationShieldClassTable)
        _BAShield_PegasusKnight         .structBattleAnimationShieldDefinitionEntry PegasusKnight,       	-1
        _BAShield_FalconKnight          .structBattleAnimationShieldDefinitionEntry FalconKnight,        	-1
        _BAShield_Dracorider            .structBattleAnimationShieldDefinitionEntry Dracorider,				-1
        _BAShield_Dracoknight           .structBattleAnimationShieldDefinitionEntry Dracoknight,			-1
        _BAShield_DracoriderF           .structBattleAnimationShieldDefinitionEntry DracoriderF,			-1
        _BAShield_DracoknightF          .structBattleAnimationShieldDefinitionEntry DracoknightF,  			-1
        _BAShield_Ballistician          .structBattleAnimationShieldDefinitionEntry Ballistician,			-1
        _BAShield_IronBallistician      .structBattleAnimationShieldDefinitionEntry IronBallistician,		-1
        _BAShield_KillerBallistician    .structBattleAnimationShieldDefinitionEntry KillerBallistician,		-1
        _BAShield_VeninBallistician	  .structBattleAnimationShieldDefinitionEntry VeninBallistician,		-1
		
        .sint -1

		_CavalierShields .block
		  .structBattleAnimationShieldEntry	Callion,	Shield_Cavalier,	BA_ShieldPalette_BaseCallion
		  .structBattleAnimationShieldEntry	-1,			Shield_Cavalier,	BA_ShieldPalette_Cavalier_Troubadour_AxeKnight
        .endblock

        _TroubadourShields .block
          .structBattleAnimationShieldEntry	Nanna,		Shield_Troubadour,	BA_ShieldPalette_BaseNanna
		  .structBattleAnimationShieldEntry	-1,			Shield_Troubadour,	BA_ShieldPalette_Cavalier_Troubadour_AxeKnight
        .endblock

        _PaladinShields .block
          .structBattleAnimationShieldEntry	Nanna,		Shield_Paladin,		BA_ShieldPalette_PromotedNanna
		  .structBattleAnimationShieldEntry	Callion,	Shield_Paladin,		BA_ShieldPalette_PromotedCallion
		  .structBattleAnimationShieldEntry	Fred,		Shield_Paladin,		BA_ShieldPalette_Fred
		  .structBattleAnimationShieldEntry	Amalda,		Shield_Paladin,		BA_ShieldPalette_Amalda
		  .structBattleAnimationShieldEntry	Conomor,	Shield_Paladin,		BA_ShieldPalette_Conomor
		  .structBattleAnimationShieldEntry	-1,			Shield_Paladin,		BA_ShieldPalette_Paladin
        .endblock

        _LanceKnightShields .block
          .structBattleAnimationShieldEntry	Finn,		Shield_LanceKnight,	BA_ShieldPalette_BaseFinn
		  .structBattleAnimationShieldEntry	Kane,		Shield_LanceKnight,	BA_ShieldPalette_Kane
		  .structBattleAnimationShieldEntry	Alba,		Shield_LanceKnight,	BA_ShieldPalette_BaseAlba
		  .structBattleAnimationShieldEntry	-1,			Shield_LanceKnight,	BA_ShieldPalette_LanceKnight
        .endblock

        _DukeKnightShields .block
          .structBattleAnimationShieldEntry	Finn,		Shield_DukeKnight,	BA_ShieldPalette_PromotedFinn
		  .structBattleAnimationShieldEntry	Glade,		Shield_DukeKnight,	BA_ShieldPalette_Glade
		  .structBattleAnimationShieldEntry	Kane,		Shield_DukeKnight,	BA_ShieldPalette_Kane
		  .structBattleAnimationShieldEntry	Alba,		Shield_DukeKnight,	BA_ShieldPalette_PromotedAlba
		  .structBattleAnimationShieldEntry	-1,			Shield_DukeKnight,	BA_ShieldPalette_DukeKnight
        .endblock

        _AxeKnightShields .block
          .structBattleAnimationShieldEntry	Brighton,	Shield_AxeKnight,	BA_ShieldPalette_Brighton
		  .structBattleAnimationShieldEntry	-1,			Shield_AxeKnight,	BA_ShieldPalette_Cavalier_Troubadour_AxeKnight
        .endblock

        _GreatKnightShields .block
          .structBattleAnimationShieldEntry	Brighton,	Shield_GreatKnight,	BA_ShieldPalette_Brighton
		  .structBattleAnimationShieldEntry	Hicks,		Shield_GreatKnight,	BA_ShieldPalette_PromotedHicks
		  .structBattleAnimationShieldEntry	-1,			Shield_GreatKnight,	BA_ShieldPalette_GreatKnight
        .endblock

        _SwordKnightShields .block
          .structBattleAnimationShieldEntry	Fergus,		Shield_SwordKnight_Ranger,	BA_ShieldPalette_BaseFergus
		  .structBattleAnimationShieldEntry	-1,			Shield_SwordKnight_Ranger,	BA_ShieldPalette_SwordKnight_Ranger
        .endblock

        _RangerShields .block
          .structBattleAnimationShieldEntry	Fergus,		Shield_SwordKnight_Ranger,	BA_ShieldPalette_PromotedFergus
		  .structBattleAnimationShieldEntry	Diarmuid,	Shield_SwordKnight_Ranger,	BA_ShieldPalette_SwordKnight_Ranger
		  .structBattleAnimationShieldEntry	-1,			Shield_SwordKnight_Ranger,	BA_ShieldPalette_SwordKnight_Ranger
        .endblock

        _MageKnightShields .block
          .structBattleAnimationShieldEntry	Olwen,		Shield_MageKnight,	BA_ShieldPalette_Olwen
		  .structBattleAnimationShieldEntry	-1,			Shield_MageKnight,	BA_ShieldPalette_MageKnight
        .endblock

        _KnightLordShields .block
          .structBattleAnimationShieldEntry	-1,			Shield_KnightLord,	BA_ShieldPalette_KnightLord
        .endblock

        _MasterKnightShields .block
          .structBattleAnimationShieldEntry	-1,			Shield_MasterKnight, BA_ShieldPalette_MasterKnight
        .endblock

        _ArmoredLanceShields .block
		  .structBattleAnimationShieldEntry	Dalsin,		Shield_Armors,		BA_ShieldPalette_Dalsin		  
		  .structBattleAnimationShieldEntry	-1,			Shield_Armors,		BA_ShieldPalette_Armors
        .endblock

        _GeneralShields .block
          .structBattleAnimationShieldEntry	Dalsin,		Shield_General,		BA_ShieldPalette_Dalsin		  
		  .structBattleAnimationShieldEntry	-1,			Shield_General,		BA_ShieldPalette_General
        .endblock

        _ArmoredAxeShields .block
          .structBattleAnimationShieldEntry	-1, 		Shield_Armors,		BA_ShieldPalette_Armors
        .endblock

        _ArmoredSwordShields .block
          .structBattleAnimationShieldEntry	-1,			Shield_Armors,		BA_ShieldPalette_Armors
        .endblock

        _BaronShields .block
          .structBattleAnimationShieldEntry	-1,			Shield_Baron,		BA_ShieldPalette_Baron_Emperor
        .endblock

        _SoldierShields .block
          .structBattleAnimationShieldEntry	-1,			Shield_Soldier,		BA_ShieldPalette_Soldier
        .endblock

        _EmperorShields .block
          .structBattleAnimationShieldEntry	-1,			Shield_Emperor,		BA_ShieldPalette_Baron_Emperor
        .endblock
		
		_UnknownShields .block
          .structBattleAnimationShieldEntry	-1,			Shield_Armors,		BA_ShieldPalette_BaseCallion
        .endblock

      .endblock