local assert = require("utils").assert

local d = node.direct.new("glyph")
node.direct.setproperty(d, "Some properties")

assert.same(node.direct.get_properties_table(), {
  [234] = "Some properties",
})

node.direct.flush_properties_table()
assert.same(node.direct.get_properties_table(), {})
