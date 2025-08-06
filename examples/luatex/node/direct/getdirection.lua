local assert = require("utils").assert

local n = node.new("hlist")
local d = node.direct.todirect(n)
node.direct.setdir(d, "LTL")
assert.equals(node.direct.getdirection(d), 2)
