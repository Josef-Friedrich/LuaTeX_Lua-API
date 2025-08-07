require("lualibs")
local utils = require("utils")

assert(utils.are_same(table.reverse({ 1, 2, 3, 4 }), { 4, 3, 2, 1 }))
