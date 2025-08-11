local assert = require("utils").assert

local math_char = node.direct.new("math_char")
node.direct.setfam(math_char, 42)
assert.equals(node.direct.getfam(math_char), 42)

local glyph = node.direct.new("glyph")
node.direct.setfam(glyph, 42)
assert.is_nil(node.direct.getfam(glyph))
