require("lualibs")

local text = "This string is too long for our purpose."
print(string.limit(text, 15))
print(string.limit(text, 15, " …")) -- "…" seems to be three bytes long.

assert(string.limit(text, 15) == "This string ...")
assert(string.limit(text, 15, " …") == "This string …")
