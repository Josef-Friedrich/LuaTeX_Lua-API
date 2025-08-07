local assert = require("utils").assert

local d = node.direct.todirect(node.new("glyph"))
node.direct.setfield(d, "char", 3)
assert.equals(node.direct.getfield(d, "char"), 3)
