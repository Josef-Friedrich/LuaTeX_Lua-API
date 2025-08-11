#! luatex --luaonly
local assert = require("utils").assert

local pattern = lpeg.S('+-*/')
assert.equals(pattern:match("+"), 2)
assert.equals(pattern:match("-"), 2)
assert.equals(pattern:match("*"), 2)
assert.equals(pattern:match("/"), 2)
assert.is_nil(pattern:match("x"))
