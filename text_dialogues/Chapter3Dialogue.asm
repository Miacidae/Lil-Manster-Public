ch3wm1
.text "Ridding Iz of the pirates besetting it,"
.word LoadPortraitalt_1
.long LoadPortraitalt_2 
.word $0101 ;leify-left
.word $0A17 ;y then x
.byte NewLine
.text "Leif hurriedly resumed his course to Munster."
.byte WaitForA
.byte ScrollText
.byte EndText

ch3wm2
.text "It was not long until he arrived"
.byte NewLine
.text "at Kerberos' Gate, "
.byte WaitForA
.text "a small fortress that guarded"
.byte NewLine
.text "the entrance to the province of Munster..."
.byte WaitForA
.byte EndText

ch3op1

.byte Right_slot
.word LoadPortrait
.word lobos_portrait

.byte Left_slot
.word LoadPortrait
.word raydrik_portrait
.byte $09 ; font 9(always use font 9)

.text "Are the cattle being collected on schedule,"
.byte NewLine
.text "Lobos?"
.byte WaitForA

.byte Right_slot
.text "Ah, Baron Raydrik. We've rounded up all the"
.byte NewLine
.text "brats in the area, rest assured. For the time"
.byte NewLine
.text "being, I've locked them inside the fort's prison."
.byte WaitForA
.byte ScrollText
.text "What do you want done with them, milord?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Hmm. Best keep them there"
.byte NewLine
.text "until the Loptr Church arrives to claim them."
.byte WaitForA
.byte ScrollText
.text "The Magi may well try to free the little worms—"
.byte NewLine 
.text "see that your men are prepared"
.byte NewLine
.text "for an incursion."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Magi? As in those rebels from Munster?"
.byte NewLine
.text "They're still alive?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "To my great chagrin, yes."
.byte NewLine
.text "I thought they'd been wiped out,"
.byte NewLine
.text "but they've resurfaced recently."
.byte WaitForA
.byte ScrollText
.text "The little swarm of flies seems to have"
.byte NewLine
.text "a new man in charge..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Never a moment's peace these days..."
.byte NewLine
.text "And what of you, sire?"
.byte NewLine
.text "Will you be returning to Munster?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Not immediately. My journey has been"
.byte NewLine
.text "most tiring, and I would rest here while I can."
.byte WaitForA
.byte ScrollText
.text "What better place for a man to catch his"
.byte NewLine
.text "breath than the impregnable Kerberos' Gate,"
.byte NewLine
.text "eh, Lobos?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hah! Indeed, sire."
.byte WaitForA

.byte EndText

ch3op2

.byte Right_slot
.word LoadPortrait
.word leif_portrait2

.byte Left_slot
.word LoadPortrait
.word augustus_potrait
.text "That fortress, Kerberos' Gate, guards the road"
.byte NewLine
.text "into Munster."
.byte WaitForA
.byte ScrollText
.text "As strongholds go, it's rather small, but don't let"
.byte NewLine
.text "its size fool you: the people of this area say"
.byte NewLine
.text "it's more terrible than Hell itself."
.byte WaitForA

.byte Right_slot
.text "Why?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "The soldiers here no longer watch over"
.byte NewLine
.text "the road—they search for children."
.byte WaitForA
.byte ScrollText
.text "Lord Leif, the fortress now serves as a base"
.byte NewLine
.text "for the province's child hunts."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Child hunts?"
.byte NewLine
.text "What are you talking about, August?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...All across the Empire, children aged seven to"
.byte NewLine
.text "thirteen are seized by Imperial soldiers."
.byte WaitForA
.byte ScrollText
.text "They're sent to Belhalla, the capital, and after"
.byte NewLine
.text "the atrocities wrought upon them there..."
.byte NewLine
.text "the ones who survive are never the same."
.byte WaitForA
.byte ScrollText
.text "They are children no more—they begin life anew"
.byte NewLine
.text "as servants to the dark god, Loptous."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "That's inconceivable."
.byte NewLine
.text "What manner of tall tale..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I realize it sounds too horrible to be true,"
.byte NewLine
.text "but this is no fable—this is the state of Jugdral."
.byte WaitForA
.byte ScrollText
.text "Even now, children languish in captivity"
.byte NewLine
.text "within that very fortress you see."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "...What soldier could willingly take part in such"
.byte NewLine
.text "a thing? No one with a spark of humanity left,"
.byte NewLine
.text "to be sure."
.byte WaitForA
.byte ScrollText
.text "I'm sorry, August,"
.byte NewLine
.text "but we must part ways here."
.byte WaitForA
.byte ScrollText
.text "I cannot allow this evil to go unchallenged—"
.byte NewLine
.text "I must free those children from this barbarism."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Indeed..."
.byte NewLine
.text "Allow me to give you one last piece of advice,"
.byte NewLine
.text "sire."
.byte WaitForA
.byte ScrollText
.text "Kerberos' Gate is too small to fit horses,"
.byte NewLine
.text "so have any of your soldiers that fight"
.byte NewLine
.text "on horseback [Dismount] before entering."
.byte WaitForA
.byte ScrollText
.text "Further, after everything they've seen, I'd wager"
.byte NewLine
.text "the children are too traumatized to even move."
.byte WaitForA
.byte ScrollText
.text "Have your men carry them back to the villages,"
.byte NewLine
.text "and their families will owe you a debt"
.byte NewLine
.text "they can never repay."
.byte WaitForA
.byte ScrollText
.text "Fortune be with you, Prince of Leonster."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hold! This whole time, you've known I was"
.byte NewLine
.text "the heir to House Leonster?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "But of course. What's more, I want to see you"
.byte NewLine
.text "returned to power. Let's arrange to meet"
.byte NewLine
.text "in Munster after your business is concluded."
.byte WaitForA

.byte EndText

ch3end1

.byte Left_slot
.word LoadPortrait
.word leif_portrait2
.text "...It was a hard-fought victory,"
.byte NewLine
.text "but we've taken control of Kerberos' Gate."
.byte WaitForA

.word PlayMusic
.byte $3B
.byte ScrollText

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait
.text "Nicely done. I'm impressed, truly." 
.byte NewLine
.text "Such a shame to spoil your moment,"
.byte NewLine
.text "but I must ask you to drop your weapons."
.byte WaitForA
.byte ScrollText
.text "Otherwise, I'll have to do something very ugly"
.byte NewLine
.text "to this very pretty young woman."
.byte WaitForA
.byte ScrollText

.word LoadPortrait
.word nanna_portrait

.byte Left_slot
.byte ScrollText
.text "Nanna?!"
.byte WaitForA
.byte ScrollText

.byte Right_slot
.word LoadPortrait
.word raydrik_portrait

.byte Left_slot
.text "...Raydrik, you soulless parasite..."
.byte WaitForA
.byte ScrollText

.byte Right_slot
.word LoadPortrait
.word nanna_portrait
.text "Run, Lord Leif!"
.byte NewLine
.text "Don't worry about me!"
.byte WaitForA

.byte Left_slot
.text "Damn...!"
.byte WaitForA
.byte ScrollText

.byte Right_slot
.byte ScrollText
.word LoadPortrait
.word raydrik_portrait

.byte Left_slot
.text "Fine... Fine, I said!"
.byte NewLine
.text "I'm putting my weapons down,"
.byte NewLine
.text "so keep your hands off Nanna!"
.byte WaitForA

.byte Right_slot
.text "Hah! See, the young pup knows how to heel!"
.byte NewLine  
.text "Men, move in and chain the good Prince Leif!"
.byte NewLine
.text "Then fan out and seize the rest of his forces!"
.byte WaitForA

.byte EndText

ch3end2

.byte Right_slot
.word LoadPortrait
.word eyvel_portrait

.text "Damn...! Little Leif got himself captured?"
.byte NewLine
.text "Well, two can play at that game."
.byte WaitForA
.byte ScrollText
.text "I'm goin' in and waving the white flag—"
.byte NewLine
.text "no doubt they'll arrest me too. I'll do what I can"
.byte NewLine
.text "to protect the Little Lord from the inside."
.byte WaitForA
.byte ScrollText
.text "The rest of you, hightail it outta here"
.byte NewLine
.text "and make ready to rescue him!"
.byte WaitForA

.byte EndText

ch3end3

.byte Right_slot
.word LoadPortrait
.word finn_portrait

.text "I suppose this was inevitable..."
.byte NewLine
.text "We...have no choice but to retreat..."
.byte WaitForA
.byte ScrollText
.text "Hold out for as long as you can, Lord Leif!"
.byte NewLine
.text "On my honor, I will come for you!"
.byte WaitForA

.byte EndText

ch3end4

.byte Right_slot
.word LoadPortrait
.word halvan_portrait

.text "Well... We lasted until now."
.byte NewLine
.text "No one can say we didn't give it our all..."
.byte WaitForA

.byte EndText

ch3end5

.byte Right_slot
.word LoadPortrait
.word osian_portrait

.text "Dammit, Leif..."
.byte NewLine
.text "Nothing to be done about it now, I guess."
.byte WaitForA
.byte ScrollText
.text "We're comin' after you,"
.byte NewLine
.text "so don't you dare go dying first, you hear?!"
.byte WaitForA

.byte EndText

ch3end6

.byte Right_slot
.word LoadPortrait
.word safie_portrait

.text "Gods above, watch over the prince..."
.byte WaitForA

.byte EndText

ch3end7

.byte Right_slot
.word LoadPortrait
.word dagdar_portrait

.text "Damn it all, the prince let 'imself be captured?"
.byte NewLine
.text "Can't much stand it meself, but fer now, I've no"
.byte NewLine
.text "choice but to head back to Mount Violdrake."
.byte WaitForA
.byte ScrollText
.text "This ain't the end, though: I'll round up"
.byte NewLine
.text "me whole crew and we'll storm Munster!"
.byte WaitForA

.byte EndText

ch3cairprevillagecairpre

.byte Right_slot
.word LoadPortrait
.word bishop_portrait

.text "Master Cairpre! Thank the gods you're all right!"
.byte NewLine
.text "I was sick with worry..."
.byte WaitForA
.byte ScrollText
.text "The young master is a nobleman's ward,"
.byte NewLine
.text "and was coming to our village as a messenger,"
.byte NewLine
.text "but got mistaken for one of our own children!"
.byte WaitForA
.byte ScrollText
.text "You have my deepest thanks,"
.byte NewLine
.text "but I've little else to give..."
.byte WaitForA
.byte ScrollText
.text "Still, I imagine rescuing a child of Thracian"
.byte NewLine
.text "nobility ought to pay off sooner or later."
.byte WaitForA

.byte EndText

ch3cairprevillageother

.byte Right_slot
.word LoadPortrait
.word bishop_portrait

.text "Master Cairpre, taken by those savages..."
.byte NewLine
.text "Argh, a pox on them all! What am I to do...?"
.byte WaitForA

.byte EndText

ch3lucciavillageluccia

.byte Right_slot
.word LoadPortrait
.word oldlady3_portrait

.text "Luccia! Oh, me own girl, hale and hardy!"
.byte NewLine
.text "Thought me heart would give out from worry,"
.byte NewLine
.text "it would!"
.byte WaitForA
.byte ScrollText
.text "I can't begin to say how grateful I am"
.byte NewLine
.text "to ye, stranger."
.byte NewLine
.text "Don't have much in the way of thanks, but..."
.byte WaitForA
.byte ScrollText
.text "Mayhap this old parchment could be of some"
.byte NewLine
.text "good to you? We been puzzlin' over it fer years,"
.byte NewLine
.text "but what it does is beyond our ken."
.byte WaitForA
.byte ScrollText
.text "All we know is that merely holdin' it fills ye"
.byte NewLine
.text "with tremendous vim and vigor, amongst"
.byte NewLine
.text "other things. Hope it helps ye, I surely do."
.byte WaitForA

.byte EndText

ch3lucciavillageother

.byte Right_slot
.word LoadPortrait
.word oldlady3_portrait

.text "Me... Me daughter..."
.byte NewLine
.text "Please, good folk! Yer armed and fit fer battle!"
.byte NewLine
.text "Bring me girl, Luccia, back! I beg of ye!"
.byte WaitForA

.byte EndText

ch3jubelvillagejubel

.byte Right_slot
.word LoadPortrait
.word younglady_portrait

.text "Holy Heim! Jubel, yer safe!"
.byte NewLine
.text "You...gave me a real scare there..."
.byte NewLine
.text "I'm so glad to see you again."
.byte WaitForA
.byte ScrollText
.text "Whatever yer reasons, stranger,"
.byte NewLine
.text "thank you fer helpin'. Truly."
.byte WaitForA
.byte ScrollText
.text "Now listen, me older brother is an Imperial"
.byte NewLine
.text "soldier, but if'n you ever meet him, tell him"
.byte NewLine
.text "what the Empire done to our youngest kin."
.byte WaitForA
.byte ScrollText
.text "His name's Dalsin. Ain't a doubt in me mind"
.byte NewLine
.text "he'd help you, so don't go forgettin' it!"
.byte WaitForA

.byte EndText

ch3jubelvillageother

.byte Right_slot
.word LoadPortrait
.word younglady_portrait

.text "Me kid brother, Jubel,"
.byte NewLine
.text "was taken to Kerberos' Gate..."
.byte WaitForA
.byte ScrollText
.text "Please, stranger! He's just a wee lad,"
.byte NewLine
.text "and you've the arms an' army to give"
.byte NewLine
.text "them Imperial dastards what-for!"
.byte WaitForA

.byte EndText

ch3romeovillageromeo

.byte Right_slot
.word LoadPortrait
.word oldlady_portrait

.text "Hm? Oh, it can't be! Romeo, safe and sound..."
.byte NewLine
.text "From the depths of me heart, I thank ye."
.byte WaitForA
.byte ScrollText
.text "Fer bringing me boy back single-handed,"
.byte NewLine
.text "I'd like ye to have this."
.byte WaitForA
.byte ScrollText
.text "This here ring's been handed down"
.byte NewLine
.text "in me family fer as long as I can remember."
.byte NewLine
.text "It's enchanted, it is. Take it, I insist."
.byte WaitForA

.byte EndText

ch3romeovillageother

.byte Right_slot
.word LoadPortrait
.word oldlady_portrait

.text "Please, I beseech ye! Save me boy, Romeo,"
.byte NewLine
.text "from that gods-forsaken fort!"
.byte WaitForA

.byte EndText