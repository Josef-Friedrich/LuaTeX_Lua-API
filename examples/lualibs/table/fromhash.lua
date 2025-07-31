require("lualibs")
local utils = require("./resources/utils")

local result = table.fromhash({ a = true, b = false, c = true })
table.sort(result)
assert(utils.are_same(result, { "a", "c" }))
