
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



NewOAMTileAndAttr .function TileIndex, Pal, Priority, XFlip, YFlip
.endfunction ((int(YFlip) << 15) | (int(XFlip) << 14) | ((Priority & $3) << 12) | ((Pal & $7) << 9) | TileIndex)
