#! luatex --luaonly

local adler = zlib.adler32()
assert(adler == 1.0)
adler = zlib.adler32(adler, 'some text')
assert(adler == 300417946.0)
adler = zlib.adler32(adler, 'some text')
assert(adler == 1144063795.0)
adler = zlib.adler32(adler, 'some text')
assert(adler == 2530937548.0)
