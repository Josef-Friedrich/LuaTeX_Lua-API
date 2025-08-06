local assert = require("utils").assert

local d = node.direct.new("glyph") --[[@as GlyphNode]]
node.direct.setchar(d, 1)
assert.equals(node.direct.getchar(d), 1)
