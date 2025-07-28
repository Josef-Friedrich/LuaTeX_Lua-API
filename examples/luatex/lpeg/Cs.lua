#! luatex --luaonly

-- http://www.inf.puc-rio.br/~roberto/lpeg/

local function gsub(s, patt, repl)
  patt = lpeg.P(patt)
  patt = lpeg.Cs((patt / repl + 1) ^ 0)
  return lpeg.match(patt, s)
end
assert(gsub("Hello, xxx!", "xxx", "World") == "Hello, World!")
