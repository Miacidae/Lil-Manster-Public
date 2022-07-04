ch4xop1

.byte Left_slot
.word LoadPortrait
.word asbel_portrait

.byte Right_slot
.word LoadPortrait
.word ced_portrait

.byte Left_slot
.text "Sir Ced, do you think the kids are safe?"
.byte WaitForA

.byte Right_slot
.text "Think of it the way Raydrik would:"
.byte NewLine
.text "would you send a convoy all the way"
.byte NewLine
.text "to Belhalla with only three or four children?"
.byte WaitForA
.byte ScrollText
.text "Or would you wait until you have plenty"
.byte NewLine
.text "to show for yourself? There's still time, Asbel."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Then we can send them all back home!"
.byte NewLine
.text "Their parents must be so worried."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Focus, Asbel. There's too many guards about"
.byte NewLine
.text "to celebrate just yet."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Yessir."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Listen closely: after you've rescued"
.byte NewLine
.text "the children, I want you to rejoin Brighton"
.byte NewLine
.text "and seek out Prince Leif of House Leonster."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "C-Come again? Prince Leif?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Indeed. He fell prey to some trap of Raydrik's"
.byte NewLine
.text "and was imprisoned in this very castle."
.byte WaitForA
.byte ScrollText
.text "...Asbel, what's wrong? You're white as a sheet!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Lord Leif was a dear friend of mine, you see."
.byte NewLine
.text "We got separated in Tahra, years ago,"
.byte NewLine
.text "and I've been looking for him ever since."
.byte WaitForA
.byte ScrollText
.text "For three whole years, I've been searching..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Then look alive—today is the day"
.byte NewLine
.text "you've been waiting for."
.byte NewLine
.text "Find the prince, and escape Munster with him."
.byte WaitForA
.byte ScrollText
.text "I've ordered all Magi outside the castle"
.byte NewLine
.text "to flee Munster as well. We'll be sitting ducks"
.byte NewLine
.text "if we stay here much longer..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Are you coming with us?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I...considered it, but I can't. There's many"
.byte NewLine
.text "villagers and townsfolk left in Munster,"
.byte NewLine
.text "and they need my aid just as much."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You've spent this whole time teaching me,"
.byte NewLine
.text "and I can't even help you in return?"
.byte NewLine
.text "Some apprentice I turned out to be..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "No, this is my choice, Asbel."
.byte NewLine
.text "It's no fault of yours."
.byte WaitForA
.byte ScrollText
.text "Besides, all I really taught you"
.byte NewLine
.text "was that Grafcalibur spell."
.byte NewLine
.text "Do me proud, and use it to protect Prince Leif."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Sir Ced, will... Will we see each other again?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "If Prince Leif is the hero we've been"
.byte NewLine
.text "waiting for, then the long night is finally over,"
.byte NewLine
.text "and Thracia will breathe free again."
.byte WaitForA
.byte ScrollText
.text "...We will see each other again, Asbel."
.byte NewLine
.text "Right here in Munster."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Munster...? R-Right! Munster it is!"
.byte NewLine
.text "Don't you forget it, Sir Ced!"
.byte WaitForA

.byte EndText

ch4xop2

.byte Right_slot
.word LoadPortrait
.word girl_portrait
.text "*Sniffle... Sniffle...*"
.byte WaitForA

.byte Left_slot
.word LoadPortrait
.word boy_portrait
.text "C'mon, knock off the waterworks..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "B-B-But...!"
.byte NewLine
.text "*Sniffle*"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Don't make them soldiers mad at us again."
.byte NewLine
.text "They'll just tell us to “Quit yer bellyachin'!”"
.byte NewLine
.text "like last time..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I don't care if they get mad!"
.byte WaitForA
.byte ScrollText
.text "If I get caught cryin', an' they get angry..."
.byte NewLine
.text "Maybe they'll jus' send me home..."
.byte WaitForA
.byte ScrollText
.text "I jus' wanna go home..."
.byte WaitForA

.byte EndText

ch4xasbelleiftalk

.byte Right_slot
.word LoadPortrait
.word asbel_portrait
.text "Lord Leif...!  "

.byte Left_slot
.word LoadPortrait
.word leif_portrait

.byte Right_slot
.text "After all these years!"
.byte NewLine
.text "It's me, Asbel!"
.byte WaitForA

.byte Left_slot
.text "Asbel?! What in the world are you doing here?"
.byte NewLine
.text "Why aren't you still in Tahra?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I set off after you just as soon as"
.byte NewLine
.text "we got separated! Lotta good that did..."
.byte NewLine
.text "I couldn't figure out where you'd gone."
.byte WaitForA
.byte ScrollText
.text "For the last half-year now,"
.byte NewLine
.text "I've been sticking around Munster."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You left Tahra that quickly?! Then...you've"
.byte NewLine
.text "spent the last three years looking for me..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Of course I did! I promised you as much,"
.byte NewLine
.text "remember? With your blade and my magic,"
.byte NewLine
.text "we were gonna take Thracia back—together!"
.byte WaitForA
.byte ScrollText
.text "But you just up an' left me behind! That..."
.byte NewLine
.text "That was quite heartless of you, Leif."
.byte NewLine
.text "Er, Lord Leif."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm sorry..."
.byte NewLine
.text "At the time, I didn't have a choice."
.byte WaitForA
.byte ScrollText
.text "Tahra had been surrounded by the Empire."
.byte NewLine
.text "I had... I had prepared myself"
.byte NewLine
.text "for the very real possibility of dying."
.byte WaitForA
.byte ScrollText
.text "When I fled, I never imagined I would make it"
.byte NewLine
.text "out alive. I didn't want to drag you down"
.byte NewLine
.text "with me, so I left you out of it."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "What a load of pegasus dung...! We swore"
.byte NewLine
.text "to live and die together, didn't we? Or was"
.byte NewLine
.text "that whole oath just part of some kids' game?"
.byte WaitForA
.byte ScrollText
.text "I've spent all these years with those words"
.byte NewLine
.text "etched into my mind—and I chose to believe"
.byte NewLine
.text "in them."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "A-Asbel..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Lord Leif, if only for my sake,"
.byte NewLine
.text "you have to liberate Thracia! Make it so that"
.byte NewLine
.text "my years of searching meant something!"
.byte WaitForA

.byte EndText

ch4xcedkarintalk

.byte Left_slot
.word LoadPortrait
.word karin_portrait

.byte Right_slot
.word LoadPortrait
.word ced_portrait

.byte Left_slot
.text "Lord Ced!"
.byte NewLine
.text "Oh, Lord Ced, after all this time..."
.byte WaitForA

.byte Right_slot
.text "Yes? Wait... Karin? Has something happened?"
.byte NewLine
.text "Why have you left Silesse?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "To... To find you, my prince!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "To find me...? Oh, for heaven's sake..."
.byte NewLine
.text "Did Fee put you up to this?"
.byte NewLine
.text "Or was it my mother?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "......"
.byte WaitForA
.byte ScrollText
.text "Lord Ced, I have some...important news"
.byte NewLine
.text "for you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Is that so? Well, let's hear it."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "W-Well, to tell the truth... Oh, gods..."
.byte WaitForA
.byte ScrollText
.text "......"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Karin, if you have something to tell me,"
.byte NewLine
.text "speak quickly and to the point."
.byte NewLine
.text "This is no time for weakness."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Y-You're right..."
.byte NewLine
.text "I... I regret to inform you that"
.byte NewLine
.text "Her Majesty the Queen has... She, um..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Mother?! No, she can't have...!"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "I'm...afraid so, milord. Two months ago..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Mother is..."
.byte NewLine
.text "My mother has...passed away...?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Lord Ced... I'm sorry. You shouldn't have"
.byte NewLine
.text "found out like this. Here, of all places..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Does it matter? I was too late... Father..."
.byte NewLine
.text "I wanted them to see each other one last time..."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Lord Ced, return to Silesse with me—please."
.byte NewLine
.text "Lady Fee is waiting for you."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Fee... How is she? Is she all right?"
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Silesse faces dire times, milord."
.byte WaitForA
.byte ScrollText
.text "Lady Fee can put up a tough front for"
.byte NewLine
.text "the others, but when it's just me and her, she..."
.byte NewLine
.text "She cries till her eyes dry up."
.byte WaitForA
.byte ScrollText
.text "Lord Ced, with respect, you've done her"
.byte NewLine
.text "a great cruelty, running away like you did."
.byte WaitForA
.byte ScrollText
.text "Lady Fee isn't much more than a kid, and"
.byte NewLine
.text "you've gone and forced the burden of ruling"
.byte NewLine
.text "Silesse onto her."
.byte WaitForA
.byte ScrollText
.text "That holy blood in your veins"
.byte NewLine
.text "has gone to your head!"
.byte WaitForA
.byte ScrollText
.text "You're the heir to Forseti's legacy,"
.byte NewLine
.text "good for you, but you up and walked out"
.byte NewLine
.text "on your mother and sister!"
.byte WaitForA
.byte ScrollText
.text "Does that sound like what a hero would do?"
.byte NewLine
.text "Does that even sound like what a real prince"
.byte NewLine
.text "would do?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Karin, I... You're right, of course, but..."
.byte NewLine
.text "But Father was the only one who could cure"
.byte NewLine
.text "Mother's illness!"
.byte WaitForA
.byte ScrollText
.text "I couldn't do her any good just waiting"
.byte NewLine
.text "at her side! Was I supposed to just sit there"
.byte NewLine
.text "and watch her waste away?!"
.byte WaitForA
.byte ScrollText
.text "So I... I went to find Father,"
.byte NewLine
.text "by whatever means I could."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Then why are you leading some rebel group"
.byte NewLine
.text "in Munster?!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I heard tell that my father had been here"
.byte NewLine
.text "in Munster until half a year ago. I came here"
.byte NewLine
.text "to pick up the trail, but it had gone cold."
.byte WaitForA
.byte ScrollText
.text "As I investigated, I discovered just how deeply"
.byte NewLine
.text "the people of Munster suffered."
.byte WaitForA
.byte ScrollText
.text "I couldn't abandon them"
.byte NewLine
.text "as my father had abandoned Silesse."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Is that right...? I apologize, Lord Ced..."
.byte NewLine
.text "I should've heard your side of the story"
.byte NewLine
.text "before judging you..."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "I'm sorry, Karin, but I need more time."
.byte NewLine
.text "If I can drive that menace Raydrik"
.byte NewLine
.text "from Munster, I'll gladly return to Silesse."
.byte WaitForA
.byte ScrollText
.text "By my estimation, that should only take"
.byte NewLine
.text "a half-year at most."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...You're fixin' to overthrow that creep, huh?"
.byte NewLine
.text "Now that's a plan I can get behind!"
.byte NewLine
.text "Count me in—I'll stay here with you!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Heh. I'm flattered, Karin, but as your prince,"
.byte NewLine
.text "I insist you head back to Silesse. I couldn't"
.byte NewLine
.text "fight knowing you were endangering yourself."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...That's a diplomatic way of saying"
.byte NewLine
.text "I would be a burden. But you're right:"
.byte NewLine
.text "I would just slow you down."
.byte WaitForA
.byte ScrollText
.text "All right, I'll make my way back to Silesse—"
.byte NewLine
.text "but only if you promise to come home"
.byte NewLine
.text "yourself, Lord Ced."
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "You have my word—and as proof of my vow,"
.byte NewLine
.text "I bestow this upon you."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Er, what is it? A used handkerchief?"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Hah! Would you believe this is an heirloom"
.byte NewLine
.text "of the Silessian royal family?"
.byte WaitForA
.byte ScrollText
.text "It's an ancient scroll, penned by my namesake—"
.byte NewLine
.text "the crusader Ced himself."
.byte WaitForA
.byte ScrollText
.text "He imbued it with potent magic"
.byte NewLine
.text "that strengthens whoever so much as holds it."
.byte WaitForA
.byte ScrollText
.text "I was...supposed to give it to my betrothed,"
.byte NewLine
.text "actually. Instead, I entrust it to you, Karin."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "Are you really trusting me"
.byte NewLine
.text "with something so valuable?"
.byte WaitForA
.byte ScrollText
.text "I... This is most unexpected!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Karin... I did wrong by my mother,"
.byte NewLine
.text "and I'm sorry."
.byte WaitForA
.byte ScrollText
.text "I owe you much for helping Fee in my absence,"
.byte NewLine
.text "and this is a token of my gratitude."
.byte NewLine
.text "I want you to have it."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "...OK, but I'm only keeping it safe for you."
.byte NewLine
.text "You'll get it back the second you return"
.byte NewLine
.text "to Silesse!"
.byte WaitForA

.byte Right_slot
.byte ScrollText
.text "Then the snowy banks of Silesse shall be"
.byte NewLine
.text "witness to our next meeting. Be well, Karin."
.byte WaitForA

.byte Left_slot
.byte ScrollText
.text "You said it!"
.byte NewLine
.text "Gods be with you, Lord Ced!"
.byte WaitForA

.byte EndText

ch4xuppercell

.byte Right_slot
.word LoadPortrait
.word girl_portrait
.text "I jus' wanna go home..."
.byte WaitForA
.byte ScrollText
.text "*Sniffle, sniffle*"
.byte NewLine
.text "H-How do I get home?"
.byte NewLine
.text "Uh-huh... The way to the right...?"
.byte WaitForA
.byte ScrollText
.text "Then I'll run that way and won't stop"
.byte NewLine
.text "till I'm back home...! Th-Thank you..."
.byte WaitForA

.byte EndText

ch4xlowercell

.byte Right_slot
.word LoadPortrait
.word boy_portrait
.text "Huh? Can I go home to my papa now?"
.byte WaitForA
.byte ScrollText
.text "...Oh, I can escape if I go down that passage"
.byte NewLine
.text "to the right? Thank you! B-Bless you!"
.byte WaitForA

.byte EndText