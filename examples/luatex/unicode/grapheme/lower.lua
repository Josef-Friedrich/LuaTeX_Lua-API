#! luatex --luaonly

local lower = unicode.grapheme.lower("Ä")
assert(lower == "ä")
