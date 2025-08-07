local assert = require("utils").assert

assert.equals(node.is_char(node.new("glyph")), 0)
assert.equals(node.is_char(node.new("hlist")), nil)
