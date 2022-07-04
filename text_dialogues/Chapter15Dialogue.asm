ch15ralphamaldaspawn

.byte Right_slot
.word LoadPortrait
.word bishop_portrait

.byte Left_slot
.word LoadPortrait
.word amalda_portrait
.text "It was good seeing you, Bishop, though"
.byte NewLine
.text "I wish it were under better circumstances."
.byte NewLine
.text "You'll watch over the children, I trust."
.byte WaitForA

.byte Right_slot
.text "Of course, milady. They'll be most safe here—"
.byte NewLine
.text "the Empire has no reason to come all this way"
.byte NewLine
.text "through the mountains for one poor village."
.byte WaitForA
.byte ScrollText
.text "Truth be told, I'm most glad to dedicate"
.byte NewLine
.text "my final years to raising these children."
.byte WaitForA
.byte ScrollText
.text "But what of you, Lady Amalda?"
.byte NewLine
.text "Will you be all right?"
.byte WaitForA
.byte ScrollText
.text "If the Empire learns of what you've done here,"
.byte NewLine
.text "I shudder to think of what terrible fate"
.byte NewLine
.text "would befall you..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I feel no fear, only shame—shame that,"
.byte NewLine
.text "even as a proud knight of House Friege,"
.byte NewLine
.text "I can only help these children in secret."
.byte WaitForA
.byte ScrollText
.text "With each passing day, more and more"
.byte NewLine
.text "are taken captive and sent to Belhalla..."
.byte NewLine
.text "I can only save but a handful."
.byte WaitForA
.byte ScrollText
.text "Each time His Majesty grants me an audience,"
.byte NewLine
.text "I try to convince him that going along"
.byte NewLine
.text "with these child hunts is a grave mistake."
.byte WaitForA
.byte ScrollText
.text "But time and time again,"
.byte NewLine
.text "he simply refuses to listen to reason..."
.byte WaitForA
.byte ScrollText
.text "And now I'm in command of a whole division..."
.byte NewLine
.text "How can I lead my men when I don't even"
.byte NewLine
.text "believe in our orders myself?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word schroff_portrait
.text "I do understand how you must feel,"
.byte NewLine
.text "Lady Amalda, but you mustn't let yourself"
.byte NewLine
.text "get careless."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Father Schroff, I can't just—"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Without you, we'd have no way of helping"
.byte NewLine
.text "the captive children at all. We'd be reduced"
.byte NewLine
.text "from rescuing a handful to rescuing none."
.byte WaitForA
.byte ScrollText
.text "Think of how many more lives we have"
.byte NewLine
.text "yet to save before throwing your own away."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...You're right."
.byte NewLine
.text "Thank you for your counsel, Father Schroff."
.byte NewLine
.text "I'll do as you advise."
.byte WaitForA
.byte ScrollText
.word LoadPortrait
.word bishop_portrait

.byte Right_slot
.byte ScrollText
.text "She walks a hard road, that one."
.byte NewLine
.text "Would that our own was any easier..."
.byte WaitForA

.byte Left_slot
.text "Yet for all that we do, the world is still"
.byte NewLine
.text "crumbling to pieces all around us."
.byte NewLine
.text "We can do naught but pray as it collapses..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Perhaps... But I know what I heard"
.byte NewLine
.text "at the Tower of Bragi."
.byte WaitForA
.byte ScrollText
.text "“When the three lights converge as one,"
.byte NewLine
.text "darkness shall be banished"
.byte NewLine
.text "from the living world.”"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "The voice of Father Claud,"
.byte NewLine
.text "long since dead and buried..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I'm sure it was him."
.byte WaitForA
.byte ScrollText
.text "He asked a service of me, saying,"
.byte WaitForA
.byte NewLine
.text "“O righteous man, servant of Bragi, do what"
.byte NewLine
.text "I cannot: be my eyes, look upon your world,"
.byte NewLine
.text "and tell me what it has become.”"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Mm... I understand."
.byte NewLine
.text "You're meant for greater things than raising"
.byte NewLine
.text "a few toddlers in a remote village."
.byte WaitForA
.byte ScrollText
.text "Go. Embark on this journey"
.byte NewLine
.text "the gods have charged you with."
.byte NewLine
.text "Worry not, I'll care for the children."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Thank you, Bishop..."
.byte NewLine
.text "Please forgive my selfishness."
.byte NewLine
.text "I'm deeply sorry I cannot stay..."
.byte WaitForA
.byte ScrollText
.word LoadPortrait
.word ralph_portrait

.byte Left_slot
.byte ScrollText

.word PlayMusic
.byte $31

.byte Right_slot
.text "Bishop?"
.byte NewLine
.text "We got a big problem on our hands."
.byte NewLine
.text "A pack of bandits are closing in on the village."
.byte WaitForA

.byte Left_slot
.text "H-How can that be?!"
.byte NewLine
.text "We have nothing of value!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Guess they got their reasons, 'cause I just saw"
.byte NewLine
.text "'em headed this way with my own two eyes."
.byte WaitForA
.byte ScrollText
.text "That woman you were talking with, the knight,"
.byte NewLine
.text "she says she's gonna help fight 'em off."
.byte WaitForA
.byte ScrollText
.text "But with just the two of us,"
.byte NewLine
.text "I dunno how long we can hold 'em back."
.byte WaitForA
.byte ScrollText
.text "You'd best take all the women and children"
.byte NewLine
.text "an' hightail it outta here."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Will the gods grant us no respite? Bah!"
.byte WaitForA
.byte ScrollText
.text "Very well, Ralph, I'll do as you say."
.byte NewLine
.text "You have my apologies..."
.byte WaitForA
.byte ScrollText
.text "A sellsword defending a poor village"
.byte NewLine
.text "for no pay... You're proof that not all good"
.byte NewLine
.text "has vanished from the world. We all thank you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Thank destiny, 'cause it seems to have placed"
.byte NewLine
.text "me at the right place, at the right time."
.byte WaitForA

.byte EndText


ch15armorslayerhouse

.byte Right_slot
.word LoadPortrait
.word moustache_portrait
.text "Strong folk need strong swords, right?"
.byte NewLine
.text "I'd say you sure qualify."
.byte NewLine
.text "Take this as thanks for comin' to help us."
.byte WaitForA

.byte EndText


ch15skillringhouse

.byte Right_slot
.word LoadPortrait
.word oldman_portrait
.text "Hey there, chum!"
.byte NewLine
.text "I've got somethin' just for you."
.byte WaitForA
.byte ScrollText
.text "Never you mind how I got ahold of such a"
.byte NewLine
.text "thing. Them bandits outside are tryin' to take"
.byte NewLine
.text "what little this village has, that's what matters!"
.byte WaitForA

.byte EndText


ch15killerlancehouse

.byte Right_slot
.word LoadPortrait
.word elder_portrait
.text "By Ornery Od!"
.byte NewLine
.text "You've really come to help our village?"
.byte WaitForA
.byte ScrollText
.text "Well, it ain't right fer a good deed"
.byte NewLine
.text "to go unrewarded."
.byte NewLine
.text "Here, take this spear fer yer trouble."
.byte WaitForA
.byte ScrollText
.text "I'll be honest: I'm a simple man,"
.byte NewLine
.text "and I got no way of knowin' how valuable it is."
.byte WaitForA
.byte ScrollText
.text "Could be worth a king's ransom,"
.byte NewLine
.text "could be worth less than the metal it's made of."
.byte WaitForA
.byte ScrollText
.text "But it ain't goin' to any use collecting dust"
.byte NewLine
.text "in my attic, that's fer sure."
.byte WaitForA
.byte ScrollText
.text "Heheh, hope it ends up bein' worth somethin'!"
.byte WaitForA

.byte EndText


ch15ullurscroll

.byte Right_slot
.word LoadPortrait
.word oldlady_portrait
.text "Ye wouldn't happen to have any idea"
.byte NewLine
.text "what this parchment is, would ye?"
.byte WaitForA
.byte ScrollText
.text "I found it just layin' in the middle of the road"
.byte NewLine
.text "not long ago."
.byte WaitForA
.byte ScrollText
.text "Even though it makes me bones"
.byte NewLine
.text "feel more nimble, somethin' about it"
.byte NewLine
.text "just gives me the willies."
.byte WaitForA
.byte ScrollText
.text "I figure it's gotta be cursed. I mean,"
.byte NewLine
.text "if somethin' seems too good to be true,"
.byte NewLine
.text "it probably is, aye?"
.byte WaitForA
.byte ScrollText
.text "But I can't just throw it away, neither!"
.byte NewLine
.text "In every folktale, tryin' to get rid of the"
.byte NewLine
.text "cursed thing is what makes the curse worse!"
.byte WaitForA
.byte ScrollText
.text "Eh? Come again?"
.byte NewLine
.text "Ye... Ye want it, do ye?"
.byte NewLine
.text "Well, ye don't need to ask me twice! Take it!"
.byte WaitForA

.byte EndText


ch15ralphrecruitment

.byte Right_slot
.word LoadPortrait
.word ralph_portrait

.byte Left_slot
.word LoadPortrait
.word leif_portrait
.text "Are you a sellsword hired by the village?"
.byte WaitForA

.byte Right_slot
.text "Depends what you mean."
.byte NewLine
.text "I'm fighting for the village,"
.byte NewLine
.text "but I sure don't remember gettin' paid by 'em."
.byte WaitForA
.byte ScrollText
.text "Not that I woulda taken their gold"
.byte NewLine
.text "even if they had offered me any."
.byte NewLine
.text "Couldn't take coin from the needy."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Then why fight on their behalf?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I stumbled across this place in the middle of"
.byte NewLine
.text "my own little journey and they lent me a hand."
.byte NewLine
.text "Time to return the favor, that's all."
.byte WaitForA
.byte ScrollText
.text "Not that it's any of your business, ya little brat."
.byte NewLine
.text "Just who are you supposed to be, anyway?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Ah, my apologies."
.byte NewLine
.text "I shouldn't have started prying"
.byte NewLine
.text "without introducing myself first."
.byte WaitForA
.byte ScrollText
.text "I'm Leif of Leonster."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Leif...?"
.byte NewLine
.text "H-How...?!"
.byte NewLine
.text "Are you THE Leif, the prince?"
.byte WaitForA
.byte ScrollText
.text "Talk about being in the right place"
.byte NewLine
.text "at the right time! See, I'm Ralph, an' I'm"
.byte NewLine
.text "not much more than a lowly sellsword, myself."
.byte WaitForA
.byte ScrollText
.text "If it's all right with you, Prince,"
.byte NewLine
.text "could I join your army?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Of course!"
.byte NewLine
.text "We could always use more men like you."
.byte WaitForA
.byte ScrollText
.text "Though if I may, I'd like to ask you something."
.byte NewLine
.text "Why exactly do you want to join my army?"
.byte NewLine
.text "What's your reason?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Because I won't put up with living under"
.byte NewLine
.text "the Empire's thumb for one moment longer."
.byte NewLine
.text "That good enough of a reason?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I...can't say I disagree,"
.byte NewLine
.text "so that suffices for me, yes."
.byte WaitForA
.byte ScrollText
.text "Ralph, my greatest desire is to free every"
.byte NewLine
.text "person suffering under the Empire's tyranny."
.byte NewLine
.text "Do you swear to fight for that cause?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Sure do!"
.byte NewLine
.text "Leave it to me!"
.byte WaitForA

.byte EndText


ch15amaldaleave

.byte Right_slot
.word LoadPortrait
.word amalda_portrait
.text "Wonders never cease..."
.byte NewLine
.text "That band of soldiers has come"
.byte NewLine
.text "to the village's rescue."
.byte WaitForA
.byte ScrollText
.text "The gods may yet be merciful..."
.byte NewLine
.text "Now, it's high time I returned"
.byte NewLine
.text "to my own soldiers."
.byte WaitForA

.byte EndText


ch15mareetashannam1

.byte Right_slot
.word LoadPortrait
.word shannam_portrait

.byte Left_slot
.word LoadPortrait
.word mareeta_portrait
.text "Hold! Who are you?!"
.byte NewLine
.text "Another one of the Empire's lapdogs?!"
.byte WaitForA

.byte Right_slot
.text "How uncouth..."
.byte NewLine
.text "If you wish to live, turn your blade aside."
.byte WaitForA
.byte ScrollText
.text "I didn't learn the technique of Astra"
.byte NewLine
.text "just to waste it on cutting down"
.byte NewLine
.text "clueless little girls like you."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Astra?"
.byte NewLine
.text "B-But that's the secret art"
.byte NewLine
.text "of the Isaachian royal family...!"
.byte WaitForA
.byte ScrollText
.text "That would make you—"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Correct."
.byte NewLine
.text "It is I, Prince Shannan of Isaach."
.byte WaitForA
.byte ScrollText
.text "But I've been forced to hide my identity,"
.byte NewLine
.text "so do us both a favor"
.byte NewLine
.text "and forget you ever saw me."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Prince Shannan!"
.byte NewLine
.text "I would ask something of you!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hrk!"
.byte NewLine
.text "K-Keep your voice down, would you?"
.byte NewLine
.text "Let's avoid any surprises, shall we?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Please, you must teach me"
.byte NewLine
.text "some of your swordplay! I beg of you!"
.byte WaitForA
.byte ScrollText
.text "It doesn't have to be a prolonged lesson."
.byte NewLine
.text "Just knowing the secret of how to perform"
.byte NewLine
.text "Astra would be enough..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "......"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Please, Prince Shannan!"
.byte NewLine
.text "I want—no, I NEED to become stronger!"
.byte NewLine
.text "No matter what, I must grow stronger...!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "W-Well, I could take you through"
.byte NewLine
.text "the motions, I suppose..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Would you?"
.byte NewLine
.text "Oh, I'd be in your debt!"
.byte WaitForA
.byte ScrollText

.word ClearPortrait
.word RetractBox

.word PlayMusic
.byte $4C

.byte Right_slot
.byte ScrollText
.text "Oof, this has gone from bad to worse."
.byte NewLine
.text "Guess I'll just ramble off some vague nonsense"
.byte NewLine
.text "about swordsmanship..."
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word mareeta_portrait

.byte Right_slot
.byte ScrollText
.text "Knowing the movements of the technique"
.byte NewLine
.text "is important, of course, but more important"
.byte NewLine
.text "is your spirit, your heart."
.byte WaitForA
.byte ScrollText
.text "When the swiftness of your body becomes one"
.byte NewLine
.text "with the sharpness of your mind,"
.byte NewLine
.text "only then are you capable of learning Astra."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "My body and my mind...?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Indeed."
.byte NewLine
.text "Now, to begin with, make a simple swing"
.byte NewLine
.text "with your sword."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "But how should I swing it, exactly?"
.byte NewLine
.text "Could you demonstrate? Just once?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Uhhh..."
.byte WaitForA
.byte ScrollText
.text "N-No, that would defeat the whole point."
.byte NewLine
.text "Astra can only be mastered through"
.byte NewLine
.text "your own attempts to understand it."
.byte WaitForA
.byte ScrollText
.text "If I were to demonstrate it,"
.byte NewLine
.text "all you would learn is how to imitate me."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText
.text "Yeah, that sounded good..."
.byte WaitForA
.byte ScrollText

.byte Left_slot
.word LoadPortrait
.word mareeta_portrait
.text "So that's how it is, huh...?"
.byte NewLine
.text "All right. I'll just try something, then."
.byte WaitForA
.byte ScrollText
.text "Hee-yah!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "No, not like that!"
.byte NewLine
.text "You're doing it completely wrong!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Haaa-yah!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "No, no!"
.byte NewLine
.text "Now you're just flailing your sword around"
.byte NewLine
.text "like you're blindfolded!"
.byte WaitForA
.byte ScrollText
.text "It's about using your body and mind together,"
.byte NewLine
.text "remember?"
.byte NewLine
.text "Your body is working, but your mind isn't in it!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText
.text "I have no idea what I'm saying."
.byte WaitForA
.byte ScrollText

.byte Left_slot
.word LoadPortrait
.word mareeta_portrait
.text "Focus my mind into my body..."
.byte NewLine
.text "Focus my mind into my body..."
.byte NewLine
.text "HAAA-YAH!"
.byte WaitForA

.byte EndText


ch15mareetashannam2

.byte Right_slot
.word LoadPortrait
.word shannam_portrait

.byte Left_slot
.word LoadPortrait
.word mareeta_portrait
.text "W-Was that...?"
.byte NewLine
.text "I can't believe it...!"
.byte WaitForA

.byte Right_slot
.text "...No way..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "No, that can't be it!"
.byte NewLine
.text "It isn't really THAT easy, is it, Prince Shannan?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Huh?"
.byte NewLine
.text "Oh, well, uh... Of course not, my pupil!"
.byte NewLine
.text "You couldn't call that a perfected Astra!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "That's what I thought."
.byte NewLine
.text "I mean, that hardly took any time at all..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "A-At any rate, I promised to show you"
.byte NewLine
.text "the motions, and I've made good on my word."
.byte NewLine
.text "I'll be taking my leave now."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Thank you for everything, Prince Shannan!"
.byte WaitForA

.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word mareeta_portrait
.text "Focus my mind into my body..."
.byte NewLine
.text "Focus my body into my mind..."
.byte WaitForA
.byte ScrollText

.word ClearPortrait
.word RetractBox

.word LoadPortrait
.word shannam_portrait
.text "Maaan, what was up with that girl?"
.byte WaitForA

.byte EndText


ch15opening1

.byte Right_slot
.word LoadPortrait
.word dorias_portrait
.text "Prince Leif, a moment, if I may?"
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word leif_portrait

.byte Right_slot
.byte ScrollText
.text "I would advise heading west at the pass"
.byte NewLine
.text "up ahead to reach the road to Nordrhein."
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word augustus_portrait
.text "And it is on this matter that Duke Dorius and I"
.byte NewLine
.text "are of different minds."
.byte NewLine
.text "I instead argue heading east at the pass."
.byte WaitForA
.byte ScrollText
.text "That route will allow us to attack Leonster"
.byte NewLine
.text "from the south, where the Empire's defenses"
.byte NewLine
.text "are sure to be weaker."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Clearly you aren't well-acquainted"
.byte NewLine
.text "with the area. If you were, you'd know that"
.byte NewLine
.text "Millefeuille Forest lies to Leonster's south."
.byte WaitForA
.byte ScrollText
.text "The place is synonymous with folk getting lost"
.byte NewLine
.text "and never returning!"
.byte NewLine
.text "Hell, the locals even call it the “Mirage Forest!”"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Don't patronize me."
.byte WaitForA
.byte ScrollText
.text "I'm well aware of the dangers—but so is"
.byte NewLine
.text "the Empire. They won't be expecting an attack"
.byte NewLine
.text "to come from such a treacherous area."
.byte WaitForA
.byte ScrollText
.text "With our smaller numbers, making clever use"
.byte NewLine
.text "of the terrain is our only hope of victory."
.byte NewLine
.text "That's just basic tactics!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I must strenuously object!"
.byte NewLine
.text "All of Thracia—no, all of Jugdral is watching"
.byte NewLine
.text "our battle! This is about more than victory!"
.byte WaitForA
.byte ScrollText
.text "We cannot merely win, we must win"
.byte NewLine
.text "in such a way that gives inspiration and hope"
.byte NewLine
.text "to the masses oppressed by the Empire!"
.byte WaitForA
.byte ScrollText
.text "Are we to skulk through the woods"
.byte NewLine
.text "like common bandits? Nay!"
.byte WaitForA
.byte ScrollText
.text "We have to make a glorious spectacle of it,"
.byte NewLine
.text "charging into battle with Leonster's flag"
.byte NewLine
.text "held high!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Such a spectacle would indeed be glorious—"
.byte NewLine
.text "for the Empire."
.byte WaitForA
.byte ScrollText
.text "We'd be charging right into their front lines."
.byte NewLine
.text "Our casualties would be enormous."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Some of our own would perish, true,"
.byte NewLine
.text "but it would be an honorable death"
.byte NewLine
.text "worthy of a knight of Leonster."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Don't presume to speak for all of us,"
.byte NewLine
.text "Duke Dorius. Only a small fraction of our"
.byte NewLine
.text "troops are knights—many more hold no title."
.byte WaitForA
.byte ScrollText
.text "To them, your notion of an “honorable death”"
.byte NewLine
.text "is something neither meaningful nor desirable."
.byte WaitForA
.byte ScrollText
.text "See that you don't get innocent men killed"
.byte NewLine
.text "by projecting your own values onto them."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Th-That's uncalled for, August!"
.byte NewLine
.text "Your very words come perilously close"
.byte NewLine
.text "to an insult!"
.byte WaitForA
.byte ScrollText
.text "*Sigh*"
.byte NewLine
.text "Though I suppose there's little point"
.byte NewLine
.text "to us arguing further."
.byte WaitForA
.byte NewLine
.text "The decision rests with Prince Leif now."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...Indeed it does."
.byte NewLine
.text "We shall do as the prince commands."
.byte WaitForA

.byte EndText


ch15opening2

.byte Right_slot
.word LoadPortrait
.word seil_portrait

.byte Left_slot
.word LoadPortrait
.word merc_portrait
.text "Boss, Boss! I gots a great idea!"
.byte NewLine
.text "Let's hit up that there village today!"
.byte WaitForA

.byte Right_slot
.text "What, that old slum?"
.byte NewLine
.text "It's just a couple lean-tos and an outhouse."
.byte NewLine
.text "They don't got nuthin' worth stealin'."
.byte WaitForA
.byte ScrollText
.text "Heh, burnin' the place down might actually be"
.byte NewLine
.text "an improvement fer them villagers."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "They might not got anything valuable,"
.byte NewLine
.text "but they DO got girls. Real pretty girls."
.byte WaitForA
.byte ScrollText
.text "We could just snatch 'em up and sell 'em"
.byte NewLine
.text "to slavers! It'd be an easy payday!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Huh..."
.byte NewLine
.text "You might be onto something, young'un!"
.byte WaitForA
.byte ScrollText
.text "All right, let's do it! Move out, boys!"
.byte NewLine
.text "Round up all the ladyfolk"
.byte NewLine
.text "and kill everybody else!"
.byte WaitForA

.byte EndText


ch15rightaugustus

.byte Right_slot
.word LoadPortrait
.word augustus_portrait
.text "This path shall take us through the deep"
.byte NewLine
.text "woodlands of Millefeuille Forest, better"
.byte NewLine
.text "known as the infamous “Mirage Forest.”"
.byte WaitForA
.byte ScrollText
.text "We would encounter little resistance,"
.byte NewLine
.text "but there may well be unforeseen hazards"
.byte NewLine
.text "we have yet to discover."
.byte WaitForA

.byte EndText


ch15rightaugustusyesno

.word $2E00
.long $8CBBBC
.byte Right_slot
.word LoadPortrait
.word augustus_portrait
.text "Shall we proceed, my prince?"
.byte NewLine
.text "     Yes"
.byte NewLine
.text "     No"
.word $2E00
.long $8CBBCC

.byte EndText


ch15bishopnoleif

.byte Right_slot
.word LoadPortrait
.word bishop_portrait
.text "Good heavens, what a day this has been..."
.byte NewLine
.text "Ah! You're the strangers that came"
.byte NewLine
.text "to our village's aid, are you not?"
.byte WaitForA
.byte ScrollText
.text "I wish to thank your leader personally."
.byte NewLine
.text "Where might they be?"
.byte WaitForA

.byte EndText


ch15bishopleif

.byte Left_slot
.word LoadPortrait
.word leif_portrait

.byte Right_slot
.word LoadPortrait
.word bishop_portrait
.text "My goodness, we owe you and your forces"
.byte NewLine
.text "quite the debt... Your decision to aid us is"
.byte NewLine
.text "the only reason any of us still draw breath."
.byte WaitForA
.byte ScrollText
.text "Please accept this gift"
.byte NewLine
.text "as a token of our gratitude."
.byte WaitForA

.byte EndText


ch15closing

.byte Left_slot
.word LoadPortrait
.word bishop_portrait

.byte Right_slot
.word LoadPortrait
.word leif_portrait
.text "Thank you, Bishop."
.byte NewLine
.text "If you'll excuse us,"
.byte NewLine
.text "my men and I must be on our way."
.byte WaitForA

.byte Left_slot
.text "Where are you headed, might I ask?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "We ride for Leonster."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Is that so?"
.byte NewLine
.text "I've a favor to ask of you, then."
.byte WaitForA
.byte ScrollText
.text "A disciple of mine, Schroff, left here on..."
.byte NewLine
.text "something of a personal journey."
.byte WaitForA
.byte ScrollText
.text "If you happen to cross paths,"
.byte NewLine
.text "do send word that the lad is all right."
.byte WaitForA
.byte ScrollText
.text "That said, I offer to send you partway there"
.byte NewLine
.text "with my Warp staff."
.byte WaitForA
.byte ScrollText
.text "I can teleport you to one of two places:"
.byte WaitForA
.byte NewLine
.text "The first is Millefeuille Forest, which is"
.byte NewLine
.text "to the south of Leonster. Be warned: there's"
.byte NewLine
.text "a reason it has the nickname “Mirage Forest.”"
.byte WaitForA
.byte ScrollText
.text "The second is Nordrhein, the coastline"
.byte NewLine
.text "that runs all the way to Leonster. But you'd"
.byte NewLine
.text "have to breach the fort the Empire has there."
.byte WaitForA

.byte EndText


ch15bishopyesno

.word $2E00
.long $8CBBBC
.byte Right_slot
.word LoadPortrait
.word leif_portrait
.byte Left_slot
.word LoadPortrait
.word bishop_portrait
.text "Which way shall I send you?"

.byte Right_slot
.text "Please send us toward..."
.byte NewLine
.text "     Fort Nordrhein"
.byte NewLine
.text "     Millefeuille Forest"
.word $2E00
.long $8CBBCC

.byte EndText


ch15leftdorias

.byte Right_slot
.word LoadPortrait
.word dorias_portrait
.text "This way leads to Nordrhein, which will"
.byte NewLine
.text "take us north along the coast to Leonster."
.byte WaitForA
.byte ScrollText
.text "Seasoned Imperial troops will be"
.byte NewLine
.text "on the lookout for us. I anticipate"
.byte NewLine
.text "the battle will be a difficult one indeed."
.byte WaitForA

.byte EndText


ch15leftdoriasyesno

.word $2E00
.long $8CBBBC
.byte Right_slot
.word LoadPortrait
.word dorias_portrait
.text "Is this your will, sire?"
.byte NewLine
.text "     Yes"
.byte NewLine
.text "     No"
.word $2E00
.long $8CBBCC

.byte EndText


ch15wm1

.text "Abiding by the armistice"
.byte NewLine
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0036 ;arion
.word $0907 ;y then x
.text "brokered by Arion and Linoan, "
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0126 ;linoan
.word $0915 ;y then x
.byte WaitForA
.byte NewLine
.text "the Liberation Army withdrew from Tahra."
.byte WaitForA
.word ClearPortraitalt
.long $82937A
.word $0000
.byte ScrollText
.word ClearPortraitalt
.long $82937A
.word $0001
.text "Their next goal was a matter of some debate:"
.byte WaitForA

.byte EndText


ch15wm2

.byte NewLine
.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0178 ;raydrik
.word $020F ;y then x
.text "the Fiana Freeblades and the Magi wished to"
.byte NewLine
.text "make for Castle Munster and liberate it first,"
.byte WaitForA
.word ClearPortraitalt
.long $82937A
.word $0001
.byte ScrollText

.byte EndText


ch15wm3

.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0151
.word $0112 ;y then x
.text "while the nobles of Leonster"
.byte NewLine
.text "and the sellswords of Tahra"
.byte WaitForA
.byte NewLine
.text "favored liberating Castle Leonster first."
.byte WaitForA
.word ClearPortraitalt
.long $82937A
.word $0001
.byte ScrollText
.text "Ultimately, pragmatism prevailed,"
.byte WaitForA
.byte NewLine
.text "as it was agreed that seizing Leonster first"
.byte NewLine
.text "was more advantageous to the army's mobility."
.byte WaitForA
.byte ScrollText

.byte EndText


ch15wm4

.word LoadPortraitalt_1
.long LoadPortraitalt_2
.word $0001 ;leify-right
.word $070F ;y then x
.text "However, Leif would soon have to make"
.byte NewLine
.text "another strategic decision..."
.byte WaitForA

.byte EndText