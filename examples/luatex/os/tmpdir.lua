#! luatex --luaonly

lfs.chdir("/tmp")
local dir, err = os.tmpdir()
assert(type(dir) == "string")
assert(lfs.isdir("/tmp/" .. dir))

dir, err = os.tmpdir("tmp.XXXXXX")
assert(type(dir) == "string")
assert(lfs.isdir("/tmp/" .. dir))

dir, err = os.tmpdir("tmp.X")
assert(dir == nil)
assert(err == "Invalid argument to os.tmpdir()", err)

dir, err = os.tmpdir("tmp.XXXXXXX_suffix")
assert(dir == nil)
assert(err == "Invalid argument to os.tmpdir()", err)
