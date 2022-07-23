ch2xop1
	.byte Left_slot ; Left slot
    .word LoadPortrait    ; load portrait
    .word shiva_portrait

    .byte Right_Slot ; Right slot
    .word LoadPortrait    ; load portrait
    .word lifis_portrait
	
	.byte Left_slot ; opentext left
	.byte $09 ; font 9(always use font 9)
	
	.text "I shouldn't have to say this, Lifis,"
	.byte NewLine
	.text "but don't you dare lay a hand on the cleric."
	.byte WaitForA
	
	.byte Right_Slot
	.text "Oh, uh... R-Right. Got it."
	.byte WaitForA
	.byte ScrollText
	
	.byte Left_slot
	.byte ScrollText
	
	.byte Right_Slot
	.word ClearPortrait
	
	.byte Left_slot
	.word ClearPortrait
    .word LoadPortrait    ; load portrait
    .word lifis_portrait
		
	.byte Right_Slot	
	.word LoadPortrait    ; load portrait
    .word safie_portrait
	
	.byte Left_slot ; Right slot
	.text "You could stand to give me the time of day,"
	.byte NewLine
	.text "Safy. We both know I could get"
	.byte NewLine
	.text "anything you want."
	.byte WaitForA
	.byte ScrollText
	.text "Just go along with me, yeah?"
	.byte WaitForA
	
	.byte Right_Slot
	.text "I have given my word to see Lady Linoan's"
	.byte NewLine
	.text "hopes realized. Unless you wish to join us"
	.byte NewLine
	.text "in fighting for Tahra, I will not falter."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "T-Take up arms against the Empire?!"
	.byte NewLine
	.text "May as well stand on the shore"
	.byte NewLine
	.text "an' try to push the tide back!"
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "Perhaps it sounds impossible,"
	.byte NewLine
	.text "but the alternative is to do nothing"
	.byte NewLine
	.text "as innocent children are ritually slaughtered."
	.byte WaitForA
	.byte ScrollText
	.text "No matter the cost, no one with"
	.byte NewLine
	.text "a drop of humanity could stand by"
	.byte NewLine
	.text "and allow this to continue."
	.byte WaitForA
	.byte ScrollText
	.text "We're not naive. Everyone knows the risks—"
	.byte NewLine
	.text "we know we'll likely die."
	.byte NewLine
	.text "But this isn't just about us!"
	.byte WaitForA
	.byte ScrollText
	.text "This is bigger than one city or one society—"
	.byte NewLine
	.text "this is about resisting the grip of damnation"
	.byte NewLine
	.text "itself."
	.byte WaitForA
	.byte ScrollText
	.text "Loptous beckons, Lifis."
	.byte NewLine
	.text "The world hurtles ever closer toward his jaws."
	.byte WaitForA
	.byte ScrollText
	.text "Tahra is the only place in Jugdral"
	.byte NewLine
	.text "still in dispute—where will you be"
	.byte NewLine
	.text "when history is written?"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Well... I..."
	.byte WaitForA
	.byte ScrollText
	.text "Look, you're out to fulfill your Lady's hopes,"
	.byte NewLine
	.text "right? If I say yes, will you fulfill"
	.byte NewLine
	.text "one of my own hopes?"
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "If it is within my power, I will."
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "It's a deal. I'll talk to my boys,"
	.byte NewLine
	.text "make sure everybody is on board."
	.byte NewLine
	.text "But don't forget our little arrangement."
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "Very well."
	.byte WaitForA
	
	.byte EndText
	
ch2xop2
	.byte Right_Slot
    .word LoadPortrait
    .word leif_portrait
	.byte $09 ; font 9(always use font 9)
	.text "Of all the rotten luck...!"
	.byte NewLine
	.text "We just had to land right as it was getting dark."
	.byte WaitForA
	
	.byte Left_slot
    .word LoadPortrait    ; load portrait
    .word augustus_portrait
	.text "The timing isn't ideal, granted,"
	.byte NewLine
	.text "but with a torch in hand,"
	.byte NewLine
	.text "your men will be able to see a ways ahead."
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "I...don't believe we have any flint or tinder"
	.byte NewLine
	.text "handy. What are our chances without torches?"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.text "Your men won't be totally blind, but they'll"
	.byte NewLine
	.text "barely be able to see in front of them."
	.byte WaitForA
	.byte ScrollText
	.text "Still, I imagine you can find a spare torch"
	.byte NewLine
	.text "or two lying around somewhere."
	.byte WaitForA
	
	.byte Right_Slot
	.byte ScrollText
	.text "Then let's get moving."
	.byte NewLine
	.text "There's no time to waste!"
	.byte WaitForA
	
	.byte EndText
	
ch2xturn2
	.byte Left_slot ; Left slot
    .word LoadPortrait    ; load portrait
    .word bandit_portrait

    .byte Right_Slot ; Right slot
    .word LoadPortrait    ; load portrait
    .word lifis_portrait
	
	.byte Left_slot ; opentext left
	.byte $09 ; font 9(always use font 9)
	
	.text "Boss, you really mean to make for Tahra?"
	.byte NewLine
	.text "I'm goin' pale jus' thinkin' about fightin'"
	.byte NewLine
	.text "the Empire..."
	.byte WaitForA
	.byte ScrollText
	.text "I mean, we might as well jus' jab a knife in our"
	.byte NewLine
	.text "necks now an' save everybody some time!"
	.byte WaitForA
	
	.byte Right_Slot
	.text "I know, I know, I'm just leading her on!"
	.byte NewLine
	.text "Gotta get my foot in the door with that lass."
	.byte WaitForA
	.byte ScrollText
	.text "An' just who does Shiva think he is, talking to"
	.byte NewLine
	.text "me like that? Did that cutthroat sellsword"
	.byte NewLine
	.text "grow a conscience when nobody was looking?"
	.byte WaitForA
	
	.byte Left_slot
	.byte ScrollText
	.word LoadPortrait    ; load portrait
    .word bandit1_portrait
	
	.text "Hey Boss, we got a couple do-gooders"
	.byte NewLine
	.text "scurryin' in from the west!"
	.byte WaitForA
	
	.byte Right_slot
	.byte ScrollText
	.text "What? Here? You gotta be joking!"
	.byte WaitForA
	.byte ScrollText
	.text "...All right boys, let's go say hello!"
	.byte NewLine
	.text "The sharks are gonna be well-fed tonight!"
	.byte WaitForA
	
	.byte EndText
	
ch2xeyvelLeif
	.byte Left_slot
	.word LoadPortrait
	.word leif_portrait
	
	.byte Right_slot
	.word LoadPortrait
	.word eyvel_portrait
	
	.byte Left_slot
	.text "The pirates seem to have greater numbers..."
	.byte NewLine
	.text "Can we make it through this, Commander?"
	.byte WaitForA

	.byte Right_slot
	.text "Numbers aren't everything."
	.byte NewLine
	.text "We keep our heads about us,"
	.byte NewLine
	.text "we'll make it through just fine."
	.byte WaitForA

	.byte Left_slot
	.byte ScrollText
	.text "O-Of course, Commander."
	.byte NewLine
	.text "Still, would you happen to know anything"
	.byte NewLine
	.text "useful about this Lifis thug?"
	.byte WaitForA

	.byte Right_slot
	.byte ScrollText
	.text "Hah! “Thug” is too generous for Lifis."
	.byte NewLine
	.text "He's small-time—ain't even worth killing."
	.byte WaitForA
	.byte ScrollText
	.text "When we get our hands on him, take him alive,"
	.byte NewLine
	.text "and don't let him go after the fighting's done."
	.byte WaitForA
	.byte ScrollText
	.text "We'll bring him back to Iz and see that he gets"
	.byte NewLine
	.text "justice for his crimes."
	.byte WaitForA
	
	.byte EndText
	
ch2xend1
	.byte Left_slot
	.word LoadPortrait
	.word leif_portrait
	
	.text "The pirates seem to have escaped,"
	.byte NewLine
	.text "but never mind that—is the cleric safe?"
	.byte WaitForA

	.byte Right_slot
	.word LoadPortrait
	.word augustus_potrait
	.text "Ahem. I've found her, sire."
	.byte WaitForA
	.byte ScrollText
	
	.byte Left_slot
	.byte ScrollText
	
	.byte Right_slot
	.word ClearPortrait
	.word LoadPortrait
	.word safie_portrait
	
	.text "Thank you, kind folk. I owe you my—"
	.byte WaitForA
	.byte ScrollText
	.text "Hm? Is that...?"
	.byte WaitForA

	.byte Left_slot
	.byte ScrollText
	.text "I beg your pardon, milady."
	.byte NewLine
	.text "Battle is dirty business, and if I have"
	.byte NewLine
	.text "some grime or blood on my face—"
	.byte WaitForA

	.byte Right_slot
	.byte ScrollText
	.text "Have you forgotten me already, Lord Leif?"
	.byte NewLine
	.text "It's me, Safy—we met in Tahra."
	.byte WaitForA

	.byte Left_slot
	.byte ScrollText
	.text "Safy, you say? I knew a young woman"
	.byte NewLine
	.text "at the monastery in Tahra by that name."
	.byte WaitForA

	.byte Right_slot
	.byte ScrollText
	.text "I only had the honor of seeing you"
	.byte NewLine
	.text "two or three times, milord."
	.byte NewLine
	.text "I suppose I wasn't as memorable as I thought!"
	.byte WaitForA
	.byte ScrollText
	.text "Still, you left an impression on me all the same."
	.byte NewLine
	.text "When you departed the city, it was I"
	.byte NewLine
	.text "who wiped Lady Linoan's face of tears."
	.byte WaitForA

	.byte Left_slot
	.byte ScrollText
	.text "Ah, now I can place you."
	.byte NewLine
	.text "Your father was a priest, and you were rather"
	.byte NewLine
	.text "close with Linoan, were you not?"
	.byte WaitForA

	.byte Right_slot
	.byte ScrollText
	.text "As close as a woman of common birth can be, I"
	.byte NewLine
	.text "suppose. The Duke of Tahra was Lady Linoan's"
	.byte NewLine
	.text "father, and I am more her servant than peer."
	.byte WaitForA

	.byte Left_slot
	.byte ScrollText
	.text "That aside, how did you come to be here?"
	.byte NewLine
	.text "Has something happened to Linoan?"
	.byte WaitForA

	.byte Right_slot
	.byte ScrollText
	.text "You mean to say you don't know"
	.byte NewLine
	.text "what's happened to Tahra since you left?"
	.byte NewLine
	.text "Ah... Let me start from the beginning."
	.byte WaitForA
	.byte ScrollText
	.text "After the Duke passed away,"
	.byte NewLine
	.text "the Empire installed their own governor."
	.byte WaitForA
	.byte ScrollText
	.text "The man proved to be a walking pox, inflicting"
	.byte NewLine
	.text "tragedy after tragedy upon us. Just this year,"
	.byte NewLine
	.text "they even began child hunts in Tahra."
	.byte WaitForA

	.byte Left_slot
	.byte ScrollText
	.text "Child hunts...?"
	.byte WaitForA

	.byte Right_slot
	.byte ScrollText
	.text "That proved to be the breaking point."
	.byte NewLine
	.text "The people of Tahra revolted,"
	.byte NewLine
	.text "installing Lady Linoan as rightful Duchess."
	.byte WaitForA
	.byte ScrollText
	.text "They hired any sellsword who could stand"
	.byte NewLine
	.text "upright, and then sent offerings of gold and"
	.byte NewLine
	.text "gemstones to the Empire's leading noblemen."
	.byte WaitForA
	.byte ScrollText
	.text "It was...an admirable effort, but King Bloom"
	.byte NewLine
	.text "of Thracia did not forgive such a slight, and"
	.byte NewLine
	.text "summoned the Imperial Army to besiege Tahra."
	.byte WaitForA
	.byte ScrollText
	.text "The sellswords proved craven and fled,"
	.byte NewLine
	.text "and now only a handful of militiamen"
	.byte NewLine
	.text "stand between the Empire and our city."
	.byte WaitForA
	.byte ScrollText
	.text "Lady Linoan bade me leave and seek out any"
	.byte NewLine
	.text "who would fight in Tahra's defense."
	.byte WaitForA

	.byte Left_slot
	.byte ScrollText
	.text "Are things truly that dire...?"
	.byte NewLine
	.text "The Duke sheltered me for half a decade before"
	.byte NewLine
	.text "the Empire learned of it and had him executed."
	.byte WaitForA
	.byte ScrollText
	.text "Not a day goes by that I don't think"
	.byte NewLine
	.text "of his generosity..."
	.byte WaitForA
	.byte ScrollText
	.text "You're seeking folk to aid Tahra? Look no more."
	.byte NewLine
	.text "I pledge to deliver Tahra from this evil."
	.byte NewLine
	.text "Let's be off, Safy."
	.byte WaitForA

	.byte Right_slot
	.byte ScrollText
	.text "You will be most welcome in Tahra, Lord Leif."
	.byte NewLine
	.text "Thank you."
	.byte WaitForA
	
	.byte EndText
	
ch2xend2

.word PlayMusic
.byte $41

.byte Left_slot
.byte ScrollText

.byte Right_Slot
.byte ScrollText
.word LoadPortrait
.word lifis_portrait
.text "Well, don't keep me in suspense."
.byte NewLine
.text "What are you gonna do with me?"
.byte WaitForA

.byte Left_slot
.text "That's up to the villagers of Iz. We're taking"
.byte NewLine
.text "you back there to answer for your crimes."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "We both know what'll happen! You handin' me"
.byte NewLine
.text "over to them is as good as killin' me yourself!"
.byte WaitForA

.byte Left_slot ; Left slot
.byte ScrollText
.word LoadPortrait; load portrait
.word safie_portrait

.byte Right_slot
.byte ScrollText
.text "Safy, c'mon, we had a deal—"
.byte NewLine
.text "I said I'd go to Tahra with you!"
.byte WaitForA
.byte ScrollText

.byte Left_slot
.word LoadPortrait
.word leif_portrait

.byte Right_slot
.word LoadPortrait
.word safie_portrait
.text "...Lord Leif, Lifis is not an evil man."
.byte WaitForA
.byte ScrollText
.text "He's committed many foul acts as a pirate, yes,"
.byte NewLine
.text "but he seemed genuinely repentant"
.byte NewLine
.text "when we spoke earlier."
.byte WaitForA
.byte ScrollText
.text "Give him a chance to redeem himself"
.byte NewLine
.text "in the eyes of the gods."
.byte WaitForA

.byte ScrollText
.word LoadPortrait; load portrait
.word lifis_portrait

.byte Left_slot
.text "...All right. If Safy believes in you,"
.byte NewLine
.text "I can give you a chance for the time being."
.byte WaitForA

.byte ScrollText
.word ClearPortrait
.word RetractBox

.byte Right_slot
.byte ScrollText
.text "Hah, I've cheated death once again!"
.byte NewLine
.text "Just gotta wait for the right opening,"
.byte NewLine
.text "then I'll book it."
.byte WaitForA
.byte ScrollText
.text "But come to think of it..."
.byte NewLine
.text "If that boy's really the missing Leonster heir,"
.byte NewLine
.text "the Empire'd pay mighty well to hear of it..."
.byte WaitForA
.byte ScrollText
.text "It's worth mulling over, at least."
.byte NewLine
.text "Either way, it'll have to wait until after Safy"
.byte NewLine
.text "has given in to my many charms!"
.byte WaitForA

.byte EndText