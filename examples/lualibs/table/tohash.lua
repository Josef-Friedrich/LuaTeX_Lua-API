require("lualibs")
local utils = require("./resources/utils")

assert(utils.are_same(table.tohash({ "a", "b", "c" }), {
  a = true,
  b = true,
  c = true,
}))
