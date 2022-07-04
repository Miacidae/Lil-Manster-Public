ch19conomorrecruit

.byte Right_slot
.word LoadPortrait
.word conomor_portrait

.byte Left_slot
.word LoadPortrait
.word miranda_portrait
.text "Conomor!"
.byte NewLine
.text "Stop your foolishness this instant!"
.byte WaitForA

.byte Right_slot
.text "Princess Miranda?!"
.byte NewLine
.text "What are you doing here?!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I was rescued by Prince Leif, and at my"
.byte NewLine
.text "urging, he commanded his army to come to"
.byte NewLine
.text "Ulster's aid."
.byte WaitForA
.byte ScrollText
.text "It cost him countless soldiers"
.byte NewLine
.text "and one of his closest advisors—"
.byte NewLine
.text "and what have YOU done for me?!"
.byte WaitForA
.byte ScrollText
.text "Just what is all this?!"
.byte NewLine
.text "What idiocy compelled you to make"
.byte NewLine
.text "Ulster's finest knights into Imperial lapdogs?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Ah..."
.byte NewLine
.text "You have my...deepest apologies..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "The enemy isn't Leonster, you fool!"
.byte NewLine
.text "The enemy is the Empire!"
.byte WaitForA
.byte ScrollText
.text "Command the Knights of Ulster"
.byte NewLine
.text "to aid in Leonster's retreat!"
.byte WaitForA
.byte ScrollText
.text "As ruler, I hereby declare that all of Ulster"
.byte NewLine
.text "is part of Prince Leif's Liberation Army!"
.byte NewLine
.text "Their mission is now our own!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "As you command, milady!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText
.text "Knights of Ulster!"
.byte NewLine
.text "From this moment onward, we are part"
.byte NewLine
.text "of the North Thracian Liberation Army!"
.byte WaitForA
.byte NewLine
.text "Serve Prince Leif as you would serve me!"
.byte WaitForA
.byte ScrollText
.text "We'll take sanctuary in Castle Leonster,"
.byte NewLine
.text "and plot the recapture of our motherland"
.byte NewLine
.text "from there!"
.byte WaitForA
.byte ScrollText
.text "So orders Her Highness Princess Miranda,"
.byte NewLine
.text "by royal decree!"
.byte WaitForA

.byte EndText


ch19amaldarecruit

.byte Right_slot
.word LoadPortrait
.word amalda_portrait

.byte Left_slot
.word LoadPortrait
.word schroff_portrait
.text "Lady Amalda, lower your sword!"
.byte NewLine
.text "It's me, Schroff!"
.byte WaitForA

.byte Right_slot
.text "Father Schroff?!"
.byte NewLine
.text "What in blazes are you doing here?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I came to meet with you."
.byte NewLine
.text "Prince Leif of the Liberation Army"
.byte NewLine
.text "has been waiting for you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "You...want me to betray my country?"
.byte WaitForA
.byte ScrollText
.text "That's not even in the realm of possibility,"
.byte NewLine
.text "Father Schroff. If it was, I... I wouldn't"
.byte NewLine
.text "be living in such torment."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Lady Amalda, a country isn't the plaything"
.byte NewLine
.text "of a king or nobleman. If a country has lost"
.byte NewLine
.text "its way, it's a knight's duty to lead it back."
.byte WaitForA
.byte ScrollText
.text "Will you stand idly by and allow evil"
.byte NewLine
.text "to consume your home, all out of the fear"
.byte NewLine
.text "of being called a traitor?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "It's not that simple!"
.byte NewLine
.text "I have to consider what will become"
.byte NewLine
.text "of my troops if I defect!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "They can decide for themselves."
.byte NewLine
.text "But your foremost duty is to your country—"
.byte NewLine
.text "follow your heart."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Mm... I understand."
.byte NewLine
.text "Father Schroff, I shall fight"
.byte NewLine
.text "with the Liberation Army."
.byte WaitForA
.byte ScrollText
.text "I know what I must do:"
.byte NewLine
.text "rescue the children stolen by the Empire!"
.byte WaitForA

.byte EndText


ch19balladpurewater

.byte Right_slot
.word LoadPortrait
.word youngman2_portrait
.text "Is it true the Leonster army was wiped out"
.byte NewLine
.text "at Ulster? Are we doomed to live"
.byte NewLine
.text "under the Empire forever?"
.byte WaitForA
.byte ScrollText
.text "Come, have a sip of this Pure Water"
.byte NewLine
.text "and toast with me to the final days of"
.byte NewLine
.text "Leonster."
.byte WaitForA
.byte ScrollText
.text "I was just about to sing of the Aed Massacre,"
.byte NewLine
.text "the start of this kingdom's decline..."
.byte WaitForA
.word PlayMusic
.byte $4F
.byte ScrollText
.text "In seasons past, Leonster thrived with Quan"
.byte NewLine
.text "upon its throne"
.byte WaitForA
.byte NewLine
.text "Though less esteemed,"
.byte NewLine
.text "Travant had dreamed"
.byte NewLine
.text "Of making it his own"
.byte WaitForA
.byte ScrollText
.text "Quan's kin by marriage, Sigurd, was the victim"
.byte NewLine
.text "of a coup"
.byte WaitForA
.byte NewLine
.text "Quan had no stake"
.byte NewLine
.text "But told him: “Take"
.byte NewLine
.text "the aid I bring to you.”"
.byte WaitForA
.byte ScrollText
.text "The limber bond of friendship was a noose"
.byte NewLine
.text "around his neck"
.byte WaitForA
.byte NewLine
.text "Quan planned a course"
.byte NewLine
.text "With half his force"
.byte NewLine
.text "Embarking on the trek"
.byte WaitForA
.byte ScrollText
.text "And so with gallant mounted knights and"
.byte NewLine
.text "Queen upon her steed"
.byte WaitForA
.byte NewLine
.text "He slowly marched"
.byte NewLine
.text "Determined, parched"
.byte NewLine
.text "Across the desert Aed"
.byte WaitForA
.byte ScrollText
.text "But oh how Travant had waited"
.byte NewLine
.text "And followed, hushed as death"
.byte WaitForA
.byte NewLine
.text "His flyers would not be sated"
.byte NewLine
.text "Till Quan drew his final breath"
.byte WaitForA
.byte ScrollText
.text "So from the sky a swarm of foes came soaring"
.byte NewLine
.text "into view"
.byte WaitForA
.byte NewLine
.text "Their numbers vast,"
.byte NewLine
.text "Their dragons fast,"
.byte NewLine
.text "Their lances aiming true"
.byte WaitForA
.byte ScrollText
.text "The startled knights could not escape,"
.byte NewLine
.text "the desert held them fast"
.byte WaitForA
.byte NewLine
.text "They had to stand"
.byte NewLine
.text "Upon the sand"
.byte NewLine
.text "As bloody wounds amassed"
.byte WaitForA
.byte ScrollText
.text "The heart that bled for Sigurd led his forces"
.byte NewLine
.text "to their end"
.byte WaitForA
.byte NewLine
.text "His kingdom snatched"
.byte NewLine
.text "His queen dispatched"
.byte NewLine
.text "No respite for his friend"
.byte WaitForA
.byte ScrollText
.text "This world is not an ally, it is sinister and cruel"
.byte WaitForA
.byte NewLine
.text "What Quan forgot"
.byte NewLine
.text "Travant did not:"
.byte NewLine
.text "The caring man's the fool"
.byte WaitForA
.byte ScrollText
.text "And Sigurd, he took to weeping"
.byte NewLine
.text "As Thracia took their rule"
.byte WaitForA
.byte NewLine
.text "There's no other code worth keeping"
.byte NewLine
.text "Aye, the caring man's the fool"
.byte WaitForA

.byte EndText


ch19silverswordhouse

.byte Right_slot
.word LoadPortrait
.word moustache_portrait
.text "Hornswogglin' Hoðr! This place"
.byte NewLine
.text "has turned into a damned warzone...!"
.byte WaitForA
.byte ScrollText
.text "Oh, yer a knight of Leonster, right?"
.byte NewLine
.text "Here, I'll lend ya my old Silver Sword."
.byte WaitForA
.byte ScrollText
.text "Might make the difference"
.byte NewLine
.text "between life and death!"
.byte WaitForA

.byte EndText


ch19killerlancehouse

.byte Right_slot
.word LoadPortrait
.word black_mustache_portrait
.text "Just because the other knights were defeated"
.byte NewLine
.text "at Ulster doesn't mean it's all over, right?"
.byte WaitForA
.byte ScrollText
.text "I mean, you folks are here, so that means"
.byte NewLine
.text "there's still more Knights of Leonster"
.byte NewLine
.text "to fight for our motherland!"
.byte WaitForA
.byte ScrollText
.text "But I reckon fightin' will be a lot easier with"
.byte NewLine
.text "good weapons, so take this here Killer Lance."
.byte WaitForA
.byte ScrollText
.text "It's mighty easy-to-use, so lop off a few"
.byte NewLine
.text "Imperial heads with it for me!"
.byte WaitForA

.byte EndText


ch19speedringhouse

.byte Right_slot
.word LoadPortrait
.word braidedgirl_portrait
.text "I've been saving the nearby Thracians"
.byte NewLine
.text "from starving by giving them"
.byte NewLine
.text "a tenth of our crops."
.byte WaitForA
.byte ScrollText
.text "This Speed Ring is what lets me"
.byte NewLine
.text "smuggle the supplies so quickly!"
.byte NewLine
.text "The others are shocked by how fast I am!"
.byte WaitForA
.byte ScrollText
.text "But with the Empire here now, it looks like"
.byte NewLine
.text "I won't be able to sneak food over for a while."
.byte NewLine
.text "Why don't you hang on to it for the time being?"
.byte WaitForA

.byte EndText


ch19purewaterhouse2

.byte Right_slot
.word LoadPortrait
.word beardedman_portrait
.text "Hey, are you the ones fighting to free Thracia?"
.byte NewLine
.text "Ah, you have such a noble spirit!"
.byte NewLine
.text "I'm so glad to have met you!"
.byte WaitForA
.byte ScrollText
.text "Here, take this Pure Water"
.byte NewLine
.text "to match the purity of your heart!"
.byte WaitForA
.byte ScrollText
.text "Best drink it, even if you don't use magic"
.byte NewLine
.text "yourself—lots of folks in the Imperial Army"
.byte NewLine
.text "use spells."
.byte WaitForA

.byte EndText


ch19healhouse

.byte Right_slot
.word LoadPortrait
.word youngman_portrait
.text "So the Imperial Army has come"
.byte NewLine
.text "to bring down the hammer..."
.byte WaitForA
.byte ScrollText
.text "Surely you have comrades"
.byte NewLine
.text "who've been injured."
.byte NewLine
.text "Use this—it's a Heal staff."
.byte WaitForA

.byte EndText


ch19ensorcelhouse

.byte Right_slot
.word LoadPortrait
.word younglady_portrait
.text "The Imperial Army looks to be"
.byte NewLine
.text "awfully strong..."
.byte NewLine
.text "You can't lose now!"
.byte WaitForA
.byte ScrollText
.text "Please, you're our only hope!"
.byte NewLine
.text "Uh, here! Take this staff!"
.byte NewLine
.text "It makes your magical senses stronger, I think."
.byte WaitForA
.byte ScrollText
.text "That tiny staff is all that's left of my garden"
.byte NewLine
.text "after my idiot brother tried to water my plants"
.byte NewLine
.text "with Pure Water..."
.byte WaitForA

.byte EndText


ch19healhouse2

.byte Right_slot
.word LoadPortrait
.word oldman_portrait
.text "Flyin' Forseti! The other knights"
.byte NewLine
.text "have been hurt pretty bad, right?!"
.byte WaitForA
.byte ScrollText
.text "Take this Heal staff, an' help them!"
.byte NewLine
.text "On the double!"
.byte WaitForA

.byte EndText


ch19windhouse

.byte Right_slot
.word LoadPortrait
.word teenageboy_portrait
.text "Pardon me, but, um..."
.byte NewLine
.text "Would this book be able to help you?"
.byte NewLine
.text "I'm fairly certain it's enchanted..."
.byte WaitForA
.byte ScrollText
.text "I've tried reading from it, and it summons"
.byte NewLine
.text "the most terrible storm—strong gusts"
.byte NewLine
.text "that sweep up anything that isn't nailed down."
.byte WaitForA
.byte ScrollText
.text "So, uh..."
.byte NewLine
.text "Please, just protect us..."
.byte WaitForA

.byte EndText


ch19opening1

.byte Right_slot
.word LoadPortrait
.word augustus_portrait

.byte Left_slot
.word LoadPortrait
.word leif_portrait2
.text "Everyone is ready, August."
.byte WaitForA

.byte Right_slot
.text "Hold a moment, my prince."
.byte NewLine
.text "It seems someone has come to the castle..."
.byte NewLine
.text "One of Dorius' men, I believe."
.byte WaitForA
.byte ScrollText
.word LoadPortrait
.word whitecloak_portrait
.text "Prince Leif!"
.byte NewLine
.text "I... I'm sorry..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Sorry for what?"
.byte NewLine
.text "What's happened?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Th-The Imperial Army counterattacked..."
.byte NewLine
.text "We were...slaughtered..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Wh-What?!"
.byte NewLine
.text "Where's Dorius?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Duke Dorius, he..."
.byte NewLine
.text "To ensure some of us could escape, he..."
.byte NewLine
.text "He rushed the enemy's flank."
.byte WaitForA
.byte ScrollText
.text "I'm sorry."
.byte NewLine
.text "He...met his end..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Dorius..."
.byte NewLine
.text "He's..."
.byte WaitForA
.byte ScrollText
.text "......"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "We weren't strong enough..."
.byte NewLine
.text "Forgive us!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Th-That's absurd..."
.byte NewLine
.text "This can't be..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word augustus_portrait
.text "Prince Leif, time is of the essence."
.byte NewLine
.text "We must withdraw all of our troops at once,"
.byte NewLine
.text "before our entire army is massacred."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "No..."
.byte NewLine
.text "This can't be happening..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Prince Leif!"
.byte NewLine
.text "Snap out of it!"
.byte WaitForA
.byte ScrollText
.text "If we lose our troops now,"
.byte NewLine
.text "Duke Dorius will have died for nothing!"
.byte WaitForA
.byte ScrollText
.text "We owe it to him to save"
.byte NewLine
.text "as many of our people as we can!"
.byte WaitForA

.byte EndText


ch19opening2

.byte Right_slot
.word LoadPortrait
.word wolfe_portrait

.byte Left_slot
.word LoadPortrait
.word blume_portrait
.text "...Now the maggots understand"
.byte NewLine
.text "what the Empire is capable of."
.byte WaitForA
.byte ScrollText
.text "I'll leave the rest to you, Wolfe."
.byte NewLine
.text "Know that House Friege expects nothing less"
.byte NewLine
.text "than Castle Leonster's recapture!"
.byte WaitForA

.byte Right_slot
.text "It shall be done."
.byte WaitForA

.byte EndText


ch19opening3conomor

.byte Right_slot
.word LoadPortrait
.word conomor_portrait
.text "So many of our people have died..."
.byte NewLine
.text "But as long as I still live, so too does Ulster."
.byte WaitForA

.byte EndText


ch19opening3amalda

.byte Right_slot
.word LoadPortrait
.word amalda_portrait
.text "I have a duty to protect my troops, but..."
.byte NewLine
.text "Is this truly right?"
.byte WaitForA
.byte ScrollText
.text "Ah, Father Schroff..."
.byte NewLine
.text "What I would give to hear your counsel..."
.byte WaitForA

.byte EndText


ch19closing1

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word augustus_portrait
.text "And so the Empire's retaliation begins..."
.byte NewLine
.text "There's nothing more we can do."
.byte NewLine
.text "We should retreat to the castle."
.byte WaitForA

.byte Right_slot
.text "August, this is all my fault..."
.byte NewLine
.text "It's like I killed Dorius myself..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You don't have the luxury"
.byte NewLine
.text "of wallowing in regret—not now."
.byte WaitForA
.byte ScrollText
.text "There will be time to atone to Duke Dorius"
.byte NewLine
.text "after you've defended Leonster."
.byte WaitForA
.byte ScrollText
.text "Summon all your patience and discipline—"
.byte NewLine
.text "you'll need it for what lies ahead."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...You're right."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Come now, I do bring some good news."
.byte WaitForA
.byte ScrollText
.text "I've heard multiple reports"
.byte NewLine
.text "that a large rebellion is taking place"
.byte NewLine
.text "in the eastern reaches of Isaach."
.byte WaitForA
.byte ScrollText
.text "They seem to be putting up a good fight"
.byte NewLine
.text "against the Empire, by all accounts."
.byte NewLine
.text "Do you know who their leader is?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "If the rebellion is in Isaach,"
.byte NewLine
.text "couldn't it be Prince Shannan?"
.byte WaitForA
.byte ScrollText
.text "Finn told me about him..."
.byte WaitForA
.byte NewLine
.text "He has the most gifted sword-arm"
.byte NewLine
.text "in all the world, and he's beloved by"
.byte NewLine
.text "his people..."
.byte WaitForA
.byte ScrollText
.text "In short, he's a far greater man than I..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Of course Prince Shannan is with the rebels,"
.byte NewLine
.text "but their leader is someone else."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "That being...?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Lord Seliph of House Chalphy."
.byte NewLine
.text "The people of Isaach and Grannvale alike"
.byte NewLine
.text "hail him as the “Scion of Light.”"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "L-Lord Seliph?!"
.byte NewLine
.text "Can this be true...?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I believe it is—and his father, Lord Sigurd,"
.byte NewLine
.text "was your uncle."
.byte WaitForA
.byte ScrollText
.text "The Crusader Sigurd..."
.byte WaitForA
.byte NewLine
.text "As recently as a decade ago,"
.byte NewLine
.text "he was reviled as a traitor,"
.byte NewLine
.text "but nowadays he's a popular folk hero."
.byte WaitForA
.byte ScrollText
.text "He saw through the Emperor's schemes"
.byte NewLine
.text "from the beginning, and died trying"
.byte NewLine
.text "to protect the world from his machinations."
.byte WaitForA
.byte ScrollText
.text "Bards spread his tale across the land, and"
.byte NewLine
.text "it captivated the hearts of every man, woman,"
.byte NewLine
.text "and child suffering under the Empire's rule..."
.byte WaitForA
.byte NewLine
.text "And so he's become more legend than man."
.byte WaitForA
.byte ScrollText
.text "Now, the child of that legend"
.byte NewLine
.text "is fighting to realize his father's dream..."
.byte WaitForA
.byte ScrollText
.text "The people feel hope once again."
.byte NewLine
.text "And blinded by that hope,"
.byte NewLine
.text "they wouldn't hesitate to die for his cause..."
.byte WaitForA
.byte ScrollText
.text "This is a bounty from the gods."
.byte NewLine
.text "We couldn't have crafted"
.byte NewLine
.text "a more perfect opportunity ourselves."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "......"
.byte WaitForA
.byte ScrollText
.text "What exactly are you saying?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm saying there's a reason so many people"
.byte NewLine
.text "are ready to die for Lord Seliph."
.byte NewLine
.text "It's not just because he's a strong warrior."
.byte WaitForA
.byte ScrollText
.text "Our era demands a hero."
.byte NewLine
.text "The people clamor for one, and so...someone"
.byte NewLine
.text "has crafted Lord Seliph to be their hero."
.byte WaitForA
.byte ScrollText
.text "Forged him, if you will, in much the same way"
.byte NewLine
.text "one forges metal into a blade—taking a man"
.byte NewLine
.text "and sculpting him into what the people need."
.byte WaitForA
.byte ScrollText
.text "Do you understand?"
.byte WaitForA
.byte ScrollText
.text "No one chooses to become a hero."
.byte NewLine
.text "They're willed into a hero by the people"
.byte NewLine
.text "around them, shaped by the needs of others."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "August..."
.byte NewLine
.text "Does that mean...the people in my life"
.byte NewLine
.text "crafted me to be what they needed, too?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Mm... You'll have to come to your own"
.byte NewLine
.text "conclusions on the matter."
.byte WaitForA
.byte ScrollText
.text "Though I will say this..."
.byte WaitForA
.byte NewLine
.text "Recall that Duke Dorius lost an arm"
.byte NewLine
.text "protecting you—and now he's traded"
.byte NewLine
.text "his life for yours."
.byte WaitForA
.byte ScrollText
.text "Have you ever stopped to wonder"
.byte NewLine
.text "why he did that?"
.byte WaitForA
.byte ScrollText
.text "Why do so many people"
.byte NewLine
.text "keep sacrificing themselves for you?"
.byte NewLine
.text "Why do so many hail you as a hero?"
.byte WaitForA
.byte ScrollText
.text "Think on that, and think well..."
.byte WaitForA

.byte EndText


ch19closing2

.byte Right_slot
.word LoadPortrait
.word youngman_portrait

.byte Left_slot
.word LoadPortrait
.word augustus_portrait
.text "The prince has ordered that he not"
.byte NewLine
.text "be disturbed, for the time being."
.byte NewLine
.text "You may state your business to me instead."
.byte WaitForA

.byte Right_slot
.text "Oh, well, uh... We fled from Ulster, y'see."
.byte NewLine
.text "The Imperials were hot on our trail"
.byte NewLine
.text "when your army showed up to help us!"
.byte WaitForA
.byte ScrollText
.text "We just wanted to give the prince"
.byte NewLine
.text "this Master Seal, as a way of sayin' thanks."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Leave it with me. I'll deliver it to the prince,"
.byte NewLine
.text "and convey your gratitude."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "All right. Thank you."
.byte WaitForA

.byte EndText


ch19wm1

.text "Already a day behind Dorius,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $033C ;dorius
.word $0B0E ;y then x
.byte NewLine
.text "Leif's forces were finally rested and ready."
.byte WaitForA
.byte ScrollText

.byte EndText


ch19wm2

.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0101 ;leify-left
.word $0013 ;y then x
.text "He was just about to march for Ulster"
.byte WaitForA
.byte NewLine
.text "when a most unexpected message"
.byte NewLine
.text "was delivered to him."
.byte WaitForA
.byte ScrollText

.byte EndText


ch19wm3

.text "It was this moment that marked Leif's"
.byte NewLine
.text "beginning down a long road of hardship..."
.byte WaitForA

.byte EndText