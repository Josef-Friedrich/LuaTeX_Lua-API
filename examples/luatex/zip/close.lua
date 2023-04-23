#! luatex --luaonly

local z_file = zip.open('test.zip')
local success = zip.close(z_file)
assert(success == true)
