#! luatex --luaonly

-- test.zip: Hello-World.txt
local z_internal_file = zip.openfile("test/Hello-world.txt")
assert(z_internal_file)
local content = z_internal_file:read("*a")
assert(content == "Hello, World!\n", content)
