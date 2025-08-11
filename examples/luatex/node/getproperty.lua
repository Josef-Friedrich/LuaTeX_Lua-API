local assert = require("utils").assert

local n = node.new("glyph")
node.setproperty(n, "Some value")
assert.equals(node.getproperty(n), "Some value")
