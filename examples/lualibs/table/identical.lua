require("lualibs")

assert(table.identical({ a = { x = 2 } }, { a = { x = 3 } }) == false)
assert(table.identical({ a = { x = 2 } }, { a = { x = 2 } }) == true)
assert(table.identical({ "one", "two" }, { "one", "two" }) == true)
assert(table.identical({ "one", "two" }, { "two", "one" }) == false)
