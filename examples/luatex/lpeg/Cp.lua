#! luatex --luaonly

-- http://www.inf.puc-rio.br/~roberto/lpeg/

local I = lpeg.Cp()
local function anywhere(p) return lpeg.P({I * p * I + 1 * lpeg.V(1)}) end
local match_start, match_end = anywhere("world"):match("hello world!")
assert(match_start == 7)
assert(match_end == 12)
