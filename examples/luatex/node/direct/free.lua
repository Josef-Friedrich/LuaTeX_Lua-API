local assert = require("utils").assert

local d1 = node.direct.new("glyph")
local d2 = node.direct.new("glyph")
node.direct.setnext(d1, d2)
assert.equals(node.direct.free(d1), d2)
