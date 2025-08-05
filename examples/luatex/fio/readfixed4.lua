local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.numbers(fio.readfixed4(f), 29797.45098877)
  assert.is_nil(fio.readfixed4(f))
  f:close()
end
