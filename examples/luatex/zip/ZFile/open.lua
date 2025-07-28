#! luatex --luaonly

local z_file = zip.open("test.zip")
assert(z_file)
local _, err = z_file:open("xxx.xxx")
assert(err == "could not open file `xxx.xxx'")

local z_internal_file, err = z_file:open("Hello-world.txt")
assert(z_internal_file)
assert(err == nil)
