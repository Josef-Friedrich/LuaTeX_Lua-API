local assert = require("utils").assert

local character, font =
  node.direct.is_glyph(node.direct.todirect(node.new("glyph")))
assert.equals(character, 0)
assert.equals(font, 0)
assert.is_false(node.direct.is_glyph(node.direct.todirect(node.new("hlist"))))
