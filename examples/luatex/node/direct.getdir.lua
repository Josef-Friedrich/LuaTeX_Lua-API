local assert = require("utils").assert

local n = node.new("hlist")
local d = node.direct.todirect(n)
node.direct.setdir(d, "TLT")
assert.equals(node.direct.getdir(d), "TLT")
