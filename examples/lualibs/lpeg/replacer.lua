local str = "Luxury Yacht"

local rep = {
  [1] = { "Luxury", "Throatwobbler" },
  [2] = { "Yacht", "Mangrove" },
}

print(
  "My name is spelled “"
    .. str
    .. "”, but it's pronounced “"
    .. lpeg.replacer(rep):match(str)
    .. "”."
)

str = "aaababaaba"
local rep1 = {
  { "a", "x" },
  { "aa", "y" },
}

local rep2 = {
  { "aa", "y" },
  { "a", "x" },
}

print(lpeg.replacer(rep1):match(str))
print(lpeg.replacer(rep2):match(str))
