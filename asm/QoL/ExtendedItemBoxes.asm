; Extended Item Description Box - Ultimage

; Clear 2 additional description lines:

* = $00F808
.logical lorom($00F808, 1)

.byte $14

.here

; Inventory Screen:

; Moving the text:
* = $00DE45
.logical lorom($00DE45, 1)

.byte $02

.here

* = $00DE4A
.logical lorom($00DE4A, 1)

.byte $07

.here

; Text box

* = $00FA8F
.logical lorom($00FA8F, 1)
.byte $16
.here
* = $00FA98
.logical lorom($00FA98, 1)
.byte $16
.here


* = $00FACA
.logical lorom($00FACA, 1)
.byte $FC
.here
* = $00FACB
.logical lorom($00FACB, 1)
.byte $E8
.here


* = $00FADE
.logical lorom($00FADE, 1)
.byte $16
.here

* = $00FAEC
.logical lorom($00FAEC, 1)
.byte $FC
.here
* = $00FAED
.logical lorom($00FAED, 1)
.byte $D8
.here


* = $00FB00
.logical lorom($00FB00, 1)
.byte $16
.here

* = $00FB33
.logical lorom($00FB33, 1)
.byte $80
.here
* = $00FB34
.logical lorom($00FB34, 1)
.byte $01
.here

* = $00FB5A
.logical lorom($00FB5A, 1)
.byte $80
.here
* = $00FB5B
.logical lorom($00FB5B, 1)
.byte $01
.here

* = $00FB76
.logical lorom($00FB76, 1)
.byte $FC
.here
* = $00FB77
.logical lorom($00FB77, 1)
.byte $E8
.here


* = $00FB8A
.logical lorom($00FB8A, 1)
.byte $16
.here

* = $00FB98
.logical lorom($00FB98, 1)
.byte $FC
.here
* = $00FB99
.logical lorom($00FB99, 1)
.byte $D8
.here


* = $00FBAC
.logical lorom($00FBAC, 1)
.byte $16
.here

; Trade Screen: 

; Moving Text:

* = $02B1DA
.logical lorom($02B1DA, 1)
.byte $07
.here

; Text box:

* = $00FD42
.logical lorom($00FD42, 1)
.byte $E9
.here

* = $00FD55
.logical lorom($00FD55, 1)
.byte $16
.here

* = $00FD64
.logical lorom($00FD64, 1)
.byte $D9
.here

* = $00FD77
.logical lorom($00FD77, 1)
.byte $16
.here

* = $00FDAB
.logical lorom($00FDAB, 1)
.byte $01
.here

* = $00FDD2
.logical lorom($00FDD2, 1)
.byte $01
.here

* = $00FDE1
.logical lorom($00FDE1, 1)
.byte $E9
.here

* = $00FDF4
.logical lorom($00FDF4, 1)
.byte $16
.here

* = $00FE03
.logical lorom($00FE03, 1)
.byte $D9
.here

* = $00FE16
.logical lorom($00FE16, 1)
.byte $16
.here

* = $00FE4A
.logical lorom($00FE4A, 1)
.byte $01
.here

* = $00FE71 
.logical lorom($00FE71, 1)
.byte $01
.here

* = $00FF08
.logical lorom($00FF08, 1)
.byte $E9
.here

* = $00FF1B
.logical lorom($00FF1B, 1)
.byte $16
.here

* = $00FF2A
.logical lorom($00FF2A, 1)
.byte $D9
.here

* = $00FF3D
.logical lorom($00FF3D, 1)
.byte $16
.here

* = $00FF4E
.logical lorom($00FF4E, 1)
.byte $E9
.here

* = $00FF61
.logical lorom($00FF61, 1)
.byte $16
.here

* = $00FF70
.logical lorom($00FF70, 1)
.byte $D9
.here

* = $00FF83
.logical lorom($00FF83, 1)
.byte $16
.here

; Clear weapon rank icons

* = $00FECC
.logical lorom($00FECC, 1)
.byte $07
.here

* = $00FEDA
.logical lorom($00FEDA, 1)
.byte $07
.here


; Trading AND Supply window borders

* = $00FAB3
.logical lorom($00FAB3, 1)
.byte $16
.here

* = $00FABC
.logical lorom($00FABC, 1)
.byte $16
.here


; Supply text box background

* = $053283
.logical lorom($053283, 1)
.byte $16
.here

* = $0532A3
.logical lorom($0532A3, 1)
.byte $16
.here

* = $0532E0
.logical lorom($0532E0, 1)
.byte $16
.here

* = $053344
.logical lorom($053344, 1)
.byte $16
.here








































