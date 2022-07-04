; Faction name pointers

* = $47E700
.logical lorom($47E700, 1)

leader_sets				.block

.word $0001
.word <>leader_text._LeifLeader

.word $00ED
.word <>leader_text._LeonsterLeader

.word $0019
.word <>leader_text._LeonsterLeader

.word $0033
.word <>leader_text._RaydrikLeader	;formerly "Raydrik": a big unnamed mishmash

.word $005B
.word <>leader_text._MysteryLeader	;formerly "Lemay": an unnamed mishmash

.word $0022
.word <>leader_text._TahraLeader	;formerly "Dean": unnamed

.word $003D
.word <>leader_text._MansterLeader

.word $0055
.word <>leader_text._MansterLeader

.word $00B7
.word <>leader_text._MansterLeader

.word $00B9
.word <>leader_text._MansterLeader

.word $0090
.word <>leader_text._MansterLeader

.word $0143
.word <>leader_text._MansterLeader

.word $0056
.word <>leader_text._ThraciaLeader

.word $005D
.word <>leader_text._ThraciaLeader

.word $0072
.word <>leader_text._ThraciaLeader

.word $008B
.word <>leader_text._ThraciaLeader

.word $0091
.word <>leader_text._ThraciaLeader

.word $00C3
.word <>leader_text._ThraciaLeader

.word $0073
.word <>leader_text._ThraciaLeader

.word $0046
.word <>leader_text._CiviliansLeader	;formerly "Ishtar": unnamed

.word $001E
.word <>leader_text._FriegeLeader

.word $0086
.word <>leader_text._Friege2ndLeader

.word $0080
.word <>leader_text._Friege3rdLeader

.word $0102
.word <>leader_text._Friege4thLeader

.word $0156
.word <>leader_text._Friege4thLeader

.word $006D
.word <>leader_text._Friege5thLeader

.word $007E
.word <>leader_text._Friege7thLeader

.word $006E
.word <>leader_text._Friege8thLeader

.word $002D
.word <>leader_text._Friege10thLeader

.word $0066
.word <>leader_text._Friege12thLeader

.word $0067
.word <>leader_text._Friege12thLeader

.word $00D4
.word <>leader_text._Friege15thLeader

.word $0084
.word <>leader_text._Friege16thLeader

.word $00A3
.word <>leader_text._Friege17thLeader

.word $006C
.word <>leader_text._Friege20thLeader

.word $0063
.word <>leader_text._Friege22ndLeader

.word $008D
.word <>leader_text._Friege26thLeader

.word $008C
.word <>leader_text._Friege27thLeader

.word $008A
.word <>leader_text._Friege30thLeader

.word $0082
.word <>leader_text._GelbenritterLeader

.word $002E
.word <>leader_text._UlsterLeader

.word $0035
.word <>leader_text._WelkenrosenLeader

.word $0074
.word <>leader_text._WelkenrosenLeader

.word $0081
.word <>leader_text._WelkenrosenLeader

.word $0083
.word <>leader_text._WelkenrosenLeader

.word $008E
.word <>leader_text._WelkenrosenLeader

.word $00B8
.word <>leader_text._WelkenrosenLeader

.word $0020
.word <>leader_text._LifisCrewLeader

.word $0038
.word <>leader_text._LifisCrewLeader

.word $0039
.word <>leader_text._LifisCrewLeader

.word $001F
.word <>leader_text._MagiSquadLeader

.word $0045
.word <>leader_text._MagiSquadLeader

.word $005C
.word <>leader_text._BanditLeader

.word $00D0
.word <>leader_text._BanditLeader

.word $0049
.word <>leader_text._ResistanceLeader

.word $0027
.word <>leader_text._MischaLeader

.word $006B
.word <>leader_text._KolkhoLeader

.word $0018
.word <>leader_text._DandelionLeader

.word $0017
.word <>leader_text._MercenaryLeader

.word $00E0
.word <>leader_text._MischaLeader

.word $0007
.word <>leader_text._MercenaryLeader

.word $0000

.bend
.here

;	Factions character limit: 16

* = $47E7F6
.logical lorom($47E7F6, 1)

leader_text				.block

_LeifLeader
	.text "Leif's Ar[my"
.word $0000

_NoneLeader
	.text "{-}{-}{-}{-}{-}{-}"
.word $0000

_LeonsterLeader
	.text "Leonster34Ar[my "
.word $0000

_RaydrikLeader
	.text "Raydrik's Unit"
.word $0000

_MysteryLeader
	.text "Unkno]wn Party"
.word $0000

_TahraLeader
	.text "Tahra's Ar[my "
.word $0000

_MansterLeader
	.text "(Munster34Ar[my "
.word $0000

_ThraciaLeader
	.text "Thracia's Ar[my "
.word $0000

_CiviliansLeader
	.text "Civilians "
.word $0000

_FriegeLeader
	.text "Friege's Ar[my"
.word $0000

_Friege2ndLeader
	.text "{2}{nd} Division "
.word $0000

_Friege3rdLeader
	.text "{3}{rd} Division "
.word $0000

_Friege4thLeader
	.text "{4}{th} Division "
.word $0000

_Friege5thLeader
	.text "{5}{th} Division "
.word $0000

_Friege7thLeader
	.text "{7}{th} Division "
.word $0000

_Friege8thLeader
	.text "{8}{th} Division "
.word $0000

_Friege10thLeader
	.text "{1}{0}{th} Division "
.word $0000

_Friege12thLeader
	.text "{1}{2}{th} Division "
.word $0000

_Friege15thLeader
	.text "{1}{5}{th} Division "
.word $0000

_Friege16thLeader
	.text "{1}{6}{th} Division "
.word $0000

_Friege17thLeader
	.text "{1}{7}{th} Division "
.word $0000

_Friege20thLeader
	.text "{2}{0}{th} Division "
.word $0000

_Friege22ndLeader
	.text "{2}{2}{nd} Division "
.word $0000

_Friege26thLeader
	.text "{2}{6}{th} Division "
.word $0000

_Friege27thLeader
	.text "{2}{7}{th} Division "
.word $0000

_Friege30thLeader
	.text "{3}{0}{th} Division "
.word $0000

_GelbenritterLeader
	.text "Gelbenritter"
.word $0000

_UlsterLeader
	.text "Ulster's Ar[my"
.word $0000

_WelkenrosenLeader
	.text ")Welkenrosen"
.word $0000

_LifisCrewLeader
	.text "Lifis Pirates "
.word $0000

_MagiSquadLeader
	.text "(Magi Squad "
.word $0000

_BanditLeader
	.text "Bandits "
.word $0000

_ResistanceLeader
	.text "Resistance"
.word $0000

_MischaLeader
	.text "Pegasus Corps "
.word $0000

_KolkhoLeader
	.text "Colho's Boys"
.word $0000

_DandelionLeader
	.text "Dandelion "
.word $0000

_MercenaryLeader
	.text "Sells]words "
.word $0000

.bend
.here
