local assert = require("utils").assert

local n = node.new("glyph") --[[@as GlyphNode]]
n.font = 1
assert.equals(node.getfont(n), 1)
