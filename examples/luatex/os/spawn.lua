#! luatex --luaonly

---@diagnostic disable-next-line
local exit, err = os.spawn(1, 2, 3)
assert(exit == nil)
assert(err == "invalid arguments passed")

os.spawn("/usr/bin/uname -a")

os.spawn({ "/usr/bin/uname", "-a" })
