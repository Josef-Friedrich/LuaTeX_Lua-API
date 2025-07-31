require("lualibs")
local utils = require("./resources/utils")

assert(utils.are_same(table.swapped({ "a", "b", "c" }), {
  a = 1,
  b = 2,
  c = 3,
}))
