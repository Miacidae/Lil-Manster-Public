ch22saiasleavecohenalive

.byte Right_slot
.word LoadPortrait
.word saias_portrait

.byte Left_slot
.word LoadPortrait
.word bishop_portrait
.text "Gods above, the enemy has advanced this far?"
.byte NewLine
.text "Saias, you must flee! Now!"
.byte WaitForA

.byte Right_slot
.text "No, Count!"
.byte NewLine
.text "Come what may, I'll stay by your side!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Still your tongue! Just do as I say!"
.byte NewLine
.text "The battle is lost!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Wait! Please!"
.byte NewLine
.text "I must—"
.byte WaitForA

.byte EndText


ch22saiasleavecohendead

.byte Right_slot
.word LoadPortrait
.word saias_portrait
.text "Count Cohen..."
.byte NewLine
.text "After everything...must I keep living...?"
.byte WaitForA

.byte EndText


ch22villagerpurewater

.byte Right_slot
.word LoadPortrait
.word black_mustache_portrait
.text "Hey, listen up! The Empire's got a whole"
.byte NewLine
.text "bunch of troops waitin' across the river,"
.byte NewLine
.text "an' some of 'em even know magic!"
.byte WaitForA
.byte ScrollText
.text "It's a death wish to head over there"
.byte NewLine
.text "without bein' prepared, so take this with you."
.byte WaitForA

.byte EndText


ch22villagerwarpstaff

.byte Right_slot
.word LoadPortrait
.word oldman_portrait
.text "By Nimble Njörun, the River Thracia"
.byte NewLine
.text "sure is wide, ain't it?"
.byte WaitForA
.byte ScrollText
.text "Now look, if you just storm in from the front,"
.byte NewLine
.text "the Empire will charge before all your troops"
.byte NewLine
.text "are done crossin' the river!"
.byte WaitForA
.byte ScrollText
.text "What you oughta do instead is use a"
.byte NewLine
.text "Warp staff to attack the Imperials from behind!"
.byte WaitForA
.byte ScrollText
.text "If you don't have one handy, it just so happens"
.byte NewLine
.text "that I have one here... I'd be willing to part"
.byte NewLine
.text "with it for a measly 35000 gold."
.byte WaitForA
.byte ScrollText
.text "......"
.byte WaitForA
.byte ScrollText
.text "Naw, I'm just kidding!"
.byte NewLine
.text "I hate the Empire as much as the next guy,"
.byte NewLine
.text "so the staff is yours, free of charge."
.byte WaitForA
.byte ScrollText
.text "...You shoulda seen the look on your face,"
.byte NewLine
.text "though! Heheheh!"
.byte WaitForA

.byte EndText


ch22villagerrescuestaff

.byte Right_slot
.word LoadPortrait
.word beardedman_portrait
.text "By Dapper Dáinn, the River Thracia"
.byte NewLine
.text "sure is wide, ain't it?"
.byte WaitForA
.byte ScrollText
.text "But you're already across, so you'd best"
.byte NewLine
.text "press your advantage while you can!"
.byte WaitForA
.byte ScrollText
.text "If things start to go wrong while you're"
.byte NewLine
.text "makin' your assault on the castle, just use this"
.byte NewLine
.text "Rescue staff to pull your folks outta trouble!"
.byte WaitForA
.byte ScrollText
.text "Truth be told, I've just been usin' it to warp"
.byte NewLine
.text "my chickens back to me when they get loose."
.byte NewLine
.text "I reckon you need it more than me."
.byte WaitForA

.byte EndText


ch22saiasbridge

.byte Right_slot
.word LoadPortrait
.word saias_portrait
.text "...That's it! NOW!"
.byte NewLine
.text "Collapse the bridge!"
.byte NewLine
.text "Tell the Gelbenritter to charge!"
.byte WaitForA

.byte EndText


ch22nosaiasbridge

.byte Right_slot
.word LoadPortrait
.word guard_portrait
.text "NOW!"
.byte NewLine
.text "Collapse the bridge!"
.byte WaitForA

.byte EndText


ch22reinhardtbridge

.byte Right_slot
.word LoadPortrait
.word reinhardt_portrait
.text "The enemy has finally gotten close enough!"
.byte NewLine
.text "In the name of the Gelbenritter, don't let them"
.byte NewLine
.text "take one more step toward the castle!"
.byte WaitForA

.byte EndText


ch22reinhardtolwen

.byte Right_slot
.word LoadPortrait
.word reinhardt_portrait

.byte Left_slot
.word LoadPortrait
.word olwen_portrait
.text "Brother...!"
.byte NewLine
.text "As soon as I saw the Gelbenritter were here,"
.byte NewLine
.text "I knew you couldn't be far, my lord brother..."
.byte WaitForA

.byte Right_slot
.text "It feels like a lifetime"
.byte NewLine
.text "since we last saw each other..."
.byte NewLine
.text "Thank the gods we were able to meet again."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Brother..."
.byte NewLine
.text "I..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Come now, there will be time to tell me"
.byte NewLine
.text "about all that's happened once you're safe."
.byte WaitForA
.byte ScrollText
.text "Everyone will be so glad to see you again—"
.byte NewLine
.text "every Friege worth a damn"
.byte NewLine
.text "has been worried sick about you."
.byte WaitForA
.byte ScrollText
.text "Heh, I'm sure you have plenty of good stories"
.byte NewLine
.text "to regale them with."
.byte WaitForA
.byte ScrollText
.text "Olwen..."
.byte NewLine
.text "Let's go back home together."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Home..."
.byte NewLine
.text "No, I cannot go back to Castle Friege."
.byte WaitForA
.byte ScrollText
.text "I can't show my face there until I right"
.byte NewLine
.text "the wrongs I helped commit,"
.byte NewLine
.text "and rescue the children taken by the Loptrians."
.byte WaitForA
.byte ScrollText
.text "Don't try to argue—"
.byte NewLine
.text "I've already made up my mind."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Olwen, listen to what you're saying!"
.byte NewLine
.text "We're family! You're my darling little sister!"
.byte NewLine
.text "I couldn't bear to lose you!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm more than just your little sister!"
.byte NewLine
.text "I'm my own woman!"
.byte WaitForA
.byte ScrollText
.text "This is the decision I came to"
.byte NewLine
.text "after thinking it over on my own."
.byte WaitForA
.byte ScrollText
.text "I know what it means for me. I've prepared"
.byte NewLine
.text "myself for the anguish it will bring."
.byte WaitForA
.byte ScrollText
.text "Not even the words of my own brother"
.byte NewLine
.text "could sway my mind now."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Then..."
.byte NewLine
.text "Then that makes us enemies."
.byte WaitForA
.byte ScrollText
.text "Do you have it in you to raise your blade"
.byte NewLine
.text "against me, Olwen?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "If you stand in our way, Brother, then..."
.byte NewLine
.text "I have no choice."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I see..."
.byte NewLine
.text "So you really are serious about this..."
.byte NewLine
.text "It's exactly as Bishop Saias said."
.byte WaitForA
.byte ScrollText
.text "You have indeed grown up—"
.byte NewLine
.text "that's clear to me now."
.byte WaitForA
.byte ScrollText
.text "You've become a formidable woman, Olwen."
.byte NewLine
.text "I'm proud of you."
.byte WaitForA

.byte EndText


ch22reinhardtolwen2

.byte Right_slot
.byte ScrollText
.text "This is the last time I'll be able to treat you"
.byte NewLine
.text "as my little sister, and not as my enemy."
.byte WaitForA
.byte ScrollText
.text "So, as your older brother,"
.byte NewLine
.text "I have one last gift for you."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "This is...?!"
.byte NewLine
.text "I recognize this sword!"
.byte NewLine
.text "It's your most prized weapon, Brother!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "A token of better days..."
.byte WaitForA
.byte NewLine
.text "Princess Ishtar gave me that sacred blade,"
.byte NewLine
.text "but I've no need for it now."
.byte NewLine
.text "You can put it to better use."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "But why?"
.byte NewLine
.text "I know how important it is to you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "That's..."
.byte NewLine
.text "That's none of your concern!"
.byte NewLine
.text "Now ride back to your army, Olwen!"
.byte WaitForA
.byte ScrollText
.text "The next time we meet on the battlefield,"
.byte NewLine
.text "I'll show you no mercy, sister of mine or no!"
.byte NewLine
.text "Am I clear?!"
.byte WaitForA

.byte EndText


ch22saiascohen

.byte Right_slot
.word LoadPortrait
.word saias_portrait

.byte Left_slot
.word LoadPortrait
.word bishop_portrait
.text "You've done plenty, Saias!"
.byte NewLine
.text "Quickly, you must begone from here!"
.byte WaitForA

.byte Right_slot
.text "I shall do no such thing!"
.byte NewLine
.text "I'll stay at your side until the end, Count!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "If you value me half as much as you claim,"
.byte NewLine
.text "be silent and listen!"
.byte WaitForA
.byte ScrollText
.text "Have you already forgotten how"
.byte NewLine
.text "my only daughter, my Aida, gave her life "
.byte NewLine
.text "to protect you from that fiend Manfroy?"
.byte WaitForA
.byte ScrollText
.text "Surely your lonely childhood in that isolated"
.byte NewLine
.text "monastery cannot have left your memory"
.byte NewLine
.text "so easily..."
.byte WaitForA
.byte ScrollText
.text "Yet hiding you in such a remote place"
.byte NewLine
.text "was all I could do to shield you from him."
.byte WaitForA
.byte ScrollText
.text "I could scarcely contain my laughter when"
.byte NewLine
.text "you finally came of age and were appointed a"
.byte NewLine
.text "military officer at Manfroy's own suggestion—"
.byte WaitForA
.byte NewLine
.text "the fool didn't realize who you really were,"
.byte NewLine
.text "having lost your trail years prior."
.byte WaitForA
.byte ScrollText
.text "Yet his mistake was your gain, and you set to"
.byte NewLine
.text "honing your skills as a tactician with a passion"
.byte NewLine
.text "that not even I knew you possessed."
.byte WaitForA
.byte ScrollText
.text "So obvious was your talent that it only"
.byte NewLine
.text "took you a decade to rise from a lowly officer"
.byte NewLine
.text "to the Royal Bishop of House Velthomer."
.byte WaitForA
.byte ScrollText
.text "And for a brief time, you were so trusted"
.byte NewLine
.text "by Emperor Arvis that Manfroy couldn't dare"
.byte NewLine
.text "harm you, and I was able to rest easy."
.byte WaitForA
.byte ScrollText
.text "But that sanctuary has come to an end:"
.byte WaitForA
.byte NewLine
.text "with the power of Prince Julius behind them,"
.byte NewLine
.text "the Loptr Church now wields more influence"
.byte NewLine
.text "than the Emperor himself."
.byte WaitForA
.byte ScrollText
.text "You bear the brand of Fjalar, Saias—"
.byte NewLine
.text "neither Prince Julius nor Princess Julia"
.byte NewLine
.text "inherited her mark."
.byte WaitForA
.byte ScrollText
.text "That is why Manfroy fears you so."
.byte WaitForA
.byte ScrollText
.text "For the sake of Fjalar, for the sake"
.byte NewLine
.text "of House Velthomer, you must live on"
.byte NewLine
.text "to preserve that holy bloodline."
.byte WaitForA
.byte ScrollText
.text "That is why you cannot die here—why"
.byte NewLine
.text "you must hide, and hone your true strength."
.byte NewLine
.text "More than just my life is at stake here!"
.byte WaitForA

.byte EndText


ch22saiasrein

.byte Right_slot
.word LoadPortrait
.word saias_portrait

.byte Left_slot
.word LoadPortrait
.word reinhardt_portrait
.text "It's been some time since last we met,"
.byte NewLine
.text "Bishop Saias."
.byte WaitForA

.byte Right_slot
.text "Commander Reinhardt!"
.byte NewLine
.text "What are you doing here, milord?"
.byte WaitForA
.byte ScrollText
.text "I'd heard Princess Ishtar had returned"
.byte NewLine
.text "to Miletos—weren't you with her?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I worry for my little sister..."
.byte NewLine
.text "I've stayed behind to see to her safety."
.byte WaitForA
.byte ScrollText
.text "Besides, Lady Ishtar has no need of me"
.byte NewLine
.text "any longer."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...Did the princess really tell you that?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "She did. With a man as powerful as"
.byte NewLine
.text "Prince Julius with her, she says,"
.byte NewLine
.text "there's no reason for me to escort her as well."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "......"
.byte WaitForA

.byte EndText


ch22saiasrein2

.byte Right_slot
.byte ScrollText
.text "Commander, this is difficult for me to ask,"
.byte NewLine
.text "but... I've heard that Lady Olwen has"
.byte NewLine
.text "defected to the rebels. Is this true?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...It is."
.byte WaitForA
.byte ScrollText
.text "But she's little more than a child."
.byte NewLine
.text "I'm certain she's being deceived"
.byte NewLine
.text "by the enemy, somehow..."
.byte WaitForA
.byte ScrollText
.text "If I can just speak with her,"
.byte NewLine
.text "I know I can bring her back to her senses."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Mm... I know that you'll always see her"
.byte NewLine
.text "as your little sister, but she's not quite so little"
.byte NewLine
.text "anymore. She's a grown adult, Commander."
.byte WaitForA
.byte ScrollText
.text "She wasn't going to be the little girl"
.byte NewLine
.text "chasing her big brother's coattails forever."
.byte WaitForA
.byte ScrollText
.text "How she lives her life is her choice to make."
.byte NewLine
.text "You must accept that."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "How Olwen lives her life..."
.byte NewLine
.text "Bishop, do you mean to say that"
.byte NewLine
.text "her path has split apart from mine?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Indeed..."
.byte NewLine
.text "Though I do agree you should speak with her,"
.byte NewLine
.text "if the gods give you a chance to do so."
.byte WaitForA

.byte EndText


ch22leifintro

.byte Right_slot
.word LoadPortrait
.word augustus_portrait

.byte Left_slot
.word LoadPortrait
.word leif_portrait2
.text "The River Thracia..."
.byte NewLine
.text "It's stunning just how vast it is."
.byte WaitForA
.byte ScrollText
.text "Its clean, shimmering waters are surely"
.byte NewLine
.text "the blessing of Earth Mother Ethniu herself."
.byte WaitForA

.byte Right_slot
.text "Indeed? I'm afraid its beauty is lost on me—"
.byte NewLine
.text "I see only a river stained red with blood."
.byte WaitForA
.byte ScrollText
.text "True, the river has granted this land"
.byte NewLine
.text "many blessings, but it also stirs greed"
.byte NewLine
.text "in the hearts of men."
.byte WaitForA
.byte ScrollText
.text "Countless battles have been fought"
.byte NewLine
.text "for control of this river—and now"
.byte NewLine
.text "we find ourselves about to fight another."
.byte WaitForA
.byte ScrollText
.text "Take heed, my prince."
.byte NewLine
.text "The last king of Leonster—your grandfather,"
.byte NewLine
.text "King Kalf—was slain on this very river."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "That's right..."
.byte NewLine
.text "My lord grandfather met his end"
.byte NewLine
.text "on this bridge..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Ah, at the risk of sounding pedantic, King Kalf"
.byte NewLine
.text "didn't perish here, but at the Thracian Bridge,"
.byte NewLine
.text "much further downstream."
.byte WaitForA
.byte ScrollText
.text "He fell in battle when the Knights of"
.byte NewLine
.text "Connaught—Raydrik's men—suddenly turned"
.byte NewLine
.text "against his army, shattering their formation."
.byte WaitForA
.byte ScrollText
.text "Now, bear in mind that the river is notoriously"
.byte NewLine
.text "easy to defend, but near impossible to attack."
.byte WaitForA
.byte ScrollText
.text "The enemy has likely stationed"
.byte NewLine
.text "powerful battalions here to halt our advance."
.byte WaitForA
.byte ScrollText
.text "I expect this battle will be"
.byte NewLine
.text "our most difficult yet, Prince Leif."
.byte NewLine
.text "Steel yourself for what lies ahead..."
.byte WaitForA

.byte EndText


ch22leifclosing

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word augustus_portrait
.text "We've made it across the river at last."
.byte WaitForA

.byte Right_slot
.text "“A river stained red with blood.”"
.byte NewLine
.text "Now I understand what you meant by that."
.byte NewLine
.text "Somehow, I can feel that taint upon the river..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...Blood that has been spilled can never be"
.byte NewLine
.text "returned. Wise men accept this, and see to it"
.byte NewLine
.text "that blood is only spilled for a worthy cause."
.byte WaitForA
.byte ScrollText
.text "Bah, enough of my ruminations."
.byte NewLine
.text "Come along, Prince Leif—"
.byte NewLine
.text "we must hurry to Munster."
.byte WaitForA

.byte EndText


ch22wm1

.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0001 ;leify-right
.word $0A05 ;y then x
.text "Leif's Liberation Army made its way"
.byte NewLine
.text "to Munster through the pass"
.byte WaitForA
.byte NewLine
.text "formerly guarded by Fort Danzig."
.byte WaitForA
.byte ScrollText

.byte EndText


ch22wm2

.text "Before them stood the vast River Thracia,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $013A ;reinhardt
.word $0A10 ;y then x
.byte NewLine
.text "the largest river in the Thracian Peninsula."
.byte WaitForA
.byte ScrollText
.text "It was this river's water that blessed much of"
.byte NewLine
.text "North Thracia with rich, fertile land."
.byte WaitForA
.byte ScrollText
.text "Just beyond its rapid waves,"
.byte NewLine
.text "the city of Munster awaited..."
.byte WaitForA

.byte EndText