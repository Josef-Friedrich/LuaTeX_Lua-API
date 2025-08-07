local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.equals(fio.readinteger1(f), 116)
  assert.equals(fio.readinteger1(f), 101)
  assert.equals(fio.readinteger1(f), 115)
  assert.equals(fio.readinteger1(f), 116)
  assert.is_nil(fio.readinteger1(f))
  f:close()
end
