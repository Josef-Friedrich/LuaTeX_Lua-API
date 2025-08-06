local assert = require("utils").assert

local g1 = node.new("glyph")
local g2 = node.new("glyph")
local g3 = node.new("glyph")

g1.next = g2
g2.next = g3
assert.equals(g1.next, g2)

local head, current = node.remove(g1, g2)
assert.equals(g1.next, g3)
assert.equals(head, g1)
assert.equals(current, g3)
