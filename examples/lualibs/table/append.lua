require("lualibs")
local utils = require("./resources/utils")

assert(
  utils.are_same(
    table.append({ "a", "b", "c" }, { "d", "e" }),
    { "a", "b", "c", "d", "e" }
  )
)
