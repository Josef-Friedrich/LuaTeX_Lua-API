local assert = require("utils").assert

local n = node.new("glyph")
node.setproperty(n, "Some properties")
assert.equals(node.get_properties_table()[n], "Some properties")

node.flush_properties_table()
assert.is_nil(node.get_properties_table()[n])
