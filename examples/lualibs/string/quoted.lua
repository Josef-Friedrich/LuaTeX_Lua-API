require("lualibs")

local quoted = string.quoted("lorem")
print(quoted)
assert(quoted == '"lorem"')
