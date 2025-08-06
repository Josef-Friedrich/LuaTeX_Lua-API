local assert = require("utils").assert

assert.equals(
  node.direct.tostring(node.direct.todirect(node.new("glyph"))),
  "<node    nil <    234 >    nil : glyph 0>"
)
