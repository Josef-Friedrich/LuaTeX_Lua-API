#! luatex --luaonly

local upper = unicode.utf8.upper('ä')
assert(upper == 'Ä')
