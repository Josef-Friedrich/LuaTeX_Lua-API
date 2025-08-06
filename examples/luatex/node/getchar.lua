local assert = require("utils").assert

local n = node.new("glyph") --[[@as GlyphNode]]
n.char = 1
assert.equals(node.getchar(n), 1)
