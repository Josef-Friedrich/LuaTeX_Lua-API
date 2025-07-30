require("lualibs")

local fn = string.wordsplitter("two")
local result = fn("one two three")
assert(result[1] == "one")
assert(result[2] == "three")
