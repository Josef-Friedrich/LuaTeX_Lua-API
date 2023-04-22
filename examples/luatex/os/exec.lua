#! luatex --luaonly

---@diagnostic disable-next-line
local exit, err = os.exec(1, 2, 3)
assert(exit == nil)
assert(err == 'invalid arguments passed')

os.exec('/usr/bin/uname -a')

os.exec({'/usr/bin/uname', '-a'})
