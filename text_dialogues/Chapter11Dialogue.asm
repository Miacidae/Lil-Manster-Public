ch11kempfleave

.byte Right_slot
.word LoadPortrait
.word kempf_portrait
.text "Ugh... What a joke...!"
.byte NewLine
.text "I must flee this place,"
.byte NewLine
.text "at least for the time being..."
.byte WaitForA

.byte EndText


ch11kempfleif

.byte Right_slot
.word LoadPortrait
.word kempf_portrait
.text "What's this...?!"
.byte NewLine
.text "The enemy flies the banner of House Leonster!"
.byte WaitForA
.byte ScrollText
.text "Are they being led by...a boy?"
.byte NewLine
.text "Why, he can't be more than 14 or 15!"
.byte NewLine
.text "I've got swords that are older than him!"
.byte WaitForA
.byte ScrollText
.text "Ah, I see..."
.byte NewLine
.text "That must be the wayward Prince Leif!"
.byte WaitForA
.byte ScrollText
.text "First Olwen, and now Prince Leif marches"
.byte NewLine
.text "right up to my doorstep! The gods are"
.byte NewLine
.text "most generous today—this is my chance!"
.byte WaitForA
.byte ScrollText
.text "All hands, hear me:"
.byte WaitForA
.byte NewLine
.text "I've a plan for just such an occasion as this,"
.byte NewLine
.text "but for it to work, you must lure the enemy"
.byte NewLine
.text "inside! And don't be too obvious about it!"
.byte WaitForA
.byte ScrollText
.text "Prepare to launch Operation Portcullis!"
.byte WaitForA

.byte EndText


ch11kempftrapactivated

.byte Right_slot
.word LoadPortrait
.word kempf_portrait
.text "Ahahaha! Those dullards actually fell for it!"
.byte WaitForA
.byte ScrollText
.text "All right, men! Fire at will!"
.byte WaitForA

.byte EndText


ch11leiffred

.byte Right_slot
.word LoadPortrait
.word fred_portrait

.byte Left_slot
.word LoadPortrait
.word leif_portrait
.text "Do the holy-blooded knights of House Friege"
.byte NewLine
.text "fight using such underhanded tactics?!"
.byte WaitForA
.byte ScrollText
.text "When our forces met in Nowell Valley,"
.byte NewLine
.text "I respected the honor with which your army"
.byte NewLine
.text "conducted itself!"
.byte WaitForA
.byte ScrollText
.text "It seems I was mistaken!"
.byte WaitForA

.byte Right_slot
.text "...On behalf of my home, my honor compels"
.byte NewLine
.text "me to agree with you. The crusader Thrud"
.byte NewLine
.text "would not have fought using such treachery."
.byte WaitForA
.byte ScrollText
.text "This is all because of that fool of a man,"
.byte NewLine
.text "General Kempf... This disgrace is his doing."
.byte WaitForA
.byte ScrollText
.text "As a knight, I'm loath to give my life"
.byte NewLine
.text "in service of such a foul plan."
.byte WaitForA
.byte ScrollText
.text "You seem to be an honorable lad."
.byte NewLine
.text "I've self-control enough to not turn my sword"
.byte NewLine
.text "against you if you can promise the same."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...If you've no mind to fight, sir,"
.byte NewLine
.text "then we have no reason to meddle with you."
.byte WaitForA
.byte ScrollText
.text "In fact, we may even be able to help"
.byte NewLine
.text "each other—I'd wager the both of us"
.byte NewLine
.text "have little energy to spare, now."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I...can agree to those terms."
.byte NewLine
.text "I've many things left undone."
.byte WaitForA
.byte ScrollText
.text "...It's settled, then. We can both agree"
.byte NewLine
.text "that our time is better spent devising an escape."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Very well. My forces will storm"
.byte NewLine
.text "the castle's interior in short order."
.byte WaitForA
.byte ScrollText
.text "When that happens, you should make"
.byte NewLine
.text "your escape to the south—we can take care"
.byte NewLine
.text "of the gate ourselves."
.byte WaitForA
.byte ScrollText
.text "Are we in agreement?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "We are. It appears I owe you quite the debt..."
.byte NewLine
.text "I'm Fred, proud knight of House Stade."
.byte NewLine
.text "I would know your name as well, friend."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...It's Leif. Leif of House Leonster."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "House Leonster?!"
.byte NewLine
.text "I... I see..."
.byte WaitForA
.byte ScrollText
.text "Well, Lord Leif, I believe we'll meet again"
.byte NewLine
.text "one of these days!"
.byte WaitForA

.byte EndText


ch11opening1

.byte Right_slot
.word LoadPortrait
.word kempf_portrait

.byte Left_slot
.word LoadPortrait
.word olwen_portrait
.text "I've already told you, the enemy appeared"
.byte NewLine
.text "out of nowhere to attack Fort Nowell!"
.byte WaitForA
.byte ScrollText
.text "If you don't send reinforcements,"
.byte NewLine
.text "General Largo is as good as dead!"
.byte WaitForA
.byte ScrollText
.text "Just say the word, and I'll lead our troops"
.byte NewLine
.text "to stomp out these invaders!"
.byte NewLine
.text "Please, General Kempf...!"
.byte WaitForA

.byte Right_slot
.text "You claim this enemy “appeared"
.byte NewLine
.text "out of nowhere” to besiege Fort Nowell,"
.byte NewLine
.text "but who exactly were they?"
.byte WaitForA
.byte ScrollText
.text "Remind me: what was your assignment again?"
.byte NewLine
.text "I'm just a lowly General of House Friege,"
.byte NewLine
.text "and these little details escape me all the time."
.byte WaitForA
.byte ScrollText
.text "Ah, wait, it's coming back to me!"
.byte NewLine
.text "Reconnaissance, wasn't it?"
.byte WaitForA
.byte ScrollText
.text "But if your duty was reconnaissance,"
.byte NewLine
.text "surely you'd come to me with"
.byte NewLine
.text "more than “they just appeared!”"
.byte WaitForA
.byte ScrollText
.text "Or are you such an incompetent soldier"
.byte NewLine
.text "that you failed to gather even"
.byte NewLine
.text "the slightest bit of information!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I came here to warn you precisely because"
.byte NewLine
.text "there was no time to do anything else!"
.byte WaitForA
.byte ScrollText
.text "Listen to yourself! You're badgering me"
.byte NewLine
.text "for needless details while our borders are under"
.byte NewLine
.text "siege! Does it matter who the attackers are?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "And what if this “attack” is merely a ploy"
.byte NewLine
.text "to lure us away from the fort?"
.byte NewLine
.text "Did you consider that, girlie?"
.byte WaitForA
.byte ScrollText
.text "Fort Dundrum earned its reputation of being"
.byte NewLine
.text "impregnable only because House Friege's"
.byte NewLine
.text "12th Division is here to guard it!"
.byte WaitForA
.byte NewLine
.text "Without them, the fort is mere stone and slate!"
.byte WaitForA
.byte ScrollText
.text "If I don't have complete information on"
.byte NewLine
.text "our enemy, I can't chance deploying the"
.byte NewLine
.text "12th Division. It would weaken our position!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "And what of General Largo?!"
.byte NewLine
.text "Perhaps sending our troops out is a risk, but"
.byte NewLine
.text "he faces certain danger at this very moment!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Bah, what's one or two old men in the grand"
.byte NewLine
.text "scheme of things? Besides, how much time"
.byte NewLine
.text "could he really have left, anyway?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Wh-What?!"
.byte NewLine
.text "General Kempf, even now, you... You..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "The glare you're shooting me is almost"
.byte NewLine
.text "treasonous on its own—I've had men executed"
.byte NewLine
.text "for much less brazen displays of disrespect."
.byte WaitForA
.byte ScrollText
.text "So before you back up that glare with equally"
.byte NewLine
.text "traitorous words, let me warn you: you're very"
.byte NewLine
.text "close to insulting the chain of command."
.byte WaitForA
.byte ScrollText
.text "It's amusing watching you squirm, I admit,"
.byte WaitForA
.byte NewLine
.text "but are you really willing to defy"
.byte NewLine
.text "your superior officer, knowing what"
.byte NewLine
.text "the Empire does to traitors?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Tch..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Is that it? You've got quite the mouth on you,"
.byte NewLine
.text "but no spine to back up your words."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "......"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "You're a simple girl who got into Belhalla's"
.byte NewLine
.text "military academy on the prestige of her blood,"
.byte NewLine
.text "not the skill of her sword-arm."
.byte WaitForA
.byte ScrollText
.text "So naive, so oblivious to the way"
.byte NewLine
.text "of the world... You're lucky to have"
.byte NewLine
.text "a commanding officer as understanding as I."
.byte WaitForA
.byte ScrollText
.text "Don't worry. I never expected much of you:"
.byte NewLine
.text "I know that your only real weapon"
.byte NewLine
.text "is to go begging your brother for help."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Wh-What did you just say to me?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hm? Are you hard of hearing? I said that all"
.byte NewLine
.text "you're good for is to go crying to Reinhardt!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You...!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Oh, how he must dote on you..."
.byte NewLine
.text "Then again, Reinhardt's greatest skill"
.byte NewLine
.text "is knowing how to lead women on!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Hold your tongue! I'll not stand here"
.byte NewLine
.text "and let you dishonor my brother!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hah! You dare to draw your sword on me?!"
.byte NewLine
.text "You feeble-minded wench!"
.byte WaitForA
.byte ScrollText

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word guard_portrait

.byte Right_slot
.text "Men! Seize Olwen and throw her"
.byte NewLine
.text "in the dungeon for this act of rebellion!"
.byte WaitForA

.byte Left_slot
.text "Yes, General!"
.byte WaitForA

.byte ScrollText
.word LoadPortrait
.word olwen_portrait

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word guard_portrait
.text "Lady Olwen, in the name of the Empire,"
.byte NewLine
.text "you're under arrest! Drop your weapon!"
.byte WaitForA

.byte ScrollText
.word LoadPortrait
.word kempf_portrait

.byte Left_slot
.text "Tch... General Kempf..."
.byte NewLine
.text "How contemptible..."
.byte WaitForA
.word ClearPortrait
.word RetractBox

.byte EndText


ch11opening2

.byte Right_slot
.word LoadPortrait
.word kempf_portrait
.text "Hah! That should put the impertinent little girl"
.byte NewLine
.text "in her place."
.byte WaitForA
.byte ScrollText
.text "And if his own sister is executed for mutiny,"
.byte NewLine
.text "Reinhardt will no doubt be stripped"
.byte NewLine
.text "of his rank as well!"
.byte WaitForA
.byte ScrollText
.text "Oh, the look on his face when he hears of this"
.byte NewLine
.text "will be quite the spectacle! Ahahaha!"
.byte WaitForA

.byte EndText


ch11opening3

.byte Right_slot
.word LoadPortrait
.word kempf_portrait

.byte Left_slot
.word LoadPortrait
.word fred_portrait
.text "General Kempf! Explain yourself!"
.byte WaitForA

.byte Right_slot
.text "Fred, my dear boy, you look different"
.byte NewLine
.text "from your usual self. Is something amiss?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Don't play dumb!"
.byte NewLine
.text "Why have you done this to Lady Olwen?!"
.byte WaitForA
.byte ScrollText
.text "It's a violation of our military code to punish"
.byte NewLine
.text "a subordinate over a personal grudge like this!"
.byte NewLine
.text "You have a responsibility to overturn this!"
.byte WaitForA
.byte ScrollText
.text "Please, sir, release her at once!"
.byte NewLine
.text "Otherwise, I have no choice"
.byte NewLine
.text "but to report this matter to Princess Ishtar!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "“Personal grudge?” Nonsense!"
.byte WaitForA
.byte ScrollText
.text "Right where you're standing,"
.byte NewLine
.text "Lady Olwen drew her sword against me,"
.byte NewLine
.text "her superior officer! She meant to kill me!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Wh-What?!"
.byte NewLine
.text "That's not possible!"
.byte NewLine
.text "She... She would never..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Fred, since you're so well-acquainted with"
.byte NewLine
.text "our military code, what's the punishment for"
.byte NewLine
.text "turning your sword against a superior officer?"
.byte WaitForA
.byte ScrollText
.text "Because I seem to recall that it's a crime"
.byte NewLine
.text "punishable by execution..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...So that's your goal, is it?"
.byte NewLine
.text "Your cowardice knows no bounds..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Be that as it may, as Olwen's adjutant, her"
.byte NewLine
.text "duties now fall to you. I command you to ride"
.byte NewLine
.text "forth and engage these invaders in her place."
.byte WaitForA
.byte ScrollText
.text "But be warned: this isn't merely an order,"
.byte NewLine
.text "it's a punishment."
.byte NewLine
.text "You are not permitted to retreat for any reason!"
.byte WaitForA
.byte ScrollText
.text "See the battle through, regardless of the"
.byte NewLine
.text "outcome, or I'll have Olwen executed!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Kempf...! You're shameless!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hm? Did you say something?"
.byte NewLine
.text "Eh, must've just been my imagination."
.byte NewLine
.text "Heh, heh, heh..."
.byte WaitForA

.byte EndText


ch11endfredsaved

.byte Left_slot
.word LoadPortrait
.word leif_portrait2

.byte Right_slot
.word LoadPortrait
.word augustus_portrait
.text "Simply superb work, my prince! With Fort"
.byte NewLine
.text "Dundrum's gates captured this quickly, it will"
.byte NewLine
.text "be all but impossible for the enemy to escape!"
.byte WaitForA
.byte ScrollText
.text "We cannot afford to rest on our laurels,"
.byte NewLine
.text "however. This being an Imperial fort, I expect"
.byte NewLine
.text "there are children imprisoned here as well."
.byte WaitForA
.byte ScrollText
.text "Let's make the most of our swift victory,"
.byte NewLine
.text "and conduct a sweep of the interior!"
.byte WaitForA
.byte ScrollText
.text "If indeed there are children locked up here,"
.byte NewLine
.text "we must help them at once!"
.byte WaitForA

.byte EndText


ch11endfreddead

.byte Left_slot
.word LoadPortrait
.word leif_portrait2

.byte Right_slot
.word LoadPortrait
.word dorias_portrait
.text "Fort Dundrum has fallen, and not a moment"
.byte NewLine
.text "too soon. We've little time to spare."
.byte WaitForA
.byte ScrollText
.text "Still, better to seize a fort slowly than to incur"
.byte NewLine
.text "massive casualties doing so quickly."
.byte WaitForA
.byte ScrollText
.text "There's nothing left for us here—Fort Dundrum"
.byte NewLine
.text "no longer has any strategic value."
.byte WaitForA
.byte ScrollText
.text "Ignore any enemies already in retreat."
.byte NewLine
.text "We must make for Tahra on the double!"
.byte WaitForA

.byte EndText


ch11wm1

.text "Breaking through the enemy's lines, the"
.byte NewLine
.text "Liberation Army finally set foot on Imperial"
.byte WaitForA
.byte NewLine
.text "soil. Their invasion could now begin in full."
.byte WaitForA
.byte ScrollText

.byte EndText


ch11wm2

.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0101 ;leify-left
.word $0513 ;y then x
.text "However, there was no time to celebrate:"
.byte WaitForA
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0080 ;IN AMERICA
.word $0107 ;y then x
.byte NewLine
.text "Fort Dundrum, widely regarded as an impregnable"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $021E ;olwen
.word $0A08 ;y then x
.byte NewLine
.text "defense against Thracian incursions,"
.byte WaitForA
.byte NewLine
.text "now stood before them."
.byte WaitForA
.byte ScrollText
.text "If they could not capture Fort Dundrum,"
.byte NewLine
.text "the army would never reach Tahra in time..."
.byte WaitForA

.byte EndText