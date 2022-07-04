; Lists of possible opponent classes

ArenaBaseClasses 			:= [Cavalier, LanceKnight, AxeKnight, SwordKnight, Troubadour, Myrmidon, ArmoredLance, ArmoredAxe, ArmoredSword, Brigand, Pirate, Mage, LoptrianMage, ThunderMage, WindMage]
ArenaBaseRangedClasses    	:= [BowKnight, ArcherEnemy, Sniper, BowKnightF, BowKnight, ArcherEnemy, Sniper, BowKnightF, Mage, LoptrianMage, ThunderMage, WindMage]
ArenaThiefClasses         	:= [Thief, ThiefF, Dancer, Soldier, Thief, ThiefF, Dancer, Soldier, Mage, LoptrianMage, ThunderMage, WindMage]
ArenaPromotedClasses 		:= [DukeKnight, Paladin, PaladinF, Ranger, MageKnight, GreatKnight, PegasusKnight, Swordmaster, General, Baron, HighPriest, Bishop, Sage]
ArenaPromotedRangedClasses  := [Sniper, ArchKnight, ArchKnightF, HighPriest, Bishop, Sage]

ArenaNormalAutolevelScheme :?= -7
ArenaThiefAutolevelScheme  :?= -8

structArenaOpponentPool .struct Pool, AutolevelScheme
  .if (type(\Pool) == gap)
    Pool            .word <>\Pool
    AutolevelScheme .sint \AutolevelScheme
  .else
    .word <>\Pool
    .sint \AutolevelScheme
  .endif
.endstruct

; Data

aBaseArenaOpponentTypes .block ; 85/EF31
  _Normal    .structArenaOpponentPool aBaseArenaOpponentNormalPool, ArenaNormalAutolevelScheme
  _Ranged   .structArenaOpponentPool aBaseRangedArenaOpponentPool,    ArenaNormalAutolevelScheme
  _Thieflike .structArenaOpponentPool aThiefArenaOpponentPool,         ArenaThiefAutolevelScheme
.endblock

aPromotedArenaOpponentTypes .block ; 85/EF3D
  _Normal    .structArenaOpponentPool aPromotedArenaOpponentNormalPool, ArenaNormalAutolevelScheme
  _Ranged   .structArenaOpponentPool aPromotedRangedArenaOpponentPool,    ArenaNormalAutolevelScheme
  _Thieflike .structArenaOpponentPool aThiefArenaOpponentPool,         ArenaNormalAutolevelScheme
.endblock

aBaseArenaOpponentNormalPool 		.byte ArenaBaseClasses, 0 			; 85/EF49
aBaseRangedArenaOpponentPool    	.byte ArenaBaseRangedClasses, 0    	; 85/EF59
aThiefArenaOpponentPool         	.byte ArenaThiefClasses, 0         	; 85/EF66

aPromotedArenaOpponentNormalPool	.byte ArenaPromotedClasses, 0 		; 85/EF73
aPromotedRangedArenaOpponentPool	.byte ArenaPromotedRangedClasses, 0 ; 85/EF81