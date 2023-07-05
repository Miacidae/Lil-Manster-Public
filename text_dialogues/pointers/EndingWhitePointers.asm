;	Timers for each page:

* = $0D1DE7
.logical mapped($0D1DE7)

.byte	$F0

.here

* = $0D1E24
.logical mapped($0D1E24)

.byte	$C0

.here

* = $0D1E61
.logical mapped($0D1E61)

.byte	$A0

.here

* = $0D1E9E
.logical mapped($0D1E9E)

.byte	$F0

.here

* = $0D1EDB
.logical mapped($0D1EDB)

.byte	$F0

.here

;	Proper fade-out for last page

* = $1CBFA7
.logical mapped($1CBFA7)

.byte	$03

.here

* = $0D1F2B
.logical mapped($0D1F2B)

.word	<>page1_line1

.here

* = $0D1F3A
.logical mapped($0D1F3A)

.word	<>page2_line1

.here

* = $0D1F49
.logical mapped($0D1F49)

.word	<>page3_line1

.here

* = $0D1F58
.logical mapped($0D1F58)

.word	<>page4_line1

.here

* = $0D1F67
.logical mapped($0D1F67)

.word	<>page5_line1

.here


* = $0D1F70
.logical mapped($0D1F70)

page1_line1

.long	dialogueEndingPage1Line1
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page1_line2

.long	dialogueEndingPage1Line2
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000

page1_line3

.long	dialogueEndingPage1Line3
.byte	$FF
.byte	$0E
.word	$0800
.word	$0001
.word	$0000

page1_line4

.long	dialogueEndingPage1Line4
.byte	$FF
.byte	$10
.word	$0A00
.word	$0001
.word	$0000
.word	$0000

page2_line1

.long	dialogueEndingPage2Line1
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page2_line2

.long	dialogueEndingPage2Line2
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000
.word	$0000

page3_line1

.long	dialogueEndingPage3Line1
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page3_line2

.long	dialogueEndingPage3Line2
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000
.word	$0000

page4_line1

.long	dialogueEndingPage4Line1
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page4_line2

.long	dialogueEndingPage4Line2
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000

page4_line3

.long	dialogueEndingPage4Line3
.byte	$FF
.byte	$0E
.word	$0800
.word	$0001
.word	$0000
.word	$0000

page5_line1

.long	dialogueEndingPage5Line1
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page5_line2

.long	dialogueEndingPage5Line2
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000
.word	$0000

.here