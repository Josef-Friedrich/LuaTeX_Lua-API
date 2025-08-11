local assert = require("utils").assert

local d = node.direct.new("glyph")
node.direct.setproperty(d, "Some value")
assert.equals(node.direct.getproperty(d), "Some value")
