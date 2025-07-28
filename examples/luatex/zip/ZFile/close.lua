#! luatex --luaonly

local z_file = zip.open("../test.zip")
assert(z_file)
local success = z_file:close()
assert(success == true, success)
