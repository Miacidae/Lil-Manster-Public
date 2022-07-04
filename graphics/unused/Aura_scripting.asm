* = $0B0BC6
.logical lorom($0B0BC6, 1)

; B0BC6 - B0C31

.byte $3B, $08     ; BEGIN
.byte $0A, $42     ; Load Tile: Aura (+pause)
.byte $FE, $FF     ; --Wait--
.byte $09, $42     ; Load Tile: Aura Tilemap (+pause)
.byte $FE, $FF     ; --Wait--
.byte $09, $5E     ; Scroll to defender: Normal (+pause)
.byte $FE, $FF     ; --Wait--
.byte $07, $56     ; Effects: Interruptible Fade out (+pause)
.byte $FE, $FF     ; --Wait--
.byte $05, $04     ; Display tiles: ???
.byte $10, $00     ; Effect mask: Large Pillar
.byte $2A, $08     ; Battle Scene Mod: Shift BG Up
.byte $0B, $42     ; Load Tile: Thoron Pulse (+pause)
.byte $FE, $FF     ; --Wait--
.byte $07, $1C     ; Secondary Palette: ???
.byte $11, $1A     ; Placement/Scrolling: ???
.byte $0F, $08     ; Battle Scene Mod: Aura BG Scroll (normally, Wait: 1 frame OR Sound after this)
.byte $01, $54     ; --Wait: 1 frame--		[ST: Sound here]
.byte $FE, $FF     ; --Wait--
.byte $5B, $04     ; Display tiles: ???
.byte $49, $56     ; Effects: Change Floor Color 1 (+pause)
.byte $FE, $FF     ; --Wait-- (normally, Sound after this)
.byte $18, $2E     ; Play sound: Tornado (lower)
.byte $08, $06     ; Tile effects: Heavy Ripple (Does not move, need to animate layer) (+special horizontal split?)
.byte $4A, $16     ; Effects: Change Floor Color 2
.byte $36, $1A     ; Scrolling: Upward, slightly forward
.byte $50, $54     ; --Wait: 80 frames--
.byte $FE, $FF     ; --Wait--
.byte $FD, $FF     ; Cast1: Starts the animation loop on the caster
.byte $F9, $FF     ; Dodge point
.byte $10, $54     ; --Wait: 16 frames--
.byte $FE, $FF     ; --Wait--
.byte $FA, $FF     ; Damage point
.byte $40, $54     ; --Wait: 64 frames--
.byte $FE, $FF     ; --Wait--
.byte $4B, $56     ; Effects: Change Floor Color 3 (+pause)
.byte $FE, $FF     ; --Wait--
.byte $29, $04     ; Display tiles: ???
.byte $01, $54     ; --Wait: 1 frame--
.byte $FE, $FF     ; --Wait--
.byte $FD, $FF     ; Cast2: resting
.byte $FC, $FF     ; Reaction point
.byte $00, $06     ; Tile effects: Valkyrie something??
.byte $11, $00     ; Effect mask: ???
.byte $2B, $08     ; Battle Scene Mod: Reset BG
.byte $06, $18     ; BG Mod: ???
.byte $60, $16     ; Effects: Fade In
.byte $01, $54     ; --Wait: 1 frame--
.byte $FE, $FF     ; --Wait--
.byte $5A, $04     ; Display tiles: ???
.byte $12, $56     ; Effects: Reset (+pause)
.byte $FE, $FF     ; --Wait--
.byte $36, $08     ; END
.byte $FF, $FF     ; EXIT

.here