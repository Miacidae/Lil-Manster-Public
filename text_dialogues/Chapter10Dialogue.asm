ch10wm1

.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0101 ;leify-left
.word $0211 ;y then x
.text "The forces of the Fiana Freeblades, the Magi,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $033B ;augustus
.word $0219 ;y then x
.byte NewLine
.text "and the remnants of Leonster's nobility,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $003C ;dorius
.word $0209 ;y then x
.byte WaitForA
.byte ScrollText
.text "though but strangers to one another,"
.byte NewLine
.text "had rallied behind their common cause."
.byte WaitForA
.byte ScrollText
.text "They quickly cohered into a formidable"
.byte NewLine
.text "fighting unit, "
.byte WaitForA
.word ClearPortraitalt
.long $82937A
.word $0000
.text "and became a new army"
.word ClearPortraitalt
.long $82937A
.word $0003
.byte NewLine
.text "all their own: the Liberation Army."
.byte WaitForA
.byte ScrollText
.text "The time was finally right to head for Tahra"
.byte NewLine
.text "and break the siege upon the city."
.byte WaitForA
.word ClearPortraitalt
.long $82937A
.word $0001
.byte ScrollText

.byte EndText


ch10wm2

.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0101 ;leify-left
.word $0417 ;y then x
.text "The Liberation Army made their way to the"
.byte NewLine
.text "Imperial-Thracian border, "
.byte WaitForA
.text "which they would"
.byte NewLine
.text "cross through Nowell Valley, "
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word largo_portrait
.word $40B ;y then x
.byte WaitForA
.text "a small gap"
.byte NewLine
.text "in the otherwise impassable mountain range..."
.byte WaitForA

.byte EndText


ch10olwenfredarrive

.byte Right_slot
.word LoadPortrait
.word olwen_portrait

.byte Left_slot
.word LoadPortrait
.word largo_portrait
.text "Lady Olwen, the valley is under attack!"
.byte NewLine
.text "You must ride for Fort Dundrum at once"
.byte NewLine
.text "and warn them—I'll keep the enemy at bay."
.byte WaitForA

.byte Right_slot
.text "If you'll permit it, General, I would rather"
.byte NewLine
.text "remain here and fight alongside you!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm honored, Lady Olwen, but we have our"
.byte NewLine
.text "orders. Yours is reconnaissance—and alerting"
.byte NewLine
.text "Fort Dundrum must be your first priority!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I can't just leave you here!"
.byte NewLine
.text "You must allow me to help you defend"
.byte NewLine
.text "the valley, if only for a little while...!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...Very well—provided that you swear to leave"
.byte NewLine
.text "the battlefield and ride for Fort Dundrum"
.byte NewLine
.text "in short order."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Thank you, General!"
.byte WaitForA
.byte ScrollText

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word fred_portrait

.byte Right_slot
.text "Fred, let's move out!"
.byte WaitForA

.byte Left_slot
.text "Hah! There's the Lady Olwen I know!"
.byte WaitForA

.byte EndText


ch10olwenfredleave

.byte Right_slot
.word LoadPortrait
.word olwen_portrait
.text "I can delay no longer..."
.byte NewLine
.text "Fort Dundrum must be warned"
.byte NewLine
.text "of this invasion."
.byte WaitForA
.byte ScrollText
.text "General Largo, I'll return with"
.byte NewLine
.text "every able-bodied soldier I can find!"
.byte NewLine
.text "You have my word...!"
.byte WaitForA

.byte EndText


ch10rescuehouse

.byte Right_slot
.word LoadPortrait
.word oldlady_portrait
.text "Natterin' Nál!"
.byte NewLine
.text "You folks are with the Liberation Army, right?"
.byte WaitForA
.byte ScrollText
.text "Well, you be sure to show the Empire"
.byte NewLine
.text "some of our famous Thracian hospitality!"
.byte NewLine
.text "Drive the lot of 'em outta our valley!"
.byte WaitForA
.byte ScrollText
.text "Oh, an' take this with you. I've just been"
.byte NewLine
.text "usin' it as a walking stick for years,"
.byte NewLine
.text "but I think it's enchanted. Maybe it'll help!"
.byte WaitForA

.byte EndText


ch10ensorcelhouse

.byte Right_slot
.word LoadPortrait
.word youngman_portrait
.text "Don't tell me! You're the Liberation Army,"
.byte NewLine
.text "right? Well, have I got a surprise for you!"
.byte WaitForA
.byte ScrollText
.text "See, I fancy myself a botanist,"
.byte NewLine
.text "and a few months ago I started an experiment."
.byte WaitForA
.byte ScrollText
.text "I wanted to see what would happen"
.byte NewLine
.text "if I watered a tree using only Pure Water."
.byte WaitForA
.byte ScrollText
.text "I won't keep you in suspense—this here staff"
.byte NewLine
.text "is what resulted from the whole thing!"
.byte WaitForA
.byte ScrollText
.text "Use it, and it'll fortify your magic, same as if"
.byte NewLine
.text "you'd just gulped down Pure Water yourself."
.byte WaitForA
.byte ScrollText
.text "Hm? Where's the rest of the tree, you ask?"
.byte NewLine
.text "Uh... You're looking at it."
.byte NewLine
.text "That staff WAS the whole tree."
.byte WaitForA
.byte ScrollText
.text "Poor thing never grew bigger than three feet"
.byte NewLine
.text "tall... Heh, it turns out Pure Water actually"
.byte NewLine
.text "isn't very good for plants."
.byte WaitForA
.byte ScrollText
.text "Yeah... Probably should've checked"
.byte NewLine
.text "that before I spent months"
.byte NewLine
.text "on the whole experiment..."
.byte WaitForA

.byte EndText


ch10opening1

.byte Left_slot
.word LoadPortrait
.word olwen_portrait
.text "Has there been any change, General Largo?"
.byte WaitForA

.byte Right_slot
.word LoadPortrait
.word largo_portrait
.text "Hm? You're doing reconnaissance again today,"
.byte NewLine
.text "Lady Olwen? I admire your fortitude,"
.byte NewLine
.text "coming this far into the mountains every morn."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word fred_portrait
.text "She's been assigned to it on the direct orders"
.byte NewLine
.text "of General Kempf."
.byte WaitForA
.byte ScrollText
.text "There's no doubt he's out to harass her,"
.byte NewLine
.text "having her make such a back-breaking trek"
.byte NewLine
.text "each day..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word olwen_portrait
.text "Truth be told, Fred, I'd rather be out here"
.byte NewLine
.text "than cooped up in Fort Dundrum, having to"
.byte NewLine
.text "look at Kempf's face every hour of the day."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word largo_portrait
.text "Oh ho ho! Scathing words, but General"
.byte NewLine
.text "Kempf is...quite an embarrassment, really."
.byte WaitForA
.byte ScrollText
.text "A highborn noble, his impudence and pettiness"
.byte NewLine
.text "undermine his stature, and he behaves closer"
.byte NewLine
.text "to a boy than a man."
.byte WaitForA
.byte ScrollText
.text "Perhaps it's natural to be a little insecure"
.byte NewLine
.text "when Commander Reinhardt's fame"
.byte NewLine
.text "has so thoroughly eclipsed his own,"
.byte WaitForA
.byte ScrollText
.text "but to be so vindictive about it as to"
.byte NewLine
.text "take it out on the Commander's only sister?"
.byte WaitForA
.byte ScrollText
.text "You'd scarcely believe there was"
.byte NewLine
.text "any noble blood in him at all."
.byte NewLine
.text "He's a disgrace to his uniform."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "General Kempf is utterly convinced that"
.byte NewLine
.text "my lord brother is somehow his competition."
.byte WaitForA
.byte ScrollText
.text "He doesn't understand the solidarity that"
.byte NewLine
.text "comes with military service."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "They're both close in age, were both"
.byte NewLine
.text "promoted to General very young... It's easy"
.byte NewLine
.text "to see how such a vile mindset took root."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "But my lord brother certainly doesn't feel"
.byte NewLine
.text "the same way about him."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Then that's all the more reason for General"
.byte NewLine
.text "Kempf to hate him, wouldn't you say?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "What? Why? If the hatred's not mutual,"
.byte NewLine
.text "there should be no reason for it to continue!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Hah! You don't get it? I envy your innocence."
.byte NewLine
.text "It's Kempf's way of thinking that ensures"
.byte NewLine
.text "North and South Thracia will never be as one."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I don't follow... What's that got to do"
.byte NewLine
.text "with the North and South?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...Ah, I've bent your ear for too long, though"
.byte NewLine
.text "it's been good to speak so frankly. Why don't"
.byte NewLine
.text "you stay a spell and catch your breath?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I will. Thank you."
.byte NewLine
.text "You spoil me, General..."
.byte WaitForA

.byte EndText


ch10opening2

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word dorias_portrait
.text "Prince Leif, just across the valley"
.byte NewLine
.text "is Fort Nowell, which guards the border"
.byte NewLine
.text "between Thracia and the Empire."
.byte WaitForA

.byte Right_slot
.text "We'll finally be able to strike"
.byte NewLine
.text "at the enemy's own territory for a change..."
.byte NewLine
.text "Have we any idea of their numbers?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Our reports say that their garrison is small,"
.byte NewLine
.text "but they make up for it with force of arms:"
.byte WaitForA
.byte NewLine
.text "the fort is guarded with ballistae—a sort of"
.byte NewLine
.text "giant bow that can fire across great distances."
.byte WaitForA
.byte ScrollText
.text "They're tremendously powerful—we'll have to"
.byte NewLine
.text "destroy them before advancing toward the fort."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "How do you propose we do that?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "We've three means of attack."
.byte NewLine
.text "First, we could send the majority of our forces"
.byte NewLine
.text "to draw the enemy out of ballista range."
.byte WaitForA
.byte ScrollText
.text "Then, we send a small force to deal with"
.byte NewLine
.text "the ballistae while they're occupied."
.byte NewLine
.text "Simple, but effective."
.byte WaitForA
.byte ScrollText
.text "Second, we could storm the valley with our"
.byte NewLine
.text "cavalry, overwhelming their main body and"
.byte NewLine
.text "allowing us to swiftly dispatch the ballistae."
.byte WaitForA
.byte ScrollText
.text "This...could work as a last recourse."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "They both have their own crucial downsides..."
.byte NewLine
.text "What's the best course of action?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "That would be the third way."
.byte WaitForA
.byte ScrollText
.text "Since you've caught on that both plans"
.byte NewLine
.text "involving direct confrontation are inadvisable,"
.byte WaitForA
.byte NewLine
.text "I'm sure you don't need it spelled out for you,"
.byte NewLine
.text "Prince Leif!"
.byte WaitForA

.byte EndText


ch10endlargoalive

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word dorias_portrait
.text "General Largo..."
.byte NewLine
.text "The man was every bit the soldier"
.byte NewLine
.text "he was made out to be."
.byte WaitForA

.byte Right_slot
.text "This was our first time fighting the troops"
.byte NewLine
.text "of House Friege... Now that the battle is over,"
.byte NewLine
.text "I can almost admire how well they fought."
.byte WaitForA
.byte ScrollText
.text "If this was the might of a skeleton crew"
.byte NewLine
.text "manning a small border outpost, I worry"
.byte NewLine
.text "how fierce their full army will prove to be..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Indeed. House Friege is one of the most"
.byte NewLine
.text "prestigious families in all of Jugdral—"
.byte NewLine
.text "they have a reputation to uphold."
.byte WaitForA
.byte ScrollText
.text "To save themselves from any embarrassment,"
.byte NewLine
.text "even the most lowly, rank-and-file soldiers are"
.byte NewLine
.text "drilled in the ways of knighthood and honor."
.byte WaitForA
.byte ScrollText
.text "Their army throughout the rest of the continent"
.byte NewLine
.text "will reflect this rigid discipline."
.byte WaitForA
.byte ScrollText
.text "They're a formidable enemy, no doubt—but"
.byte NewLine
.text "you fought with the best of them, Prince Leif."
.byte NewLine
.text "Your leadership this day was most admirable."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Ah... You mean how I had General Largo"
.byte NewLine
.text "captured instead of killed?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Indeed. This holy war must be fought to the"
.byte NewLine
.text "bitter end—but fighting it with such mercy"
.byte NewLine
.text "is what the late Prince Quan would have done."
.byte WaitForA
.byte ScrollText
.text "I pray that you remain this just and forthright"
.byte NewLine
.text "as our battles continue."
.byte NewLine
.text "Never forsake your knightly pride."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Knightly pride... Huh. I didn't really think of it"
.byte NewLine
.text "in those terms—I merely wanted to avoid"
.byte NewLine
.text "a needless slaughter if I could."
.byte WaitForA

.byte EndText


ch10endlargodead

.byte Right_slot
.word LoadPortrait
.word augustus_portrait

.byte Left_slot
.word LoadPortrait
.word leif_portrait
.text "August, did you see the Mage Knight"
.byte NewLine
.text "that fled midway through the battle?"
.byte WaitForA

.byte Right_slot
.text "Indeed—a woman knight, at that."
.byte NewLine
.text "She was a most difficult adversary."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Who was she?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I didn't recognize her, but there's little doubt"
.byte NewLine
.text "she rode for Fort Dundrum to bring word"
.byte NewLine
.text "of our incursion."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "So the enemy will know we're coming..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Just so. And Fort Dundrum is no common"
.byte NewLine
.text "encampment—it's regarded as impregnable,"
.byte NewLine
.text "even a permanent fixture of the region."
.byte WaitForA
.byte ScrollText
.text "Combine that with the advance warning"
.byte NewLine
.text "we've given them, and they'll have plenty of"
.byte NewLine
.text "time to shore up their defenses even further."
.byte WaitForA
.byte ScrollText
.text "The fort's commander is surely no slouch—"
.byte NewLine
.text "he's certain to make the most of the extra time"
.byte NewLine
.text "to prepare."
.byte WaitForA
.byte ScrollText
.text "Indeed, I fear we'll have a most difficult time"
.byte NewLine
.text "seizing the fort..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I see... Still, there's no other route"
.byte NewLine
.text "that would allow us to cross the mountains."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "That seems to be the hand we've been dealt,"
.byte NewLine
.text "my prince. If we're to arrive at Tahra in time"
.byte NewLine
.text "to act, we must take Fort Dundrum."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Then there's little point standing around"
.byte NewLine
.text "and complaining about it. The longer we wait,"
.byte NewLine
.text "the stronger the fort's defenses will be."
.byte WaitForA
.byte ScrollText
.text "This is our only chance,"
.byte NewLine
.text "and we'll make the most of it!"
.byte WaitForA

.byte EndText