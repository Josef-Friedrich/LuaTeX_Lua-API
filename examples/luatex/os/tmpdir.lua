#! luatex --luaonly
local assert = require("utils").assert

lfs.chdir("/tmp")
local dir, err = os.tmpdir()
assert.is_type(dir, "string")
assert.is_true(lfs.isdir("/tmp/" .. dir))

dir, err = os.tmpdir("tmp.XXXXXX")
assert.is_type(dir, "string")
assert.is_true(lfs.isdir("/tmp/" .. dir))

dir, err = os.tmpdir("tmp.X")
assert.is_nil(dir)
assert.equals(err, "Invalid argument to os.tmpdir()")

dir, err = os.tmpdir("tmp.XXXXXXX_suffix")
assert.is_nil(dir)
assert.equals(err, "Invalid argument to os.tmpdir()")
