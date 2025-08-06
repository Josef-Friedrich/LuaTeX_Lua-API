local assert = require("utils").assert

local hlist = node.new("hlist")
local glyph1 = node.new("glyph")
local glyph2 = node.new("glyph")

hlist.head = glyph1
glyph1.next = glyph2

local list = node.getlist(hlist)
assert.equals(list, glyph1)
assert.equals(list.next, glyph2)
