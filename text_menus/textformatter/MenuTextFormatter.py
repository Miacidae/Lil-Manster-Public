#!/usr/bin/python3


import re
import sys
import argparse
import os.path

from itertools import product
from PIL import Image

from zgfx import Palette, Tile
import prog_text as pt


NOT_FOUND = -1 # For str.find results


def error(text):
  print(text)
  sys.exit(-1)


def s2b(string):
  """String -> bool"""
  if string.lower() == "true":
    return True
  return False


def c2i(coordinates, image=None):
  """Coordinates -> index"""
  x, y = coordinates[0] // 8, coordinates[1] // 8
  w, h = (image.width // 8, image.height // 8) if image else (16, 46)
  if (x >= w) or (y >= h):
    error(pt.coord_range_error.format(coordinates))
  return x + (y * w)


def i2c(index, image, size=(8, 8)):
  """Index -> coordinates"""
  e_w, e_h = size
  w, h = (image.width // e_w, image.height // e_h)
  x, y = index % w, index // w
  if index >= (w * h):
    error(pt.coord_range_error.format((x, y)))
  return (x * e_w, y * e_h)


def readcoord(text):
  """Tries to find a coordinate tuple in a string."""
  s = re.search(r"(\s*(?P<x>[0-9]+)\s*,\s*(?P<y>[0-9]+)\s*)", text)
  if s:
    return (int(s.group("x")), int(s.group("y")))


def strip_text(text):
  """Removes comments and trailing whitespace"""
  text = text.rstrip()
  if (comment_pos := text.find("//")) != NOT_FOUND:
    text = text[:comment_pos]
  return text


def convert_image(image, color_zero_coords=(120, 40)):
  _colors = [image.getpixel((color_zero_coords))]
  for (y, x) in product(range(image.height), range(image.width)):

    if not (_c := image.getpixel((x, y))) in _colors:
      _colors.append(_c)
      if len(_colors) > 4:
        error(pt.convert_image_count_error.format(image.filename, _c))

  if (_l := len(_colors)) < 4:
    _colors.extend([_colors[0] for c in range(4 - _l)])

  _new = Image.new("P", image.size, _colors[0])
  _new.putpalette([b for c in _colors for b in c])
  for (y, x) in product(range(image.height), range(image.width)):
    _new.putpixel((x, y), _colors.index(image.getpixel((x, y))))

  return _new


def get_next_char_id(i, characters):
  i += 1
  while i in characters.keys():
    i += 1
  return i

# Regexes broken up for sanity

p_flag = r"(True|False)"
p_num = r"[0-9]"
p_hex = r"[0-9a-fA-F]"

p_highcoord = r"\s*".join([r"\(", r"(?P<highx>"+p_num+r"+)", ",", r"(?P<highy>"+p_num+r"+)", r"\)"])
p_lowcoord = r"\s*".join([r"\(", r"(?P<lowx>"+p_num+r"+)", ",", r"(?P<lowy>"+p_num+r"+)", r"\)"])

p_hightile = r"\s*".join([r"\[", p_highcoord, ",", r"(?P<highxflip>"+p_flag+r")", ",", r"(?P<highyflip>"+p_flag+r")", ",", r"(?P<highpal>"+p_num+r")", r"\]"])
p_lowtile = r"\s*".join([r"\[", p_lowcoord, ",", r"(?P<lowxflip>"+p_flag+r")", ",", r"(?P<lowyflip>"+p_flag+r")", ",", r"(?P<lowpal>"+p_num+r")", r"\]"])

p_layout_type = r"(?P<type>(value|string|fixed))"
p_value = r"0x" + p_hex + r"{4}"
p_string = r"(?P<string>((?P<quote>['\"])[^\"]+(?P=quote))|value)"
p_enc = r"(?P<enc>(" + p_value + r"|auto))"

p_fixed_template = r"\s*".join([p_layout_type, p_lowcoord])
p_char_template = r"\s*".join([p_layout_type, p_string, p_enc, p_hightile, p_lowtile])

def process_base_files(base_image, base_layout, layout_fname):
  """
  Given a base image and layout text describing
  fixed tiles within the font, generate preliminary
  character definitions and used tiles.
  """

  if base_image.size != (128, 368):
    error(pt.base_image_size_error.format(base_image.filename, base_image.size))

  used = [None for (y, x) in product(range(0, 368, 8), range(0, 128, 8))]

  characters = {}
  char_index = 0

  # We make a temporary set of characters first
  # so that we can find all value definitions
  temp_chars = {}

  for linenum, line in enumerate(base_layout, 1):

    if (line := strip_text(line)):

      s = re.match(p_layout_type, line)

      if not s:
        error(pt.process_base_files_type_error.format(linenum, layout_fname))

      line_type = s.group("type")

      if line_type == "fixed":

        s = re.search(p_fixed_template, line)

        if not s:
          error(pt.process_base_files_coord_error.format(linenum, layout_fname))

        tiles = [[(int(s.group("lowx")), int(s.group("lowy"))), False, False]]

      # String types
      else:
        s = re.search(p_char_template, line)

        if not s:
          error(pt.process_base_files_char_error.format(linenum, layout_fname))

        highcoords = (int(s.group("highx")), int(s.group("highy")))
        lowcoords = (int(s.group("lowx")), int(s.group("lowy")))

        highxflip, highyflip = s.group("highxflip"), s.group("highyflip")
        lowxflip, lowyflip = s.group("lowxflip"), s.group("lowyflip")

        highpal, lowpal = int(s.group("highpal")), int(s.group("lowpal"))

        # Fixed value but not a normal string
        if (s.group("string") == "value") and (s.group("enc") != "auto"):
          characters[int(s.group("enc"), 16)] = [s.group("enc"), [highcoords, s2b(highxflip), s2b(highyflip), highpal], [lowcoords, s2b(lowxflip), s2b(lowyflip), lowpal]]

        # Fixed value, normal string
        elif (s.group("string") != "value") and (s.group("enc") != "auto"):
          characters[int(s.group("enc"), 16)] = [s.group("string"), [highcoords, s2b(highxflip), s2b(highyflip), highpal], [lowcoords, s2b(lowxflip), s2b(lowyflip), lowpal]]

        # Auto value, normal string
        elif (s.group("enc") == "auto"):
          temp_chars[s.group("string")] = [[highcoords, s2b(highxflip), s2b(highyflip), highpal], [lowcoords, s2b(lowxflip), s2b(lowyflip), lowpal]]

        # Fixed value marker with auto
        # encoding isn't valid.

        else:
          error(pt.process_base_files_char_error.format(linenum, layout_fname))

        tiles = [[highcoords, s2b(highxflip), s2b(highyflip)], [lowcoords, s2b(lowxflip), s2b(lowyflip)]]

      # Instead of just marking which tiles in
      # the font are already used, cache the tile
      # and its flipped states to check against later.

      for tile in tiles:
        coords, _, _ = tile

        if not used[c2i(coords, base_image)]:

          x1, y1 = coords
          x2, y2 = x1+8, y1+8

          t = base_image.crop((x1, y1, x2, y2))
          flips = [Image.FLIP_LEFT_RIGHT, Image.FLIP_TOP_BOTTOM, Image.ROTATE_180]

          dirs = [t] + [t.transpose(flip) for flip in flips]
          dirs = [Tile.from_image(t).to_data() for t in dirs]

          used[c2i(coords, base_image)] = dirs

  # Process all temp characters now that we
  # know all of the value definitions.

  for string, info in temp_chars.items():
    enc = char_index = get_next_char_id(char_index, characters)
    characters[enc] = [string, *info]

  return used, characters, char_index


def get_bigrams(string, bigrams):
  string = strip_text(string)
  if len(string) % 2: string = string + " "
  for i in range(0, len(string), 2):
    bigram = string[i:i+2]
    c = bigrams.get(bigram, 0)
    bigrams[bigram] = c + 1
  return bigrams


def process_text_entries(base_image, font_image, font_text, text_entries,
                         used, characters, char_index):

  # Clear newlines from font text
  font_text = "".join([c for c in font_text if c != "\n"])

  # {bigram:count, ...} to order table
  # by frequency.
  bigrams = {}
  for line in text_entries:
    bigrams = get_bigrams(line, bigrams)

#  s = sorted([(s, f) for s, f in bigrams.items()], key=lambda t: t[1], reverse=True)
#  bigrams = [t[0] for t in s]
  bigrams = bigrams.keys()

  # Make a list of all encoding def strings
  # so we don't duplicate any.

  encoded = [v[0].strip('"') for v in characters.values()]

  for bigram in bigrams:

    if bigram in encoded: continue

    char_im = Image.new("P", (8, 16))
    char_im.putpalette(base_image.getpalette())

    for i, c in enumerate(bigram):

      try:
        c_x, c_y = i2c(font_text.index(c), font_image, (4, 16))

      except ValueError:
        for l, line in enumerate(text_entries, 1):
          if (p := line.find(c)) != NOT_FOUND:
            error(pt.process_text_entries_char_error.format(c, l, p+1))

      char_im.paste(font_image.crop((c_x, c_y, c_x+4, c_y+16)), (i*4, 0, (i*4)+4, 16))

    upper_im, lower_im = char_im.crop((0, 0, 8, 8)), char_im.crop((0, 8, 8, 16))

    tiles = []
    for tile in [upper_im, lower_im]:

      t = Tile.from_image(tile).to_data()

      # Check if we already have a tile
      # that is identical.

      found = False
      for i, u in enumerate(used):
        if found: break
        if not u: continue
        for d, direction in enumerate(u):
          if t == direction:
            found = True
            break

      if found:
        i -= 1
        flags = [(False, False), (True, False), (False, True), (True, True)]
        xflip, yflip = flags[d]

      else:

        # Add the tile to the used tiles
        # and base image

        # Get the earliest unused tile index.
        # Track if we reach the end without finding
        # a free tile.

        free = False
        for i, u in enumerate(used):
          if not u:
            free = True
            break

        if not free:
          error(pt.process_text_entries_free_error.format(bigram))

        flips = [Image.FLIP_LEFT_RIGHT, Image.FLIP_TOP_BOTTOM, Image.ROTATE_180]

        dirs = [tile] + [tile.transpose(flip) for flip in flips]
        dirs = [Tile.from_image(tile).to_data() for tile in dirs]

        used[i] = dirs

        base_image.paste(tile, i2c(i, base_image))

        # New tiles are not flipped when added to the image.
        xflip, yflip = False, False

      tiles.append([i2c(i, base_image), xflip, yflip, 0])

    # Add to character set

    bigram = '"' + bigram.replace("\"", "\\\"") + '"'

    char_index = get_next_char_id(char_index, characters)
    characters[char_index] = [bigram, *tiles]

  return used, characters, base_image


def image2data(image):
  d = bytearray()
  for (y, x) in product(range(0, image.height, 8),
                        range(0, image.width, 8)):
    t = Tile.from_image(image.crop((x, y, x+8, y+8)), 2)
    d.extend(t.to_data())
  return d


if __name__ == "__main__":

  parser = argparse.ArgumentParser(description=pt.desc, epilog=pt.epilog)
  parser.add_argument("base_image", metavar="base_image.png", help=pt.base_image_help)
  parser.add_argument("base_layout", metavar="base_layout.txt", help=pt.base_layout_help)
  parser.add_argument("font_image", metavar="font_image.png", help=pt.font_image_help)
  parser.add_argument("font_text", metavar="font_text.txt", help=pt.font_text_help)
  parser.add_argument("text_entries", metavar="text_entries.txt", help=pt.text_entries_help)
  parser.add_argument("output", help=pt.output_help)

  args = parser.parse_args()

  out_dir, out_name = os.path.split(args.output)

  # Generate an initial set of characters from
  # fixed tiles.

  base_image = Image.open(args.base_image)
  if base_image.mode != "P":
    base_image = convert_image(base_image, (120, 40))

  with open(args.base_layout, "r", encoding="UTF-8") as i:
    base_layout = i.readlines()

  used, characters, char_index = process_base_files(base_image, base_layout, args.base_layout)

  # Generate tiles based on menu text.

  font_image = Image.open(args.font_image)

  with open(args.font_text, "r", encoding="UTF-8") as i:
    font_text = i.read()

  with open(args.text_entries, "r", encoding="UTF-8") as i:
    text_entries = i.read().splitlines()

  used, characters, tiles_image = process_text_entries(base_image, font_image, font_text, text_entries,
                                                       used, characters, char_index)

  # Turn the set of characters into the
  # table and encoding definition files

  encoding = [f'.enc "{out_name}"\n','.edef "\\n", [$00, $00]\n']
  table = bytearray()
  for enc, [string, upper, lower] in characters.items():

    if string != "value":
      encoding.append(f".edef {string}, [${enc&0xFF:02X}, ${(enc>>8)&0xFF:02X}]\n")

    entry = [enc]
    for t in [upper, lower]:
      coords, xflip, yflip, pal = t
      index = c2i(coords, base_image)
      if xflip: index |= 0x4000
      if yflip: index |= 0x8000
      index |= (pal << 10)
      entry.append(index)

    entry = b"".join([i.to_bytes(2, "little") for i in entry])

    table.extend(entry)

  with open(os.path.join(out_dir, out_name+".asm"), "w", encoding="UTF-8") as o:
    o.writelines(encoding)

  with open(os.path.join(out_dir, out_name+"Table.bin"), "wb") as o:
    values = [table[i:i+6] for i in range(0, len(table), 6)]
    values.sort(key=lambda x: x[0] + (x[1] * 256))
    o.write(bytes().join(values))

  with open(os.path.join(out_dir, out_name+"Offsets.bin"), "wb") as o:
    counts = [0] * 257
    for i in range(len(table) // 6):
      counts[values[i][1] + 1] += 1
    for i in range(1, 257):
      counts[i] += counts[i - 1]
    offsets = bytes().join(map(lambda c: c.to_bytes(2, "little"), counts))
    o.write(offsets)



  tiles_image.save(os.path.join(out_dir, out_name+"Font.png"))

  tiles_data = image2data(tiles_image)

  with open(os.path.join(out_dir, out_name+"Font.2bpp"), "wb") as o:
    o.write(tiles_data)

  with open(os.path.join(out_dir, out_name+"Supplement.2bpp"), "wb") as o:
    o.write(tiles_data[0x2800:])

