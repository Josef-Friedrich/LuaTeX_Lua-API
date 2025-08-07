#! luatex --luaonly
local assert = require("utils").assert

---@diagnostic disable-next-line
local exit, err = os.spawn(1, 2, 3)
assert.is_nil(exit)
assert.equals(err, "invalid arguments passed")

os.spawn("/usr/bin/uname -a")
os.spawn({ "/usr/bin/uname", "-a" })
