local assert = require("utils").assert

assert.equals(
  tostring(node.usedlist()),
  "<node    nil <    234 >    239 : dir 0>"
)
