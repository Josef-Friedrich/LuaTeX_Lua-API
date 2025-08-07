local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  -- t: decimal=116 hexadecimal=74 binary=01110100
  assert.equals(fio.readcardinal1(f), 116)

  fio.setposition(f, 0)
  assert.equals(fio.skipposition(f, 1), 0)
  -- e: decimal=101 hexadecimal=65 binary=01100101
  assert.equals(fio.readcardinal1(f), 101)
  f:close()
end
