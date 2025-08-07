local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  local t = fio.readcardinaltable(f, 4, 1)
  -- t: decimal=116 hexadecimal=74 binary=01110100
  assert.equals(t[1], 116)
  -- e: decimal=101 hexadecimal=65 binary=01100101
  assert.equals(t[2], 101)
  -- s: decimal=115 hexadecimal=73 binary=01110011
  assert.equals(t[3], 115)
  -- t: decimal=116 hexadecimal=74 binary=01110100
  assert.equals(t[4], 116)
  f:close()
end
