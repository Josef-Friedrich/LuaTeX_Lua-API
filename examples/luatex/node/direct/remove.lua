local assert = require("utils").assert

local g1 = node.direct.new("glyph")
local g2 = node.direct.new("glyph")
local g3 = node.direct.new("glyph")

node.direct.setnext(g1, g2)
node.direct.setnext(g2, g3)

assert.equals(node.direct.getnext(g1), g2)

local head, current = node.direct.remove(g1, g2)
assert.equals(node.direct.getnext(g1), g3)
assert.equals(head, g1)
assert.equals(current, g3)
