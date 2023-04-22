#! luatex --luaonly

local f = zip.open('test.zip')
assert(f)
local _, err = f:open('xxx.xxx')
assert(err == 'could not open file `xxx.xxx\'')

local ff, err = f:open('Hello-world.txt')
assert(ff)
assert(err == nil)
