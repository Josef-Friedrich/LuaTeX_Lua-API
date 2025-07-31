require("lualibs")

assert(table.are_equal({ a = { x = 2 } }, { a = { x = 3 } }) == true)
assert(table.are_equal({ a = { x = 2 } }, { a = { x = 2 } }) == true)
assert(table.are_equal({ "one", "two" }, { "one", "two" }) == true)
assert(table.are_equal({ "one", "two" }, { "two", "one" }) == false)
