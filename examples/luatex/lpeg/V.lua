#! luatex --luaonly

-- http://www.inf.puc-rio.br/~roberto/lpeg/
local b = lpeg.P({"(" * ((1 - lpeg.S "()") + lpeg.V(1)) ^ 0 * ")"})
assert(b:match('((string))') == 11)
assert(b:match('(') == nil)
