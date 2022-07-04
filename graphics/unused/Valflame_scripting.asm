* = $0B1222
.logical lorom($0B1222, 1)

; B1222 - B12B7

.byte $3B, $08     ; BEGIN
.byte $29, $42     ; Load Tile: Valflame Lines (+pause)
.byte $FE, $FF     ; --Wait--
.byte $2A, $42     ; Load Tile: Valflame Triangle Lines -2bpp (+pause)
.byte $FE, $FF     ; --Wait--
.byte $2B, $42     ; Load Tile: Valflame Lines Tilemap (+pause)
.byte $FE, $FF     ; --Wait--
.byte $15, $1C     ; Secondary Palette: ???
.byte $2E, $42     ; Load Tile: Valflame Triangle Lines Tilemap (+pause)
.byte $FE, $FF     ; --Wait--
.byte $09, $5E     ; Scroll to Defender: Normal (+pause)
.byte $FE, $FF     ; --Wait--
.byte $68, $16     ; Effect / Palette: ???
.byte $07, $56     ; Effect: Fade Out (+pause)
.byte $FE, $FF     ; --Wait--
.byte $69, $16     ; Effect / Palette: ???
.byte $34, $04     ; Display Tiles: Black out BG
.byte $02, $1A     ; Placement: Center of Screen
.byte $2A, $08     ; Battle Scene Mod: Shift Background Up
.byte $2F, $1A     ; Placement / Scrolling: ???
.byte $28, $42     ; Load Tile: Valflame Sun (+pause)
.byte $FE, $FF     ; --Wait--
.byte $2C, $68     ; Load Tile2: Valflame Sun Tilemap 1 (+pause)
.byte $FE, $FF     ; --Wait--
.byte $2D, $2A     ; Play Sound: Silence End[--Wait--]
.byte $35, $04     ; Display Tiles: ???
.byte $4F, $16     ; Palette: Valflame Red 1
.byte $65, $56     ; Effect / Palette: ???
.byte $FE, $FF     ; --Wait--
.byte $50, $16     ; Palette: Valflame Red 2
.byte $66, $16     ; Effect / Palette: ???
.byte $30, $1A     ; Placement / Scrolling: ???
.byte $0D, $64     ; Special Triangle Masking: ??? (+pause)
.byte $FE, $FF     ; --Wait--
.byte $19, $2E     ; Play Sound: Light (lower)
.byte $36, $04     ; Display Tiles: ???
.byte $FD, $FF     ; Cast1: Starts the animation loop on the caster
.byte $0B, $24     ; Special Triangle Masking: ???
.byte $73, $54     ; --Wait: 115 frames--
.byte $F9, $FF     ; Dodge point
.byte $FE, $FF     ; --Wait--
.byte $67, $16     ; Effect / Palette: ???
.byte $51, $16     ; Palette: Valflame Red 2
.byte $14, $54     ; --Wait: 20 frames--
.byte $6A, $16     ; Effect / Palette: ???
.byte $10, $54     ; --Wait: 16 frames--
.byte $FE, $FF     ; --Wait--
.byte $FA, $FF     ; Damage point
.byte $12, $54     ; --Wait: 18 frames--
.byte $FE, $FF     ; --Wait--
.byte $57, $04     ; Display Tiles: ???
.byte $01, $54     ; --Wait: 1 frame--
.byte $FE, $FF     ; --Wait--
.byte $37, $04     ; Display Tiles: ???
.byte $B2, $56     ; Effect / Palette: ???
.byte $04, $58     ; BG Mod: Clear?? (+pause)
.byte $FE, $FF     ; --Wait--
.byte $FD, $FF     ; Cast2: resting
.byte $FC, $FF     ; Reaction point
.byte $05, $58     ; BG Mod: Clear?? (+pause)
.byte $FE, $FF     ; --Wait--
.byte $2B, $08     ; Battle Scene Mod: Reset BG
.byte $05, $4E     ; BG?: Meteor something1 (+pause)
.byte $FE, $FF     ; --Wait--
.byte $06, $4E     ; BG?: Meteor something2 (+pause)
.byte $06, $18     ; BG Mod: ???
.byte $FE, $FF     ; --Wait--
.byte $60, $16     ; Effect / Palette: Fade In
.byte $01, $54     ; --Wait: 1 frame--
.byte $FE, $FF     ; --Wait--
.byte $56, $04     ; Display Tiles: ???
.byte $12, $56     ; Effect: Reset Tile/Palette Effects
.byte $FE, $FF     ; --Wait--
.byte $36, $08     ; END
.byte $FF, $FF     ; EXIT

.here