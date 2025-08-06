local assert = require("utils").assert

local d1 = node.direct.new("glyph")
local d2 = node.direct.new("glyph")
local d3 = node.direct.new("glyph")
node.direct.setboth(d1, d2, d3)
local prev, next = node.direct.getboth(d1)
assert.equals(prev, d2)
assert.equals(next, d3)
