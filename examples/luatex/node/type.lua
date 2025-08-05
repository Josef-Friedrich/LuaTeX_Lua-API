local assert = require("utils").assert

assert.equals(node.type(29), "glyph")
assert.equals(node.type(node.id("glyph")), "glyph")
assert.is_nil(node.type("xxx"))
