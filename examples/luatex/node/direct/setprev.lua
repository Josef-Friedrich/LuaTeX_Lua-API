local assert = require("utils").assert

local d1 = node.direct.new("glyph")
local d2 = node.direct.new("glyph")
node.direct.setprev(d1, d2)
assert.equals(node.direct.getprev(d1), d2)
