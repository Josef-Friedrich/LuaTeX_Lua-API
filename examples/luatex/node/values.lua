local utils = require("utils")
assert = utils.assert

assert.same(
  node.values("dir"),
  { [0] = "TLT", [1] = "TRT", [2] = "LTL", [3] = "RTT" }
)
assert.same(
  node.values("direction"),
  { [0] = "TLT", [1] = "TRT", [2] = "LTL", [3] = "RTT" }
)
assert.same(
  node.values("glue"),
  { [0] = "normal", [1] = "fi", [2] = "fil", [3] = "fill", [4] = "filll" }
)
assert.same(node.values("pdf_literal"), {
  [0] = "origin",
  [1] = "page",
  [2] = "always",
  [3] = "raw",
  [4] = "text",
  [5] = "font",
  [6] = "special",
})
assert.same(
  node.values("pdf_action"),
  { [0] = "page", [1] = "goto", [2] = "thread", [3] = "user" }
)
assert.same(
  node.values("pdf_window"),
  { [0] = "unset", [1] = "new", [2] = "nonew" }
)
assert.same(
  node.values("color_stack"),
  { [0] = "set", [1] = "push", [2] = "pop", [3] = "current" }
)
assert.same(
  node.values("pagestate"),
  { [0] = "empty", [1] = "box_there", [2] = "inserts_only" }
)
