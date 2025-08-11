local assert = require("utils").assert

local glyph1 = node.new("glyph")
node.setproperty(glyph1, "Properties of glyph 1")

local glyph2 = node.new("glyph")
node.setproperty(glyph2, "Properties of glyph 2")

assert.equals(node.get_properties_table()[glyph1], "Properties of glyph 1")
assert.equals(node.get_properties_table()[glyph2], "Properties of glyph 2")
