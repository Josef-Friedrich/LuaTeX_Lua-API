#! luatex --luaonly

local upper = unicode.ascii.upper('ä')
assert(upper == 'ä')
