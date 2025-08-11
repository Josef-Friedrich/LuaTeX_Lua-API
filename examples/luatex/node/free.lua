local assert = require("utils").assert

local n1 = node.new("glyph")
local n2 = node.new("glyph")
n1.next = n2
assert.equals(node.free(n1), n2)
