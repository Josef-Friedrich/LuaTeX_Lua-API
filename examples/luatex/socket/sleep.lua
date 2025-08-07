#! luatex --luaonly
local assert = require("utils").assert

local time = socket.gettime()
socket.sleep(1)
assert.is_true(socket.gettime() - time >= 1)
