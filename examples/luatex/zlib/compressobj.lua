#! luatex --luaonly

local z_stream = zlib.compressobj(1)
local result = z_stream:compress('test')
assert(type(result) == 'string')
