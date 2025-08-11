#! luatex --luaonly
local assert = require("utils").assert

assert.equals(lpeg.version(), "1.0.1")
