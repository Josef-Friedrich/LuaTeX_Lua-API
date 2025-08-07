local assert = require("utils").assert

local hlist = node.new("hlist")
hlist.subtype = 2

assert.equals(node.getsubtype(hlist), 2)
