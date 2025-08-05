local assert = require("utils").assert

assert.equals(
  node.tostring(node.new("glyph")),
  "<node    nil <    234 >    nil : glyph 0>"
)
