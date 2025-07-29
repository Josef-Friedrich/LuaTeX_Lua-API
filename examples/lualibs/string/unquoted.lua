require("lualibs")

print(string.unquoted([["Do you see any quotes around here?"]]))
print(string.unquoted([['Do you see any quotes around here?']]))
print(string.unquoted([["Do you see any quotes around here?']])) -- Doesn't match
print(string.unquoted([[“Do you see any quotes around here?”]])) -- Doesn't match

assert(string.unquoted([["Lorem"]]) == "Lorem")
