#! luatex --luaonly
local assert = require("utils").assert

local uname = os.uname()
assert.is_type(uname.machine, "string")
assert.is_type(uname.nodename, "string")
assert.is_type(uname.release, "string")
assert.is_type(uname.sysname, "string")
assert.is_type(uname.version, "string")
