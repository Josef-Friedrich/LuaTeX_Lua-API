#! luatex --luaonly

local z_file = zip.open('../test.zip')
assert(z_file)
local z_internal_file, err = z_file:open('Hello-world.txt')
assert(z_internal_file)
local content = z_internal_file:read('*a')
assert(content == 'Hello, World!\n', content)
