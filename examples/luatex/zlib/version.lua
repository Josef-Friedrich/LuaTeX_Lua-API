#! luatex --luaonly

local version = zlib.version()
assert(version == "1.2.13")
