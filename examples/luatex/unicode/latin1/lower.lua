#! luatex --luaonly

local lower = unicode.latin1.lower('A')
assert(lower == 'a')
