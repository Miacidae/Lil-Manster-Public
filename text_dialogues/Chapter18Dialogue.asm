ch18xavierrecruitment

.byte Right_slot
.word LoadPortrait
.word xavier_portrait

.byte Left_slot
.word LoadPortrait
.word leif_portrait2
.text "General Xavier?!"
.byte WaitForA

.byte Right_slot
.text "Prince Leif..."
.byte WaitForA
.byte ScrollText
.text "Mm, good. This is how it's supposed to be."
.byte NewLine
.text "I wanted to see you one last time."
.byte NewLine
.text "I've no regrets left, now."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "General, what are you saying...?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Ah... Need I spell it out?"
.byte WaitForA
.byte ScrollText
.text "Regardless of my reasons, I betrayed"
.byte NewLine
.text "the crown. I owe the kingdom a terrible debt,"
.byte NewLine
.text "and that cannot be changed."
.byte WaitForA
.byte ScrollText
.text "But the guilt rests on my shoulders,"
.byte NewLine
.text "and mine alone."
.byte WaitForA
.byte ScrollText
.text "My adjutants are innocent,"
.byte NewLine
.text "and merely followed my orders."
.byte NewLine
.text "Their only crime was placing their trust in me."
.byte WaitForA
.byte ScrollText
.text "Spare them from your justice,"
.byte NewLine
.text "I beg of you..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "General..."
.byte NewLine
.text "The way you've had to live..."
.byte NewLine
.text "Please, raise your head."
.byte WaitForA
.byte ScrollText
.text "I'm the one that owes you a terrible debt."
.byte NewLine
.text "I fled the castle thinking it would protect the"
.byte NewLine
.text "people, but all I really did was abandon them."
.byte WaitForA
.byte ScrollText
.text "I failed the highest duty of a ruler,"
.byte NewLine
.text "and left you to shoulder the burden."
.byte NewLine
.text "For years, you've carried this weight alone..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Prince Leif..."
.byte NewLine
.text "I... I... I'm glad I lived to see this day."
.byte NewLine
.text "I didn't think it'd come so soon."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word dorius_portrait
.text "Xavier, I too must offer you"
.byte NewLine
.text "my sincerest apologies."
.byte NewLine
.text "I had...erred in my judgment."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Duke Dorius..."
.byte NewLine
.text "Your words are more than I deserve."
.byte NewLine
.text "I... I'm..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Prince Leif needs men like you, Xavier."
.byte NewLine
.text "It's time to come home."
.byte NewLine
.text "Serve him once again."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hah..."
.byte NewLine
.text "If these old bones can do you any good,"
.byte NewLine
.text "they're yours."
.byte WaitForA
.byte ScrollText
.text "To fight against the Empire is all I could want!"
.byte WaitForA

.byte EndText


ch18villager1

.byte Right_slot
.word LoadPortrait
.word $006B	;purple cape Liszt

.byte Left_slot
.word LoadPortrait
.word $009A	;yellow young lady
.text "Paaapa!"
.byte NewLine
.text "Heeey, Papa...!"
.byte WaitForA

.byte Right_slot
.text "Y-You're all right!"
.byte NewLine
.text "Take my hand, sweetie—"
.byte NewLine
.text "Papa's taking you home."
.byte WaitForA

.byte EndText


ch18villager2

.byte Right_slot
.word LoadPortrait
.word $0071	;brown cape Paulus

.byte Left_slot
.word LoadPortrait
.word oldlady3_portrait
.text "It's you!"
.byte WaitForA

.byte Right_slot
.text "Y-You're safe?!"
.byte WaitForA
.byte ScrollText
.text "Look, there's no reason for us"
.byte NewLine
.text "to stick around here now."
.byte NewLine
.text "Let's go home..."
.byte WaitForA

.byte EndText


ch18villager3

.byte Right_slot
.word LoadPortrait
.word guard_portrait

.byte Left_slot
.word LoadPortrait
.word boy_portrait
.text "Father!"
.byte NewLine
.text "Oh, Father, I'm so sorry!"
.byte WaitForA

.byte Right_slot
.text "H-How..."
.byte NewLine
.text "How did you get here?!"
.byte WaitForA
.byte ScrollText
.text "...Actually, you know what?"
.byte NewLine
.text "I couldn't care less what miracle"
.byte NewLine
.text "brought you back to me."
.byte WaitForA
.byte ScrollText
.text "Let's just get outta here."
.byte NewLine
.text "Never look a gift horse in the mouth, son!"
.byte WaitForA

.byte EndText


ch18villager4

.byte Right_slot
.word LoadPortrait
.word dvorak_portrait

.byte Left_slot
.word LoadPortrait
.word $0099	;blue young lady portrait
.text "Stop it! Lower your weapon!"
.byte NewLine
.text "I'm here! You don't have to fight anymore!"
.byte WaitForA

.byte Right_slot
.text "Aw, really? I was just starting to enjoy it, too!"
.byte NewLine
.text "I-I mean..."
.byte NewLine
.text "If you're safe, that's all that matters."
.byte WaitForA
.byte NewLine
.text "Let's see ourselves out!"
.byte WaitForA

.byte EndText


ch18villager5

.byte Right_slot
.word LoadPortrait
.word blond_portrait

.byte Left_slot
.word LoadPortrait
.word braidedgirl_portrait
.text "HEY!"
.byte NewLine
.text "Just what do you think you're doing?!"
.byte NewLine
.text "I have half a mind to run off without you!"
.byte WaitForA

.byte Right_slot
.text "Ah, it's not what you think!"
.byte NewLine
.text "I was only helping the Empire"
.byte NewLine
.text "because you'd been imprisoned—"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText
.text "Hey, wait for me!"
.byte NewLine
.text "Waaait!"
.byte WaitForA

.byte EndText


ch18villager6

.byte Right_slot
.word LoadPortrait
.word whitecloak_portrait

.byte Left_slot
.word LoadPortrait
.word elder_portrait
.text "I'm sorry for everything you've been through..."
.byte NewLine
.text "All this, just for my sake..."
.byte WaitForA

.byte Right_slot
.text "Ah, Father! You're alive!"
.byte NewLine
.text "My kin is safe—that's all I know about life"
.byte NewLine
.text "and all I need to know."
.byte WaitForA
.byte ScrollText
.text "Come on."
.byte NewLine
.text "Let's get out of here."
.byte WaitForA

.byte EndText


ch18villager7

.byte Right_slot
.word LoadPortrait
.word collar_portrait

.byte Left_slot
.word LoadPortrait
.word oldlady_portrait
.text "......"
.byte WaitForA

.byte Right_slot
.text "M-Mother?!"
.byte WaitForA
.byte ScrollText
.text "Ah... It's all right, Mother."
.byte NewLine
.text "You don't need to say anything."
.byte NewLine
.text "I'm taking you home..."
.byte WaitForA

.byte EndText


ch18villager8

.byte Right_slot
.word LoadPortrait
.word $0062	;brown hair Rumaigh

.byte Left_slot
.word LoadPortrait
.word girl_portrait
.text "Papa!"
.byte NewLine
.text "Papa, stop it!"
.byte WaitForA

.byte Right_slot
.text "Ah! You're all right!"
.byte NewLine
.text "I'm so glad..."
.byte WaitForA
.byte ScrollText
.text "Come along, now."
.byte NewLine
.text "With you back, there's no reason"
.byte NewLine
.text "to fight for the damned Empire!"
.byte WaitForA

.byte EndText


ch18opening1

.byte Right_slot
.word LoadPortrait
.word xavier_portrait

.byte Left_slot
.word LoadPortrait
.word gustav_portrait
.text "I trust we have an understanding, Xavier?"
.byte WaitForA

.byte Right_slot
.text "...Milord?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "An understanding that I'm the only general"
.byte NewLine
.text "who will tolerate your worthless life."
.byte WaitForA
.byte ScrollText
.text "I could've killed you at any moment"
.byte NewLine
.text "over these past several years, but I didn't."
.byte NewLine
.text "In fact, I made you my right-hand man."
.byte WaitForA
.byte NewLine
.text "I trust you won't forget my generosity."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Right-hand man?"
.byte NewLine
.text "I... I've merely done what I could"
.byte NewLine
.text "to aid you, nothing more."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Yes, you've been quite the asset."
.byte NewLine
.text "And, if you'll recall, I've reciprocated that—"
.byte NewLine
.text "I've granted your every request, within reason."
.byte WaitForA
.byte ScrollText
.text "Now, how many lords do you think"
.byte NewLine
.text "would do that?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hah..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "What?"
.byte NewLine
.text "Is something funny?!"
.byte WaitForA
.byte ScrollText
.text "Oh, is there something else you want,"
.byte NewLine
.text "princess?"
.byte NewLine
.text "Well, let's hear it! Out with it, now!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...Unless you can bring back the dead,"
.byte NewLine
.text "I don't think you can help me."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Ah..."
.byte NewLine
.text "Funny. Very funny."
.byte WaitForA
.byte ScrollText
.text "Though it doesn't compare"
.byte NewLine
.text "to your greatest joke: your knighthood."
.byte WaitForA
.byte ScrollText
.text "Look at yourself—"
.byte NewLine
.text "you're every bit the fiend as I."
.byte WaitForA
.byte ScrollText
.text "Worse, perhaps, as the rebels resent you"
.byte NewLine
.text "as a turncoat and traitor."
.byte WaitForA
.byte ScrollText
.text "Even if you were to betray me and offer them"
.byte NewLine
.text "your sword, they'd never accept you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I know that, dammit!"
.byte NewLine
.text "I've prepared myself for this..."
.byte WaitForA
.byte ScrollText
.text "After so long, perhaps I can finally"
.byte NewLine
.text "show my face to them,"
.byte NewLine
.text "even if it's from across the field of battle..."
.byte WaitForA
.byte ScrollText
.text "Bah, enough!"
.byte NewLine
.text "I'm just another soldier!"
.byte NewLine
.text "I'm not afraid to face death!"
.byte WaitForA

.byte EndText


ch18opening2

.byte Right_slot
.word LoadPortrait
.word leif_portrait

.byte Left_slot
.word LoadPortrait
.word augustus_portrait

.byte Right_slot
.text "August, are you certain this is a good idea,"
.byte NewLine
.text "splitting our forces in two like this?"
.byte WaitForA

.byte Left_slot
.text "It's a necessary maneuver if we wish"
.byte NewLine
.text "to protect the castle's treasure."
.byte WaitForA
.byte ScrollText
.text "Besides, rescuing the hostages will require"
.byte NewLine
.text "two teams working in tandem."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "And how do we talk down General Xavier?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "With great difficulty, I imagine."
.byte WaitForA
.byte ScrollText
.text "If you're determined to save him, however,"
.byte NewLine
.text "I'd try having the hostages speak with"
.byte NewLine
.text "the eight adjutants. Perhaps they'll see reason."
.byte WaitForA
.byte ScrollText
.text "Just take care that they're not spotted by"
.byte NewLine
.text "Imperial soldiers—if Gustav's men catch sight"
.byte NewLine
.text "of an escaped hostage, the plan is ruined."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Understood."

.byte Left_slot
.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte NewLine
.text "All right, everyone! Take breaching positions!"
.byte WaitForA
.byte ScrollText
.text "By day's end, the flag of the Gáe Bolg"
.byte NewLine
.text "will fly from Castle Leonster once more!"
.byte WaitForA

.byte EndText


ch18closing1

.byte Right_slot
.word LoadPortrait
.word leif_portrait

.byte Left_slot
.word LoadPortrait
.word dorius_portrait
.text "The last remains of the Empire's forces"
.byte NewLine
.text "have been dealt with, Prince Leif."
.byte NewLine
.text "The castle is ours!"
.byte WaitForA
.byte ScrollText
.text "After 14 long years,"
.byte NewLine
.text "Leonster has returned to its rightful ruler!"
.byte WaitForA

.byte Right_slot
.text "Thank you, Dorius."
.byte NewLine
.text "I never would've made it here"
.byte NewLine
.text "without your aid... I owe you much."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You owe me nothing, Prince Leif."
.byte WaitForA

.byte EndText


ch18closing2finn

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word finn_portrait

.byte Right_slot
.byte ScrollText
.text "Finn..."
.byte NewLine
.text "We've finally come home. Together."
.byte NewLine
.text "It's been our dream for so long..."
.byte WaitForA
.byte NewLine
.text "Thank you for everything, Finn."
.byte WaitForA

.byte Left_slot
.text "Lord Leif..."
.byte NewLine
.text "I...haven't the words..."
.byte WaitForA

.byte EndText


ch18closing3miranda

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word miranda_portrait

.byte Right_slot
.byte ScrollText

.byte Left_slot
.text "Prince!"
.byte NewLine
.text "Not to ruin your moment,"
.byte NewLine
.text "but I insist you live up to your word!"
.byte WaitForA

.byte Right_slot
.text "Princess Miranda? Ah, I haven't"
.byte NewLine
.text "forgotten—the liberation of Ulster."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Splendid! Then we're on the same page."
.byte NewLine
.text "So get out there and make for the front lines!"
.byte NewLine
.text "Quickly now, before we lose our chance!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "What do you mean?"
.byte NewLine
.text "Has something happened in Ulster?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "The citizens are plotting rebellion—"
.byte NewLine
.text "but they don't stand a chance on their own."
.byte NewLine
.text "Help them, Prince Leif!"
.byte WaitForA
.byte ScrollText
.text "Save the people of Ulster,"
.byte NewLine
.text "as they once saved you!"
.byte WaitForA

.byte EndText


ch18closing4

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word augustus_portrait

.byte Right_slot
.byte ScrollText

.byte Left_slot
.text "I apologize for disturbing you, Prince,"
.byte NewLine
.text "but someone wishes to speak with you."
.byte NewLine
.text "She's come from Ulster, and—"
.byte WaitForA
.byte ScrollText
.text "Ah! Stop!"
.byte NewLine
.text "You don't have leave to address the prince!"
.byte WaitForA
.byte ScrollText
.word LoadPortrait
.word oldlady3_portrait
.text "You're Prince Leif, right?"
.byte NewLine
.text "Please, I beg of you, come to Ulster's aid!"
.byte WaitForA

.byte Right_slot
.text "Ulster? What are you talking about?"
.byte NewLine
.text "Calm down, and explain everything"
.byte NewLine
.text "from the beginning."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I think you already know Ulster's situation:"
.byte NewLine
.text "the only reason the city is still standing"
.byte NewLine
.text "is because it swears fealty to the Empire."
.byte WaitForA
.byte ScrollText
.text "But yesterday, things reached"
.byte NewLine
.text "a breaking point, and the folk of Ulster"
.byte NewLine
.text "took up arms and rebelled."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "A rebellion..."
.byte WaitForA
.byte ScrollText
.text "But the citizens of Ulster, fighting alone,"
.byte NewLine
.text "don't stand a chance. Have the Knights"
.byte NewLine
.text "of Ulster joined this rebellion?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm afraid not..."
.byte NewLine
.text "We asked Count Conomor for his help"
.byte NewLine
.text "many times, but all he said was to wait."
.byte WaitForA
.byte ScrollText
.text "Eventually, we grew tired of his excuses,"
.byte NewLine
.text "and revolted without him and his knights."
.byte NewLine
.text "That rebellion swiftly ended in failure..."
.byte WaitForA
.byte ScrollText
.text "Then the Empire retaliated,"
.byte NewLine
.text "and killed Ulster's people by the dozens..."
.byte WaitForA
.byte ScrollText
.text "Our city faces its darkest hour!"
.byte NewLine
.text "Lord Leif, you're the only hope for our people!"
.byte WaitForA

.byte EndText


ch18closing5

.byte Right_slot
.byte ScrollText
.text "...I understand."
.byte NewLine
.text "I'll head for Ulster immediately."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word dorius_portrait
.text "Prince Leif, we should discuss this!"
.byte NewLine
.text "I share your feelings, but we simply don't have"
.byte NewLine
.text "the manpower to aid Ulster!"
.byte WaitForA
.byte ScrollText
.text "Before we do anything else, we should"
.byte NewLine
.text "shore up our defenses and fortify Leonster."
.byte WaitForA
.byte ScrollText
.word LoadPortrait
.word augustus_portrait
.text "I agree with Duke Dorius' assessment."
.byte WaitForA
.byte ScrollText
.text "A frontal assault against the Empire"
.byte NewLine
.text "has little chance to succeed—"
.byte NewLine
.text "don't engage them on their terms!"
.byte WaitForA
.byte ScrollText
.text "Don't let yourself be lulled"
.byte NewLine
.text "into a false sense of security"
.byte NewLine
.text "just because you have your motherland back!"
.byte WaitForA
.byte ScrollText
.text "Our victories thus far have been because of"
.byte NewLine
.text "the Empire's own blunders—don't forget that!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Dorius! August!"
.byte NewLine
.text "You would have me stand idly by"
.byte NewLine
.text "and let the people of Ulster be wiped out?!"
.byte WaitForA
.byte ScrollText
.text "They sheltered me when I was but an infant,"
.byte NewLine
.text "and it was Queen Eithne's love and care"
.byte NewLine
.text "that kept me alive!"
.byte WaitForA
.byte ScrollText
.text "Father would never forgive me"
.byte NewLine
.text "if I didn't repay their kindness!"
.byte WaitForA
.byte ScrollText
.text "If you can't understand that,"
.byte NewLine
.text "you can just wait in this damn castle!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "How disappointing..."
.byte NewLine
.text "I'd hoped you'd grown into a man,"
.byte NewLine
.text "but you still think like a child."
.byte WaitForA
.byte ScrollText
.word LoadPortrait
.word dorius_portrait
.text "...Very well, milord. We'll ride for Ulster."
.byte WaitForA
.byte ScrollText
.text "I'll take half our army now"
.byte NewLine
.text "and lead a vanguard. You can lead"
.byte NewLine
.text "the other half on the morrow, Prince."
.byte WaitForA
.byte ScrollText

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word augustus_portrait

.byte Left_slot
.text "Are we in agreement, August?"
.byte WaitForA

.byte Right_slot
.text "Ah..."
.byte NewLine
.text "Is this how...?"
.byte WaitForA
.byte ScrollText
.text "......"
.byte WaitForA
.byte ScrollText
.text "No. I should lead the vanguard."
.byte NewLine
.text "Please, Dorius."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "The prince needs you."
.byte NewLine
.text "We've had our differences, you and I,"
.byte NewLine
.text "but we wouldn't be here without you."
.byte WaitForA
.byte ScrollText
.text "...After this, you must devote all your skills,"
.byte NewLine
.text "all your intellect, to Prince Leif's cause."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "......"
.byte WaitForA
.byte ScrollText
.text "It shall be done."
.byte WaitForA
.byte ScrollText
.word LoadPortrait
.word leif_portrait2
.text "Why not bring the whole army, Dorius?"
.byte NewLine
.text "I'll go with you. We can get a head start"
.byte NewLine
.text "if we lead our troops at the same time."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Don't be so selfish, Prince!"
.byte NewLine
.text "Our soldiers are exhausted."
.byte WaitForA
.byte ScrollText
.text "The hope of liberating Leonster"
.byte NewLine
.text "was the only thing keeping them going."
.byte WaitForA
.byte ScrollText
.text "Just take a look around you!"
.byte NewLine
.text "They sleep like the dead."
.byte WaitForA
.byte ScrollText
.text "But if their prince orders a march,"
.byte NewLine
.text "they'll push themselves to keep going,"
.byte NewLine
.text "even if it means their health."
.byte WaitForA
.byte NewLine
.text "Would you put them through such a thing?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...You've the right of it, Dorius."
.byte NewLine
.text "I apologize."
.byte NewLine
.text "Even so, will you have enough manpower?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Ah, the motherland has provided"
.byte NewLine
.text "that answer as well. Leonster's liberation"
.byte NewLine
.text "will yield many able hands."
.byte WaitForA
.byte ScrollText
.text "Many who fought for the Empire"
.byte NewLine
.text "did so against their will. Their numbers will"
.byte NewLine
.text "make up for the absent half of our army."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Very well."
.byte NewLine
.text "I'll follow behind you as soon as I'm able."
.byte NewLine
.text "Take care of Ulster's people for me, Dorius!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Of course."
.byte NewLine
.text "But before I depart,"
.byte NewLine
.text "there's one other matter of import."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "What is it?"
.byte NewLine
.text "Has something happened?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Leonster once again stands free."
.byte NewLine
.text "The kingdom has been reborn."
.byte WaitForA
.byte ScrollText
.text "As the heir to Leonster's throne,"
.byte NewLine
.text "you are now truly a prince,"
.byte NewLine
.text "in both deed and name."
.byte WaitForA
.byte ScrollText
.text "Bring glory to your title,"
.byte NewLine
.text "and live up to your duties as ruler."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Yes, indeed."
.byte NewLine
.text "I'll strive to become a strong leader—"
.byte NewLine
.text "but my fight isn't over until I rescue Eyvel."
.byte WaitForA
.byte NewLine
.text "We have to seize Munster together, Dorius."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Mm..."
.byte NewLine
.text "I've tarried long enough."
.byte NewLine
.text "I must be off."
.byte WaitForA
.byte ScrollText
.text "May the gods bless and keep you"
.byte NewLine
.text "until we meet again!"
.byte WaitForA

.byte EndText


ch18soldiers

.byte Right_slot
.word LoadPortrait
.word leif_portrait

.byte Left_slot
.word LoadPortrait
.word augustus_portrait
.text "A few of the enemy soldiers have requested"
.byte NewLine
.text "an audience with you, my prince."
.byte WaitForA
.byte ScrollText
.text "They claim to have been pressed into service"
.byte NewLine
.text "against their will, and that we saved them"
.byte NewLine
.text "from that fate."
.byte WaitForA

.byte Right_slot
.text "Very well."
.byte NewLine
.text "Show them in."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word whitecloak_portrait
.text "I suppose congratulations are in order,"
.byte NewLine
.text "what with you takin' back the throne an' all."
.byte WaitForA
.byte ScrollText
.text "But you didn't just save Leonster,"
.byte NewLine
.text "you saved her soldiers too!"
.byte NewLine
.text "Even though we ain't nobles or anything!"
.byte WaitForA
.byte ScrollText
.text "So, uh... We'd like you to have this."
.byte NewLine
.text "You've earned it."
.byte WaitForA

.byte EndText


ch18wm1

.text "Acting without pause or reprieve,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0001 ;leify-right
.word $080B ;y then x
.byte NewLine
.text "the Liberation Army had broken through"
.byte WaitForA
.byte NewLine
.text "to Castle Leonster. They now stormed the gates"
.byte NewLine
.text "with renewed fury."
.byte WaitForA
.byte ScrollText
.text "They fought for only one thing:"
.byte NewLine
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0151 ;Gustav
.word $0013 ;y then x
.text "the throne of Leonster."
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $034D ;Xavier
.word $0319 ;y then x
.byte WaitForA
.byte ScrollText
.text "The kingdom's rebirth—Leif's greatest desire—"
.byte NewLine
.text "was tantalizingly close to becoming reality..."
.byte WaitForA

.byte EndText