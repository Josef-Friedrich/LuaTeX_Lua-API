local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.equals(fio.readinteger3(f), 7628147)
  assert.is_nil(fio.readinteger3(f))
  f:close()
end
