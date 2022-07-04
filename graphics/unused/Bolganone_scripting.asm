* = $0B0DAC
.logical lorom($0B0DAC, 1)

; B0DAC - B0E19

.byte $3B, $08     ; BEGIN
.byte $0E, $42     ; Load Tile: Bolganone Ground - 2bpp (+pause)
.byte $07, $2A     ; Play Sound: Meteor Charging (lower) [--Wait--]		[.byte $07, $2A	Fire]
.byte $0F, $42     ; Load Tile: Bolganone Ground Tilemap (+pause)
.byte $FE, $FF     ; --Wait--
.byte $00, $22     ; Add Background Hue: Red
.byte $11, $16     ; Effect: Slow Fade Out
.byte $00, $1C     ; Secondary Palette: ???
.byte $0A, $54     ; --Wait: 10 frames--
.byte $FE, $FF     ; --Wait--
.byte $EA, $EA     ; Skip? [Play Sound: Bolganone Hole Open]
.byte $01, $20     ; Screen Shake: Magnitude 1
.byte $00, $5E     ; Scroll to Defender: Slowest (+pause)
.byte $FE, $FF     ; --Wait--
.byte $03, $1A     ; Placement: ???
.byte $07, $04     ; Display Tiles: ???
.byte $10, $42     ; Load Tile: Bolganone Flame (+pause)
.byte $FE, $FF     ; --Wait--
.byte $09, $00     ; Effect Mask: Create Large Ground Hole + Very Slow Expand
.byte $0B, $40     ; Effect Mask: Create “Out of a pit” mask (+pause)
.byte $FE, $FF     ; --Wait-- [Distortion] [>19 06]
.byte $11, $42     ; Load Tile: Bolganone Tilemap (+pause)
.byte $FE, $FF     ; --Wait--
.byte $FD, $FF     ; Cast1: Starts the animation loop on the caster
.byte $18, $2E     ; Play Sound: Blizzard [05>08, 2A>2E]
.byte $04, $1A     ; Placement: ???
.byte $08, $04     ; Display Tiles: Dim Display
.byte $0E, $56     ; Palette: Bolganone Red1 start (+pause)
.byte $FE, $FF     ; --Wait--
.byte $0F, $56     ; Palette: Bolganone Red2 loop (+pause)
.byte $FE, $FF     ; --Wait--
.byte $0F, $56     ; Palette: Bolganone Red2 loop (+pause)
.byte $FE, $FF     ; --Wait--
.byte $0F, $56     ; Palette: Bolganone Red2 loop (+pause)
.byte $FE, $FF     ; --Wait--
.byte $F9, $FF     ; Dodge point
.byte $0F, $56     ; Palette: Bolganone Red2 loop (+pause)
.byte $FE, $FF     ; --Wait--
.byte $FA, $FF     ; Damage point
.byte $0F, $56     ; Palette: Bolganone Red2 loop (+pause)
.byte $FE, $FF     ; --Wait--
.byte $10, $56     ; Palette: Bolganone Red3 end (+pause)
.byte $FE, $FF     ; --Wait--
.byte $FD, $FF     ; Cast2: resting
.byte $FC, $FF     ; Reaction point
.byte $09, $04     ; Display Tiles: Remove Display?
.byte $0A, $40     ; Effect Mask: Fast Contract (Large Ground Hole) (+pause)
.byte $FE, $FF     ; --Wait--
.byte $12, $56     ; Effect: Reset Tile/Palette Effects
.byte $FE, $FF     ; --Wait--
.byte $00, $20     ; Screen Shake: Stop
.byte $01, $54     ; --Wait: 1 frame--
.byte $FE, $FF     ; --Wait--
.byte $36, $08     ; END
.byte $FF, $FF     ; EXIT

.here