ch17Bamaldacharge

.byte Right_slot
.word LoadPortrait
.word amalda_portrait
.text "The castle is in jeopardy..."
.byte NewLine
.text "All troops, make for the castle grounds!"
.byte NewLine
.text "Don't fall behind the rebels!"
.byte WaitForA

.byte EndText


ch17Bopengate1

.byte Right_slot
.word LoadPortrait
.word colho_portrait
.text "Oh-ho, so you're attackin' Castle Leonster?"
.byte NewLine
.text "Well, lemme bend yer ear for a second..."
.byte WaitForA
.byte ScrollText
.text "See, it just so happens that I've cooked up"
.byte NewLine
.text "a little scheme to get past the eastern gate."
.byte WaitForA
.byte NewLine
.text "My boys can have that thing wide open"
.byte NewLine
.text "in two shakes of a lamb's tail."
.byte WaitForA
.byte ScrollText
.text "So, how 'bout it? Feel like taking a shortcut?"
.byte WaitForA
.byte ScrollText
.text "Won't be free, a' course. Nothin' is."
.byte NewLine
.text "But you pile up an even 20000 gold"
.byte NewLine
.text "in front of me an' we'll call it a deal."
.byte WaitForA
.byte ScrollText
.text "What, does it sound too expensive?"
.byte NewLine
.text "Well, we ain't stupid."
.byte NewLine
.text "We'll be the ones putting our lives on the line."
.byte WaitForA
.byte ScrollText

.byte EndText


ch17Bopengate2

.word $2E00
.long $8CBBBC
.byte Right_slot
.word LoadPortrait
.word colho_portrait
.text "So... What's it gonna be?"
.byte NewLine
.text "     Pay 20,000 gold."
.byte NewLine
.text "     Save the money and make a frontal assault."
.word $2E00
.long $8CBBCC

.byte EndText


ch17Bopengatenomoney

.byte Right_slot
.word LoadPortrait
.word colho_portrait
.text "What kind of conqueror doesn't have"
.byte NewLine
.text "a full wallet? Ugh, just see yourself out."
.byte WaitForA

.byte EndText


ch17Bhouseother

.byte Right_slot
.word LoadPortrait
.word elder_portrait
.text "You're with the Leonster army, aren't you?"
.byte NewLine
.text "Where's Lord Leif?"
.byte WaitForA

.byte EndText


ch17Belder1

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word elder_portrait
.text "Ah, Lord Leif..."
.byte NewLine
.text "Welcome home."
.byte WaitForA
.byte NewLine
.text "The people of Leonster have long awaited"
.byte NewLine
.text "this day..."
.byte WaitForA

.byte Right_slot
.text "You're the village elder, I take it?"
.byte WaitForA
.byte ScrollText
.text "I can't imagine how your people"
.byte NewLine
.text "must have suffered over these long years..."
.byte NewLine
.text "I'm sorry for everything you've been through."
.byte WaitForA
.byte ScrollText
.text "But that all ends today."
.byte WaitForA
.byte ScrollText
.text "I'll personally be leading the"
.byte NewLine
.text "Knights of Leonster into battle"
.byte NewLine
.text "to recapture the castle."
.byte WaitForA
.byte ScrollText
.text "Believe in our victory!"
.byte NewLine
.text "Leonster shall rise again!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Prince, there's something I must ask of you."
.byte NewLine
.text "Let us help you reach the castle."
.byte NewLine
.text "Please."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Help us...?"
.byte NewLine
.text "You mean your people wish to fight?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Indeed."
.byte NewLine
.text "We'll not bear the abuses of the Empire"
.byte NewLine
.text "for one moment longer."
.byte WaitForA
.byte ScrollText
.text "We always knew the day would come"
.byte NewLine
.text "to liberate the motherland, and we've been"
.byte NewLine
.text "stockpiling weapons in secret."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word dorius_portrait
.text "With respect, Elder, there are numerous"
.byte NewLine
.text "ballistae positioned in the castle grounds."
.byte WaitForA
.byte ScrollText
.text "Your poorly-armed militia"
.byte NewLine
.text "will be easy pickings for them."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I know that."
.byte NewLine
.text "I don't expect any of us to make it back alive."
.byte WaitForA
.byte ScrollText
.text "All we could do is be the prince's shield,"
.byte NewLine
.text "but we would do it gladly."
.byte WaitForA
.byte ScrollText
.text "We can attract the ballistae's attention, and"
.byte NewLine
.text "lure them away from your forces. While we"
.byte NewLine
.text "keep them busy, the prince can breach the—"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word leif_portrait2
.text "Out of the question!"
.byte NewLine
.text "What's the point of winning back my country"
.byte NewLine
.text "if I sacrifice my people to do it?!"
.byte WaitForA
.byte ScrollText
.text "I won't allow such a thing!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Lord Leif..."
.byte NewLine
.text "Do you have any idea just how much pain"
.byte NewLine
.text "we've endured over these past ten years?"
.byte WaitForA
.byte ScrollText
.text "Marquess Gustav took our women."
.byte NewLine
.text "The Loptr Church took our children."
.byte WaitForA
.byte ScrollText
.text "The few who tried to resist were killed in the"
.byte NewLine
.text "most brutal ways imaginable, and then their"
.byte NewLine
.text "families were killed too—as an example."
.byte WaitForA
.byte ScrollText
.text "My prince, my sovereign lord..."
.byte NewLine
.text "This is the only home we've ever known."
.byte NewLine
.text "Simple folk like us can't live without our home."
.byte WaitForA
.byte ScrollText
.text "So if it means regaining that home,"
.byte NewLine
.text "we'll do whatever it takes."
.byte WaitForA
.byte ScrollText
.text "We offer you our lives,"
.byte NewLine
.text "and we have no regrets."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Elder, sir..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word augustus_portrait
.text "Prince Leif... When a country falls to ruin,"
.byte NewLine
.text "its people fall to ruin as well. For what life"
.byte NewLine
.text "awaits those left behind without a home?"
.byte WaitForA
.byte ScrollText
.text "They speak with the same tawdry devotion"
.byte NewLine
.text "one would expect from a knight—and like"
.byte NewLine
.text "a knight, they seem utterly resigned to die."
.byte WaitForA
.byte ScrollText
.text "Even after years of oppression, they're still"
.byte NewLine
.text "consumed by this childish sentimentality."
.byte NewLine
.text "And if they're so set in their ways..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "You..."
.byte NewLine
.text "August, you mean to say"
.byte NewLine
.text "I should accept their offer?!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm merely saying it's worth considering."
.byte NewLine
.text "You wanted “a better way” to seize the castle,"
.byte NewLine
.text "did you not? This may very well be it."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...Dorius, what say you?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word dorius_portrait
.text "I can only imagine how the villagers must feel,"
.byte NewLine
.text "but even so, I cannot condone this."
.byte WaitForA
.byte ScrollText
.text "Regardless, the choice is yours to make,"
.byte NewLine
.text "Prince Leif."
.byte WaitForA

.byte EndText


ch17Belder2

.word $2E00
.long $8CBBBC
.byte Right_slot
.word LoadPortrait
.word leif_portrait2
.byte Left_slot
.word LoadPortrait
.word dorius_portrait
.text "What is your command?"

.byte Right_slot
.text "Let's see..."
.byte NewLine
.text "     We'll accept the villagers' help."
.byte NewLine
.text "     We'll attack on our own."
.word $2E00
.long $8CBBCC

.byte EndText


ch17Bopengate3

.byte Right_slot
.word LoadPortrait
.word gomez_portrait
.text "Been waitin' for ya."
.byte NewLine
.text "I heard the whole story from the boss."
.byte NewLine
.text "Well... Good luck, I guess."
.byte WaitForA

.byte EndText


ch17Bopening1

.byte Right_slot
.word LoadPortrait
.word leif_portrait

.byte Left_slot
.word LoadPortrait
.word augustus_portrait
.text "My prince, may I present your sovereign land:"
.byte NewLine
.text "Castle Leonster is in sight."
.byte WaitForA
.byte ScrollText
.text "We're approaching from the rear gate,"
.byte NewLine
.text "so the enemy shouldn't be expecting us."
.byte WaitForA

.byte Right_slot
.text "I'm not sure it will be so easy, August."
.byte WaitForA
.byte ScrollText
.text "The cliffs are impassable, and if we go"
.byte NewLine
.text "around them and head west toward the gate,"
.byte NewLine
.text "the ballistae will have a clear shot at us."
.byte WaitForA
.byte ScrollText
.text "What are we to do?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Indeed..."
.byte NewLine
.text "I admit, I didn't foresee the enemy"
.byte NewLine
.text "preparing so many ballistae."
.byte WaitForA
.byte ScrollText
.text "Yet if we go about things too slowly,"
.byte NewLine
.text "we'll lose the element of surprise,"
.byte NewLine
.text "and enemy reinforcements will overwhelm us."
.byte WaitForA
.byte ScrollText
.text "Ah, this is most vexing..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Dorius, what would you suggest?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word dorius_portrait
.text "At the very least, our goal is simple:"
.byte NewLine
.text "our army won't be able to advance"
.byte NewLine
.text "as long as those damned ballistae are there."
.byte WaitForA
.byte ScrollText
.text "As for how to eliminate them,"
.byte NewLine
.text "we could either send in mages,"
.byte NewLine
.text "or use aerial units to attack from above."
.byte WaitForA
.byte ScrollText
.text "Either way, we'll likely suffer a few losses."
.byte NewLine
.text "We need to prepare ourselves for that."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I understand, but keep thinking."
.byte NewLine
.text "There may yet be a better way."
.byte WaitForA

.byte EndText


ch17Bopening2

.byte Right_slot
.word LoadPortrait
.word amalda_portrait

.byte Left_slot
.word LoadPortrait
.word palman_portrait
.text "General Amalda, how is it a fine soldier"
.byte NewLine
.text "like you got stuck guarding the rear gate?"
.byte WaitForA

.byte Right_slot
.text "Evidently, my comments touched a nerve"
.byte NewLine
.text "with Marquess Gustav..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Still bickering about the child hunts, I take it?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "It's more than a simple row."
.byte WaitForA
.byte ScrollText
.text "Gustav is seizing children"
.byte NewLine
.text "from the nearby villages despite having"
.byte NewLine
.text "no order from the king to do so."
.byte WaitForA
.byte ScrollText
.text "It's obvious he's trying to curry favor"
.byte NewLine
.text "with the Loptr Church—handing over"
.byte NewLine
.text "innocent children like little presents."
.byte WaitForA
.byte ScrollText
.text "Could you forgive such a thing,"
.byte NewLine
.text "if you were in my position?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Now, now, Lady Amalda."
.byte NewLine
.text "Just take a breath."
.byte WaitForA
.byte ScrollText
.text "I understand how you feel, but remember,"
.byte NewLine
.text "the child hunts were instituted"
.byte NewLine
.text "by Emperor Arvis himself."
.byte WaitForA
.byte ScrollText
.text "So sooner or later, regardless of how vocally"
.byte NewLine
.text "you oppose it, all the local children"
.byte NewLine
.text "will be seized and taken to Belhalla."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "But why?!"
.byte NewLine
.text "Why is all this happening?"
.byte WaitForA
.byte ScrollText
.text "I believed in Emperor Arvis,"
.byte NewLine
.text "I longed to become a knight in his service..."
.byte NewLine
.text "How did he go so wrong?"
.byte WaitForA

.byte EndText


ch17Bclosing1

.byte Right_slot
.word LoadPortrait
.word augustus_portrait

.byte Left_slot
.word LoadPortrait
.word leif_portrait2
.text "We've finally seized the castle gates,"
.byte NewLine
.text "but we don't know what awaits us inside..."
.byte WaitForA
.byte ScrollText
.text "August, let's hear the intelligence"
.byte NewLine
.text "you've gathered."
.byte WaitForA

.byte Right_slot
.text "Ahem..."
.byte WaitForA
.byte ScrollText
.text "The castle's commander is a man named"
.byte NewLine
.text "Gustav, a close associate of King Bloom."
.byte NewLine
.text "He is...a man of many vices."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Marquess Gustav..."
.byte NewLine
.text "For the past decade,"
.byte NewLine
.text "he's ruled Leonster with an iron fist."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Frankly, he's a second-rate commander,"
.byte NewLine
.text "but he makes up for it by lavishing his troops"
.byte NewLine
.text "with expensive equipment."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Anything else we should be aware of?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Well, the real problem will be General Xavier."
.byte WaitForA
.byte ScrollText
.text "His skills on the battlefield are"
.byte NewLine
.text "quite renowned, and he commands"
.byte NewLine
.text "a battalion of heavily-armored knights."
.byte WaitForA

.byte ScrollText
.word LoadPortrait
.word dorius_portrait
.text "Xavier?!"
.byte NewLine
.text "Ngh..."
.byte WaitForA
.byte NewLine
.text "A thousand deaths won't be enough"
.byte NewLine
.text "for that traitor!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I...take it you know him, Dorius?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hah... As ashamed as I am to admit it,"
.byte NewLine
.text "Xavier was once an esteemed general"
.byte NewLine
.text "of Leonster."
.byte WaitForA
.byte ScrollText
.text "He was known for his sense of justice,"
.byte NewLine
.text "and had everyone's utmost trust."
.byte WaitForA
.byte ScrollText
.text "But the instant Leonster fell, he betrayed us,"
.byte NewLine
.text "and defected to the invaders!"
.byte WaitForA
.byte ScrollText
.text "The shameless cur... I cannot forgive him!"
.byte NewLine
.text "No force in all the heavens"
.byte NewLine
.text "will keep my blade from his throat!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word elder_portrait
.text "It's not what you think, Duke Dorius!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "You're...the village elder?"
.byte NewLine
.text "What are you talking about?"
.byte WaitForA
.byte ScrollText
.text "Do you mean to protect"
.byte NewLine
.text "that damnable turncoat?!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "General Xavier did everything for our sake."
.byte NewLine
.text "He joined the invaders out of necessity,"
.byte NewLine
.text "to help guarantee our safety."
.byte WaitForA
.byte ScrollText
.text "Leonster was in chaos after being defeated,"
.byte NewLine
.text "and we common folk were abandoned—"
.byte NewLine
.text "left to the enemy's mercy."
.byte WaitForA
.byte ScrollText
.text "The general showed us pity,"
.byte NewLine
.text "and traded his own honor for our lives."
.byte WaitForA
.byte ScrollText
.text "Had he not intervened,"
.byte NewLine
.text "myself and all the other villagers"
.byte NewLine
.text "wouldn't be alive today."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Is this true?!"
.byte NewLine
.text "No, it can't be! The prince has returned,"
.byte NewLine
.text "yet he still serves the Empire!"
.byte WaitForA
.byte ScrollText
.text "If he and his men would just turn against them,"
.byte NewLine
.text "the castle would be as good as ours!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Bah, would that things were that simple..."
.byte WaitForA
.byte ScrollText
.text "You see, the general has eight adjutants—"
.byte NewLine
.text "they're as close as kin, and they've shouldered"
.byte NewLine
.text "life's burdens together."
.byte WaitForA
.byte ScrollText
.text "The families of these eight adjutants"
.byte NewLine
.text "are being held hostage inside the castle."
.byte WaitForA
.byte ScrollText
.text "And despite being their superior,"
.byte NewLine
.text "the general hasn't the heart to act"
.byte NewLine
.text "without the consent of his men."
.byte WaitForA
.byte ScrollText
.text "Say what you will, but he cares deeply"
.byte NewLine
.text "for their well-being..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word leif_portrait2
.text "Then our plan is obvious!"
.byte NewLine
.text "If we rescue the hostages, the general"
.byte NewLine
.text "and his men will be freed of their servitude!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You...think it will be that easy?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "He deserves an apology for everything"
.byte NewLine
.text "he's been through... As the last living heir"
.byte NewLine
.text "to House Leonster, I owe him that much!"
.byte WaitForA

.byte EndText


ch17Bclosing2

.byte Left_slot
.byte ScrollText
.text "Ah, one other thing."
.byte NewLine
.text "The people of my village bade me"
.byte NewLine
.text "give this to you, Lord Leif."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Is this...a Master Seal?"
.byte NewLine
.text "They were awarded only"
.byte NewLine
.text "to the most valiant of knights..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Indeed. We couldn't be of much help to you"
.byte NewLine
.text "in seizing the castle, so perhaps you can"
.byte NewLine
.text "make use of that medal instead."
.byte WaitForA
.byte ScrollText
.text "That's what we figured, anyway."
.byte NewLine
.text "Perhaps you could award it"
.byte NewLine
.text "to one of your own soldiers."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I accept your gift, Elder."
.byte NewLine
.text "Give everyone in the village my thanks."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "If you can recapture the castle,"
.byte NewLine
.text "you'll truly be a prince once again."
.byte WaitForA
.byte ScrollText
.text "If you succeed...it will be such a"
.byte NewLine
.text "grand moment that no ceremony, no holiday"
.byte NewLine
.text "could be its equal."
.byte WaitForA
.byte ScrollText
.text "We await the hour of your victory!"
.byte WaitForA

.byte EndText


ch17Bwm1

.text "Leaving the forest behind them,"
.byte WaitForA
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0100 ;leif
.word $0912 ;y then x
.byte NewLine
.text "the Liberation Army finally reached"
.byte NewLine
.text "the southern gates of Leonster."
.byte WaitForA
.byte ScrollText
.text "Yet an arduous task awaited them:"
.byte WaitForA
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0070 ;paulus
.word $0109 ;y then x
.byte NewLine
.text "the gates stood atop high cliffs, and were"
.byte NewLine
.text "defended by vast numbers of ballistae."
.byte WaitForA
.byte ScrollText
.text "It was painfully clear that seizing the gates"
.byte NewLine
.text "would be anything but simple..."
.byte WaitForA

.byte EndText