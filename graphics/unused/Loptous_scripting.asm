* = $0B1B6A
.logical lorom($0B1B6A, 1)

; B1B6A - B1C03

.byte $3B, $08		; BEGIN
.byte $2F, $42		; Load Tiles: Meteor Outlines (+pause)
.byte $FE, $FF		; --Wait--
.byte $31, $42		; Load Tiles: Prob Meteor Tilemap (+pause)
.byte $FE, $FF		; --Wait--
.byte $2A, $42		; Load Tiles: Valflame Triangle Lines -2bpp (+pause)
.byte $FE, $FF		; --Wait--
.byte $2E, $42		; Load Tiles: Valflame Triangle Lines Tilemap (+pause)
.byte $FE, $FF		; --Wait--
.byte $09, $5E		; Scroll to Defender: Normal (+pause)
.byte $FE, $FF		; --Wait--
.byte $07, $56		; Effect: Fade Out 1 (+pause)
.byte $FE, $FF		; --Wait--
.byte $3E, $04		; Display Tiles: ???
.byte $2A, $08		; Battle Scene Mod: Shift BG Up
.byte $0F, $1C		; Secondary Palette: ???
.byte $01, $54		; --Wait: 1 frame-- [Insert sound below for Meteor Instruments]
.byte $FE, $FF		; --Wait--
.byte $75, $16		; Palette: ???
.byte $02, $1A		; Placement: Center of Screen
.byte $37, $1A		; Placement / Scrolling: ???
.byte $72, $42		; Load Tiles: Loptous Dragon (+pause)
.byte $FE, $FF		; --Wait--
.byte $74, $42		; Load Tiles: Loptous Dragon Tilemap (+pause)
.byte $FE, $FF		; --Wait--
.byte $0B, $2E		; Play Sound (lower): Dire Thunder Rumble 0B
.byte $3F, $04		; Display Tiles: ???
.byte $38, $1A		; Placement / Scrolling: ???
.byte $76, $16		; Palette: ???
.byte $3C, $54		; --Wait: 60 frames--
.byte $2B, $2C		; [--Wait--] Play Sound (low): Meteor Charging 07
.byte $0A, $54		; --Wait: 10 frames--
.byte $FE, $FF		; --Wait--
.byte $02, $1A		; Placement: Center of Screen
.byte $24, $00		; Effect Mask: Delete [FE4: Loptous blast]
.byte $FE, $FF		; --Wait--
.byte $FD, $FF		; Cast1: Starts the animation loop on the caster
.byte $5C, $04		; Display Tiles: ???
.byte $3A, $1A		; Placement / Scrolling: ???
.byte $26, $00		; Effect Mask: Slow Expand (pixel-wide to max)
.byte $39, $1A		; Placement / Scrolling: ???
.byte $52, $56		; Effect / Palette: ??? (+pause)
.byte $FE, $FF		; --Wait--
.byte $53, $16		; Effect / Palette: ???
.byte $1E, $54		; --Wait: 30 frames--
.byte $FE, $FF		; --Wait--
.byte $F9, $FF		; Dodge point
.byte $1A, $54		; --Wait: 30 frames--
.byte $FE, $FF		; --Wait--
.byte $FA, $FF		; Damage point
.byte $06, $54		; --Wait: 6 frames--
.byte $FE, $FF		; --Wait--
.byte $54, $16		; Effect / Palette: ???
.byte $77, $16		; Palette: ???
.byte $78, $16		; Palette: ???
.byte $5C, $54		; --Wait: 92 frames--
.byte $FE, $FF		; --Wait--
.byte $FD, $FF		; Cast2: resting
.byte $FC, $FF		; Reaction point
.byte $40, $04		; Display Tiles: ???
.byte $04, $58		; BG Mod: ??? (+pause)
.byte $FE, $FF		; --Wait--
.byte $05, $58		; BG Mod: ??? (+pause)
.byte $FE, $FF		; --Wait--
.byte $05, $0E		; BG?: Meteor Something 1
.byte $06, $4E		; BG?: Meteor Something 2 (+pause)
.byte $06, $18		; BG Mod: ???
.byte $FE, $FF		; --Wait--
.byte $2B, $08		; Battle Scene Mod: Reset BG
.byte $60, $16		; Effect: Fade In
.byte $01, $54		; --Wait: 1 frame--
.byte $FE, $FF		; --Wait--
.byte $5D, $04		; Display Tiles: ???
.byte $12, $56		; Effect: Reset Tile/Palette Effects (+pause)
.byte $FE, $FF		; --Wait--
.byte $36, $08		; END
.byte $FF, $FF		; EXIT

.here