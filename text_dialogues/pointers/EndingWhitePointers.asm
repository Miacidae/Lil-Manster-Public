;	Timers for each page:

* = $0D1DE7
.logical lorom($0D1DE7, 1)

.byte	$FF

.here

* = $0D1E24
.logical lorom($0D1E24, 1)

.byte	$C0

.here

* = $0D1E61
.logical lorom($0D1E61, 1)

.byte	$A0

.here

* = $0D1E9E
.logical lorom($0D1E9E, 1)

.byte	$FF

.here

* = $0D1EDB
.logical lorom($0D1EDB, 1)

.byte	$FF

.here

;	Proper fade-out for last page

* = $1CBFA7
.logical lorom($1CBFA7, 1)

.byte	$03

.here

* = $0D1F2B
.logical lorom($0D1F2B, 1)

.word	<>page1_line1

.here

* = $0D1F3A
.logical lorom($0D1F3A, 1)

.word	<>page2_line1

.here

* = $0D1F49
.logical lorom($0D1F49, 1)

.word	<>page3_line1

.here

* = $0D1F58
.logical lorom($0D1F58, 1)

.word	<>page4_line1

.here

* = $0D1F67
.logical lorom($0D1F67, 1)

.word	<>page5_line1

.here


* = $0D1F70
.logical lorom($0D1F70, 1)

page1_line1

.long	page1_line1_text
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page1_line2

.long	page1_line2_text
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000

page1_line3

.long	page1_line3_text
.byte	$FF
.byte	$0E
.word	$0800
.word	$0001
.word	$0000

page1_line4

.long	page1_line4_text
.byte	$FF
.byte	$10
.word	$0A00
.word	$0001
.word	$0000
.word	$0000

page2_line1

.long	page2_line1_text
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page2_line2

.long	page2_line2_text
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000
.word	$0000

page3_line1

.long	page3_line1_text
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page3_line2

.long	page3_line2_text
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000
.word	$0000

page4_line1

.long	page4_line1_text
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page4_line2

.long	page4_line2_text
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000

page4_line3

.long	page4_line3_text
.byte	$FF
.byte	$0E
.word	$0800
.word	$0001
.word	$0000
.word	$0000

page5_line1

.long	page5_line1_text
.byte	$FF
.byte	$0A
.word	$0400
.word	$0001
.word	$0000

page5_line2

.long	page5_line2_text
.byte	$FF
.byte	$0C
.word	$0600
.word	$0001
.word	$0000
.word	$0000

.here