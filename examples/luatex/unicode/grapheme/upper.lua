#! luatex --luaonly

local upper = unicode.grapheme.upper("ä")
assert(upper == "Ä")
