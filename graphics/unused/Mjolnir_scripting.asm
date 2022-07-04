* = $0B140E
.logical lorom($0B140E, 1)

; B140E - B147D

.byte $3B, $08     ; BEGIN
.byte $4E, $42     ; Load Tiles: Mjölnir Bolts Tilemap (+pause)
.byte $FE, $FF     ; --Wait--
.byte $4D, $42     ; Load Tiles: Mjölnir Static Tilemap (+pause)
.byte $FE, $FF     ; --Wait--
.byte $4B, $42     ; Load Tiles: Mjölnir Static (+pause) [4B>10] ok
.byte $FE, $FF     ; --Wait--
.byte $09, $1C     ; Secondary Palette: ???
.byte $4C, $42     ; Load Tiles: Mjölnir Bolts - 2bpp (+pause)
.byte $FE, $FF     ; --Wait--
.byte $09, $5E     ; Scroll to Defender: Normal (+pause)
.byte $FE, $FF     ; --Wait--
.byte $82, $16     ; Effect / Palette: ???
.byte $01, $22     ; Add Background Hue: Light Blue
.byte $02, $1A     ; Placement: Center of Screen
.byte $14, $06     ; Tile Effect: Mjölnir Orb
.byte $13, $56     ; Effect: Fade Out 2 (+pause)
.byte $FE, $FF     ; --Wait--
.byte $0B, $2A     ; Play Sound: Dire/Bolting Start [0F>0B]
.byte $3E, $1A     ; Placement / Scrolling: ??? 
.byte $16, $40     ; Effect Mask: Create Orb Hole + Slow Expand (+pause)
.byte $FE, $FF     ; --Wait--
.byte $4B, $04     ; Display Tiles: Mjölnir Whooshy BG
.byte $07, $56     ; Effect / Palette: Fade out 1 (+pause) [83>07]
.byte $EA, $EA     ; Skip? [--Wait--]
.byte $18, $2A     ; Play Sound: Blizzard?? [11>18]
.byte $FD, $FF     ; Cast1: Starts the animation loop on the caster
.byte $F9, $FF     ; Dodge point
.byte $84, $16     ; Effect / Palette: ???
.byte $4C, $04     ; Display Tiles: Mjölnir Shock
.byte $3D, $1A     ; Placement: Center of Screen 2
.byte $10, $54     ; --Wait: 16 frames--
.byte $FE, $FF     ; --Wait--
.byte $FA, $FF     ; Damage point
.byte $AC, $54     ; --Wait: 172 frames-- [78>AC]
.byte $FE, $FF     ; --Wait--
.byte $0B, $2A     ; Play Sound: Dire/Bolting Start [10>0B]
.byte $4D, $04     ; Display Tiles: Mjölnir Thing???
.byte $85, $16     ; Effect / Palette: ???
.byte $17, $00     ; Effect Mask: Fast Contract (any to pixel-wide)
.byte $20, $54     ; --Wait: 32 frames--
.byte $FE, $FF     ; --Wait--
.byte $62, $04     ; Clear Tiles?
.byte $18, $00     ; Effect Mask: Delete (Hole)
.byte $01, $06     ; Tile Effect: ???
.byte $82, $16     ; Effect / Palette: ???
.byte $01, $54     ; --Wait: 1 frame--
.byte $FE, $FF     ; --Wait--
.byte $FD, $FF     ; Cast2: resting
.byte $FC, $FF     ; Reaction point
.byte $00, $06     ; Tile Effect: Stop
.byte $1F, $1A     ; Placement: ???
.byte $12, $56     ; Effect: Reset Tile/Palette Effects (+pause)
.byte $FE, $FF     ; --Wait--
.byte $36, $08     ; END
.byte $FF, $FF     ; EXIT


.here