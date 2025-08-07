#! luatex --luaonly
local assert = require("utils").assert

local time = os.socketgettime()
os.socketsleep(1)
assert.is_true(os.socketgettime() - time >= 1)
