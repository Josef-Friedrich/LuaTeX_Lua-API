local assert = require("utils").assert

local n = node.new("hlist") --[[@as HlistNode]]
local d = node.direct.todirect(n)
node.direct.setwhd(d, 1, 2, 3)
assert.equals(n.width, 1)
assert.equals(n.height, 2)
assert.equals(n.depth, 3)
