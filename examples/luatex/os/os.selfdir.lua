#! luatex --luaonly
local assert = require("utils").assert

assert.is_type(os.selfdir, "string")
