local assert = require("utils").assert

local n = node.new("hlist") --[[@as HlistNode]]
local d = node.direct.todirect(n)
node.direct.setwidth(d, 42)
assert.equals(node.direct.getwidth(d), 42)
assert.equals(n.width, 42)
