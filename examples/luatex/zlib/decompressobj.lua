#! luatex --luaonly

local z_stream_com = zlib.compressobj(1)
local compressed = z_stream_com:compress("test")
compressed = compressed .. z_stream_com:flush()

local z_stream_decomp = zlib.decompressobj()
local result = z_stream_decomp:decompress(compressed)
assert(result == "test")
