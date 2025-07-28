#! luatex --luaonly

-- https://github.com/LuaDist/slnunicode/blob/e8abd35c5f0f5a9084442d8665cbc9c3d169b5fd/unitest#L123

local one, two = unicode.latin1.byte("Ä°Ö", 3, 4)
-- the UTF-8 seq for °
assert(one == 194)
assert(two == 176)
