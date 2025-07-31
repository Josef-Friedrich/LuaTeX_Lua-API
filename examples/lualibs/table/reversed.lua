require("lualibs")
local utils = require("./resources/utils")

assert(utils.are_same(table.reversed({ "a", "b", "c" }), { "c", "b", "a" }))
