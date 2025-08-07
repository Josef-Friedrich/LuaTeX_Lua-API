#! luatex --luaonly
local assert = require("utils").assert

---@diagnostic disable-next-line
local exit, err = os.exec(1, 2, 3)
assert.is_nil(exit)
assert.equals(err, "invalid arguments passed")

os.exec("/usr/bin/uname -a")

os.exec({ "/usr/bin/uname", "-a" })
