#! luatex --luaonly
local assert = require("utils").assert

local function split(s, sep)
  sep = lpeg.P(sep)
  local elem = lpeg.C((1 - sep) ^ 0)
  local p = elem * (sep * elem) ^ 0
  return lpeg.match(p, s)
end

local a, b, c = split("a,b,c", ",")
assert.equals(a, "a")
assert.equals(b, "b")
assert.equals(c, "c")
