#! luatex --luaonly

local lower = unicode.ascii.lower("Ä")
assert(lower == "Ä")
