local assert = require("utils").assert

local d = node.direct.new("hlist")
node.direct.setwidth(d, 42)
assert.equals(node.direct.getwidth(d), 42)
