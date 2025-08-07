local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.equals(fio.readinteger2(f), 29797)
  assert.equals(fio.readinteger2(f), 29556)
  assert.is_nil(fio.readinteger2(f))
  f:close()
end
