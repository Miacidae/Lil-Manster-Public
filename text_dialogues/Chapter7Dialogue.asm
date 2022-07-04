ch7op1

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word augustus_portrait
.text "Prince Leif, the Knights of Munster"
.byte NewLine
.text "will catch up with us before long."
.byte WaitForA

.byte Right_slot
.text "What should I do?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "There are two options: first, you could flee"
.byte NewLine
.text "through the mountain range to the west,"
.byte NewLine
.text "and lose the knights in the rocky terrain."
.byte WaitForA
.byte ScrollText
.text "Second, you could continue south"
.byte NewLine
.text "and seek refuge in Castle Meath."
.byte WaitForA
.byte ScrollText
.text "In either case, it will be necessary"
.byte NewLine
.text "to petition Thracia for aid immediately."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "A-Ask Thracia for aid?! That's absurd!"
.byte WaitForA
.byte ScrollText
.text "Those damnable cowards took everything from"
.byte NewLine
.text "me: my kingdom, my mother, my father... I'll"
.byte NewLine
.text "not come crawling to them with cup in hand!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Do you expect to fight off the Knights of"
.byte NewLine
.text "Munster with the strength of your pride alone?"
.byte WaitForA
.byte ScrollText
.text "We are not fighting to satisfy your own sense"
.byte NewLine
.text "of vengeance, my prince—we fight to liberate"
.byte NewLine
.text "North Thracia from the tyranny of the Empire."
.byte WaitForA
.byte ScrollText
.text "You yourself said that there was"
.byte NewLine
.text "“no hardship you would be unwilling to endure”"
.byte NewLine
.text "to accomplish this."
.byte WaitForA
.byte ScrollText
.text "Did you think the only kind of hardship"
.byte NewLine
.text "in this war would be from battle?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...Even supposing I did agree,"
.byte NewLine
.text "what makes you think we can trust Thracia?"
.byte NewLine
.text "They're allies of the Empire!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "And if foreign invaders amass at their borders,"
.byte NewLine
.text "they'll respond with force all the same."
.byte WaitForA
.byte ScrollText
.text "I imagine the retaliation from General"
.byte NewLine
.text "Hannibal of Meath would be especially great."
.byte WaitForA
.byte ScrollText
.text "He's a famed military leader that the people"
.byte NewLine
.text "revere as the “Shield of Thracia.”"
.byte WaitForA
.byte ScrollText
.text "Between us and Raydrik's men,"
.byte NewLine
.text "who do you think he would help?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...I understand. We'll take refuge"
.byte NewLine
.text "in Castle Meath, and head for Tahra afterward."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You want to make for Tahra...? As in,"
.byte NewLine
.text "the city refusing to take part in child hunts?"
.byte WaitForA
.byte ScrollText
.text "The same city being besieged"
.byte NewLine
.text "by the Imperial Army for their rebellion?"
.byte WaitForA
.byte ScrollText
.text "Going there with the small force we have now"
.byte NewLine
.text "is certain death."
.byte NewLine
.text "Does my prince wish an early grave?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Tahra is...my home away from home,"
.byte NewLine
.text "you could say. The Duke of Tahra sheltered me"
.byte NewLine
.text "for years and was killed by the Empire for it."
.byte WaitForA
.byte ScrollText
.text "I have many friends there, August."
.byte NewLine
.text "I won't abandon them now!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...Very well, but let's discuss this later."
.byte NewLine
.text "Right now, focus on our escape!"
.byte WaitForA

.byte EndText

ch7op2

.byte Right_slot
.word LoadPortrait
.word shiva_portrait
.text "What's all this ruckus...?"
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word merc_portrait
.text "Couple rebels in Munster kicked"
.byte NewLine
.text "the hornet's nest."
.byte WaitForA
.byte ScrollText
.text "I hear the ringleader is a young'un named Leif,"
.byte NewLine
.text "a Leonster prince with a price on 'is head"
.byte NewLine
.text "to match."
.byte WaitForA
.byte ScrollText
.text "The boy's got stones, all right. Almost seems"
.byte NewLine
.text "like a shame to kill 'im, but coin is coin."
.byte WaitForA
.byte ScrollText
.text "He's comin' our way already—haven't had"
.byte NewLine
.text "a bounty this convenient in a long while."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hmm..."
.byte WaitForA

.byte EndText

ch7ending1

.byte Right_slot
.word LoadPortrait
.word leif_portrait

.byte Left_slot
.word LoadPortrait
.word hannibal_portrait
.text "Clearly, your group wanted to flee Munster,"
.byte NewLine
.text "but I would hear your reasons."
.byte WaitForA

.byte Right_slot
.text "Most of us lived in a village on the eastern"
.byte NewLine
.text "shore. I was...captured while freeing"
.byte NewLine
.text "several children from an Imperial prison."
.byte WaitForA
.byte ScrollText
.text "The Magi, the local resistance, later rescued"
.byte NewLine
.text "me, and we fled the province together."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Hmm... For one so young, you don't seem"
.byte NewLine
.text "to bend easily. What's your name, lad?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Lugh Faris, at your service, General Hannibal."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Hmm... You share...quite the resemblance..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Resemblance? What do you mean, General...?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "It's...nothing you need concern yourself with."
.byte NewLine
.text "More importantly, what do you plan to do"
.byte NewLine
.text "now that you're free of Munster?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "We'll head to Tahra to fend off the Empire's siege."
.byte NewLine
.text "I've many friends there in need of help."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Are you planning a route"
.byte NewLine
.text "through the central mountains?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "That was my intent, yes."
.byte NewLine
.text "As rebels, we obviously can't risk"
.byte NewLine
.text "crossing through Imperial territory."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Is that so? Then be warned:"
.byte NewLine
.text "many bandits make their home there."
.byte NewLine
.text "Don't let your guard down."
.byte WaitForA
.byte ScrollText

.byte EndText

ch7ending2

.byte Right_slot
.byte ScrollText
.text "Thank you, General. Now, would you release"
.byte NewLine
.text "the men you captured earlier?"
.byte NewLine
.text "They're good friends of mine."
.byte WaitForA

.byte Left_slot
.text "Ah, of course."
.byte WaitForA
.byte ScrollText

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word wolfe_portrait

.byte Left_slot
.text "Men, bring them to the prisoners,"
.byte NewLine
.text "on the double!"
.byte WaitForA

.byte Right_slot
.text "Yes, General!"
.byte WaitForA

.byte ScrollText
.word LoadPortrait
.word leif_portrait

.byte Left_slot
.byte ScrollText
.word ClearPortrait

.byte EndText

ch7ending3halvan

.byte Left_slot
.word LoadPortrait
.word halvan_portrait
.text "Prince Leif! Sheesh, some help I turned out"
.byte NewLine
.text "to be, huh? Might as well have stayed in Fiana,"
.byte NewLine
.text "for all the good I did..."
.byte WaitForA
.byte ScrollText

.byte EndText

ch7ending4osian

.byte Left_slot
.word LoadPortrait
.word osian_portrait
.text "Damned Thracians! Next time I see them,"
.byte NewLine
.text "they'll pay for what they've done!"
.byte WaitForA
.byte ScrollText

.byte EndText

ch7ending5ronan

.byte Left_slot
.word LoadPortrait
.word ronan_portrait
.text "I'm awful sorry, Prince Leif..."
.byte NewLine
.text "I guess I'm just not very strong..."
.byte WaitForA
.byte ScrollText

.byte EndText

ch7hannibalportrait

.byte Left_slot
.word LoadPortrait
.word hannibal_portrait

.byte EndText

ch7ending6hannibal

.text "Ah, my apologies for intruding."
.byte NewLine
.text "There is something else."
.byte WaitForA
.byte ScrollText

.byte EndText

ch7ending7callion

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word callion_portrait

.byte Left_slot
.text "Good folk, let me introduce you to Callion."
.byte WaitForA
.byte ScrollText
.text "There are many perils in the central"
.byte NewLine
.text "mountains—not the least of which is a massive"
.byte NewLine
.text "hunt for bandits around Mount Violdrake."
.byte WaitForA
.byte ScrollText
.text "If you're mistaken for these bandits, you could"
.byte NewLine
.text "very well lose your lives over it. Callion here"
.byte NewLine
.text "will see that you cross the mountains safely."
.byte WaitForA

.byte Right_slot
.text "Of course, sire. They can count on me!"
.byte WaitForA

.byte ScrollText
.word LoadPortrait
.word leif_portrait
.text "General, there's no need to reassign your man."
.byte WaitForA
.byte ScrollText
.text "We don't need to go as far into the mountains"
.byte NewLine
.text "as Mount Violdrake."
.byte NewLine
.text "I'm sure there's a detour we can find—"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word callion_portrait
.text "Nonsense! I'd be honored to join you!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...If you insist,"
.byte NewLine
.text "I certainly would appreciate your help."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Think nothing of it!"
.byte WaitForA

.byte Right_slot
.word ClearPortrait
.byte ScrollText

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word leif_portrait

.byte EndText

ch7ending8cairpre

.byte Right_slot
.word LoadPortrait
.word cairpre_portrait
.text "Good day, sir!"
.byte WaitForA

.byte Left_slot
.text "Oh, you were one of the children imprisoned"
.byte NewLine
.text "at Kerberos' Gate... What are you doing here?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "General Hannibal is my lord father, you see."
.byte WaitForA
.byte ScrollText
.text "On the off chance we met again, I prepared"
.byte NewLine
.text "you a token of my gratitude. Here you are. It's"
.byte NewLine
.text "a very powerful staff imbued with Warp magic."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Thank you! This is most generous...!"
.byte WaitForA
.byte ScrollText

.byte Right_slot
.byte ScrollText

.byte EndText

ch7ending9

.byte Right_slot
.word LoadPortrait
.word hannibal_portrait
.text "Sir Lugh, you'd best be setting out."
.byte NewLine
.text "It'll be dark before long."
.byte WaitForA

.byte Left_slot
.text "Of course."
.byte NewLine
.text "Many thanks for your help, General Hannibal."
.byte NewLine
.text "I won't forget the kindness you've done us!"
.byte WaitForA

.byte EndText

ch7finnsafie1

.byte Right_slot
.word LoadPortrait
.word hannibal_portrait

.byte Left_slot
.word LoadPortrait
.word wolfe_portrait
.text "Welcome back, General Hannibal."
.byte WaitForA

.byte Right_slot
.text "I see our dungeon is considerably"
.byte NewLine
.text "more full than when I departed."
.byte NewLine
.text "What, pray tell, happened while I was away?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "A group of suspicious characters were making"
.byte NewLine
.text "their way down the mountains near here,"
.byte NewLine
.text "so we saw fit to arrest them."
.byte WaitForA
.byte ScrollText
.text "I reckon they're bandits"
.byte NewLine
.text "from the eastern frontier."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hmm... What have they to say for themselves?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "“We're just villagers!” and other obvious tripe."
.byte NewLine
.text "What kind of villagers trek"
.byte NewLine
.text "through the Thracian mountains?"
.byte WaitForA
.byte ScrollText
.text "They must be up to something—"
.byte NewLine
.text "otherwise, why lie?"
.byte WaitForA

.byte EndText

ch7finnsafie2

.byte Left_slot
.byte ScrollText
.text "What's more, we saw what looked like a"
.byte NewLine
.text "knight among them, but the man escaped."
.byte NewLine
.text "We've assembled search parties to find him."
.byte WaitForA

.byte EndText

ch7finnsafie3

.byte Right_slot
.byte ScrollText
.text "Understood. I'll go have a word with"
.byte NewLine
.text "the prisoners myself. In the meantime, there's"
.byte NewLine
.text "some sort of commotion over in Munster."
.byte WaitForA
.byte ScrollText
.text "Raydrik may be up to something..."
.byte NewLine
.text "Let's not give that fiend any openings, eh?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Hah! Of course, milord."
.byte WaitForA

.byte EndText

ch7finnsafie4onlyfinn

.byte Right_slot
.word LoadPortrait
.word finn_portrait
.text "I must reach Lord Leif at once..."
.byte NewLine
.text "Ah, I pray that he's still safe..."
.byte WaitForA

.byte EndText

ch7finnsafie5

.byte Left_slot
.word LoadPortrait
.word safie_portrait

.byte Right_slot
.byte ScrollText
.text "I cannot allow myself to be delayed any longer."
.byte NewLine
.text "Sister, please make your way back to Tahra."
.byte WaitForA

.byte Left_slot
.text "Am I that much of a burden to you, Sir Finn?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Not at all. Your presence has been most"
.byte NewLine
.text "heartening—but where I go, I'm not certain"
.byte NewLine
.text "I could protect you."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "When I left Tahra, I swore to Saint Heim that,"
.byte NewLine
.text "for those willing to defend the city,"
.byte NewLine
.text "there was nothing I wouldn't do."
.byte WaitForA
.byte ScrollText
.text "If I can help Lord Leif—and in so doing, help"
.byte NewLine
.text "Tahra—then I must. We are both bound by duty,"
.byte NewLine
.text "Sir Finn. Allow me to uphold my own oath."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...I understand, Sister. Let's get moving"
.byte NewLine
.text "before we lose any more daylight."
.byte WaitForA

.byte EndText

ch7finnsafie4safieonly

.byte Right_slot
.word LoadPortrait
.word safie_portrait
.text "I pray that Lord Leif is safe..."
.byte WaitForA

.byte EndText

ch7safieshiva

.byte Right_slot
.word LoadPortrait
.word shiva_portrait

.byte Left_slot
.word LoadPortrait
.word safie_portrait
.text "Hm? Oh, you're..."
.byte WaitForA

.byte Right_slot
.text "Ah, Sister... It's been a while."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Why are you doing this?"
.byte NewLine
.text "I know you're not a bad person."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "This is the job. I'm a sellsword—and frankly,"
.byte NewLine
.text "the details are no business of yours."
.byte WaitForA
.byte ScrollText
.text "...Time for you to leave, Sister."
.byte NewLine
.text "I'm trouble to be around."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm not going anywhere."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...You really willing to risk everything"
.byte NewLine
.text "for that little boy?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "If it came to that, I would give my life"
.byte NewLine
.text "to protect Prince Leif, yes."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "......"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Losing Prince Leif, losing what he represents,"
.byte NewLine
.text "would be an irreplaceable loss"
.byte NewLine
.text "to the entire Thracian Peninsula."
.byte WaitForA
.byte ScrollText
.text "If I needed to give my life to save his,"
.byte NewLine
.text "it would only be right to do so."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hmph... You're quite the fool, Sister."
.byte WaitForA
.byte ScrollText
.text "...Well, all the better."
.byte NewLine
.text "I can appreciate that kind of naive innocence."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Hm? Will you...agree to aid the prince, then?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Ah, this is getting absurd... But yes,"
.byte NewLine
.text "I suppose I will. Just one thing: don't talk"
.byte NewLine
.text "so lightly about throwing your life away."
.byte WaitForA
.byte ScrollText
.text "There's nothing more loathsome"
.byte NewLine
.text "than people rushing toward their own death."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I apologize... I'll be mindful of that."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Can I ask you something, though?"
.byte NewLine
.text "What is it that YOU want? What is it that"
.byte NewLine
.text "brightens your day, that brings you laughter?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I suppose that I want to see everyone"
.byte NewLine
.text "around me be happy. When they laugh,"
.byte NewLine
.text "when they feel joy, I share in it."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I see..."
.byte NewLine
.text "Well, I already said you were quite the fool."
.byte WaitForA
.byte ScrollText
.text "...You know, I don't think I even know"
.byte NewLine
.text "your name. I'm Shiva of Saban, by the way."
.byte NewLine
.text "What do you go by?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Safy. I'm Safy of Tahra."
.byte WaitForA

.byte EndText

ch7finnleif

.byte Right_slot
.word LoadPortrait
.word leif_portrait

.byte Left_slot
.word LoadPortrait
.word finn_portrait
.text "Lord Leif! You're all right!"
.byte WaitForA

.byte Right_slot
.text "I'm sorry to have worried you, Finn."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Worried? Of... Of course not! I never doubted"
.byte NewLine
.text "you'd be able to keep yourself safe."
.byte NewLine
.text "I just...didn't expect we'd meet again so soon."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "You can thank the Magi for that."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Is that the name your new retinue goes by?"
.byte NewLine
.text "There appear to be former knights and common"
.byte NewLine
.text "sellswords among them... Who are they, then?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "They're a group of rebels from up north."
.byte NewLine
.text "They've pledged to serve me until the day"
.byte NewLine
.text "that Munster stands free."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Their loyalty to you is most important"
.byte NewLine
.text "above all. If they've promised you as much,"
.byte NewLine
.text "their personal details are none of my concern."
.byte WaitForA
.byte ScrollText
.text "Though now that I get a look at everyone..."
.byte NewLine
.text "I don't see Eyvel among them."
.byte NewLine
.text "Milord, is she...?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "The Commander is still in Munster..."
.byte NewLine
.text "She... She was turned to stone"
.byte NewLine
.text "by the fell magic of a Loptrian bishop."
.byte WaitForA
.byte ScrollText
.text "There's...nothing I can do for her now..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Gods' breath! Th-That can't be...! Lord Leif..."
.byte NewLine
.text "I'm sorry. I... I don't know what to say..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "You've nothing to apologize for, Finn."
.byte NewLine
.text "As for the Commander..."
.byte NewLine
.text "Nothing will stop me from getting her back."
.byte WaitForA
.byte ScrollText
.text "Between the two of us, we're sure to find a way"
.byte NewLine
.text "to reverse what's been done to her!"
.byte WaitForA
.byte ScrollText
.text "So, Finn... I'm giving you an order: don't die."
.byte NewLine
.text "I want you there with me, head held high,"
.byte NewLine
.text "on the day we take back Munster!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Gladly, milord! On my honor, never again"
.byte NewLine
.text "shall you and I be parted! I'll be at your side,"
.byte NewLine
.text "Brave Lance in hand, until the very end!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Thank you, Finn."
.byte WaitForA
.byte ScrollText
.text "...Ahem. Now, where has the rest"
.byte NewLine
.text "of our former group gone?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "They were captured by General Hannibal's"
.byte NewLine
.text "Panzerritter, and imprisoned in Castle Meath."
.byte WaitForA
.byte ScrollText
.text "I...considered rescuing them, but my duty"
.byte NewLine
.text "to you comes first, so I set out without them."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Then our road leads to Meath regardless."
.byte WaitForA
.byte ScrollText
.text "Very well... Finn, let's head for the castle and"
.byte NewLine
.text "see to their release. With our forces bolstered,"
.byte NewLine
.text "we can make our way to Tahra."
.byte WaitForA
.byte ScrollText
.text "...You've missed the city as well, haven't you?"
.byte NewLine
.text "I can tell."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Ah... I have, milord."
.byte WaitForA

.byte EndText

ch7finnnanna

.byte Right_slot
.word LoadPortrait
.word finn_portrait

.byte Left_slot
.word LoadPortrait
.word nanna_portrait
.text "Father?!"
.byte WaitForA

.byte Right_slot
.text "Nanna...! Are you all right?"
.byte NewLine
.text "You weren't hurt, were you?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm fine. Eyvel was there to...to protect me..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "That is good."
.byte NewLine
.text "If something were to happen to you,"
.byte NewLine
.text "I couldn't bear to break the news to your..."
.byte WaitForA
.byte ScrollText
.text "Ah, but never mind that."
.byte NewLine
.text "You know, if there's anything on your mind,"
.byte NewLine
.text "I'm always here to listen."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Father..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Yes? What's wrong?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...No, it's nothing. I apologize."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "All right, all right,"
.byte NewLine
.text "I know better than to press the issue with you."
.byte NewLine
.text "Ah... It's good to see you again, child."
.byte WaitForA
.byte ScrollText
.text "Now, try to stay focused—"
.byte NewLine
.text "there's no shortage of danger here."
.byte NewLine
.text "I want you to stay to the rear as we fight."
.byte WaitForA
.byte ScrollText
.text "Your healing magic will be invaluable,"
.byte NewLine
.text "but don't linger on the front lines"
.byte NewLine
.text "after you've used your staff."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Of... Of course, Father."
.byte WaitForA

.byte EndText

ch7hannibalappear

.byte Right_slot
.word LoadPortrait
.word hannibal_portrait
.text "The Knights of Munster dare to cross"
.byte NewLine
.text "the border?! Raydrik, do you hold me"
.byte NewLine
.text "in such contempt as to attack so brazenly?!"
.byte WaitForA
.byte ScrollText
.text "Men of the Panzerritter, sortie and engage the"
.byte NewLine
.text "knights! We'll show them the wrath of Meath!"
.byte WaitForA

.byte EndText

ch7raydrikdialogue

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait
.text "H-Hannibal himself has taken the field?!"
.byte NewLine
.text "Of all the times for that doddering fool"
.byte NewLine
.text "to show his face..."
.byte WaitForA
.byte ScrollText
.text "All knights, fall back! Retreat to Munster!"
.byte WaitForA

.byte EndText

ch7eisenauspawn

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait
.text "The rebels have a head start, but they're"
.byte NewLine
.text "only on foot."
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word eisenau_portrait

.byte Right_slot
.text " Eisenhau, chase them down"
.byte NewLine
.text "with your knights and eliminate them."
.byte WaitForA
.byte ScrollText
.text "Don't allow them to set even one foot"
.byte NewLine
.text "on Castle Meath's soil."
.byte WaitForA

.byte Left_slot
.text "Aye, milord, but...Thracia is our sworn ally."
.byte NewLine
.text "Why would the rebels head to Castle Meath?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Oh, please... Thracia and the Empire"
.byte NewLine
.text "can mix no better than oil and water."
.byte WaitForA
.byte ScrollText
.text "We may be allies, but we're certainly"
.byte NewLine
.text "not friends. If the rebels have any sense,"
.byte NewLine
.text "they'll use that to their advantage."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Ah... I see."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Perhaps I'm overestimating them,"
.byte NewLine
.text "but I'll not be made a fool of twice."
.byte WaitForA
.byte ScrollText
.text "Still, we can't overplay our hand:"
.byte NewLine
.text "Hannibal's elite knights, the Panzerritter,"
.byte NewLine
.text "lie in wait inside the castle."
.byte WaitForA
.byte ScrollText
.text "Attacking them would be tantamount to"
.byte NewLine
.text "a declaration of war. If they take the field, you"
.byte NewLine
.text "must not lay a hand on them, no matter what!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Aye, milord!"
.byte WaitForA

.byte EndText


ch7purewaterhouse

.byte Right_slot
.word LoadPortrait
.word moustache_portrait
.text "If yer feelin' lucky, why not head to the arena"
.byte NewLine
.text "just south o' here?"
.byte WaitForA
.byte ScrollText
.text "If you compete there an' win,"
.byte NewLine
.text "you'll make out with a pouch o' coin"
.byte NewLine
.text "an' a fair bit of experience!"
.byte WaitForA
.byte ScrollText
.text "Oh, but all fights are to the death,"
.byte NewLine
.text "so don't hesitate to yield by [pressing the"
.byte NewLine
.text "B Button] if things start goin' south!"
.byte WaitForA
.byte ScrollText
.text "An' don't feel like you gotta clear out"
.byte NewLine
.text "everybody inside, neither! Pacing yerself is"
.byte NewLine
.text "more important than winnin' first place!"
.byte WaitForA
.byte ScrollText
.text "Oh, an' if yer magic needs an extra edge—"
.byte NewLine
.text "whether yer usin' it or defendin' against it—"
.byte NewLine
.text "use this afore you go inside."
.byte WaitForA

.byte EndText

ch7antitoxinhouse

.byte Right_slot
.word LoadPortrait
.word beardedman_portrait
.text "Yer headed fer Tahra?"
.byte NewLine
.text "Best take this Antitoxin with you, then."
.byte WaitForA
.byte ScrollText
.text "If you get stuck with one o' them"
.byte NewLine
.text "Venin weapons, just pour that over yer wound"
.byte NewLine
.text "and it'll clear right up."
.byte WaitForA
.byte ScrollText
.text "I hear lotsa those bandits to the west like usin'"
.byte NewLine
.text "poisons... One dose o' the stuff an' you'll be in"
.byte NewLine
.text "fer a bad time, so keep that Antitoxin handy."
.byte WaitForA

.byte EndText

ch7mastersealhouse

.byte Right_slot
.word LoadPortrait
.word younglady_portrait
.text "Heeey there, soldier. At the risk of sounding"
.byte NewLine
.text "too forward, I've always admired"
.byte NewLine
.text "the Panzerritter, you know."
.byte WaitForA
.byte ScrollText
.text "You folks are just so brave,"
.byte NewLine
.text "with a body to match..."
.byte WaitForA
.byte ScrollText
.text "Hm? Beg pardon?"
.byte NewLine
.text "You're not with the Panzerritter?"
.byte WaitForA
.byte ScrollText
.text "...Oh, c'mon! I had this whole spiel prepared"
.byte NewLine
.text "an' everything! Ugh, there go my plans..."
.byte WaitForA
.byte ScrollText
.text "Look, one of the knights in the Panzerritter"
.byte NewLine
.text "was by earlier, and he left this here."
.byte WaitForA
.byte ScrollText
.text "I thought it was the classic “pretend to forget"
.byte NewLine
.text "something so you have an excuse"
.byte NewLine
.text "to come back” ploy, but I guess not..."
.byte WaitForA
.byte ScrollText
.text "Well, see that this gets back to him, will you?"
.byte WaitForA

.byte EndText

ch7wm1

.text "His mind consumed by regret,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0101 ;leify-left
.word $0706 ;y then x
.byte NewLine
.text "Leif managed to escape Munster."
.byte WaitForA
.byte ScrollText
.text "He was joined by several members of the"
.byte NewLine
.text "Magi, who pledged themselves to his service."
.byte WaitForA
.word ClearPortraitalt
.long $82937A
.word $0001
.byte ScrollText

.byte EndText

ch7wm2

.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0101 ;leify-left
.word $0910 ;y then x
.text "Yet there was no time to celebrate:"
.byte WaitForA
.byte NewLine
.text "an enormous price had been placed"
.byte NewLine
.text "on Leif's head, "
.byte WaitForA
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0072 ;Jabal
.word $0B05 ;y then x
.text "and countless bounty hunters"
.byte NewLine
.text "were determined to claim it."
.byte WaitForA
.byte ScrollText
.text "What's more,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0278 ;raydrik
.word $0109 ;y then x
.text " the Knights of Munster"
.byte NewLine
.text "had doggedly pursued Leif, "
.byte WaitForA
.byte NewLine
.text "and their forces were growing"
.byte NewLine
.text "dangerously close..."
.byte WaitForA

.byte EndText