#! luatex --luaonly

local orig = [[
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
sed diam voluptua.
]]
assert(string.len(zlib.compress(orig)) < string.len(orig))
