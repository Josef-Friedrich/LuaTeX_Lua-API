local assert = require("utils").assert

local n = node.new("glyph")
node.setfield(n, "char", 2)
assert.equals(node.getfield(n, "char"), 2)
