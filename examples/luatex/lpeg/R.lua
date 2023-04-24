#! luatex --luaonly

-- http://www.inf.puc-rio.br/~roberto/lpeg/
local pattern = lpeg.R("az") ^ 1 * -1
assert(pattern:match("hello") == 6)
