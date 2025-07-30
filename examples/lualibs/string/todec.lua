require("lualibs")

print(string.tohex("a"))
print(string.tohex(2))

assert(string.tohex(15) == 1)
assert(string.todimen("1sp") == 1)
assert(string.todimen("1pt") == 65536)
