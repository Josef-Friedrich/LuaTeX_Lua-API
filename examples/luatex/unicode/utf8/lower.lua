#! luatex --luaonly

local lower = unicode.utf8.lower('Ä')
assert(lower == 'ä')
