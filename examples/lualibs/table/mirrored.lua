require("lualibs")
local utils = require("utils")

assert(utils.are_same(table.mirrored({ a = "x", b = "y", c = "z" }), {
  a = "x",
  b = "y",
  c = "z",
  x = "a",
  y = "b",
  z = "c",
}))
