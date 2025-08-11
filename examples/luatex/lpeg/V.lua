#! luatex --luaonly
local assert = require("utils").assert

-- http://www.inf.puc-rio.br/~roberto/lpeg/
local b = lpeg.P({ "(" * ((1 - lpeg.S("()")) + lpeg.V(1)) ^ 0 * ")" })
assert.equals(b:match("((string))"), 11)
assert.equals(b:match("("), nil)
