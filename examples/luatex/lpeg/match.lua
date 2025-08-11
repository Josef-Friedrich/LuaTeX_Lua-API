#! luatex --luaonly
local assert = require("utils").assert

-- http://www.inf.puc-rio.br/~roberto/lpeg/

local pattern = lpeg.R("az") ^ 1 * -1
assert(pattern:match("hello") == 6)
assert(lpeg.match(pattern, "hello") == 6)
assert(pattern:match("1 hello") == nil)
