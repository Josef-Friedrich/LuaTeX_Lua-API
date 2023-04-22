#! luatex --luaonly

local f = zip.open('test.zip')
assert(f)
assert(zip.type(f) == "zip file")
f:close()
assert(zip.type(f) == "closed zip file")
