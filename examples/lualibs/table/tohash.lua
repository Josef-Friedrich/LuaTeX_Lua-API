require("lualibs")
local utils = require("utils")

assert(utils.are_same(table.tohash({ "a", "b", "c" }), {
  a = true,
  b = true,
  c = true,
}))
