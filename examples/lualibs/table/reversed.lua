require("lualibs")
local utils = require("utils")

assert(utils.are_same(table.reversed({ "a", "b", "c" }), { "c", "b", "a" }))
