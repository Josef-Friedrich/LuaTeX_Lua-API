#! luatex --luaonly

local f = zip.openfile('test.zip')
assert(zip.type(f) == "zip file")
