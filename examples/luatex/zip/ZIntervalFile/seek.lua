#! luatex --luaonly

local z_file = zip.open('../test.zip')
assert(z_file)
local z_internal_file, err = z_file:open('Hello-world.txt')
assert(z_internal_file)

local size = z_internal_file:seek('end')
assert(size == 14, size)

local offset = z_internal_file:seek('set', 7)
assert(offset == 7)

local cur = z_internal_file:seek('cur')
assert(cur == 7)
