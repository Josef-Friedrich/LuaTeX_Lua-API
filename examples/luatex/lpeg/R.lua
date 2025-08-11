#! luatex --luaonly
local assert = require("utils").assert

-- http://www.inf.puc-rio.br/~roberto/lpeg/
local pattern = lpeg.R("az") ^ 1 * -1
assert.equals(pattern:match("hello"), 6)
