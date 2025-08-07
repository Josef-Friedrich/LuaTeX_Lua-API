require("lualibs")
local utils = require("utils")

assert(
  utils.are_same(
    table.prepend({ "a", "b", "c" }, { "d", "e" }),
    { "d", "e", "a", "b", "c" }
  )
)
