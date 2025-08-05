local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.equals(fio.readinteger4le(f), 1953719668)
  assert.is_nil(fio.readinteger4le(f))
  f:close()
end
