#! luatex --luaonly

local z_file = zip.open('test.zip')
assert(z_file)
assert(zip.type(z_file) == "zip file")
z_file:close()
assert(zip.type(z_file) == "closed zip file")
