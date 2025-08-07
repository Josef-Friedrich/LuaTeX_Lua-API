local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.equals(fio.readinteger4(f), 1952805748)
  assert.is_nil(fio.readinteger4(f))
  f:close()
end
