local assert = require("utils").assert

local n = node.new("glyph") --[[@as GlyphNode]]
n.char = 123
assert.equals(node.getfield(n, "char"), 123)
