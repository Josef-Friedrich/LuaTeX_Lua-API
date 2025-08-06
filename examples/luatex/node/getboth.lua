local assert = require("utils").assert

local n1 = node.new("glyph")
local n2 = node.new("glyph")
local n3 = node.new("glyph")

n1.next = n2
n2.next = n3
node.slide(n1) -- to set n2.prev

local prev, next = node.getboth(n2)
assert.equals(prev, n1)
assert.equals(next, n3)
