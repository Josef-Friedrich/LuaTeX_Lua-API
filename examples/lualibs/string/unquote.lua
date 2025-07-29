require("lualibs")

print(string.unquote([["Do you see any quotes around here?"]]))
print(string.unquote([['Do you see any quotes around here?']]))
print(string.unquote([["Do you see any quotes around here?']])) -- Doesn't match
print(string.unquote([[“Do you see any quotes around here?”]])) -- Doesn't match

assert(string.unquote([["Lorem"]]) == "Lorem")
