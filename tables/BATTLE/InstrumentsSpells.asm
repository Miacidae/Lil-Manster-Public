InstrumentsStaves 			= $05
InstrumentsBows				= $07
InstrumentsFires			= $09
InstrumentsMeteor			= $0B
InstrumentsThunders			= $0D
InstrumentsThoron			= $0F
InstrumentsWindGraf			= $11
InstrumentsTornado			= $13
InstrumentsForseti			= $15
InstrumentsBlizzard			= $17
InstrumentsLight		    = $19
InstrumentsNosferatu	    = $1B
InstrumentsJormungandr	    = $1D
InstrumentsFenrirs		    = $1F
InstrumentsHel			    = $21
InstrumentsRestore		    = $23
InstrumentsSilence		    = $25

; Left sounds table
.byte $00               		; NoneItem
					    
; Swords                
.byte $00               		; IronSword
.byte $00               		; SteelSword
.byte $00               		; SilverSword
.byte $00               		; SlimSword			STFire
.byte $00            			; IronBlade			STWind
.byte $00               		; KillingEdge
.byte $00               		; VeninEdge
.byte $00               		; BerserkEdge
.byte $00               		; SleepEdge
.byte $00               		; BeoBlade			STNosferatu
.byte $00               		; BlessedSword
.byte InstrumentsJormungandr	; LoptrianFang		STFire
.byte $00               		; BragisBlade
.byte InstrumentsLight			; LightBrand		STJormungandr
.byte $00               		; BraveSword
.byte $00               		; Kingmaker			STMeteor
.byte InstrumentsNosferatu   	; EarthSword		STNosferatu
.byte InstrumentsWindGraf    	; WindSword			STForseti
.byte InstrumentsFires       	; FlameSword		STFire
.byte InstrumentsThunders    	; LightningSword	STThunder
.byte $00               		; ParagonSword
.byte $00               		; Armorslayer
.byte $00               		; Rapier
.byte $00               		; Shortsword
.byte $00               		; Longsword
.byte $00               		; Greatsword
.byte $00               		; MasterSword
.byte $00               		; ShadowSword		STFire
.byte $00               		; MareetasSword
.byte $00               		; BrokenSword		STJormungandr

; Lances
.byte $00               		; IronLance
.byte $00               		; SteelLance
.byte $00               		; SilverLance
.byte $00               		; SlimLance
.byte $00               		; VeninLance
.byte $00               		; Dragonpike
.byte $00               		; ShadowSpear
.byte $00               		; BraveLance
.byte $00               		; ShortLance
.byte $00               		; LongLance
.byte $00               		; Greatlance
.byte $00               		; Javelin
.byte $00               		; MasterLance
.byte $00               		; Ridersbane
.byte $00               		; KillerLance
.byte $00               		; GaeBolg
.byte $00               		; Gungnir
.byte $00               		; BrokenLance
					    
; Axes                  
.byte $00              			; IronAxe
.byte $00               		; VeninAxe			STThoron
.byte $00               		; SteelAxe
.byte $00               		; SilverAxe
.byte $00               		; HandAxe
.byte $00               		; Hammer
.byte $00               		; KillerAxe
.byte $00               		; Vouge
.byte $00               		; BraveAxe
.byte $00               		; DevilAxe
.byte $00               		; BattleAxe
.byte $00               		; Poleax
.byte $00               		; MasterAxe
.byte $00               		; BrokenAxe
					    
; Bows                  
.byte InstrumentsBows        	; IronBow
.byte InstrumentsBows        	; SteelBow
.byte InstrumentsBows        	; SilverBow
.byte InstrumentsBows        	; VeninBow
.byte InstrumentsBows        	; KillerBow
.byte InstrumentsBows        	; BraveBow
.byte InstrumentsBows        	; Shortbow
.byte InstrumentsBows        	; Longbow
.byte InstrumentsBows        	; Greatbow
.byte InstrumentsBows        	; MasterBow
.byte InstrumentsBows        	; Ballista
.byte InstrumentsBows        	; IronBallista		STMeteor
.byte InstrumentsBows        	; KillerBallista	STFire
.byte InstrumentsBows        	; VeninBallista		STMeteor
.byte InstrumentsBows        	; BrokenBow			STMeteor
					    
; Fire                  
.byte InstrumentsFires       	; Fire				STFire
.byte InstrumentsFires       	; Elfire			STFire
.byte InstrumentsFires       	; Bolganone			STMeteor		vanilla:00
.byte InstrumentsFires       	; Valflame			STFire			vanilla:00
					    
; Thunder               
.byte InstrumentsThunders     	; Thunder			STThunder
.byte InstrumentsThunders     	; DireThunder		STThunder
.byte InstrumentsThoron       	; Thoron			STThoron
.byte InstrumentsThoron       	; Mjolnir			STThoron		vanilla:00
							
; Wind                  	
.byte InstrumentsWindGraf     	; Wind				STWind
.byte InstrumentsWindGraf     	; Grafcalibur		STWind
.byte InstrumentsTornado      	; Tornado			STTornado
.byte InstrumentsForseti      	; Forseti			STForseti
					    
; Light                 
.byte InstrumentsLight       	; Light				STLight
.byte InstrumentsNosferatu   	; Nosferatu			STNosferatu
.byte InstrumentsLight       	; Aura				STJormungandr	vanilla:00
					    
; Dark                  
.byte InstrumentsJormungandr 	; Jormungandr		STJormungandr
.byte InstrumentsFenrirs     	; Fenrir			STFenrirs
.byte InstrumentsHel         	; Hel				STJormungandr
.byte InstrumentsForseti	   	; Loptous			STFire			vanilla:00
					    
; Siege magic           
.byte InstrumentsMeteor      	; Meteor			STMeteor
.byte InstrumentsThunders    	; Bolting			STThunder
.byte InstrumentsBlizzard    	; Blizzard			STBlizzard
.byte InstrumentsFenrirs     	; Venin				STFire
.byte InstrumentsFenrirs     	; Petrify			STFenrirs
					    
; Forseti2              
.byte InstrumentsForseti     	; ForsetiInfinite	STThoron
					    
; Broken tome           
.byte InstrumentsStaves      	; BrokenTome		STFire
					    
; Staves                
.byte InstrumentsStaves      	; Heal				STStaves
.byte InstrumentsStaves      	; Mend				STStaves
.byte InstrumentsStaves      	; Recover			STStaves
.byte InstrumentsStaves      	; Physic			STStaves
.byte InstrumentsStaves      	; Fortify			STStaves
.byte $00               		; Rescue
.byte $00               		; Warp
.byte InstrumentsRestore     	; Restore			STRestore
.byte InstrumentsSilence		; Silence			STSilence
.byte InstrumentsStaves      	; Sleep				STStaves
.byte InstrumentsStaves      	; TorchStaff		STStaves
.byte $00               		; ReturnStaff
.byte InstrumentsStaves      	; Hammerne			STStaves
.byte InstrumentsStaves      	; ThiefStaff		STStaves
.byte InstrumentsStaves      	; Watch
.byte InstrumentsStaves      	; Berserk			STStaves
.byte InstrumentsStaves      	; Unlock			STStaves
.byte InstrumentsStaves      	; Ensorcel			STStaves
.byte $00               		; Rewarp
.byte InstrumentsRestore      	; Kia				STStaves
.byte InstrumentsStaves      	; BrokenStaff		STFire
					    
; Items                 
.byte $00               		; LuckRing
.byte $00               		; LifeRing
.byte $00               		; SpeedRing
.byte $00               		; MagicRing
.byte $00               		; StrengthRing
.byte $00               		; BodyRing
.byte $00               		; ShieldRing
.byte $00               		; SkillRing
.byte $00               		; LegRing
.byte $00               		; MasterSeal
.byte $00               		; MasterCrown
.byte $00               		; ChestKey
.byte $00               		; DoorKey
.byte $00               		; BridgeKey
.byte $00               		; Lockpick
.byte $00               		; StaminaDrink
.byte $00               		; Vulnerary
.byte $00               		; PureWater
.byte $00               		; Torch
.byte $00               		; Antitoxin
.byte $00               		; MemberCard
.byte $00               		; OdsScroll
.byte $00               		; BaldrsScroll
.byte $00               		; HezulsScroll
.byte $00               		; DainnsScroll
.byte $00               		; NjorunsScroll
.byte $00               		; NalsScroll
.byte $00               		; UllursScroll
.byte $00               		; ThrudsScroll
.byte $00               		; FjalarsScroll
.byte $00               		; CedsScroll
.byte $00               		; BragisScroll
.byte $00               		; HeimsScroll
.byte $00               		; ParagonManual
.byte $00               		; AccostManual
.byte $00               		; BargainManual
.byte $00               		; VantageManual
.byte $00               		; WrathManual
.byte $00               		; AdeptManual
.byte $00               		; MiracleManual
.byte $00               		; NihilManual
.byte $00               		; SolManual
.byte $00               		; LunaManual

.word $0000

; Right sounds table
.byte $00               		; NoneItem
					    
; Swords                
.byte $00               		; IronSword
.byte $00               		; SteelSword
.byte $00               		; SilverSword
.byte $00               		; SlimSword
.byte $00               		; IronBlade
.byte $00               		; KillingEdge
.byte $00               		; VeninEdge
.byte $00               		; BerserkEdge
.byte $00               		; SleepEdge
.byte $00               		; BeoBlade
.byte $00               		; BlessedSword
.byte InstrumentsJormungandr+1	; LoptrianFang
.byte $00               		; BragisBlade
.byte InstrumentsLight+1     	; LightBrand
.byte $00               		; BraveSword
.byte $00               		; Kingmaker
.byte InstrumentsNosferatu+1 	; EarthSword
.byte InstrumentsWindGraf+1  	; WindSword
.byte InstrumentsFires+1     	; FlameSword
.byte InstrumentsThunders+1  	; LightningSword
.byte $00               		; ParagonSword
.byte $00               		; Armorslayer
.byte $00               		; Rapier
.byte $00               		; Shortsword
.byte $00               		; Longsword
.byte $00               		; Greatsword
.byte $00               		; MasterSword
.byte $00               		; ShadowSword
.byte $00               		; MareetasSword
.byte $00               		; BrokenSword

; Lances
.byte $00               		; IronLance
.byte $00               		; SteelLance
.byte $00               		; SilverLance
.byte $00               		; SlimLance
.byte $00               		; VeninLance
.byte $00               		; Dragonpike
.byte $00               		; ShadowSpear
.byte $00               		; BraveLance
.byte $00               		; ShortLance
.byte $00               		; LongLance
.byte $00               		; Greatlance
.byte $00               		; Javelin
.byte $00               		; MasterLance
.byte $00               		; Ridersbane
.byte $00               		; KillerLance
.byte $00               		; GaeBolg
.byte $00               		; Gungnir
.byte $00               		; BrokenLance
					    
; Axes                  
.byte $00               		; IronAxe
.byte $00               		; VeninAxe
.byte $00               		; SteelAxe
.byte $00               		; SilverAxe
.byte $00               		; HandAxe
.byte $00               		; Hammer
.byte $00               		; KillerAxe
.byte $00               		; Vouge
.byte $00               		; BraveAxe
.byte $00               		; DevilAxe
.byte $00               		; BattleAxe
.byte $00               		; Poleax
.byte $00               		; MasterAxe
.byte $00               		; BrokenAxe
					    
; Bows                  
.byte InstrumentsBows +1     	; IronBow
.byte InstrumentsBows +1     	; SteelBow
.byte InstrumentsBows +1     	; SilverBow
.byte InstrumentsBows +1     	; VeninBow
.byte InstrumentsBows +1     	; KillerBow
.byte InstrumentsBows +1     	; BraveBow
.byte InstrumentsBows +1     	; Shortbow
.byte InstrumentsBows +1     	; Longbow
.byte InstrumentsBows +1     	; Greatbow
.byte InstrumentsBows +1     	; MasterBow
.byte InstrumentsBows +1     	; Ballista
.byte InstrumentsBows +1     	; IronBallista
.byte InstrumentsBows +1     	; KillerBallista
.byte InstrumentsBows +1     	; VeninBallista
.byte InstrumentsBows +1     	; BrokenBow
					    
; Fire                  
.byte InstrumentsFires+1     	; Fire
.byte InstrumentsFires+1     	; Elfire
.byte InstrumentsFires+1     	; Bolganone		vanilla:00
.byte InstrumentsFires+1     	; Valflame		vanilla:00
					    
; Thunder               
.byte InstrumentsThunders+1  	; Thunder
.byte InstrumentsThunders+1  	; DireThunder
.byte InstrumentsThoron+1    	; Thoron
.byte InstrumentsThoron+1    	; Mjolnir		vanilla:00
					    
; Wind                  
.byte InstrumentsWindGraf+1  	; Wind
.byte InstrumentsWindGraf+1  	; Grafcalibur
.byte InstrumentsTornado+1   	; Tornado
.byte InstrumentsForseti+1   	; Forseti
					    
; Light                 
.byte InstrumentsLight+1     	; Light
.byte InstrumentsNosferatu+1 	; Nosferatu
.byte InstrumentsLight+1     	; Aura			vanilla:00
					    
; Dark                  
.byte InstrumentsJormungandr+1 	; Jormungandr
.byte InstrumentsFenrirs+1   	; Fenrir
.byte InstrumentsHel+1       	; Hel
.byte InstrumentsForseti+1  ; Loptous		vanilla:00
					    
; Siege magic           
.byte InstrumentsMeteor+1    	; Meteor
.byte InstrumentsThunders+1  	; Bolting
.byte InstrumentsBlizzard+1  	; Blizzard
.byte InstrumentsFenrirs+1   	; Venin			vanilla:00
.byte InstrumentsFenrirs+1   	; Petrify		vanilla:00
					    
; Forseti2              
.byte InstrumentsForseti+1   	; ForsetiInfinite
					    
; Broken tome           
.byte InstrumentsStaves+1    	; BrokenTome
					    
; Staves                
.byte InstrumentsStaves+1    	; Heal
.byte InstrumentsStaves+1    	; Mend
.byte InstrumentsStaves+1    	; Recover
.byte InstrumentsStaves+1    	; Physic
.byte InstrumentsStaves+1    	; Fortify
.byte $00               		; Rescue
.byte $00               		; Warp
.byte InstrumentsRestore+1   	; Restore
.byte InstrumentsSilence+1		; Silence
.byte InstrumentsStaves+1    	; Sleep
.byte InstrumentsStaves+1    	; TorchStaff
.byte $00               		; ReturnStaff
.byte InstrumentsStaves+1    	; Hammerne
.byte InstrumentsStaves+1    	; ThiefStaff
.byte InstrumentsStaves+1    	; Watch
.byte InstrumentsStaves+1    	; Berserk
.byte InstrumentsStaves+1    	; Unlock
.byte InstrumentsStaves+1    	; Ensorcel
.byte $00               		; Rewarp
.byte InstrumentsRestore+1    	; Kia
.byte InstrumentsStaves+1    	; BrokenStaff
					    
; Items                 
.byte $00               		; LuckRing
.byte $00               		; LifeRing
.byte $00               		; SpeedRing
.byte $00               		; MagicRing
.byte $00               		; StrengthRing
.byte $00               		; BodyRing
.byte $00               		; ShieldRing
.byte $00               		; SkillRing
.byte $00               		; LegRing
.byte $00               		; MasterSeal
.byte $00               		; MasterCrown
.byte $00               		; ChestKey
.byte $00               		; DoorKey
.byte $00               		; BridgeKey
.byte $00               		; Lockpick
.byte $00               		; StaminaDrink
.byte $00               		; Vulnerary
.byte $00               		; PureWater
.byte $00               		; Torch
.byte $00               		; Antitoxin
.byte $00               		; MemberCard
.byte $00               		; OdsScroll
.byte $00               		; BaldrsScroll
.byte $00               		; HezulsScroll
.byte $00               		; DainnsScroll
.byte $00               		; NjorunsScroll
.byte $00               		; NalsScroll
.byte $00               		; UllursScroll
.byte $00               		; ThrudsScroll
.byte $00               		; FjalarsScroll
.byte $00               		; CedsScroll
.byte $00               		; BragisScroll
.byte $00               		; HeimsScroll
.byte $00               		; ParagonManual
.byte $00               		; AccostManual
.byte $00               		; BargainManual
.byte $00               		; VantageManual
.byte $00               		; WrathManual
.byte $00               		; AdeptManual
.byte $00               		; MiracleManual
.byte $00               		; NihilManual
.byte $00               		; SolManual
.byte $00               		; LunaManual

.word $0000