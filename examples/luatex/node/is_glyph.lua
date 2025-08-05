local assert = require("utils").assert

local character, font = node.is_glyph(node.new("glyph"))
assert.equals(character, 0)
assert.equals(font, 0)
assert.is_false(node.is_glyph(node.new("hlist")))
