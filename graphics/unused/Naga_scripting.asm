* = $0B17C6
.logical lorom($0B17C6, 1)

; B17C6 - B185B
; No item is attributed this animation by default.

; To use this animation, you will need to edit tables\MagicAnimations.asm.
; Give your item 20 at long and close range.

.byte $3B, $08		; BEGIN
.byte $65, $42		; Load Tiles: Naga BG Shine (+pause)
.byte $FE, $FF		; --Wait--
.byte $67, $42		; Load Tiles: Naga Small Square? (+pause)     
.byte $FE, $FF		; --Wait--
.byte $68, $42		; Load Tiles: Naga BG Shine Tilemap (+pause)     
.byte $FE, $FF		; --Wait--
.byte $6A, $42		; Load Tiles: Naga Small Square? Tilemap?? (+pause)     
.byte $FE, $FF		; --Wait--
.byte $09, $5E		; Scroll to Defender: Normal (+pause)
.byte $FE, $FF		; --Wait--
.byte $4D, $16		; Palette: ???				[Naga gold]
.byte $07, $56		; Effect: Fade Out 1 (+pause)
.byte $FE, $FF		; --Wait--
.byte $2E, $04		; Display Tiles: ???
.byte $66, $42		; Load Tiles: Naga Dragon (+pause)     
.byte $FE, $FF		; --Wait--
.byte $0D, $1C		; Secondary Palette: ??? [Gold Palette Expanding Middle Circle]
.byte $2A, $08		; Battle Scene Mod: Shift BG Up
.byte $69, $42		; Load Tiles: Naga Dragon Tilemap (+pause)     
.byte $FE, $FF		; --Wait--
.byte $49, $1A		; Placement / Scrolling: ???
.byte $34, $1A		; Placement / Scrolling: ???
.byte $44, $04		; Display Tiles: ???
.byte $39, $08		; Battle Scene Mod: Naga Fade In + HUD Fade In
.byte $01, $54		; --Wait: 1 frame--
.byte $FE, $FF		; --Wait--
.byte $09, $2C		; Play Sound (low): Thunder Rumble 09
.byte $35, $1A		; Scrolling: Restore Staff
.byte $70, $56		; Effect: Naga Dragon Fade In (+pause)
.byte $FE, $FF		; --Wait--
.byte $23, $00		; Effect Mask: Delete [FE4: Naga blast]
.byte $07, $2A		; Play Sound: Meteor Charging 07 [Wait: 1 frame]
.byte $4B, $54		; --Wait: 75 frames--
.byte $FE, $FF		; --Wait--
.byte $74, $16		; Palette: Naga Brightness
.byte $FE, $FF		; --Wait--
.byte $45, $04		; Display Tiles: ???
.byte $25, $00		; Effect Mask: Slow Expand (pixel-wide to max)
.byte $3C, $54		; --Wait: 60 frames--
.byte $FE, $FF		; --Wait--
.byte $35, $08		; Battle Scene Mod: ???
.byte $14, $54		; --Wait: 20 frames--
.byte $FE, $FF		; --Wait--
.byte $F9, $FF		; Dodge point
.byte $10, $54		; --Wait: 16 frames--
.byte $FE, $FF		; --Wait--
.byte $FA, $FF		; Damage point
.byte $FD, $FF		; Cast1: Starts the animation loop on the caster
.byte $20, $54		; --Wait: 32 frames--
.byte $FE, $FF		; --Wait--
.byte $FD, $FF		; Cast2: resting
.byte $FC, $FF		; Reaction point
.byte $20, $54		; --Wait: 32 frames--
.byte $FE, $FF		; --Wait--
.byte $72, $16		; Palette: ???
.byte $FE, $FF		; --Wait--
.byte $2F, $04		; Display Tiles: ???
.byte $2B, $08		; Battle Scene Mod: Reset BG
.byte $04, $58		; BG Mod: ??? (+pause)
.byte $FE, $FF		; --Wait--
.byte $05, $58		; BG Mod: ??? (+pause)
.byte $FE, $FF		; --Wait--
.byte $05, $0E		; BG?: Meteor Something 1
.byte $06, $4E		; BG?: Meteor Something 2 (+pause)
.byte $06, $18		; BG Mod: ???
.byte $FE, $FF		; --Wait--
.byte $73, $16		; Palette: ???
.byte $01, $54		; --Wait: 1 frame--
.byte $FE, $FF		; --Wait--
.byte $46, $04		; Display Tiles: ???
.byte $12, $56		; Effect: Reset Tile/Palette Effects (+pause)
.byte $FE, $FF		; --Wait--
.byte $36, $08		; END
.byte $FF, $FF		; EXIT

.here