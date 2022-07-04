;	Weapon descriptions character limit: 20
;	Weapon descriptions line limit: 4 (5 for staves)

* = $181A7A
.logical lorom($181A7A, 1)

item_descs		.block

_NoneDesc
.word $0000
.word $0000

; Common weapons

_IronSwordDesc
.text "Co{mm}non, quality"
.word $0000
.text "s]word"
.word $0000
.word $0000

_SteelSwordDesc
.text "Strong, quality "
.word $0000
.text "s]word"
.word $0000
.word $0000

_SilverSwordDesc
.text "Rare, quality s]word"
.word $0000
.word $0000

_ShortswordDesc
.text "Co{mm}non, s{im}ple "
.word $0000
.text "s]word"
.word $0000
.word $0000

_LongswordDesc
.text "Strong, si[mple "
.word $0000
.text "s]word"
.word $0000
.word $0000

_GreatswordDesc
.text "(Massive, si[mple "
.word $0000
.text "s]word"
.word $0000
.word $0000

_IronBladeDesc
.text "Deadly s]word, but"
.word $0000
.text "difficult to ]wield "
.word $0000
.word $0000


_SlimSwordDesc
_SlimLanceDesc
.text "Light]weight and"
.word $0000
.text "si[mple to hit ]with"
.word $0000
.word $0000


_IronLanceDesc
.text "Co{mm}non, quality"
.word $0000
.text "lance "
.word $0000
.word $0000

_SteelLanceDesc
.text "Strong, quality "
.word $0000
.text "lance "
.word $0000
.word $0000

_SilverLanceDesc
.text "Rare, quality lance "
.word $0000
.word $0000

_ShortLanceDesc
.text "Co{mm}non, s{im}ple "
.word $0000
.text "lance "
.word $0000
.word $0000

_LongLanceDesc
.text "Strong, si[mple "
.word $0000
.text "lance "
.word $0000
.word $0000

_GreatlanceDesc
.text "(Massive, si[mple "
.word $0000
.text "lance "
.word $0000
.word $0000


_IronAxeDesc
.text "Co{mm}non, quality axe"
.word $0000
.word $0000

_SteelAxeDesc
.text "Strong, quality axe "
.word $0000
.word $0000

_SilverAxeDesc
.text "Rare, quality axe "
.word $0000
.word $0000

_BattleAxeDesc
.text "Deadly axe, but "
.word $0000
.text "difficult to ]wield "
.word $0000
.word $0000


_IronBowDesc
.text "Co{mm}non, quality"
.word $0000
.text "bo12"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000

_SteelBowDesc
.text "Strong, quality bo12"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000

_SilverBowDesc
.text "Rare, quality bo12"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000

_ShortbowDesc
.text "Co{mm}non, s{im}ple bo12"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000

_LongbowDesc
.text "Strong, si[mple bo12"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000

_GreatbowDesc
.text "(Massive, si[mple "
.word $0000
.text "bo12"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000


_FireDesc
.text "Basic fire [magic "
.word $0000
.word $0000

_ElfireDesc
.text "Potent fire [magic"
.word $0000
.word $0000

_MeteorDesc
.text "Long range"
.word $0000
.text "fire [magic "
.word $0000
.word $0000


_ThunderDesc
.text "Basic thunder [magic"
.word $0000
.word $0000

_ThoronDesc
.text "Superior"
.word $0000
.text "thunder [magic"
.word $0000
.text "High critical rate"
.word $0000
.word $0000

_BoltingDesc
.text "Long range"
.word $0000
.text "thunder [magic"
.word $0000
.text "High critical rate"
.word $0000
.word $0000


_WindDesc
.text "Basic ]wind [magic"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000

_TornadoDesc
.text "Superior"
.word $0000
.text "]wind [magic"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000


_LightDesc
.text "Basic light [magic"
.word $0000
.text "High critical rate"
.word $0000
.word $0000


_FenrirDesc
.text "Long range"
.word $0000
.text "dark [magic "
.word $0000
.word $0000

; Specialty weapons

_ArmorslayerDesc
_HammerDesc
.text "Effective against "
.word $0000
.text "{ARM1}{ARM2} units"
.word $0000
.word $0000

_RidersbaneDesc
_PoleaxDesc
.text "Effective against "
.word $0000
.text "{CAV1}{CAV2} units"
.word $0000
.word $0000

_RapierDesc
.text "Effective against "
.word $0000
.text "{ARM1}{ARM2}{CAV1}{CAV2} units"
.word $0000
.word $0000


_ParagonSwordDesc
.text "Gives Paragon "
.word $0000
.text "and {+}{5} Def"
.word $0000
.word $0000

_KingmakerDesc
.text "{BRA1}{BRA2}"
.word $0000
.text "High critical rate"
.word $0000
.text "Gives Char{m}"
.word $0000
.word $0000


_KillingEdgeDesc
_KillerLanceDesc
_KillerAxeDesc
.text "High critical rate"
.word $0000
.word $0000

_KillerBowDesc
.text "High critical rate"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000


_BraveSwordDesc
_MasterSwordDesc
_BraveAxeDesc
.text "{BRA1}{BRA2}"
.word $0000
.word $0000

_BraveBowDesc
.text "{BRA1}{BRA2}"
.word $0000
.text "High critical rate"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000


_JavelinDesc
_HandAxeDesc
.text "Can attack at range "
.word $0000
.word $0000

_MasterLanceDesc
_MasterAxeDesc
.text "Can attack at range "
.word $0000
.text "{BRA1}{BRA2}"
.word $0000
.word $0000

_MasterBowDesc
.text "{BRA1}{BRA2}"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000


_BallistaDesc
.text "Long range"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000

_IronBallistaDesc
.text "Super long range"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000


_FlameSwordDesc
.text "Casts fire [magic "
.word $0000
.text "at range"
.word $0000
.text "Gives {+}{5} (Mag "
.word $0000
.word $0000

_LightningSwordDesc
.text "Casts thunder [magic"
.word $0000
.text "at range"
.word $0000
.text "Gives {+}{5} Skl"
.word $0000
.word $0000

_WindSwordDesc
.text "Casts ]wind [magic"
.word $0000
.text "at range"
.word $0000
.text "Gives {+}{5} Spd"
.word $0000
.word $0000

; Status effect weapons

_VeninEdgeDesc
_VeninLanceDesc
_VeninAxeDesc
.text "Poisons the target"
.word $0000
.text "on hit"
.word $0000
.text "Turns into an iron"
.word $0000
.text "]weapon if stolen "
.word $0000
.word $0000

_VeninBowDesc
.text "Eff against {FLY1}{FLY2}"
.word $0000
.text "Poisons on hit"
.word $0000
.text "Turns into an iron"
.word $0000
.text "]weapon if stolen "
.word $0000
.word $0000

_VeninBallistaDesc
.text "Long range"
.word $0000
.text "Eff against {FLY1}{FLY2}"
.word $0000
.text "Poisons the target"
.word $0000
.text "on hit"
.word $0000
.word $0000

_VeninDesc
.text "Long range dark "
.word $0000
.text "[magic, Poisons on"
.word $0000
.text "hit, Turns into "
.word $0000
.text "Fenrir if stolen"
.word $0000
.word $0000


_PetrifyDesc
.text "Long range dark "
.word $0000
.text "[magic, Petrifies on"
.word $0000
.text "hit, Turns into "
.word $0000
.text "Fenrir if stolen"
.word $0000
.word $0000


_BlizzardDesc
.text "Long range [magic "
.word $0000
.text "Applies Sleep on hit"
.word $0000
.text "Targets on thrones"
.word $0000
.text "or gates are i{mm}nune"
.word $0000
.word $0000

_SleepEdgeDesc
.text "Puts the target to"
.word $0000
.text "Sleep on hit"
.word $0000
.text "Targets on thrones"
.word $0000
.text "or gates are i{mm}nune"
.word $0000
.word $0000

_BerserkEdgeDesc
.text "Berserks the target "
.word $0000
.text "on hit"
.word $0000
.text "Targets on thrones"
.word $0000
.text "or gates are i{mm}nune"
.word $0000
.word $0000


_SleepDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "Puts a target ]with "
.word $0000
.text "lo]wer (Mag to Sleep"
.word $0000
.text "Ene[mies on thrones "
.word $0000
.text "or gates are i{mm}nune"
.word $0000
.word $0000

_BerserkDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "Berserks a target "
.word $0000
.text "]with lo]wer (Mag "
.word $0000
.text "Ene[mies on thrones "
.word $0000
.text "or gates are i{mm}nune"
.word $0000
.word $0000

_SilenceDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "Silences a target "
.word $0000
.text "]with lo]wer (Mag "
.word $0000
.text "Ene[mies on thrones "
.word $0000
.text "or gates are i{mm}nune"
.word $0000
.word $0000

; Staves

_HealDesc
.text "    Range     {blue1}"
.word $0000
.text "Restore {1}{0}  {H}{P}"
.word $0000
.text "{+} user's (Mag"
.word $0000
.text "to an ally"
.word $0000
.word $0000

_MendDesc
.text "    Range     {blue1}"
.word $0000
.text "Restore {2}{0}  {H}{P}"
.word $0000
.text "{+} user's (Mag"
.word $0000
.text "to an ally"
.word $0000
.word $0000

_RecoverDesc
.text "    Range     {blue1}"
.word $0000
.text "Restore all {H}{P}"
.word $0000
.text "to an ally"
.word $0000
.word $0000

_PhysicDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "Restore {1}{0}  {H}{P}"
.word $0000
.text "{+} user's (Mag"
.word $0000
.text "to an ally"
.word $0000
.word $0000

_FortifyDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "Restore {1}{0}  {H}{P}"
.word $0000
.text "{+} user's (Mag"
.word $0000
.text "to all allies "
.word $0000
.word $0000

_RestoreDesc
.text "    Range     {blue1}"
.word $0000
.text "Re[moves any status "
.word $0000
.text "{(}except Stone{)}"
.word $0000
.text "fro[m an ally "
.word $0000
.word $0000


_RescueDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "Transports an ally"
.word $0000
.text "to a traversable"
.word $0000
.text "tile next to"
.word $0000
.text "the user"
.word $0000
.word $0000

_WarpDesc
.text "    Range     {blue1}"
.word $0000
.text "Transports an ally"
.word $0000
.text "to any traversable"
.word $0000
.text "tile on the [map"
.word $0000
.word $0000

_RewarpDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "Transports the user "
.word $0000
.text "to any traversable"
.word $0000
.text "tile on the [map"
.word $0000
.word $0000


_TorchStaffDesc
.text "    Range     {blue-}"
.word $0000
.text "Gives {+}{1}{0} vision "
.word $0000
.text "in fog of ]war"
.word $0000
.text "Effect decreases by "
.word $0000
.text "{1} every turn "
.word $0000
.word $0000

_TorchDesc
.text "Gives {+}{1}{0}"
.word $0000
.text "vision in fog of"
.word $0000
.text "]war. Effect"
.word $0000
.text "decreases by"
.word $0000
.text "{1} every turn "
.word $0000
.word $0000

_EnsorcelDesc
.text "    Range     {blue1}"
.word $0000
.text "Gives {+}{7} (Mag "
.word $0000
.text "to an ally"
.word $0000
.text "Effect decreases by "
.word $0000
.text "{1} every turn "
.word $0000
.word $0000


_PureWaterDesc
.text "Gives {+}{7} (Mag to"
.word $0000
.text "the user. Effect"
.word $0000
.text "decreases by"
.word $0000
.text "{1} every turn "
.word $0000
.word $0000

; Unique weapons

_DevilAxeDesc
.text "{(}{2}{1}{-}Luck{)}{%}"
.word $0000
.text "chance to da[mage "
.word $0000
.text "its user instead"
.word $0000
.word $0000

_NosferatuDesc
.text "Potent light [magic "
.word $0000
.text "Drains target's {H}{P}"
.word $0000
.word $0000

_JormungandDesc
.text "Potent dark [magic"
.word $0000
.text "Poisons the target"
.word $0000
.text "on hit if used"
.word $0000
.text "by ene[my [mages"
.word $0000
.word $0000

_HelDesc
.text "{Lock}Loptrians "
.word $0000
.text "Reduces target's"
.word $0000
.text "{H}{P} to {1}"
.word $0000
.text "Cannot kill "
.word $0000
.word $0000

; Prf weapons

_LightBrandDesc
.text "{Lock}Leif, Casts light "
.word $0000
.text "[magic at range "
.word $0000
.text "Gives {+}{1}{0} Lck"
.word $0000
.text "Use to heal all {H}{P}"
.word $0000
.word $0000

_EarthSwordDesc
.text "{Lock}+Nanna"
.word $0000
.text "Casts potent light"
.word $0000
.text "[magic at range "
.word $0000
.text "Drains target's {H}{P}"
.word $0000
.word $0000

_ShadowSwordDesc
_MareetasSwordDesc
.text "{Lock}(Mareeta, {BRA1}{BRA2}"
.word $0000
.text "High critical rate"
.word $0000
.text "Gives +Nihil"
.word $0000
.word $0000

_BeoBladeDesc
.text "{Lock}Fergus, Diar[muid "
.word $0000
.text "High critical rate"
.word $0000
.text "Gives Vantage "
.word $0000
.text "and )Wrath"
.word $0000
.word $0000

_BlessedSwordDesc
.text "{Lock}Ol]wen, High crit "
.word $0000
.text "Eff against {CAV1}{CAV2}"
.word $0000
.text "{BRA1}{BRA2}, Gives (Miracle"
.word $0000
.text "and {+}{1}{0} (Mag "
.word $0000
.word $0000

_BragisBladeDesc
.text "{Lock}Heirs of rebels "
.word $0000
.text "Pierces Fang's curse"
.word $0000
.text "Eff against {ARM1}{ARM2}"
.word $0000
.text "Gives (Miracle"
.word $0000
.word $0000

_LoptrianFangDesc
.text "{Lock}Raydrik "
.word $0000
.text "Halves ene[my's "
.word $0000
.text "attack po]wer "
.word $0000
.text "Gives {+}{2}{0} (Mag "
.word $0000
.word $0000


_BraveLanceDesc
.text "{Lock}Finn, {BRA1}{BRA2}"
.word $0000
.text "Gives {+}{1}{0} Lck"
.word $0000
.word $0000

_DragonpikeDesc
.text "{Lock}Dean, Altena"
.word $0000
.text "{BRA1}{BRA2}, Gives Vantage "
.word $0000
.word $0000


_VougeDesc
.text "{Lock}Osian "
.word $0000
.text "Can attack at range "
.word $0000
.text "High critical rate"
.word $0000
.word $0000


_HammerneDesc
.text "    Range     {blue1}"
.word $0000
.text "{Lock}Safy"
.word $0000
.text "Restore an ally's "
.word $0000
.text "staff or ]weapon to "
.word $0000
.text "pristine condition"
.word $0000
.word $0000

_ThiefDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "{Lock}Tina, Steals a"
.word $0000
.text "]weapon, staff or "
.word $0000
.text "ite[m fro[m a target"
.word $0000
.text "]with lo]wer (Mag "
.word $0000
.word $0000

_UnlockDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "{Lock}Tina"
.word $0000
.text "Opens a door or "
.word $0000
.text "chest, or lo]wers "
.word $0000
.text "a dra]wbridge "
.word $0000
.word $0000

_KiaDesc
.text "    Range     {blue1}"
.word $0000
.text "{Lock}Sara"
.word $0000
.text "Re[moves the Stone"
.word $0000
.text "status fro[m an ally"
.word $0000
.word $0000


_DireThunderDesc
.text "{Lock}Ol]wen, Reinhardt "
.word $0000
.text "{BRA1}{BRA2}"
.word $0000
.word $0000


_GrafcaliburDesc
.text "{Lock}Asbel "
.word $0000
.text "High critical rate"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000

_ForsetiDesc
_ForsetiInfiniteDesc
.text "{Lock}Ced, Gives  {+}{2}{0}"
.word $0000
.text "Skl & Spd, High crit"
.word $0000
.text "Exalted ]wind [magic"
.word $0000
.text "Eff against {FLY1}{FLY2}"
.word $0000
.word $0000

;	Item descriptions character limit: 18
;	Item descriptions line limit: 7

; Rings

_LifeRingDesc
.text "Increases "
.word $0000
.text "{H}{P} by {7}"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_MagicRingDesc
.text "Increases "
.word $0000
.text "(Magic by {2}"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_StrengthRingDesc
.text "Increases "
.word $0000
.text "Strength by {3}"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_SkillRingDesc
.text "Increases "
.word $0000
.text "Skill by  {3}"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_SpeedRingDesc
.text "Increases "
.word $0000
.text "Speed by  {3}"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_LuckRingDesc
.text "Increases "
.word $0000
.text "Luck by {3}"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_ShieldRingDesc
.text "Increases "
.word $0000
.text "Defense by  {2}"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_BodyRingDesc
.text "Increases "
.word $0000
.text "Constitution by {3}"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_LegRingDesc
.text "Increases "
.word $0000
.text "(Move[ment by {2}"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

; Items

_ChestKeyDesc
.text "Opens chests"
.word $0000
.word $0000

_DoorKeyDesc
.text "Opens a door"
.word $0000
.word $0000

_BridgeKeyDesc
.text "Lo]wers a "
.word $0000
.text "dra]wbridge "
.word $0000
.word $0000

_LockpickDesc
.text "Opens doors and "
.word $0000
.text "chests, or lo]wers"
.word $0000
.text "dra]wbridges"
.word $0000
.text "  "
.word $0000
.text "{Lock}Units ]with the "
.word $0000
.text "Steal skill "
.word $0000
.word $0000


_VulneraryDesc
.text "Restore all {H}{P}"
.word $0000
.text "to the user "
.word $0000
.word $0000

_AntitoxinDesc
.text "Re[moves Poison "
.word $0000
.text "status"
.word $0000
.word $0000

_StaminaDrinkDesc
.text "Re[moves Fatigue"
.word $0000
.text "or allo]ws a"
.word $0000
.text "fatigued unit "
.word $0000
.text "to be deployed"
.word $0000
.word $0000


_MasterSealDesc
.text "Pro[motes [most "
.word $0000
.text "base class units"
.word $0000
.text "that are at least "
.word $0000
.text "Level {1}{0} to "
.word $0000
.text "an advanced class "
.word $0000
.word $0000


_MemberCardDesc
.text "If so[meone ]with "
.word $0000
.text "this card stops "
.word $0000
.text "in a suspicious "
.word $0000
.text "space..."
.word $0000
.word $0000

; Scrolls

_BasicScrollDesc 	; Displayed when Hidden Data is off
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.word $0000

_BaldrsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "{H}{P} & Str  {+}{5}{%}"
.word $0000
.text "Skl & Spd   {+}{5}{%}"
.word $0000
.text "Lck & Def   {+}{5}{%}"
.word $0000
.word $0000

_OdsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "Skill     {+}{3}{0}{%}"
.word $0000
.word $0000

_HezulsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "{H}{P}      {+}{3}{0}{%}"
.word $0000
.text "Strength  {+}{1}{0}{%}"
.word $0000
.text "Luck      {-}{1}{0}{%}"
.word $0000
.word $0000

_NjorunsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "Strength  {+}{3}{0}{%}"
.word $0000
.text "(Magic    {-}{1}{0}{%}"
.word $0000
.text "Speed     {+}{1}{0}{%}"
.word $0000
.text "Luck        {-}{5}{%}"
.word $0000
.text "Defense     {+}{5}{%}"
.word $0000
.word $0000

_DainnsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "Strength    {+}{5}{%}"
.word $0000
.text "Speed     {-}{1}{0}{%}"
.word $0000
.text "Defense   {+}{3}{0}{%}"
.word $0000
.text "(Mov        {+}{5}{%}"
.word $0000
.word $0000

_NalsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "{H}{P}      {+}{1}{0}{%}"
.word $0000
.text "Strength  {+}{1}{0}{%}"
.word $0000
.text "Skill     {-}{1}{0}{%}"
.word $0000
.text "Defense   {+}{1}{0}{%}"
.word $0000
.text "Con       {+}{1}{0}{%}"
.word $0000
.word $0000

_UllursScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "Skill     {+}{1}{0}{%}"
.word $0000
.text "Speed     {+}{1}{0}{%}"
.word $0000
.text "Luck      {+}{1}{0}{%}"
.word $0000
.word $0000

_BragisScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "Strength  {-}{1}{0}{%}"
.word $0000
.text "(Magic    {+}{1}{0}{%}"
.word $0000
.text "Luck      {+}{3}{0}{%}"
.word $0000
.word $0000

_FjalarsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "Strength    {+}{5}{%}"
.word $0000
.text "(Magic      {+}{5}{%}"
.word $0000
.text "Skill     {+}{1}{0}{%}"
.word $0000
.text "Speed     {+}{1}{0}{%}"
.word $0000
.word $0000

_ThrudsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "{H}{P}        {+}{5}{%}"
.word $0000
.text "Strength    {+}{5}{%}"
.word $0000
.text "(Magic      {+}{5}{%}"
.word $0000
.text "Skill     {+}{1}{0}{%}"
.word $0000
.text "Luck        {+}{5}{%}"
.word $0000
.word $0000

_CedsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "{H}{P}      {-}{1}{0}{%}"
.word $0000
.text "(Magic    {+}{1}{0}{%}"
.word $0000
.text "Speed     {+}{3}{0}{%}"
.word $0000
.word $0000

_HeimsScrollDesc
.text "Blocks criticals"
.word $0000
.text "(Modifies gro]wths"
.word $0000
.text "(Magic    {+}{3}{0}{%}"
.word $0000
.text "Luck      {+}{1}{0}{%}"
.word $0000
.text "Defense   {-}{1}{0}{%}"
.word $0000
.word $0000

; Manuals

_AccostManualDesc
.text "Teaches Accost"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_AdeptManualDesc
.text "Teaches Adept "
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_LunaManualDesc
.text "Teaches Luna"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_ParagonManualDesc
.text "Teaches Paragon "
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_NihilManualDesc
.text "Teaches +Nihil"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_SolManualDesc
.text "Teaches Sol "
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_VantageManualDesc
.text "Teaches Vantage "
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_WrathManualDesc
.text "Teaches )Wrath"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

; Broken items

_BrokenSwordDesc
_BrokenLanceDesc
_BrokenAxeDesc
.text "A broken ]weapon"
.word $0000
.text "Al[most unusable"
.word $0000
.word $0000

_BrokenBowDesc
.text "A broken ]weapon"
.word $0000
.text "Al[most unusable"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000

_BrokenTomeDesc
_BrokenStaffDesc
.text "Drained of its"
.word $0000
.text "[magic and"
.word $0000
.text "unusable" 
.word $0000
.word $0000

; Unused

_ShadowSpearDesc
.text "Can attack at range "
.word $0000
.text "Gives +Nihil"
.word $0000
.word $0000

_GaeBolgDesc
.text "High crit rate, {BRA1}{BRA2}"
.word $0000
.text "Gives {+}{1}{0} Str, "
.word $0000
.text "+Nihil, )Wrath, "
.word $0000
.text "Vantage and Char{m}"
.word $0000
.word $0000

_GungnirDesc
.text "High crit rate, {BRA1}{BRA2}"
.word $0000
.text "Gives {+}{1}{0} Def, "
.word $0000
.text "+Nihil, )Wrath, "
.word $0000
.text "Vantage and Paragon "
.word $0000
.word $0000


_KillerBallistaDesc
.text "Long range"
.word $0000
.text "High critical rate"
.word $0000
.text "Effective against "
.word $0000
.text "{FLY1}{FLY2} units"
.word $0000
.word $0000


_ReturnDesc
.text "    Range     {blue1}"
.word $0000
.text "Allo]ws an ally "
.word $0000
.text "to escape "
.word $0000
.text "the chapter "
.word $0000
.word $0000

_WatchDesc
.text "    Range   {INF1}{INF2}"
.word $0000
.text "Reveals concealed "
.word $0000
.text "areas under a roof"
.word $0000
.word $0000


_AuraDesc
.text "Superior"
.word $0000
.text "light [magic"
.word $0000
.word $0000


_BolganoneDesc
.text "Superior fire [magic"
.word $0000
.word $0000

_ValflameDesc
.text "Exalted fire [magic "
.word $0000
.text "High critical rate"
.word $0000
.word $0000


_MjolnirDesc
.text "Exalted thunder "
.word $0000
.text "[magic"
.word $0000
.text "High critical rate"
.word $0000
.word $0000


_LoptousDesc
.text "+No special effect"
.word $0000
.word $0000


_MasterCrownDesc
.text "Does nothing"
.word $0000
.word $0000

_BargainManualDesc
.text "Teaches Bargain "
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

_MiracleManualDesc
.text "Teaches (Miracle"
.word $0000
.text "  "
.word $0000
.text "Vanishes after use"
.word $0000
.word $0000

.bend
.here