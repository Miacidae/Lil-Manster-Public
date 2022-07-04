
"""
Text for error messages, descriptions, etc. for
Zane's menu text formatter.
"""

desc = """
  This tool generates a menu
  text font for use with Fire Emblem: Thracia 776.
  """

epilog = """
  This will generate five things: A binary data
  table mapping character combinations to tiles,
  two native 2bpp font images (one main image and
  a second supplementary image), an encoding definition
  file for use with the 64tass assembler,
  and the main font image as a .png for debugging.
  """

base_image_help = """
  This is a 128x368 .png image with tiles that
  are fixed within the font image and should not be
  overwritten during font generation. This is used for
  vanilla menu tiles that the game expects in order to
  build menus, but can also be used alongside the base_layout.txt
  file for any special tiles.
  """

base_layout_help = """
  This is a text file that describes individual tiles
  and characters that are fixed within the font image.
  """

font_image_help = """
  This is a .png image consisting of 4x16 pixel
  characters.
  """

font_text_help = """
  This is a UTF-8 text file containing all of the characters
  in the font image, layed out in the same configuration.
  """

text_entries_help = """
  This is a text file containing all of the menu text
  hat you wish to display.
  """

output_help = """
  This is the base of the name that will be used for output files.
  Example: .\\path\\to\\name -> .\\path\\to\\nameFont.png .\\path\\to\\nameFont.2bpp
  .\\path\\to\\nameSupplement.2bpp .\\path\\to\\nameTable.bin
  .\\path\\to\\name.asm
  """

coord_range_error = \
  "Error: Tile coordinates {0} outside of image."

convert_image_count_error = \
  "Error: Unable to convert file {0}: too many colors " \
  "for 2bpp image. Color: {1}"

base_image_size_error = \
  "Error: Wrong size for base image {0}: " \
  " got {1}, expected (128, 368)"


process_base_files_type_error = \
  "Error: Unknown type on line {0} in layout file {1}."

process_base_files_coord_error = \
  "Error: Unable to read coordinates on line {0} in layout file {1}."

process_base_files_char_error = \
  "Error: Unable to read character definition on line {0} in layout file {1}."

process_text_entries_char_error = \
  "Error: Unknown character {0} on line {1}, position {2} " \
  "in text entries."

process_text_entries_free_error = \
  "Error: Not enough space in font to " \
  "add tile(s) for bigram \"{0}\"."


