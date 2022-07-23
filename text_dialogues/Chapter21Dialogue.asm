ch21churchlinoan

.byte Right_slot
.word LoadPortrait
.word linoan_portrait

.byte Left_slot
.word LoadPortrait
.word bishop_portrait
.text "Ah..."
.byte NewLine
.text "You're Duchess Linoan of Tahra, are you not?"
.byte WaitForA

.byte Right_slot
.text "Hm?"
.byte NewLine
.text "How do you know who I am?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I grew up with your father. He and I didn't"
.byte NewLine
.text "know each other particularly well, but I was"
.byte NewLine
.text "also good friends with your late mother."
.byte WaitForA
.byte ScrollText
.text "I nearly mistook you for her when"
.byte NewLine
.text "you walked in—the resemblance is uncanny."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Oh..."
.byte NewLine
.text "Is that so...?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Oh, heavens! I didn't mean to upset you."
.byte NewLine
.text "Er... I take it you're with Prince Leif?"
.byte NewLine
.text "I saw you fighting together outside."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I am with the Liberation Army, yes."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Mm..."
.byte NewLine
.text "It seems the blood of the crusaders"
.byte NewLine
.text "is drawn to conflict..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Blood of the crusaders?"
.byte NewLine
.text "You don't mean...I have holy blood?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Eh?"
.byte NewLine
.text "Your father didn't tell you?"
.byte WaitForA
.byte ScrollText
.text "The Ducal House of Tahra is descended from"
.byte NewLine
.text "Saint Heim, the first of the Grannvale kings."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I have...the blood of Saint Heim...?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You mean to say you never realized"
.byte NewLine
.text "you bore the power of Naga herself...?"
.byte WaitForA
.byte ScrollText
.text "Follow me. I can awaken the holy blood"
.byte NewLine
.text "that lay dormant in your veins."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Very well."
.byte WaitForA

.byte EndText


ch21churchother

.byte Right_slot
.word LoadPortrait
.word bishop_portrait
.text "The fighting will only become more intense"
.byte NewLine
.text "as you draw closer to the Imperial base"
.byte NewLine
.text "to the east."
.byte WaitForA
.byte ScrollText
.text "Keep hold of this Pure Water."
.byte NewLine
.text "I'm sure it will come in handy."
.byte WaitForA

.byte EndText


ch21purewaterhouse

.byte Right_slot
.word LoadPortrait
.word elder_portrait
.text "Ever since the Empire took over,"
.byte NewLine
.text "this whole place has gone to hell..."
.byte NewLine
.text "Bah, I wish I could go back to the old days..."
.byte WaitForA
.byte ScrollText
.text "So I don't care what you do,"
.byte NewLine
.text "just drive the Empire outta here!"
.byte WaitForA
.byte ScrollText
.text "I know this little vial seems worthless now,"
.byte NewLine
.text "but just be patient!"
.byte NewLine
.text "I'm sure it'll be a lifesaver someday!"
.byte WaitForA

.byte EndText


ch21silverswordhouse

.byte Right_slot
.word LoadPortrait
.word moustache_portrait
.text "It's already been 20 years..."
.byte NewLine
.text "Ohhh, if I were just 10 years younger,"
.byte NewLine
.text "I'd drop everything to fight with you folks."
.byte WaitForA
.byte ScrollText
.text "Here, I'll give you my favorite sword."
.byte NewLine
.text "Mayhap if you use it, I'll still be fighting"
.byte NewLine
.text "in some small way..."
.byte WaitForA

.byte EndText


ch21opening1

.byte Right_slot
.word LoadPortrait
.word seliph_portrait

.byte Left_slot
.word LoadPortrait
.word julia_portrait
.text "Lord Seliph, we should be on our way soon..."
.byte WaitForA

.byte Right_slot
.text "Ah, Julia, are we out of time already?"
.byte WaitForA
.byte ScrollText

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word leif_portrait

.byte Right_slot
.text "I wish we could keep talking, Prince Leif,"
.byte NewLine
.text "but I must be going."
.byte WaitForA
.byte ScrollText
.text "Leave the conquest of Connaught to us—"
.byte NewLine
.text "I bid you go straight to Munster."
.byte WaitForA

.byte Left_slot
.text "I pray you forgive my selfishness, Lord Seliph."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Nonsense, you're not being selfish at all!"
.byte NewLine
.text "I understand your feelings perfectly."
.byte WaitForA
.byte ScrollText
.text "You can head to Munster with"
.byte NewLine
.text "a clean conscience—I'll see you soon."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Yes, in Munster!"
.byte NewLine
.text "You can count on it!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word julia_portrait
.text "I'll be praying for your health, Lord Leif..."
.byte WaitForA
.byte ScrollText
.text "If your fortune begins to wane, perhaps one of"
.byte NewLine
.text "your own clerics could appeal to the gods."
.byte NewLine
.text "I believe there's a church on your route..."
.byte WaitForA
.byte ScrollText
.text "I've heard it was built to receive the prayers"
.byte NewLine
.text "of the Ducal Family of Tahra..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Thank you, Lady Julia."
.byte NewLine
.text "Just don't forget to take care of yourself, too."
.byte WaitForA

.byte EndText


ch21opening2

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word augustus_portrait
.text "How went your meeting with Lord Seliph,"
.byte NewLine
.text "my prince?"
.byte WaitForA

.byte Right_slot
.text "He and I are only a year apart,"
.byte NewLine
.text "but he's such an incredible man..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Indeed."
.byte WaitForA
.byte NewLine
.text "He commands an army ten times the size"
.byte NewLine
.text "of ours, and he was able to lead them"
.byte NewLine
.text "across the Aed Desert."
.byte WaitForA
.byte ScrollText
.text "He's certainly not your ordinary youth..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "But you said before that he was “made”"
.byte NewLine
.text "into a hero, did you not?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I did say that, yes—and in one sense, it's true."
.byte NewLine
.text "But I'm not discounting that Lord Seliph"
.byte NewLine
.text "himself possesses outstanding talent."
.byte WaitForA
.byte ScrollText
.text "I suspect he'll eclipse the legend of his father,"
.byte NewLine
.text "Lord Sigurd, by quite some measure."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "And meanwhile, I'm still just"
.byte NewLine
.text "an embarrassment to Leonster..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You've grown much over the past year,"
.byte NewLine
.text "my prince—in another year, I expect you'll"
.byte NewLine
.text "be the same caliber of man as Lord Seliph."
.byte WaitForA
.byte ScrollText
.text "Now, putting that aside, what did you and he"
.byte NewLine
.text "agree would be the plans for our armies,"
.byte NewLine
.text "going forward?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Lord Seliph's main forces will go east"
.byte NewLine
.text "along the shore to seize Connaught,"
.byte NewLine
.text "as planned."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Which frees our army"
.byte NewLine
.text "to head for Fort Danzig, correct?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Indeed."
.byte NewLine
.text "Lord Seliph readily granted my request."
.byte WaitForA
.byte ScrollText
.text "Leaving Connaught to Seliph means we can"
.byte NewLine
.text "focus all our energy on seizing Munster—"
.byte NewLine
.text "I want to head there as soon as possible."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "We'll have to claim Fort Danzig regardless—"
.byte NewLine
.text "it controls the inland route to Munster."
.byte WaitForA

.byte EndText


ch21opening3dermott

.byte Right_Slot
.byte ScrollText

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word dermott_portrait
.text "The army stands ready, Prince Leif."
.byte NewLine
.text "We await your command."
.byte WaitForA

.byte ScrollText
.word LoadPortrait
.word augustus_portrait

.byte Right_slot
.text "Then there's no time to lose!"
.byte NewLine
.text "We storm Fort Danzig!"
.byte WaitForA

.byte EndText


ch21opening4

.byte Right_slot
.word LoadPortrait
.word seimetz_portrait
.text "Everybody remembers we fight for pay, right?"
.byte NewLine
.text "So don't be a hero! Wait for the enemy to"
.byte NewLine
.text "break up their forces, THEN swoop in!"
.byte WaitForA
.byte NewLine
.text "Until then, nobody leave their post!"
.byte WaitForA

.byte EndText


ch21noprisoners

.byte Right_slot
.word LoadPortrait
.word augustus_portrait

.byte Left_slot
.word LoadPortrait
.word leif_portrait
.text "Anything of import inside the fort, August?"
.byte WaitForA

.byte Right_slot
.text "Hmm..."
.byte NewLine
.text "The fort is completely vacant."
.byte NewLine
.text "Seems to be deserted."
.byte WaitForA
.byte ScrollText
.text "By the look of it, this place was once"
.byte NewLine
.text "a prison camp, but it's not in use anymore."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I see. Then if there's nothing requiring"
.byte NewLine
.text "our attention, we should hurry ahead"
.byte NewLine
.text "to the River Thracia."
.byte WaitForA
.byte ScrollText
.text "Once we cross it,"
.byte NewLine
.text "we'll be at Munster's doorstep."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hah..."
.byte NewLine
.text "Easier said than done, my prince."
.byte WaitForA
.byte ScrollText
.text "I've no doubt the enemy is waiting for us—"
.byte NewLine
.text "they likely have established a defensive line"
.byte NewLine
.text "at the river."
.byte WaitForA
.byte ScrollText
.text "We still have some way to go before our goal."
.byte NewLine
.text "See that you don't let your guard down."
.byte WaitForA

.byte EndText


ch21prisoners

.byte Right_slot
.word LoadPortrait
.word augustus_portrait

.byte Left_slot
.word LoadPortrait
.word leif_portrait2
.text "August!"
.byte NewLine
.text "This can't be an ordinary fort—"
.byte NewLine
.text "there are too many guards for that!"
.byte WaitForA

.byte Right_slot
.text "By the look of it, this place is being used as a"
.byte NewLine
.text "prison camp. The enemy has likely started"
.byte NewLine
.text "executing prisoners because of our attack."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "What?!"
.byte NewLine
.text "Then there's not a moment to lose!"
.byte NewLine
.text "We have to rescue the prisoners!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Our forces are already exhausting themselves,"
.byte NewLine
.text "Prince Leif. Besides, we have intelligence that"
.byte NewLine
.text "a battalion of Loptrian mages are en route."
.byte WaitForA
.byte ScrollText
.text "Please, we need to withdraw while we can!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "No, August! I won't!"
.byte NewLine
.text "I'll not abandon my comrades-in-arms"
.byte NewLine
.text "to the enemy's clutches!"
.byte WaitForA
.byte NewLine
.text "I'll free them alone if I have to!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "*Sigh*"
.byte NewLine
.text "I suppose this is unavoidable..."
.byte WaitForA
.byte ScrollText
.text "At least limit yourself to a small handful"
.byte NewLine
.text "of troops, and let the others rest."
.byte WaitForA

.byte EndText


ch21wm1

.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0101 ;leify-left
.word $090E ;y then x
.text "By the time Leif had finished"
.byte NewLine
.text "fighting in Leonster and departed"
.byte WaitForA
.word ClearPortraitalt
.long $82937A
.word $0001
.byte ScrollText

.byte EndText


ch21wm2

.text "for Ulster, the city had already fallen to the"
.byte NewLine
.text "Isaachian Liberation Army led by Lord Seliph."
.byte WaitForA
.byte ScrollText

.byte EndText


ch21wm3

.text "However, the head of House Friege,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $017C ;blume
.word $0407 ;y then x
.byte NewLine
.text "King Bloom, had escaped to Connaught."
.byte WaitForA
.word ClearPortraitalt
.long $82937A
.word $0001
.byte ScrollText

.byte EndText


ch21wm4

.text "In the now-liberated Ulster,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0101 ;leify-left
.word $0A12 ;y then x
.text " Leif finally met"
.byte NewLine
.text "his cousin,"
.byte WaitForA
.text " a man who would be"
.byte NewLine
.text "his friend and ally for the rest of his days:"
.byte WaitForA
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $003E ;scerlisph
.word $0A07 ;y then x
.byte NewLine
.text "the “Scion of Light” and"
.byte NewLine
.text "Lord of House Chalphy, Seliph..."
.byte WaitForA

.byte EndText