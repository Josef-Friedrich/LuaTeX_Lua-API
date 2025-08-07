require("lualibs")
local utils = require("utils")

assert(
  utils.are_same(
    table.append({ "a", "b", "c" }, { "d", "e" }),
    { "a", "b", "c", "d", "e" }
  )
)
