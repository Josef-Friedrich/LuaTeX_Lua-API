local assert = require("utils").assert

assert.equals(node.direct.getid(node.direct.todirect(node.new("glyph"))), 29)
