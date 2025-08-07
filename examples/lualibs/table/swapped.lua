require("lualibs")
local utils = require("utils")

assert(utils.are_same(table.swapped({ "a", "b", "c" }), {
  a = 1,
  b = 2,
  c = 3,
}))
