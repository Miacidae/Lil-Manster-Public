ch14homerwomen
.byte Right_slot
.word LoadPortrait
.word homer_portrait
.text "Well, what have we here?"
.byte WaitForA
.byte ScrollText
.text "Hmm... Tempting, but I'm saving"
.byte NewLine
.text "all my strength for later tonight."
.byte NewLine
.text "I'm gonna have my hands plenty full then."
.byte WaitForA
.byte EndText

ch14homerkids
.byte Right_slot
.word LoadPortrait
.word homer_portrait
.text "Beat it, kid. I'm trying to catch an afternoon"
.byte NewLine
.text "nap. Can't stay looking good if you let a little"
.byte NewLine
.text "ol' war get in the way of your beauty sleep..."
.byte WaitForA
.byte EndText

ch14homernanna
.byte Right_slot
.word LoadPortrait
.word nanna_portrait

.byte Left_slot
.word LoadPortrait
.word homer_portrait
.text "Oh-ho-ho...! I like what I see!"
.byte NewLine
.text "I'll clear my whole schedule"
.byte NewLine
.text "to make time for you, darling."
.byte WaitForA

.byte Right_slot
.text "I beg your pardon?"
.byte NewLine
.text "What's the meaning of this...?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Y'see, hun, this is my last night in town."
.byte NewLine
.text "Would that I could make love to all"
.byte NewLine
.text "my admirers, but alas, I'm only one man—"
.byte WaitForA
.byte ScrollText
.text "Yowch!"
.byte NewLine
.text "Hey, hey, hey!"
.byte NewLine
.text "What'd you hit me for?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "What are you thinking?!"
.byte NewLine
.text "All the people of the city, young and old,"
.byte NewLine
.text "are fighting tooth-and-nail for Tahra!"
.byte WaitForA
.byte ScrollText
.text "But here you are, already halfway"
.byte NewLine
.text "through a bottle of wine before noon!"
.byte NewLine
.text "Have you no shame?!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Well, first, it is past noon, second—"
.byte NewLine
.text "H-Hey, sweetheart, don't get that pretty face"
.byte NewLine
.text "all wet with tears..."
.byte WaitForA
.byte ScrollText
.text "*Sigh*"
.byte NewLine
.text "All right, all right, I get it."
.byte NewLine
.text "I suppose I can lend you a hand..."
.byte WaitForA
.byte ScrollText
.text "Just remember that I'm a lover, not a fighter."
.byte NewLine
.text "This body of mine, enchanting as it may look,"
.byte NewLine
.text "isn't built for heavy labor."
.byte WaitForA

.byte EndText


ch14villager1

.byte Right_slot ; HOUSE NORTH EAST
.word LoadPortrait
.word youngman_portrait
.text "W-What's gonna happen to us...?"
.byte NewLine
.text "If we packed up and moved to a different city,"
.byte NewLine
.text "would we be able to live more normally?"
.byte WaitForA

.byte EndText


ch14villager2

.byte Right_slot ; HOUSE CENTER EAST
.word LoadPortrait
.word braidedgirl_portrait
.text "I can't take this anymore!"
.byte NewLine
.text "I just... I just want to be somewhere far,"
.byte NewLine
.text "far away from here..."
.byte WaitForA

.byte EndText


ch14villager3

.byte Right_slot ; HOUSE SOUTH EAST
.word LoadPortrait
.word oldlady3_portrait
.text "This whole mess has most of the city"
.byte NewLine
.text "confused, panicking, or both..."
.byte WaitForA
.byte ScrollText
.text "If you've got anyone you wanna say"
.byte NewLine
.text "goodbye to, best do it quickly!"
.byte WaitForA

.byte EndText


ch14villager4

.byte Right_slot ; HOUSE SOUTH WEST
.word LoadPortrait
.word younglady_portrait
.text "My Ma and Pa were both killed..."
.byte NewLine
.text "Tahra has already lost, just like"
.byte NewLine
.text "all the other cities that resisted the Empire!"
.byte WaitForA

.byte EndText


ch14villager5

.byte Right_slot ; HOUSE NORTH WEST
.word LoadPortrait
.word black_mustache_portrait
.text "It seems Tahra's fate is already sealed..."
.byte NewLine
.text "I wish I could go back and do it all over again,"
.byte NewLine
.text "someplace different..."
.byte WaitForA

.byte EndText


ch14villager6

.byte Right_slot ; HOUSE CENTER WEST
.word LoadPortrait
.word youngman2_portrait
.text "I came to this city to escape the rule"
.byte NewLine
.text "of Thracia and the Empire..."
.byte WaitForA
.byte ScrollText
.text "If Tahra falls to either of them,"
.byte NewLine
.text "there's not much point in the city still existing."
.byte WaitForA

.byte EndText


ch14homermen

.byte Right_slot
.word LoadPortrait
.word homer_portrait
.text "Hmm... A man, huh?"
.byte NewLine
.text "I'm not quite in the mood for that today,"
.byte NewLine
.text "but please, do come see me another time."
.byte WaitForA

.byte EndText


ch14nosferatuhouse

.byte Right_slot
.word LoadPortrait
.word elder_portrait
.text "Ah, you're the folks from the Liberation Army."
.byte NewLine
.text "I'm terribly sorry to bother you, but I have"
.byte NewLine
.text "a book that I'm to give to Lady Linoan."
.byte WaitForA
.byte ScrollText
.text "Her father, the late Duke, entrusted it to me,"
.byte NewLine
.text "and gave me strict instructions to only deliver"
.byte NewLine
.text "it to her when she faced her darkest hour..."
.byte WaitForA

.byte EndText


ch14dragonpikehousedean

.byte Right_slot
.word LoadPortrait
.word dean_portrait

.byte Left_slot
.word LoadPortrait
.word younglady_portrait
.text "Ah, Sir Dean!"
.byte NewLine
.text "Lady Altena has been waiting here for you."
.byte WaitForA
.byte ScrollText
.word LoadPortrait
.word altena_portrait
.text "It's been too long, Dean."
.byte NewLine
.text "I'm glad to see you're doing well."
.byte WaitForA

.byte Right_slot
.text "Lady Altena?!"
.byte NewLine
.text "What in Dáinn's name are you doing here?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Heh..."
.byte NewLine
.text "You haven't changed a bit, Dean."
.byte WaitForA
.byte ScrollText
.text "I've come all this way to give you a gift:"
.byte NewLine
.text "a spear worthy of your service to Thracia."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Th-This is no mere spear...!"
.byte NewLine
.text "This is His Highness Prince Arion's"
.byte NewLine
.text "personal weapon, the Dragonpike!"
.byte WaitForA
.byte ScrollText
.text "Why would he give me"
.byte NewLine
.text "such a prized possession?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "He considered it a token of his apology,"
.byte NewLine
.text "for having to brand you a deserter"
.byte NewLine
.text "as part of your cover."
.byte WaitForA
.byte ScrollText
.text "Go on, take it—he said he wanted you"
.byte NewLine
.text "to put it to good use."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I was the one who chose to desert the army."
.byte NewLine
.text "Sure, it was to carry out His Highness'"
.byte NewLine
.text "secret mission, but I could've said no."
.byte WaitForA
.byte ScrollText
.text "I made the decision, not him—and I knew"
.byte NewLine
.text "what it would mean for me."
.byte NewLine
.text "His Highness is not to blame."
.byte WaitForA
.byte ScrollText
.text "So as flattered as I am, I can't accept this."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Don't disregard my brother's feelings so easily,"
.byte NewLine
.text "Dean. He thought just as much about this"
.byte NewLine
.text "as you did about deserting the army."
.byte WaitForA
.byte ScrollText
.text "...Besides, if you won't accept his gift willingly,"
.byte NewLine
.text "then as Princess of Thracia,"
.byte NewLine
.text "I'll just order you to accept it."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hah... You know, technically, I'm not a knight"
.byte NewLine
.text "of Thracia anymore, so you actually"
.byte NewLine
.text "couldn't order me to do anything."
.byte WaitForA
.byte ScrollText
.text "But you've made your point, Lady Altena."
.byte NewLine
.text "Order or no, you know I could never"
.byte NewLine
.text "refuse you."
.byte WaitForA
.byte ScrollText
.text "I'll wield the Dragonpike for a time—"
.byte NewLine
.text "but I'm only borrowing it, that's all."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm glad you understand."
.byte WaitForA
.byte ScrollText
.text "Now, use the Dragonpike to protect Linoan."
.byte NewLine
.text "Make sure nothing happens to her."
.byte NewLine
.text "Linoan and Brother are betrothed, after all..."
.byte WaitForA
.byte ScrollText
.text "He wanted to come here and defend Linoan"
.byte NewLine
.text "himself, but couldn't risk leaving the kingdom"
.byte NewLine
.text "unguarded for too long..."
.byte WaitForA
.byte ScrollText
.text "I suppose giving you his spear"
.byte NewLine
.text "was his way of being here in spirit."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I'm supposed to be a stand-in for"
.byte NewLine
.text "His Highness himself?"
.byte NewLine
.text "Awfully big shoes he's asking me to fill..."
.byte WaitForA
.byte ScrollText
.text "I think you've got the wrong idea, Lady Altena."
.byte NewLine
.text "No way am I the man for that kind of honor."
.byte NewLine
.text "I'll do my best, though."
.byte WaitForA
.byte ScrollText
.text "Now don't you worry another minute about"
.byte NewLine
.text "Duchess Linoan! I'll guard her with my life!"
.byte WaitForA

.byte EndText


ch14dragonpikehouseother

.byte Right_slot
.word LoadPortrait
.word younglady_portrait
.text "Oh, dear..."
.byte NewLine
.text "Where has Sir Dean gone?"
.byte WaitForA

.byte EndText


ch14npcarrive

.byte Right_slot
.word LoadPortrait
.word mccloy_portrait

.byte Left_slot
.word LoadPortrait
.word travant_portrait
.text "It's almost time..."
.byte NewLine
.text "I trust you're aware of my plans, McCloy?"
.byte WaitForA
.byte ScrollText
.text "Officially, we're the Empire's allies,"
.byte NewLine
.text "here to lend a helping hand"
.byte NewLine
.text "with their little insurrection."
.byte WaitForA
.byte ScrollText
.text "Keep the Imperial Army believing that,"
.byte NewLine
.text "but only help them as little as possible—just"
.byte NewLine
.text "enough to make it look like we're being loyal."
.byte WaitForA

.byte Right_slot
.text "...And when the Empire's forces"
.byte NewLine
.text "have exhausted themselves,"
.byte NewLine
.text "we turn on them and seize Tahra for ourselves."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Exactly."
.byte WaitForA
.byte ScrollText
.text "Tahra is the most important card we can play"
.byte NewLine
.text "against Bloom... See that you don't damage"
.byte NewLine
.text "the city too much in all the fighting."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I'm aware of the stakes, Your Majesty."
.byte NewLine
.text "Leave everything to me."
.byte WaitForA

.byte EndText


ch14shannamleave

.byte Right_slot
.word LoadPortrait
.word shannam_portrait

.byte Left_slot
.word LoadPortrait
.word homer_portrait
.text "Hey, what's with the getup?"
.byte NewLine
.text "You planning to skip town?"
.byte WaitForA

.byte Right_slot
.text "Hmph..."
.byte NewLine
.text "There's no point in stickin' around here..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Oh, c'mon! The folks around here"
.byte NewLine
.text "only put up with you because"
.byte NewLine
.text "they wanted your help so badly!"
.byte WaitForA
.byte ScrollText
.text "Everybody's gonna have it out for you"
.byte NewLine
.text "if you run out on them now—especially"
.byte NewLine
.text "the women. “Hell hath no fury,” and all that."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "N-No, it's not like that! I'm the prince of"
.byte NewLine
.text "a whole different country, and I can't just leave"
.byte NewLine
.text "my people without their beloved leader!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Uh-huh. Yeah, if you're the Prince of Isaach,"
.byte NewLine
.text "I'm Saint Heim. I can see right through you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hrk...!"
.byte NewLine
.text "How did you know?!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm a bard, remember? I know what"
.byte NewLine
.text "Prince Shannan looks like, and you ain't him."
.byte WaitForA
.byte ScrollText
.text "Still, it's not like I can blame you. I mean,"
.byte NewLine
.text "who wouldn't want to save their own skin?"
.byte WaitForA
.byte ScrollText
.text "No sense in getting dragged down"
.byte NewLine
.text "with the rest of the city if you can avoid it."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "So you're making a run for it, too?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "That's the plan. I'm hightailing it outta here"
.byte NewLine
.text "first thing in the morning—gives me"
.byte NewLine
.text "plenty of time to have my fun tonight, heheh."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Yeah, you do that. Me, I'm gettin' out while"
.byte NewLine
.text "I still can. If you make it through this alive,"
.byte NewLine
.text "maybe we'll cross paths again someday."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "One last thing. Now that we're acquainted,"
.byte NewLine
.text "you at least gotta tell me your real name."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "......"
.byte WaitForA
.byte ScrollText
.text "It's Shannam."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "That's...closer to the real thing"
.byte NewLine
.text "than I was expecting."
.byte WaitForA
.byte ScrollText
.text "Well, safe travels, “Prince” Shannam."
.byte WaitForA

.byte EndText


ch14opening1

.byte Right_slot
.word LoadPortrait
.word baldach_portrait

.byte Left_slot
.word LoadPortrait
.word paulus_portrait
.text "Where's Liszt? I don't see him anywhere..."
.byte WaitForA

.byte Right_slot
.text "I bring word of his fate. He charged into"
.byte NewLine
.text "battle early, and was defeated by the rebels."
.byte NewLine
.text "Right now, he's either dead or in chains."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "The poor sod... I almost pity him."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "If I may speak freely, sir, Liszt brought it"
.byte NewLine
.text "upon himself when he disobeyed your orders."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...I'm not so sure of that. I was opposed"
.byte NewLine
.text "to this whole plan, and now my hesitation"
.byte NewLine
.text "has cost a great many soldiers their lives."
.byte WaitForA
.byte ScrollText
.text "The blame is mine alone. I must make quite a"
.byte NewLine
.text "sight: the great Colonel Paulus, reduced to an"
.byte NewLine
.text "old man whose glory days are long past him."
.byte WaitForA
.byte ScrollText
.text "Go ahead and laugh, Baldach."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Colonel..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "But I cannot allow myself to hesitate"
.byte NewLine
.text "for one moment longer. I am a knight"
.byte NewLine
.text "of House Friege, and I have a duty to uphold."
.byte WaitForA
.byte ScrollText
.text "Will you lend me your strength, Baldach?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Of course, Colonel Paulus!"
.byte NewLine
.text "I await your orders!"
.byte WaitForA
.byte ScrollText
.text "What's more, the main body of the 8th Division"
.byte NewLine
.text "has arrived. With your permission,"
.byte NewLine
.text "we'll begin our assault at once."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Permission granted. I'll have my own troops"
.byte NewLine
.text "move to reinforce your position just as soon"
.byte NewLine
.text "as my men have finished their preparations."
.byte WaitForA
.byte ScrollText
.text "...See that you don't get sloppy, General."
.byte NewLine
.text "I imagine that goes without saying, but still,"
.byte NewLine
.text "keep your guard up."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I'll remain vigilant, Colonel."
.byte NewLine
.text "On my honor, Tahra will fall this day!"
.byte WaitForA

.byte EndText


ch14opening2

.byte Right_slot
.word LoadPortrait
.word linoan_portrait

.byte Left_slot
.word LoadPortrait
.word eda_portrait
.text "...It's started, Lady Linoan."
.byte WaitForA

.byte Right_slot
.text "And so the Empire brings the full weight"
.byte NewLine
.text "of their army to bear against us..."
.byte NewLine
.text "What is Lord Leif doing now?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Meeting with the other commanding officers"
.byte NewLine
.text "and military officials."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Is Dean with them?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Brother said he wasn't the type to sit around"
.byte NewLine
.text "in some war council."
.byte NewLine
.text "He left to go defend the southern gate."
.byte WaitForA
.byte ScrollText
.text "He's always been headstrong like that..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Heh. That much I already know."
.byte NewLine
.text "When I was a small child, I was often told"
.byte NewLine
.text "the story of Dáinn, the legendary Dracoknight."
.byte WaitForA
.byte ScrollText
.text "Dean always reminded me of him—flying"
.byte NewLine
.text "freely through the skies, untroubled"
.byte NewLine
.text "by the world's petty squabbles..."
.byte WaitForA
.byte ScrollText
.text "He's a towering man, true,"
.byte NewLine
.text "yet he's still gentle in his own way."
.byte WaitForA
.byte NewLine
.text "And above all, he is a master of the skies,"
.byte NewLine
.text "undefeatable in battle—just like Dáinn."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I...think you've been misled, Lady Linoan."
.byte NewLine
.text "My brother is not the exemplar among men"
.byte NewLine
.text "you believe him to be."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I beg to differ. He's not perfect, granted,"
.byte NewLine
.text "but had he not come to my aid,"
.byte NewLine
.text "my spirit would have been broken long ago—"
.byte WaitForA
.byte NewLine
.text "and I would be useless to the city now."
.byte WaitForA
.byte ScrollText
.text "After my father was killed, the ducal mansion"
.byte NewLine
.text "was seized, and I was forbidden"
.byte NewLine
.text "to even set foot outdoors on my own."
.byte WaitForA
.byte ScrollText
.text "For two years, I was kept prisoner"
.byte NewLine
.text "in my own home."
.byte WaitForA
.byte ScrollText
.text "And for all that time, the wretched governor"
.byte NewLine
.text "sent by the Empire interrogated me"
.byte NewLine
.text "about Prince Leif's location."
.byte WaitForA
.byte ScrollText
.text "To this day, just the thought of that disgusting"
.byte NewLine
.text "man is enough to make my heart stop..."
.byte WaitForA
.byte ScrollText
.text "Dean... He saved me from that."
.byte WaitForA
.byte ScrollText
.text "After the deed was done, he protected me"
.byte NewLine
.text "from the Empire's assassins—"
.byte WaitForA
.text "and when"
.byte NewLine
.text "my grief felt too heavy to bear, he was always"
.byte NewLine
.text "ready to bring a smile to my face."
.byte WaitForA
.byte ScrollText
.text "It was strange... I always thought"
.byte NewLine
.text "he must've been a renowned sellsword,"
.byte NewLine
.text "but he always laughed it off."
.byte WaitForA
.byte ScrollText
.text "Never would I have suspected"
.byte NewLine
.text "that he answered to Lord Arion himself..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...There's more to it than that."
.byte WaitForA
.byte ScrollText
.text "His Highness Prince Arion was worried sick"
.byte NewLine
.text "about the crisis unfolding in Tahra,"
.byte NewLine
.text "and secretly arranged for Dean to rescue you."
.byte WaitForA
.byte ScrollText
.text "I remember Brother being so honored"
.byte NewLine
.text "by the trust His Highness had placed in him..."
.byte NewLine
.text "I've never seen him happier."
.byte WaitForA
.byte ScrollText
.text "But it wasn't without its cost. To preserve the"
.byte NewLine
.text "secrecy of his mission, Brother had to make it"
.byte NewLine
.text "look like he'd simply deserted from the army."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Lord Arion really went to such lengths...?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "His Highness was caught between a rock and"
.byte NewLine
.text "a hard place. He couldn't leave Thracia, but"
.byte NewLine
.text "he couldn't sit back and let his own fiancée die."
.byte WaitForA
.byte ScrollText
.text "...His Highness seemed deeply tormented—"
.byte NewLine
.text "openly so—during the whole ordeal."
.byte WaitForA
.byte ScrollText
.text "But fear not, Lady Linoan. Dáinn and Njörun"
.byte NewLine
.text "have bore witness to your compassion"
.byte NewLine
.text "and grace, and they will not forsake you."
.byte WaitForA
.byte ScrollText
.text "...It's time. I need to set off for the front lines."
.byte NewLine
.text "Please, milady, wait here and stay safe."
.byte NewLine
.text "Have faith that we will be victorious today!"
.byte WaitForA

.byte EndText


ch14ending1

.byte Right_slot
.word LoadPortrait
.word arion_portrait

.byte Left_slot
.word LoadPortrait
.word travant_portrait

.byte Right_slot
.text "My lord father, doesn't attacking Tahra"
.byte NewLine
.text "only serve to benefit the Empire?"
.byte WaitForA
.byte ScrollText
.text "Tahra's citizens are united in their hatred of the"
.byte NewLine
.text "Empire. If we come to their aid now, it could"
.byte NewLine
.text "pave the way for a new alliance between us."
.byte WaitForA

.byte Left_slot
.text "Hah! You think shackling ourselves to Tahra"
.byte NewLine
.text "would be enough to triumph over the Empire?"
.byte WaitForA
.byte ScrollText
.text "Have you already forgotten our defeat"
.byte NewLine
.text "at Mergen?"
.byte WaitForA
.byte ScrollText
.text "We had all of North and South Thracia"
.byte NewLine
.text "united under our rule then,"
.byte NewLine
.text "and we were still no match for the Empire."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...We lost only because Raydrik betrayed us."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Maybe so, maybe so... But the fact remains"
.byte NewLine
.text "that the battle ended with us humiliated,"
.byte NewLine
.text "and having to resort to suing for peace."
.byte WaitForA
.byte ScrollText
.text "North Thracia—the land I had gone through"
.byte NewLine
.text "so much to finally regain—was taken from me"
.byte NewLine
.text "all over again. All those years...for nothing."
.byte WaitForA
.byte ScrollText
.text "As it stands, it's no exaggeration to say"
.byte NewLine
.text "that the Empire's might exceeds our own"
.byte NewLine
.text "by tenfold."
.byte WaitForA
.byte ScrollText
.text "You still like those odds?"
.byte NewLine
.text "You still think you can win?"
.byte WaitForA
.byte ScrollText
.text "A whole lot of people will die:"
.byte NewLine
.text "Imperials, Thracians, Tahrans."
.byte NewLine
.text "They'll all bleed just the same."
.byte WaitForA
.byte ScrollText
.text "You still want to go through with your plan?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "N-No..."
.byte NewLine
.text "You've the right of it, my lord father."
.byte NewLine
.text "I was...being too rash."
.byte WaitForA
.byte ScrollText
.text "...But if I may, Father, I have a request."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "*Sigh*"
.byte NewLine
.text "What?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I wish to help you seize Tahra."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...You're up to something, aren't you?"
.byte WaitForA
.byte ScrollText
.text "Well, so be it."
.byte NewLine
.text "As long as this wealthy city falls into Thracia's"
.byte NewLine
.text "hands, I don't give a damn how you do it."
.byte WaitForA
.byte ScrollText
.text "I give you leave to act as you see fit!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I won't let you down!"
.byte NewLine
.text "Thank you, my lord father!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Just make sure you don't take too long."
.byte WaitForA
.byte ScrollText
.text "I can only keep up this ruse for so much"
.byte NewLine
.text "longer, and I'd rather not use my main body"
.byte NewLine
.text "of troops to seize Tahra if I can avoid it."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Of course, Father!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText
.text "If things keep going the way they are,"
.byte NewLine
.text "countless innocent civilians will perish..."
.byte NewLine
.text "I must convince Linoan, no matter what..."
.byte WaitForA

.byte EndText


ch14ending2

.byte Right_slot
.word LoadPortrait
.word arion_portrait
.text "Linoan! Where are you?"
.byte NewLine
.text "It's me! It's Arion!"
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word linoan_portrait
.text "Lord Arion!"
.byte NewLine
.text "Wh-What are you doing here?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "There's no time. You must listen to me:"
.byte NewLine
.text "tell your people to lay down their arms"
.byte NewLine
.text "and surrender. Immediately."
.byte WaitForA
.byte ScrollText
.text "If you keep fighting like this, Tahra will never"
.byte NewLine
.text "recover from this battle. Its fate will be sealed."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Why...?"
.byte NewLine
.text "Why would I do such a thing?!"
.byte WaitForA
.byte ScrollText
.text "This isn't something I'd ever imagine hearing"
.byte NewLine
.text "from you... Just what in blazes has happened?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "My lord father is planning to seize Tahra"
.byte NewLine
.text "for himself."
.byte WaitForA
.byte ScrollText
.text "He's prepared a massive army"
.byte NewLine
.text "to take the city from the Empire"
.byte NewLine
.text "once their forces are exhausted."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "No...!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "It gets worse. Sorcerers of the Loptr Church"
.byte NewLine
.text "are headed here even as we speak."
.byte WaitForA
.byte ScrollText
.text "And not just any sorcerers—"
.byte NewLine
.text "they've sent the Welkenrosen,"
.byte NewLine
.text "the withered roses of Loptous himself."
.byte WaitForA
.byte ScrollText
.text "When they arrive here, they'll slaughter"
.byte NewLine
.text "every single man, woman, and child in Tahra."
.byte NewLine
.text "It will be genocide."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "The Welkenrosen..."
.byte NewLine
.text "This was my greatest fear..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Linoan, you must trust me."
.byte NewLine
.text "Allow Thracia to occupy Tahra."
.byte WaitForA
.byte ScrollText
.text "We can place the city's people under our"
.byte NewLine
.text "protection, and I'll see to it they're treated well."
.byte NewLine
.text "The Empire won't be able to harm them."
.byte WaitForA
.byte ScrollText
.text "Being under Thracian rule also means the city"
.byte NewLine
.text "won't be forced to participate in child hunts—"
.byte NewLine
.text "and isn't that what you wanted all along?"
.byte WaitForA
.byte ScrollText
.text "Of course, I won't allow anything"
.byte NewLine
.text "to happen to you, either. You have my word"
.byte NewLine
.text "that I'll protect you just as vigilantly, Linoan."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "What will become of Lord Leif"
.byte NewLine
.text "and the other knights?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I'm afraid they'll have no choice but to flee"
.byte NewLine
.text "the city. The Empire cannot allow the prince"
.byte NewLine
.text "to escape, and Father fears him as a threat."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...I understand, Your Highness."
.byte NewLine
.text "I shall avail myself of your kind offer,"
.byte NewLine
.text "and entrust the city of Tahra to you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "You've made a wise decision, Linoan."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "But I won't be staying here, myself."
.byte NewLine
.text "I shall accompany Lord Leif."
.byte WaitForA
.byte ScrollText
.text "It pains me to abandon the citizens who've"
.byte NewLine
.text "stood by me for so long during our rebellion,"
.byte NewLine
.text "but I believe this would be best for everyone."
.byte WaitForA
.byte ScrollText
.text "Once the Empire lies destroyed at the hands"
.byte NewLine
.text "of Lord Leif and myself, I'll return home."
.byte WaitForA
.byte ScrollText
.text "When that day comes, Your Highness,"
.byte NewLine
.text "do you promise to return Tahra to my rule?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "You...plan to overthrow the Empire?"
.byte NewLine
.text "I'll agree to those terms. If you can truly defeat"
.byte NewLine
.text "the Empire, I'll gladly return Tahra to you."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText
.text "Is Prince Leif worthy of such confidence,"
.byte NewLine
.text "I wonder? Is the boy really up to such"
.byte NewLine
.text "a monumental task as fighting the Empire?"
.byte WaitForA
.byte ScrollText
.text "Will he grow to be Thracia's ally,"
.byte NewLine
.text "or its greatest nemesis...?"
.byte WaitForA
.byte ScrollText
.text "I hope that I'm able to meet him"
.byte NewLine
.text "one of these days...together with Altena."
.byte WaitForA

.byte EndText