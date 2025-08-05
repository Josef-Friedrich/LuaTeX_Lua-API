local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.equals(fio.readinteger2le(f), 25972)
  assert.equals(fio.readinteger2le(f), 29811)
  assert.is_nil(fio.readinteger2le(f))
  f:close()
end
