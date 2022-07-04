
structSpriteEntry .struct Coords, Unk, Size, Index, Prio, Pal, HFlip, VFlip
	.if type(\Coords) == type(?)
		xc := ?
		yc := ?
	.else
		xc := \Coords[0]
		yc := \Coords[1]
	.endif
	X		.byte (xc & $FF)
			.byte ((xc>>8) & 1) | \Unk & $7E | (\Size<<7)
	Y		.char yc
	Index	.byte \Index & $FF
	Attr	.byte ((\Index>>8) & 1) | ((\Pal & 7)<<1) | ((\Prio & 3)<<4) | (\HFlip<<6) | (\VFlip<<7)
	.ends

structSpriteEntryNoLabels .struct Coords, Unk, Size, Index, Prio, Pal, HFlip, VFlip
	.if type(\Coords) == type(?)
		xc := ?
		yc := ?
	.else
		xc := \Coords[0]
		yc := \Coords[1]
	.endif
	.byte (xc & $FF)
	.byte ((xc>>8) & 1) | \Unk & $7E | (\Size<<7)
	.char yc
	.byte \Index & $FF
	.byte ((\Index>>8) & 1) | ((\Pal & 7)<<1) | ((\Prio & 3)<<4) | (\HFlip<<6) | (\VFlip<<7)
	.ends

structSpriteArray .struct SpriteList
	.if type(\SpriteList) == type(?)
		; Assume all fields are holes
		SpriteCount .fill 2
		Sprites
	.else
	SpriteCount .word len(\SpriteList)
	Sprites
	.for i = 0, i < len(\SpriteList), i += 1
		.dstruct structSpriteEntryNoLabels, \SpriteList[i][0], \SpriteList[i][1], \SpriteList[i][2], \SpriteList[i][3], \SpriteList[i][4], \SpriteList[i][5], \SpriteList[i][6]
	.next
	.endif
	.ends


structNewSpriteArray .struct SpriteList
  ; size(), len() use type(gap) for fields
  .if (type(\SpriteList) == gap)
    SpriteCount .fill 2
    Sprites
  .else
    SpriteCount .word len(\SpriteList)
    Sprites .bfor i := 0, i < len(\SpriteList), i += 1
      .dstruct structNewSpriteEntry, \SpriteList[i][0], \SpriteList[i][1], \SpriteList[i][2], \SpriteList[i][3], \SpriteList[i][4], \SpriteList[i][5], \SpriteList[i][6], \SpriteList[i][7]
    .next
  .endif
.endstruct

structNewSpriteEntry .struct Coordinates, Unknown, Size, Index, Priority, Palette, HFlip, VFlip
  ; size(), len() use type(gap) for fields
  .if (type(\Coordinates) == gap)
    xc := ?
    yc := ?
  .else
    xc := \Coordinates[0]
    yc := \Coordinates[1]
  .endif
  .if (type(\VFlip) == gap)
    vf := ?
  .else
    vf := int(\VFlip)
  .endif
  .if (type(\HFlip) == gap)
    hf := ?
  .else
    hf := int(\HFlip)
  .endif
  X .word (\Size << 15) | (\Unknown << 9) | (xc & $1FF)
  Y .char yc
  Attr .word (vf << 15) | (hf << 14) | (\Priority << 12) | (\Palette << 9) | \Index
.endstruct

structPPUOAMEntry .struct
	X		.fill 1
	Y		.fill 1
	Index	.fill 1
	Attr	.fill 1
	.ends

structUnknownSpriteEntryRAM .struct
	SpriteListOffset	.word ?
	X					.word ?
	Y					.word ?
	SpriteBase			.word ?
	AttributeBase		.word ?
	SpriteListBank		.word ?
	.ends

structActiveSpriteInfo .struct Init, OnCycle, Code
	Init .word <>\Init
	OnCycle .word <>\OnCycle
	Code .word <>\Code
	.ends

OAMTileAndAttr .function TileIndex, Palette, Priority, XFlip, YFlip
	.endf TileIndex | (Palette << 9) | (Priority << 12) | (XFlip << 14) | (YFlip << 15)

NewOAMTileAndAttr .function TileIndex, Pal, Priority, XFlip, YFlip
.endfunction ((int(YFlip) << 15) | (int(XFlip) << 14) | ((Priority & $3) << 12) | ((Pal & $7) << 9) | TileIndex)

structMapSpriteAndStatusEntry .struct
	X			.word ?
	Y			.word ?
	.union
  		TileAndAttr .word ?
  		HiddenStatusFlag .word ?
	.endu
	.ends

T_Setting .function BG1, BG2, BG3, BG4, OBJ
	.endf (OBJ << 4) | (BG4 << 3) | (BG3 << 2) | (BG2 << 1) | BG1


TilemapEntry .function TileIndex, Pal, Priority, XFlip, YFlip
	.endf (YFlip << 15) | (XFlip << 14) | (Priority << 13) | ((Pal << 10) & TM_Palette) | (TileIndex & TM_TileIndex)

SpriteSmall = 0
SpriteLarge = 1

TM_VFlip     = bits(%1000000000000000)
TM_HFlip     = bits(%0100000000000000)
TM_Priority  = bits(%0010000000000000)
TM_Palette   = bits(%0001110000000000)
TM_TileIndex = bits(%0000001111111111)

Tile2bpp .struct
  .fill ((2 * 64) / 8)
.ends

Tile4bpp .struct
  .fill ((4 * 64) / 8)
.ends

Tile8bpp .struct
  .fill ((8 * 64) / 8)
.ends