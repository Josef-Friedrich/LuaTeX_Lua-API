local assert = require("utils").assert

local hlist = node.direct.new("hlist")
node.direct.setsubtype(hlist, 2)
assert.equals(node.direct.getsubtype(hlist), 2)
