local assert = require("utils").assert

local d = node.direct.new("glyph")
node.direct.setfont(d, 1)
assert.equals(node.direct.getfont(d), 1)
