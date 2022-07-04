This is a rewrite of my menu text assembler script. It takes 5 inputs:

* A font image, consisting of as many 4x16 pixel 2bpp characters as you want.
* A UTF-8 encoded font definition text file, which has all of the characters in the font in the same order as the font image.
* A 128x368 pixel base image, which contains all of the fixed tiles within the font. This file also preserves vanilla menu tiles.
* A UTF-8 encoded layout text file, which defines fixed tiles (more on this in a moment).
* A UTF-8 encoded text entries file, which consists of all of the menu text that will appear in-game, excluding any special fixed-width characters.

and produces 5 outputs:

* A text encoding .asm file to be used with 64tass.
* A binary text table
* Two 2bpp images (The main font tile image and a smaller supplementary image).
* A font tile .png for easier debugging.


The layout file consists of two kinds of lines: character definitions and fixed tile definitions. Fixed tile definitions look like

`fixed (112, 32)`

and they define a single reserved tile within the font image that will not be overwritten with generated tiles. This is useful for defining tiles that are used by the game to build menus but aren't useful for typing text.

Character definitions look like

`string "{wide slash}" 0x5E81 [(104, 96), False, False, 0] [(104, 104), False, False, 0]`

Here's a breakdown of each of the parts:

`"{wide slash}"`: The text in the quotes is what you will type within your `.text` directives in 64tass.
`0x5E81`: This is the word that the string will be encoded as. You can instead set this to `auto`, which will leave the encoding up to the text assembler. For characters that already existed within the vanilla SJIS font, it might be best to have their encoding stay the same as their SJIS one.
Up next are two tile definitions, which are for the upper and lower tiles, respectively.
The tuple is the coordinates of the tile within the base image. You should be careful to only specify coordinates divisible by 8.
The next two values are the X and Y flipping flags, and can be either `True` or `False`. You can use this to generate base characters that reuse flipped tiles, such as vanilla's up and down stat arrows.
The last value is a palette index, 0-7. They are:

0: white
1: brown
2: blue
3: gray
4: not actually a text palette
5: green
6: orange
7: red

4-7 aren't always loaded, so be careful where you use them.


Some things to keep in mind:

Using double quotes (") within you menu text will probably not end well.
You should use indexed color .pngs.
The tile at (120, 40) should remain blank.
The `.padtext` macro will not work anymore, manually pad your strings with spaces. Special escape-encoded characters, like `{wide slash}` will always become one tile wide, so don't pad for those.
Name your base characters how you'd like.




