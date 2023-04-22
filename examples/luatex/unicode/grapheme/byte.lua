#! luatex --luaonly

-- https://github.com/LuaDist/slnunicode/blob/e8abd35c5f0f5a9084442d8665cbc9c3d169b5fd/unitest#L127

-- \204\136 (CC,88 ) -> COMBINING DIAERESIS in UTF-8
local one, two = unicode.grapheme.byte('\204\136A\204\136O\204\136', 2)
-- decomposed
assert(one == 65) -- 65 = 0041; LATIN CAPITAL LETTER A
assert(two == 776) -- 776 = 0308; COMBINING DIAERESIS
