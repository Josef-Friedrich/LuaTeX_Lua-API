local assert = require("utils").assert

local n1 = node.new("glyph")
local n2 = node.new("glyph")
n1.prev = n2
assert.equals(node.getprev(n1), n2)
