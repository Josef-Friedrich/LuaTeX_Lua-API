#! luatex --luaonly
local assert = require("utils").assert

local time = os.gettimeofday()
assert.is_true(time > 1682153121.3217)
