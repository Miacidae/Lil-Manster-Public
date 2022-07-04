
; This allows you to extend the timer on each page of the ending's "white screen" text.

* = $0D1DE7
.logical lorom($0D1DE7, 1)

.byte	$F0

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

.byte	$F0

.here

* = $0D1EDB
.logical lorom($0D1EDB, 1)

.byte	$F0

.here