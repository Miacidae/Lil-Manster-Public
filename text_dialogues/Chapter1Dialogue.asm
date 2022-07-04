
; Command definitions 

NewLine = $02
ScrollText = $04
EndText = $05
Left_slot = $06
Right_Slot = $07
WaitForA = $08

EndTextNoPortraitFade = $0001
LoadPortrait = $3A00
ClearPortrait = $3B00
LoadPortraitalt_1 = $3000
LoadPortraitalt_2 = $8CBF9C
ClearPortraitalt = $2F00
RetractBox = $3900
PlayMusic = $1300
MoveXY = $1000
PauseDialogue = $1D00


ch1op1

    .byte Left_slot ; Left slot
    .word LoadPortrait    ; load portrait
    .word raydrik_portrait

    .byte Right_Slot ; Right slot
    .word LoadPortrait
    .word weissman_portrait
	
	.byte Left_slot
	.byte $09 ; font 9(always use font 9)	
	.text "Have you found that whelp of a prince yet?"
	.byte WaitForA	
	
	.byte Right_Slot
	.text "Regretfully not, milord. The men searched the"
	.byte NewLine
	.text "village top to bottom, but came up with nothing."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Why is such a simple task taking you so long?"
	.byte NewLine
	.text "There's little doubt that the heir"
	.byte NewLine
	.text "to House Leonster is hiding here."
	.byte WaitForA
	.byte ScrollText
	.text "You've been too gentle with these villagers—"
	.byte NewLine
	.text "give them ample motivation to talk."
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "We are of the same mind, milord—"
	.byte NewLine
	.text "I've already ordered the men to do as much."
	.byte NewLine
	.text "Yet the townsfolk claim the prince isn't here."
	.byte WaitForA
	.byte ScrollText
	.text "According to them, he left with the Freeblades"
	.byte NewLine
	.text "to fend off a pirate raid on a nearby village."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Freeblades? What nonsense is that?"
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "They're the local militia, sire. As I understand it,"
	.byte NewLine
	.text "this village was once home to a group"
	.byte NewLine
	.text "of brigands—rather savage ones, at that."
	.byte WaitForA
	.byte NewLine
	.text "About a decade ago, they were routed by Eyvel,"
	.byte NewLine
	.text "a wandering sellsword."
	.byte WaitForA
	.byte ScrollText
	.text "She claimed the village as her own and founded"
	.byte NewLine
	.text "the Freeblades to protect the region"
	.byte NewLine
	.text "from future attacks."
	.byte WaitForA
	.byte ScrollText
	.text "She's supposedly quite a wonder with a sword..."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Hmm... She may be a problem."
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "You have nothing to fear, milord:"
	.byte NewLine
	.text "we've taken Eyvel's daughter captive."
	.byte WaitForA
	.byte ScrollText
	.text "What's more, we also captured"
	.byte NewLine
	.text "the daughter of Finn, the very knight"
	.byte NewLine
	.text "guarding the prince's life."
	.byte WaitForA
	.byte ScrollText
	.text "With the leverage we have over them,"
	.byte NewLine
	.text "they'll have no choice but to surrender."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Hmph. I admit, you have your uses, Weismann."
	.byte WaitForA
	.byte ScrollText
	.text "The women will accompany me back to Munster."
	.byte NewLine
	.text "You'll remain here and prepare for when"
	.byte NewLine
	.text "these upstart rebels return."
	.byte WaitForA
	.byte ScrollText
	.text "See that the young Leonster pup is put in chains"
	.byte NewLine
	.text "befitting a stray mutt."
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "Your trust in me is well placed, sire."
	
	.byte Left_slot
	.word ClearPortrait
	.word RetractBox
	
	.byte Right_slot
	.byte NewLine
	.text "Men, bring the girls here!"
	.byte WaitForA
	
	.byte EndText
	
ch1op2

	.byte Left_slot
    .word LoadPortrait
    .word raydrik_portrait

    .byte Right_Slot
    .word LoadPortrait
    .word mareeta_portrait
	
	.byte Left_slot
	.byte $09
	.text "What's your name, lass?"
	.byte WaitForA
	
	.byte Right_Slot
	.text "Hmph..."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Hah! A fighting spirit to match a pretty face."
	
	.byte Right_slot
	.byte ScrollText
	.word ClearPortrait
	
	.byte Left_slot
	.byte NewLine
	.text "Now, let's have a look at the other one..."
	.byte WaitForA
	
	.byte Right_Slot
	.word LoadPortrait
	.word nanna_portrait
	
	.byte Left_slot
	.byte ScrollText
	.text "Ah, you must be Finn's young ward."
	.byte NewLine
	.text "I hear your mother was royalty"
	.byte NewLine
	.text "of House Nordion, is that right?"
	.byte WaitForA
	.byte ScrollText
	.text "You certainly don't lack for grace, despite living"
	.byte NewLine
	.text "in this backwater hovel—holy blood doesn't run"
	.byte NewLine
	.text "thin even in squalor, I see."
	.byte WaitForA

	.byte Right_slot
	.text "......"
	.byte WaitForA
	.byte ScrollText
	
	.byte Left_slot
	.byte ScrollText
	.text "What a pleasant surprise the two of you"
	.byte NewLine
	.text "make for."
	.byte WaitForA
	
	.byte Right_Slot
	.word LoadPortrait
	.word weissman_portrait
	
	.byte Left_slot
	.byte ScrollText
	.text "Weismann, I'll be departing for Munster now."
	.byte NewLine
	.text "Don't disappoint me."
	.byte WaitForA

	.byte Right_Slot
	.text "All shall be as you wish it, milord."
	.byte WaitForA
	
	.byte EndText
	
ch1op3

	.byte Right_slot
    .word LoadPortrait
    .word eyvel_portrait
	.byte $09	
	.text "What's that commotion in the village?"
	.byte NewLine
	.text "Something's rotten here..."
	.byte WaitForA

    .byte Left_Slot
    .word LoadPortrait
    .word halvan_portrait
	.text "I'll scout ahead, Commander."
	.byte NewLine
	.text "Hold here a moment."
	.byte WaitForA
	
	.byte EndText

ch1op4

	.byte Left_slot
    .word LoadPortrait
    .word eyvel_portrait
	
    .byte Right_Slot
    .word LoadPortrait
    .word halvan_portrait
	.byte $09 ; font 9(always use font 9)	
	.text "Commander, Fiana is packed to the brim"
	.byte NewLine
	.text "with Imperial troops!"
	.byte NewLine
	.text "They...must have struck while we were away."
	.byte WaitForA
	.byte ScrollText
	
	.byte Left_Slot
	.word LoadPortrait
	.word osian_portrait
	.text "What? No way is the Empire gonna make a mess"
	.byte NewLine
	.text "of our home! "
	
	.byte Right_Slot
	.word LoadPortrait
	.word eyvel_portrait
	
	.byte Left_Slot	
	.text " Commander, let's move in!"
	.byte WaitForA
	.byte ScrollText
	
	.byte Right_Slot
	.word LoadPortrait
	.word halvan_portrait
	.text "Calm down, Osian. We'll get slaughtered"
	.byte NewLine
	.text "if we just charge in blindly."
	.byte WaitForA
	
	.byte Left_Slot
	.byte ScrollText
	.text "Yeah, Halvan, I'm sure the village will appreciate"
	.byte NewLine
	.text "your patient attitude while everyone's being"
	.byte NewLine
	.text "rounded up and jailed!"
	.byte WaitForA
	.byte ScrollText
	
	.byte Right_Slot
	.byte ScrollText
	.word LoadPortrait
	.word eyvel_portrait
	.text "Peace, Osian. Halvan is right."
	.byte NewLine
	.text "Seems we've finally been noticed"
	.byte NewLine
	.text "by the Empire."
	.byte WaitForA
	
	.byte Left_Slot
	.byte ScrollText
	.word LoadPortrait
	.word leif_portrait
	
	.byte Right_Slot
	.byte ScrollText
	.text "Looks like this is goodbye, Little Leif. I'm sorry."
	.byte WaitForA
	
	.byte Left_Slot
	.word ClearPortrait
	.word LoadPortrait
	.word finn_portrait
	
	.byte Right_Slot
	.byte ScrollText
	.text "Finn, take him as far away from here"
	.byte NewLine
	.text "as you can. Leave the soldiers to us.";interrupt
	.byte WaitForA
	
	.byte Left_Slot
	.word LoadPortrait
	.word leif_portrait2
	.text "No, Commander!"
	.byte NewLine
	.text "Nanna is still in the village!"
	.byte NewLine
	.text "I won't leave without her!"
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "I'll get her back. Don't worry."
	.byte WaitForA
	
	.byte Left_Slot
	.byte ScrollText
	.text "It's more than that, Commander..."
	.byte NewLine
	.text "I won't run anymore."
	.byte NewLine
	.text "That's my decision to make."
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "...Finn, you wanna weigh in here?"
	
	.byte Left_Slot
	.byte ScrollText
	.word LoadPortrait
	.word finn_portrait
	
	.byte Right_Slot
	.byte NewLine
	.text "You going to let the Little Lord throw himself"
	.byte NewLine
	.text "into harm's way like this?"
	.byte WaitForA
	
	.byte Left_Slot
	.text "Lord Leif has seen the passing of 15 summers,"
	.byte NewLine
	.text "by now. He's old enough to choose for himself—"
	.byte NewLine
	.text "and as my liege, I will abide by his judgment."
	.byte WaitForA

	.byte Right_Slot 
	.byte ScrollText
	.text "Has it been that long already?"
	.byte NewLine
	.text "Hmph, I suppose I let Little Leif come with us"
	.byte NewLine 
	.text "to fight off those pirates, myself..."
	.byte WaitForA
	.byte ScrollText
	.text "Guess I made up my own mind when I did that."
	.byte NewLine
	.text "If Finn's all right with it, so am I."
	.byte WaitForA
	.byte ScrollText
	
	.byte Left_Slot
	.byte ScrollText
	.word LoadPortrait
	.word osian_portrait
	.text "Then what's the hold-up? If we're done arguing,"
	.byte NewLine
	.text "there's an invasion happening over that ridge!"
	.byte WaitForA
	
	.word ClearPortrait
	.word RetractBox
	.byte ScrollText
	
	.byte Right_Slot
	.byte ScrollText
	.text "All right, get ready to move in. But stay sharp:"
	.byte NewLine
	.text "most foot-soldiers are just regular folk,"
	.byte NewLine
	.text "forced into the Imperial Army against their will."
	.byte WaitForA
	.byte ScrollText
	.text "If they surrender, just take their weapons"
	.byte NewLine
	.text "and let them go. Are we clear?"
	.byte WaitForA
	
	.byte Left_Slot
	.word LoadPortrait
	.word osian_portrait
	.text "But we can still bloody them until they surrender,"
	.byte NewLine
	.text "right? I mean, if we can't put up a good fight"
	.byte NewLine
	.text "ourselves, we'll be the ones surrendering."
	.byte WaitForA
	
	.byte ScrollText
	.word ClearPortrait
	.word RetractBox
	
	.byte Right_Slot
	.byte ScrollText
	.text "Knock 'em around if you have to, sure,"
	.byte NewLine
	.text "but don't overdo it.  "
	.byte WaitForA
	
	.byte Left_Slot
	.word LoadPortrait
	.word osian_portrait

	.byte Right_Slot
	.text "That means you, Osian."
	.byte WaitForA
	
	.byte Left_Slot
	.byte ScrollText
	.text "Hey, c'mon, gimme some credit, Commander!"
	.byte WaitForA
	
	.byte ScrollText
	.word ClearPortrait
	.word RetractBox
	
	.byte Right_Slot
	.byte ScrollText
	.text "OK, enough chatter! Let's give the Empire"
	.byte NewLine
	.text "a battle worthy of our names as Freeblades!"
	.byte WaitForA
	
	.byte EndText
	
ch1dagdararrive

	.byte Right_slot
	.word LoadPortrait
	.word dagdar_portrait

	.byte Left_slot
	.word LoadPortrait
	.word tanya_portrait
	.text "Papa, the fighting's started already!"
	.byte WaitForA
	
	.byte Right_Slot
	.text "Ain't no good way to go about"
	.byte NewLine
	.text "this damned battle..."
	.byte WaitForA
	.byte ScrollText
	.text "Don't matter how good Eyvel is, there's only"
	.byte NewLine
	.text "one of her an' over a dozen of them."
	.byte NewLine
	.text "We need to hurry."
	.byte WaitForA
	
	.byte EndText
	
ch1martyarrive

	.byte Right_slot
    .word LoadPortrait
    .word marty_portrait
	.byte $09 ; font 9(always use font 9)
	.text "Oh, fer cryin' out loud!"
	.byte NewLine
	.text "Not again..."
	.byte WaitForA
	
	.byte EndText
	
ch1osianhouseosian

	.byte Right_slot
    .word LoadPortrait
    .word Osian_portrait
	
	.byte Left_slot
    .word LoadPortrait
    .word oldman_portrait
	.byte $09 ; font 9(always use font 9)
	.text "You pullin' your weight in the Freeblades, boy?"
	.byte NewLine
	.text "Last thing Commander Eyvel needs"
	.byte NewLine
	.text "is to babysit you."
	.byte WaitForA
	
	.byte Right_slot
	.text "We're risking life and limb to protect the"
	.byte NewLine
	.text "village, and you're giving me a lecture? You've"
	.byte NewLine
	.text "got a strange sense of gratitude, old man."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Not even the Empire knockin' down our front"
	.byte NewLine
	.text "door can stop that fool mouth of yours, I see."
	.byte WaitForA
	.byte ScrollText
	.text "Well, no point in draggin' this out."
	.byte NewLine
	.text "Here. This is what you came for, right?"
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "For once, you read my mind."
	.byte NewLine
	.text "When a fight breaks out, I just feel off"
	.byte NewLine
	.text "without this axe at my side."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Which don't explain why you forget it at home"
	.byte NewLine
	.text "half the damn time!"
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "Hey, I came here for the axe,"
	.byte NewLine
	.text "not to get chewed out!"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "If that's all you wanted, then get going!"
	.byte NewLine
	.text "Go on, now!"
	.byte NewLine
	.text "Don't keep the Commander waitin' on you!"
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "You don't need to tell me twice!"
	.byte WaitForA
	
	.byte EndText
	
ch1osianhouseother

	.byte Right_slot
    .word LoadPortrait
    .word oldman_portrait
	.byte $09 ; font 9(always use font 9)	
	.text "Where has that fool boy of mine gone off to"
	.byte NewLine
	.text "in this fracas? I swear, my Osian's gonna get"
	.byte NewLine
	.text "himself killed one of these days..."
	.byte WaitForA
	
	.byte EndText
	
ch1liferinghouse

	.byte Right_slot
    .word LoadPortrait
    .word oldlady_portrait
	.byte $09 ; font 9(always use font 9)
	.text "Those Imperial dogs took Dame Mareeta"
	.byte NewLine
	.text "and Lady Nanna—just snatched 'em right up"
	.byte NewLine
	.text "like they was cattle!"
	.byte WaitForA
	.byte ScrollText
	.text "You're not gonna let 'em get away with that,"
	.byte NewLine
	.text "are you?"
	.byte WaitForA
	.byte ScrollText
	.text "If you're fixin' to fight the Empire,"
	.byte NewLine
	.text "take this with you. This here ring's enchanted"
	.byte NewLine
	.text "with some spell or another."
	.byte WaitForA
	.byte ScrollText
	.text "But don't just wear it on your finger like some"
	.byte NewLine
	.text "common bauble! You gotta actually [Use] it"
	.byte NewLine
	.text "for it to do any good!"
	.byte WaitForA
	
	.byte EndText
	
ch1vulneraryhouse

	.byte Right_slot
    .word LoadPortrait
    .word oldlady3_portrait
	.byte $09 ; font 9(always use font 9)
	
	.text "Y'all made it back! What a relief..."
	.byte WaitForA
	.byte ScrollText
	.text "But look, there's no Fiana Freeblades without"
	.byte NewLine
	.text "Fiana, right? So don't just stop with them"
	.byte NewLine
	.text "pirates—drive the Empire from our village, too!"
	.byte WaitForA
	.byte ScrollText
	.text "...Not to imply that I ain't grateful, a' course."
	.byte NewLine
	.text "Take this with you. Use it if you get scraped up."
	.byte WaitForA
	.byte ScrollText
	.text "We don't have much in the way of medicine,"
	.byte NewLine
	.text "but it's the least we can do after everythin'"
	.byte NewLine
	.text "the Commander's done fer us."
	.byte WaitForA
	
	.byte EndText
	
ch1ironswordhouse

	.byte Right_slot
    .word LoadPortrait
    .word moustache_portrait
	.byte $09 ; font 9(always use font 9)	
	.text "Weapons can be mighty expensive, can't they?" 
	.byte NewLine
	.text "Most folk here gotta make do by nicking"
	.byte NewLine
	.text "supplies from Imperial troops."
	.byte WaitForA
	.byte ScrollText
	.text "It's awful risky, but if you can capture an enemy"
	.byte NewLine
	.text "alive, you get to help yourself to their stuff."
	.byte WaitForA
	.byte ScrollText
	.text "Matter of fact, I got the drop on an Imperial"
	.byte NewLine
	.text "soldier myself. Heard 'im snoring from three"
	.byte NewLine
	.text "houses away, so I took me a souvenir!"
	.byte WaitForA
	.byte ScrollText
	.text "...Not that it'll do me much good, though."
	.byte NewLine
	.text "Probably better off in your hands, I reckon."
	.byte WaitForA
	.byte ScrollText
	.text "And hey, if you don't need it,"
	.byte NewLine
	.text "you can just hawk it for somethin' you do need."
	.byte WaitForA
	
	.byte EndText
	
ch1halvanhousehalvan
	
	.byte Right_slot
    .word LoadPortrait 
    .word halvan_portrait

	.byte Left_slot
    .word LoadPortrait
    .word younglady_portrait
	.byte $09 ; font 9(always use font 9)	
	.text "Big brother!"
	.byte NewLine
	.text "I've got something real special for you!"
	.byte NewLine
	.text "You can use this to keep yourself safe, right?"
	.byte WaitForA
	
	.byte Right_slot
	.text "An...axe? Where in the world did you get"
	.byte NewLine
	.text "such a fine weapon?"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Darnedest thing... I was walkin' past the lake"
	.byte NewLine
	.text "up on the mountain, when this strange ol' crone"
	.byte NewLine
	.text "just floated outta the water!"
	.byte WaitForA
	.byte ScrollText
	.text "She gave it to me, then vanished, quick"
	.byte NewLine
	.text "as you can blink! I been keepin' it for you,"
	.byte NewLine
	.text "and takin' real good care of it."
	.byte WaitForA
	.byte ScrollText
	.text "Now go put it to use, an' make me proud!"
	.byte WaitForA
	
	.byte EndText
	
ch1halvanhouseother

	.byte Right_slot
    .word LoadPortrait
    .word younglady_portrait
	.byte $09 ; font 9(always use font 9)	
	.text "Hey, hey, have you seen my big brother,"
	.byte NewLine
	.text "Halvan? He's got me awful scared..."
	.byte NewLine
	.text "I hope he's all right..."
	.byte WaitForA
	
	.byte EndText
	
ch1ending

	.byte Right_slot
    .word LoadPortrait
    .word leif_portrait2
	.byte $09 ; font 9(always use font 9)
	.text "Nanna! Mareeta! Where are you?!"
	.byte NewLine
	.text "Please, answer me!"
	.byte WaitForA
	
	.byte Left_slot
    .word LoadPortrait
    .word eyvel_portrait
	.text "Little Nan, Mareeta..."
	.byte NewLine
	.text "Raydrik must've taken 'em."
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "What?! That means...they were taken"
	.byte NewLine
	.text "to Munster, right?"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Yeah—as bargaining chips, in case Weismann"
	.byte NewLine
	.text "couldn't finish the job. It's the sort of thing"
	.byte NewLine
	.text "Raydrik would pull, all right."
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "Gods' breath..."
	.byte NewLine
	.text "Commander, we have to give chase!"
	.byte NewLine
	.text "The two of them are counting on us!"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Now look here, Little Leif—" ;interrupt
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "Commander, you yourself said"
	.byte NewLine
	.text "I'm not a child anymore."
	.byte WaitForA
	.byte ScrollText
	.text "Nanna and Mareeta were taken captive"
	.byte NewLine
	.text "because of me—and I refuse to let anyone"
	.byte NewLine
	.text "suffer in my place."
	.byte WaitForA
	.byte ScrollText
	.text "I will never again let someone sacrifice"
	.byte NewLine
	.text "their life in exchange for mine."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "...I understand. We leave at dawn, then."
	.byte NewLine
	.text "I won't lie, Little Lord: this is gonna get rough."
	.byte NewLine
	.text "Get some rest while you can."
	.byte WaitForA
	
	.byte EndText
	
ch1endingnoeyvel

	.byte Right_Slot
    .word LoadPortrait
    .word leif_portrait2
	.byte $09 ; font 9(always use font 9)	
	.text "Nanna! Mareeta! Where are you?!"
	.byte NewLine
	.text "Please, answer me!"
	.byte WaitForA
		
	.byte Left_slot
    .word LoadPortrait
    .word youngman_portrait
	.text "L-Lord Leif!"
	.byte NewLine
	.text "Gods' breath, are you a sight fer sore eyes!"
	.byte NewLine
	.text "I...wish I had better news fer you."
	.byte WaitForA
	.byte ScrollText
	.text "They came fer Lady Nanna, they did,"
	.byte NewLine
	.text "and we couldn't do nuthin' to stop 'em!"
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "Nanna? What happened to Nanna?"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "The Empire took 'er, sure as you're standin'"
	.byte NewLine
	.text "here. Mareeta tried to break her loose,"
	.byte NewLine
	.text "but only got captured 'erself."
	.byte WaitForA
	.byte ScrollText
	.text "They both wore chains, last I saw."
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "Where were they taken?"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Don't rightfully know, Lord Leif. One of them"
	.byte NewLine
	.text "soldiers said somethin' about headin' back"
	.byte NewLine
	.text "to Munster, but nuthin' more specific'n that."
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "Munster... Then that's where I'm headed, too."
	.byte NewLine
	.text "I'll bring everyone home: Nanna, Mareeta,"
	.byte NewLine
	.text "and the Commander!"
	.byte WaitForA
	
	.byte EndText
	
ch1wm1

	.text "Barely escaping the burning of Castle Leonster"
	.byte NewLine
	.text "with his life, "
	.byte WaitForA
	
	.word LoadPortraitalt_1
	.long LoadPortraitalt_2
	.word $0001 ;leify-right
	.word $0406 ;y then x
	.text "the young Prince Leif was looked"
	.byte NewLine
	.text "after by Finn, his knight and retainer."
	.word LoadPortraitalt_1
	.long LoadPortraitalt_2
	.word $0102 ;finn
	.word $0C10 ;y then x
	.byte WaitForA
	.byte ScrollText
	
	.byte EndText
	
ch1wm2

	.text "Together with Nanna, "
	.word LoadPortraitalt_1
	.long LoadPortraitalt_2
	.word $0213 ;nanna
	.word $0C03 ;y then x
	.byte WaitForA
	.text "a young noblewoman"
	.byte NewLine
	.text "under Finn's care, the trio fled pursuers"
	.byte WaitForA
	
	.byte NewLine
	.text "sent by the conquerors of North Thracia:"
	.byte NewLine
	.text "the Grannvale Empire, which lay to the west."
	.byte WaitForA
	
	.word ClearPortraitalt
	.long $82937A
	.word $0000
	.byte ScrollText
	.word ClearPortraitalt
	.long $82937A
	.word $0001
	.byte ScrollText
	.word ClearPortraitalt
	.long $82937A
	.word $0002
	
	.text "Yet Finn proved stronger than those who hunted"
	.byte NewLine
	.text "them, and the three made their way to the cities"
	.byte WaitForA
	.byte ScrollText
	
	.byte EndText
	
ch1wm3

	.text "of Ulster"
	.byte WaitForA
	.byte ScrollText
	
	.byte EndText
	
ch1wm4

	.text "and Tahra, posing as common vagrants."
	.byte WaitForA
	.byte ScrollText
	
	.byte EndText
	
ch1wm5

	.text "Eventually, they drifted into Fiana,"
	.byte NewLine
	.text "a small village on Thracia's eastern coast."
	.byte WaitForA
	.byte ScrollText
	
	.text "Fiana was an independent community"
	.byte NewLine
	.text "with its own militia, "
	.byte WaitForA
	.text "the Fiana Freeblades,"
	.byte NewLine
	.text "led by the swordswoman Eyvel."
	.word LoadPortraitalt_1
	.long LoadPortraitalt_2
	.word $0005 ;eyvel
	.word $080B ;y then x
	.byte WaitForA
	.byte ScrollText
	
	.text "Eyvel welcomed Leif's group"
	.byte NewLine
	.word LoadPortraitalt_1
	.long LoadPortraitalt_2
	.word $0101 ;leify-left
	.word $0817 ;y then x
	.text "as if they were her own kin."
	.byte WaitForA
	.byte ScrollText
	
	.text "Under her watchful eye, the deposed prince"
	.byte NewLine
	.text "spent his childhood in Fiana, "
	.byte WaitForA
	.text "growing into"
	.byte NewLine
	.text "maturity alongside youths of common birth."
	.byte WaitForA
	
	.word ClearPortraitalt
	.long $82937A
	.word $0000
	.byte ScrollText
	.word ClearPortraitalt
	.long $82937A
	.word $0001
	.byte ScrollText
	
	.byte EndText
	
ch1wm6

	.text "Now, in year 776 of the Grannvale calendar..."
	.byte WaitForA
	
	.byte EndText
	
ch1dagdareyveltalk
	
	.byte Right_slot
    .word LoadPortrait
    .word dagdar_portrait

	.byte Left_slot
	.word LoadPortrait
    .word eyvel_portrait
	.byte $09 ; font 9(always use font 9)	
	.text "Dagdar?! You...came down to fight with us?"
	.byte WaitForA
	
	.byte Right_slot
	.text "Eyvel! Does me heart good to see you"
	.byte NewLine
	.text "in one piece!"
	.byte WaitForA
	.byte ScrollText
	.text "Listen, ya have any idea why the Empire"
	.byte NewLine
	.text "would come all the way out here?"
	.byte WaitForA
	.byte ScrollText
	.text "It have anything to do with...the boy?"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Yeah. The Little Lord, Leif, he's..."
	.byte NewLine
	.text "He's not just some nobleman."
	.byte NewLine
	.text "He's the heir to House Leonster."
	.byte WaitForA
	.byte ScrollText
	.text "I've been helping him hide from the Empire."
	.byte NewLine
	.text "I'm sorry... I shouldn't have kept it from you."
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "Mm, I figured as much. Well, no use worryin'"
	.byte NewLine
	.text "about it now. Long as I get to cut down some of"
	.byte NewLine
	.text "those Imperial dastards meself, we're even."
	.byte WaitForA
	
	.byte EndText
	
ch1osiantayatalk

	.byte Right_slot
    .word LoadPortrait
    .word tanya_portrait
	
	.byte Left_slot
    .word LoadPortrait
    .word Osian_portrait
	.text "Tanya? What do you think you're doing here?"
	.byte WaitForA
	
	.byte Right_slot
	.text "What does it look like, Osian?"
	.byte NewLine
	.text "I'm here to help you guys, any way I can!"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "“Help any way you can,” huh?"
	.byte NewLine
	.text "In that case, turn tail and march back home."
	.byte WaitForA
	.byte ScrollText
	.text "That's the only way a kid like you could help—"
	.byte NewLine
	.text "you'd just get in the way."
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "You've got some nerve, Osian!"
	.byte NewLine
	.text "You're just a kid yourself, you know!"
	.byte WaitForA
	.byte ScrollText
	.text "You want me gone, I'm gone—not all of us are"
	.byte NewLine
	.text "as eager to throw ourselves into danger as you!"
	.byte WaitForA
	
	.byte EndText