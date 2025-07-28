#! luatex --luaonly

local upper = unicode.latin1.upper("ä")
assert(upper == "ä")
