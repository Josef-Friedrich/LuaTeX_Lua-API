#! luatex --luaonly

local number = lpeg.R("09") ^ 1 / tonumber
local list = number * ("," * number) ^ 0
local function add(acc, newvalue) return acc + newvalue end
local sum = lpeg.Cf(list, add)
assert(sum:match("10,30,43") == 83)
