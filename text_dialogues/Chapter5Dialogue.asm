;	Refer to the "Chapter 5 Flowchart" file in the docs folder for more info.

ch5op1

.byte Left_slot
.word LoadPortrait
.word eyvel_portrait

.byte Right_slot
.word LoadPortrait
.word nanna_portrait

.byte Left_slot
.text "Little Lady! You're a sight for sore eyes!"
.byte WaitForA

.byte Right_slot
.text "Eyvel..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I can't tell you how glad I am that you're safe,"
.byte NewLine
.text "Little Nan. Did that maggot Raydrik hurt you?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I-I'm fine, but... But Mareeta, she..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Mareeta?! What's happened to my Mareeta?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I don't know if she's even alive... We were"
.byte NewLine
.text "separated as soon as we got to the castle."
.byte WaitForA
.byte ScrollText

.byte Left_slot
.byte ScrollText
.word ClearPortrait

.byte Right_slot
.word LoadPortrait
.word eyvel_portrait

.byte Left_slot
.word LoadPortrait
.word raydrik_portrait

.word PlayMusic
.byte $3B

.byte Right_slot
.text "Raydrik! This your idea of a joke?! You gave"
.byte NewLine
.text "me your word that I could see my daughter!"
.byte WaitForA
.byte ScrollText
.text "Are you such an excuse of a man that"
.byte NewLine
.text "even your word means nothing?!"
.byte WaitForA

.byte Left_slot
.text "I never lied. Of course you can see"
.byte NewLine
.text "your daughter. I just made a small...omission."
.byte WaitForA

.byte Right_slot
.byte ScrollText

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word nanna_portrait
.text "Look out, Eyvel!"
.byte NewLine
.text "There's armed men coming toward us!"
.byte WaitForA

.byte EndText

ch5op2

.byte Left_slot
.word LoadPortrait
.word raydrik_portrait

.byte Right_slot
.word LoadPortrait
.word eyvel_portrait
.text "Tch!"
.byte WaitForA

.byte Left_slot
.text "These are my terms: defeat my prized"
.byte NewLine
.text "pitfighters, and you can see your daughter."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "......"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Ah, here they come now."
.byte WaitForA
.byte ScrollText
.text "Pitfighters, meet Eyvel. Eyvel, pitfighters."
.byte NewLine
.text "You've had your introductions—"
.byte NewLine
.text "let it never be said that I'm a poor host."
.byte WaitForA

.byte ScrollText
.word ClearPortrait

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word nanna_portrait

.byte Left_slot
.word LoadPortrait
.word eyvel_portrait

.byte Right_slot
.text "E-Eyvel..."
.byte WaitForA

.byte Left_slot
.text "...Little Lady, this is gonna get real dangerous,"
.byte NewLine
.text "real quick. Stay clear and keep your head down."
.byte WaitForA

.byte EndText

ch5raydrikveldturn1

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait

.byte Left_slot
.word LoadPortrait
.word veld_portrait

.byte Right_slot
.text "A thousand apologies to have kept you waiting,"
.byte NewLine
.text "Bishop Veld."
.byte WaitForA

.byte Left_slot
.text "Raydrik, you could not make one apology"
.byte NewLine
.text "and mean it, much less a thousand."
.byte WaitForA
.byte ScrollText
.text "For the Baron of such a troubled area"
.byte NewLine
.text "as Munster, you seem to have"
.byte NewLine
.text "an abundance of free time."
.byte WaitForA
.byte ScrollText
.text "These theatrics are not what you promised"
.byte NewLine
.text "you would spend your resources on."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I am...certain Your Eminence will enjoy"
.byte NewLine
.text "the spectacle I've prepared."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "*Sigh*"
.byte NewLine
.text "Oh, very well."
.byte NewLine
.text "I could do with a moment's diversion."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Well, it's all in her hands now..."
.byte NewLine
.text "That “Swordmaster” better live up to her name."
.byte WaitForA
.byte ScrollText
.text "Ah, and now the star takes center stage!"
.byte NewLine
.text "Heh, heh, heh..."
.byte WaitForA

.byte EndText

ch5mareetaloaded1

.byte Left_slot
.word LoadPortrait
.word raydrik_portrait

.byte Right_slot
.word LoadPortrait
.word eyvel_portrait

.byte Left_slot
.text "She's even more skilled than I'd hoped...!"
.byte NewLine
.text "How delightful! Here, a reward"
.byte NewLine
.text "befitting a magnificent performer!"
.byte WaitForA

.byte Right_slot
.text "What're you scheming?!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Heh... Bring the girl out!"
.byte WaitForA

.byte EndText

ch5mareetaloaded2

.byte Right_slot
.word LoadPortrait
.word eyvel_portrait

.byte Left_slot
.word LoadPortrait
.word mareeta_portrait

.byte Right_slot
.text "M-Mareeta...?"
.byte WaitForA

.byte Left_slot
.text "......"
.byte WaitForA
.byte ScrollText

.byte Right_slot
.byte ScrollText

.byte EndText

ch5mareetaloaded3

.byte Right_slot
.word LoadPortrait
.word nanna_portrait
.text "Mareeta, Mareeta! Oh, you're safe after all!"
.byte NewLine
.text "I can't tell you how worried I—" ; interrupt
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word eyvel_portrait
.text "Little Nan, don't move a muscle!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Huh?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word mareeta_portrait
.text "......"
.byte WaitForA
.byte ScrollText

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word eyvel_portrait

.byte EndText

ch5mareetaloaded4

.byte Right_slot
.text "Mareeta! Talk to me...!"
.byte WaitForA

.byte Left_slot
.text "...K-Kill..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "What?!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...Kill... Kill... KILL..."
.byte WaitForA
.byte ScrollText
.text "WITH THIS SWORD... ALL... ALL..."
.byte NewLine
.text "ALL OF YOU... KILL ALL OF YOU!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...Mareeta...you..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word raydrik_portrait
.text "Mother and daughter, reunited at last!"
.byte NewLine
.text "Tell me, is she all that you remembered, Eyvel?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...What have you done to my Mareeta?!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Me? I didn't do anything. Quite the contrary:"
.byte NewLine
.text "she was trying to escape, so I gave her"
.byte NewLine
.text "that sword to grant her a fighting chance."
.byte WaitForA
.byte ScrollText
.text "It's an exceptional blade, straight from"
.byte NewLine
.text "the treasure vault inside this very castle."
.byte WaitForA
.byte ScrollText
.text "...The Shadow Sword, I believe it's called."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "The Shadow Sword, a cursed blade..."
.byte NewLine
.text "You trying to turn my Mareeta into one of"
.byte NewLine
.text "your damned pitfighters with your little gift?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "My gift is cursed, you say?"
.byte NewLine
.text "Well, this is the first I'm hearing of it."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I'll rip that lying tongue right out of your"
.byte NewLine
.text "mouth! How... How dare you do this to Mar—" ; interrupt
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Amusing as your threats are, shouldn't you be"
.byte NewLine
.text "worrying about yourself right now?"
.byte WaitForA
.byte ScrollText
.text "The Shadow Sword bears incredible power—"
.byte NewLine
.text "an exceptional gift for an exceptional woman!"
.byte NewLine
.text "Ahahaha...!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Raydrik...!"
.byte WaitForA
.byte ScrollText

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word mareeta_portrait

.byte Right_slot
.text "Mareeta, look at me! Snap out of it!"
.byte WaitForA

.byte Left_slot
.text "......"
.byte WaitForA

.byte EndText

ch5mareetaresist

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait
.text "What's the meaning of this?"
.byte NewLine
.text "The girl wields the Shadow Sword,"
.byte NewLine
.text "yet she struggles to finish the job!"
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word veld_portrait
.text "Hmm... The blade does not appear"
.byte NewLine
.text "to rule over her completely."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "That's absurd!"
.byte NewLine
.text "As if that mere child could...could—" ; interrupt
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "The memories of her mother make her falter"
.byte NewLine
.text "and hesitate."
.byte WaitForA
.byte ScrollText
.text "Her emotions dull the sword's strength"
.byte NewLine
.text "the same as running its edge across stone."
.byte WaitForA
.byte ScrollText
.text "She's like a caged animal, desperately throwing"
.byte NewLine
.text "herself against her binds. Or have you not even"
.byte NewLine
.text "noticed her tears, you imbecile?"
.byte WaitForA

.byte EndText

ch5mareetacaptured

.byte Left_slot
.word LoadPortrait
.word mareeta_portrait

.byte Right_slot
.word LoadPortrait
.word eyvel_portrait

.byte Left_slot
.text "Agh...!"
.byte NewLine
.text "Let go..."
.byte NewLine
.text "LET GO..."
.byte WaitForA

.byte Right_slot
.text "...Sorry about this, Mareeta."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Ugh...!"
.byte WaitForA
.word ClearPortrait
.byte ScrollText

.byte Right_slot
.byte ScrollText

.byte Left_slot
.word LoadPortrait
.word raydrik_portrait
.text "What...?! She's been knocked out cold..."
.byte NewLine
.text "Is this some kind of jest...?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...Raydrik, you hellspawn..."
.byte WaitForA
.byte ScrollText
.text "As long as my heart beats,"
.byte NewLine
.text "I'll never forgive you..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Th-The woman's a beast...!"
.byte WaitForA
.byte ScrollText

.byte Right_slot
.byte ScrollText
.word ClearPortrait

.byte EndText

ch5mareetakilled

.byte Right_slot
.word LoadPortrait
.word eyvel_portrait
.text "...Mareeta... I'm sorry... I'm so sorry..."
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word raydrik_portrait
.text "She prevailed against even the Shadow Sword..."
.byte NewLine
.text "Is this some kind of jest...?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...Raydrik, you hellspawn..."
.byte WaitForA
.byte ScrollText
.text "As long as my heart beats,"
.byte NewLine
.text "I'll never forgive you..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Th-The woman's a beast...!"
.byte WaitForA
.byte ScrollText

.byte Right_slot
.byte ScrollText
.word ClearPortrait

.byte EndText

ch5raydrikpanicsA

.byte Left_slot
.word ClearPortrait
.word RetractBox

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait
.text "F-Fine, the girl wasn't enough for you?!"
.byte NewLine
.text "Let's see how you do"
.byte NewLine
.text "against my entire garrison!"
.byte WaitForA
.byte ScrollText
.text "All hands, enter the arena and stain the ground"
.byte NewLine
.text "with her blood!"
.byte WaitForA

.word PlayMusic
.word $3E

.byte Left_slot
.word LoadPortrait
.word veld_portrait
.text "Panicking already, Raydrik?"
.byte NewLine
.text "Fear not. I'll clean up your mess for you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word eyvel_portrait
.text "Wh-What...?!"
.byte WaitForA

.byte EndText

ch5eyvelcaptured

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait

.text "Tch..."
.byte NewLine
.text "In the end, she was a shadow"
.byte NewLine
.text "of what the rumors made her out to be."
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word guard_portrait
.text "What do you want done with her, sire?"
.byte WaitForA
.byte ScrollText

.word LoadPortrait
.word veld_portrait
.text "Don't kill her, Raydrik."
.byte NewLine
.text "Leave her fate in my hands."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word eyvel_portrait
.text "Wh-What...?"
.byte WaitForA

.byte EndText

ch5eyvelstone

.byte Left_slot
.word LoadPortrait
.word raydrik_portrait

.byte Right_slot
.word LoadPortrait
.word veld_portrait

.byte Left_slot
.text "G-Gods' breath... Your spellcraft is truly"
.byte NewLine
.text "a sight to behold, Your Eminence. Not even"
.byte NewLine
.text "the wildest fable could compare to this..."
.byte WaitForA

.byte Right_slot
.text "Heh, heh, heh..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "A-And now I have a perfect statue of the proud"
.byte NewLine
.text "warrior of Fiana—an eternal monument"
.byte NewLine
.text "to the price of defiance! Ahahaha!"
.byte WaitForA
.byte ScrollText

.byte Right_slot
.byte ScrollText

.byte EndText

ch5nannaleftalone

.byte Left_slot
.word ClearPortrait

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait

.byte Left_slot
.word LoadPortrait
.word guard_portrait
.text "...What about Finn's little brat?"
.byte WaitForA

.byte Right_slot
.text "Hmm... Leave the girl be. That fragile little"
.byte NewLine
.text "thing couldn't escape the castle."
.byte WaitForA
.byte ScrollText
.text "After this, I'm sure she'll serve"
.byte NewLine
.text "as a most entertaining diversion!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "As you wish, sire."
.byte WaitForA
.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText
.word ClearPortrait
.word LoadPortrait
.word nanna_portrait
.text "...Eyvel..."
.byte WaitForA

.byte EndText

ch5arenaopeneyvelnanna

.byte Right_slot
.word LoadPortrait
.word leif_portrait2
.text "Nanna! You're safe!"
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word nanna_portrait
.text "L-Lord Leif! Please, you have to help Eyvel!"
.byte NewLine
.text "I don't know how much more of this"
.byte NewLine
.text "she can take!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Leave it to us—but stay behind me, Nanna!"
.byte WaitForA
.byte ScrollText

.byte Left_slot
.byte ScrollText
.word LoadPortrait
.word eyvel_portrait

.byte Right_slot
.text "Commander, are you all right?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Little Lord! Everyone!"
.byte NewLine
.text "Heh, good to see you all made it!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I can't begin to thank you for protecting Nanna"
.byte NewLine
.text "in this ghastly place."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Would that I could've done the same"
.byte NewLine
.text "for my own kin..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "No... What's happened to Mareeta?"
.byte WaitForA

.byte EndText

ch5arenaopennannacaptured

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word eyvel_portrait

.byte Right_slot
.text "Commander, are you all right?"
.byte WaitForA

.byte Left_slot
.text "Leif... I'm so sorry..."
.byte NewLine
.text "Nanna was here, she was right here with me,"
.byte NewLine
.text "and I let her get taken by Raydrik's goons!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Nanna... No, as long as she's still alive,"
.byte NewLine
.text "we can always rescue her! This isn't over!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I failed her and Mareeta both..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "No... What's happened to Mareeta?"
.byte WaitForA

.byte EndText

ch5arenaopennannadead

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word eyvel_portrait

.byte Right_slot
.text "Commander, are you all right?"
.byte WaitForA

.byte Left_slot
.text "Leif... I'm so sorry..."
.byte NewLine
.text "Nanna was here, she was right here"
.byte NewLine
.text "with me, and I couldn't... I couldn't..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "No... Gods, NO! Th-That's not possible!"
.byte WaitForA
.byte ScrollText
.text "Oh, Nanna... After everything"
.byte NewLine
.text "we've been through together... What a waste..."
.byte NewLine
.text "What a senseless waste..."
.byte WaitForA

.byte EndText

ch5raydrikpanicsB1

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait
.text "H-How did you escape from the dungeon?!"
.byte NewLine
.text "Men, seize them! No, wait, kill them!"
.byte NewLine
.text "Kill all of them!"
.byte WaitForA
.byte ScrollText
.text "If that whelp gets free of the castle,"
.byte NewLine
.text "it'll be on my head! All hands, enter the arena"
.byte NewLine
.text "and stain the ground with their blood!"
.byte WaitForA
.byte ScrollText

.byte EndText

ch5raydrikpanicsB2

.word PlayMusic
.word $3E

.byte Left_slot
.word LoadPortrait
.word veld_portrait
.text "Panicking already, Raydrik?"
.byte NewLine
.text "Fear not. I'll clean up your mess for you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word eyvel_portrait
.text "Wh-What...?!"
.byte WaitForA

.byte EndText


ch5raydriktauntsleif

.byte Left_slot
.word ClearPortrait
.word RetractBox

.byte Right_Slot
.word LoadPortrait
.word raydrik_portrait
.text "We've nothing to fear now!"
.byte NewLine
.text "There's no rescuing a block of stone!"
.byte WaitForA
.byte ScrollText
.text "Now, kill them all!"
.byte NewLine
.text "Don't let any of them get away!"
.byte WaitForA

.byte EndText

ch5arenaopennannaalone

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word nanna_portrait

.text "Lord Leif!"
.byte WaitForA

.byte Right_slot
.text "Nanna! You're safe!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Y-Yes... I've managed, somehow."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Is the Commander with you?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Eyvel, she... She..."
.byte WaitForA
.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText

.byte EndText

ch5arenaopenbothgone

.byte Right_slot
.word LoadPortrait
.word leif_portrait2
.text "No one's here..."
.byte NewLine
.text "Were we misled?"
.byte NewLine
.text "Was our information incorrect?"
.byte WaitForA
.byte ScrollText
.text "Ah! Th-That's...!"
.byte WaitForA
.byte ScrollText

.byte EndText

ch5arenaopenafterstone

.text "No! Gods, NO!"
.byte NewLine
.text "Commander! Commander Eyvel!"
.byte WaitForA
.byte ScrollText
.text "After everything you've done for me..."
.byte NewLine
.text "After how far I've come..."
.byte NewLine
.text "How... How is such a thing possible...?!"
.byte WaitForA

.byte EndText