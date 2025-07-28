#! luatex --luaonly

local crc = zlib.adler32()
assert(crc == 0.0)
crc = zlib.adler32(crc, "some text")
assert(crc == 1337638330.0)
crc = zlib.adler32(crc, "some text")
assert(crc == 2768805016.0)
crc = zlib.adler32(crc, "some text")
assert(crc == 1021719064.0)
