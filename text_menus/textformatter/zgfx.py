#!/usr/bin/python3

"""
Library for editing and converting SNES image formats.
"""

from PIL import Image

class Tile:
	"""A representation of an 8x8px tile. Modes are
	either the tile's intended bits per pixel or 'rgb'.
	All modes other than 'rgb' are palette independent.
	"""

	def __init__(self, mode=4):
		self.mode = mode

		if self.mode == "rgb":
			self.data = [(0, 0, 0) for i in range(64)]
		else:
			self.data = [0 for i in range(64)]

	def __eq__(self, other):
		return (self.data == other.data) & (self.mode == other.mode)

	@staticmethod
	def from_image(image, mode=4):
		if image.size != (8, 8):
			raise ValueError("Image is not an 8x8 tile")
		t = Tile(mode)
		t.data = list(image.getdata())
		return t

	@staticmethod
	def from_data(data, bpp=4):
		if not (bpp in [2, 4, 8]):
			raise ValueError("Tiles must be 2, 4, or 8 bpp")

		if len(data) < (bpp * 8):
			raise ValueError("Not enough data to build {0}bpp tile: {1}/{2}".format(bpp, len(data), bpp * 8))

		t = Tile(bpp)

		planes = [b""] * bpp

		# 55 33 ... -> plane0 55
		#           -> plane1 33

		for p in range(0, bpp, 2):

			planes[p] = data[(p*8):(p*8)+16:2]
			planes[p+1] = data[(p*8)+1:(p*8)+16:2]

		d = [sum([((planes[p][y] >> x) & 0x01) << p for p in range(bpp)]) for y in range(8) for x in range(7, -1, -1)]

		t.data = d

		return t

	def to_data(self):

		if self.mode == "rgb":
			raise ValueError("Tile must be converted to an indexed image")

		bpp = self.mode

		# Represent bitplanes as strings of 0s and 1s
		# because it's easy to separate them into bytes later

		planes = [""] * bpp

		for i in range(0, 64, 8):
			row = self.data[i:i+8]
			for pixel in row:
				for plane in range(bpp):
					planes[plane] = "".join([planes[plane], str((pixel >> plane) & 0x01)])

		d = bytearray()

		# Create bytes from planes

		# plane0 '01010101'... -> 55 -> 55 33
		# plane1 '00110011'... -> 33 -^

		for p in range(0, bpp, 2):
			for i in range(0, 64, 8):
				d += (int(planes[p][i:i+8], 2)).to_bytes(1, "little")
				d += (int(planes[p+1][i:i+8], 2)).to_bytes(1, "little")

		return d

	def to_image(self, palette=None, palindex=0, xflip=False, yflip=False):

		# Convert raw list of color indices to rows for
		# convenience when flipping

		rows = [list(self.data)[n:n+8] for n in range(0, 64, 8)]

		if xflip:
			for row in rows:
				row.reverse()

		if yflip:
			rows.reverse()

		# Flatten rows back out

		d = [p for row in rows for p in row]

		if (palette is not None) & (self.mode != "rgb"): # Indexed image

			if palindex != 0:
				bpp = self.mode
				d = [i + (palindex*(2**bpp)) for i in d]

			image = Image.frombytes("P", (8, 8), bytes(d))

			# Might need to separate multiple subpalettes from
			# a larger palette

			if isinstance(palette, list):
				palette = [c for subpal in palette for c in subpal.to_list()]

			else:
				palette = palette.to_list()

			image.putpalette(palette)

		else: # Assume nonindexed image

			image = Image.new("RGBA", (8, 8), (255, 255, 255, 0))
			image.putdata(d)

		return image


class Palette:
	"""A group of Color objects."""

	def __init__(self, mode=4):
		self.mode = mode
		self.current = 0

		# If not from an indexed image, cap at max SNES can handle

		if self.mode == "rgb":
			self.palette = [Color() for n in range(256)]
		else:
			self.palette = [Color() for n in range(2 ** self.mode)]

	def __eq__(self):
		return (self.palette == other.palette)

	def __iter__(self):
		return self

	def __next__(self):
		try:
			result = self.palette[self.current]
		except IndexError:
			self.current = 0
			raise StopIteration
		self.current += 1
		return result

	def __getitem__(self, i):
		return self.palette[i]

	def __setitem__(self, i, c):
		self.palette[i] = c

	def __len__(self):
		return len(self.palette)

	def to_data(self):
		"""Convert the palette into a native SNES format."""
		return bytearray([b for c in self.palette for b in c.to_data()])

	def to_list(self):
		"""Convert the palette into a PIL palette list."""
		return [b for c in self.palette for b in c.to_rgb()]

	@staticmethod
	def from_data(data, mode=4):
		"""Generate a palette from native SNES data."""
		p = Palette(mode)
		count = 2 ** mode
		p.palette = [Color.from_data(data[i:i+2]) for i in range(0, count*2, 2)]
		return p

	@staticmethod
	def from_list(l, mode=4):
		"""Generate a palette from a PIL palette list."""
		p = Palette(mode)
		p.palette = [Color.from_rgb((l[i], l[i+1], l[i+2])) for i in range(0, count*3, 3)]
		return p


class Color:
	"""Represents a rgb555 color."""

	def __init__(self, color=0):
		self.color = color & 0x7FFF

	def __eq__(self, other):
		return (self.color == other.color)

	def __str__(self):
		return str(self.to_rgb())

	@property
	def r(self):
		return (self.color & 0x1F) << 3

	@property
	def b(self):
		return (self.color // 1024) << 3

	@property
	def g(self):
		return ((self.color // 32) & 0x1F) << 3

	def to_data(self):
		return int.to_bytes(self.color, 2, byteorder="little")

	def to_rgb(self):
		return (self.r, self.g, self.b)

	def to_hex(self):
		return "#{0:02X}{1:02X}{2:02X}".format(self.r, self.g, self.b)

	@staticmethod
	def from_data(data):
		return Color(int.from_bytes(data[0:2], byteorder="little"))

	@staticmethod
	def from_rgb(tup):
		r = (tup[0]>>3)
		g = (tup[1]>>3)<<5
		b = (tup[2]>>3)<<10
		return Color(r | g | b)
