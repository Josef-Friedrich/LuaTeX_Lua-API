local assert = require("utils").assert

local glyph1 = node.direct.new("glyph")
node.direct.setproperty(glyph1, "Properties of glyph 1")

local glyph2 = node.direct.new("glyph")
node.direct.setproperty(glyph2, "Properties of glyph 2")

assert.same(node.direct.get_properties_table(), {
  [234] = "Properties of glyph 1",
  [241] = "Properties of glyph 2",
})
