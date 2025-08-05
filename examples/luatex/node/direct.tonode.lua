local assert = require("utils").assert

local n = node.new("glyph")
local d = node.direct.todirect(n)
local from_direct = node.direct.tonode(d)
assert.equals(n, from_direct)
