require("lualibs")

assert(string.todimen(1) == 1)
assert(string.todimen("1sp") == 1)
assert(string.todimen("1pt") == 65536)
