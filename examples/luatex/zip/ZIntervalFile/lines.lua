#! luatex --luaonly

local z_file = zip.open("../test.zip")
assert(z_file)
local z_internal_file, err = z_file:open("Hello-world.txt")
assert(z_internal_file)
for line in z_internal_file:lines() do
  assert(line == "Hello, World!")
end
