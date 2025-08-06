local assert = require("utils").assert

local hlist = node.direct.new("hlist")
local glyph1 = node.direct.new("glyph")
local glyph2 = node.direct.new("glyph")

node.direct.setlist(hlist, glyph1)
node.direct.setnext(glyph1, glyph2)

local list = node.direct.getlist(hlist)
assert.equals(list, glyph1)
assert.equals(node.direct.getnext(list), glyph2)
