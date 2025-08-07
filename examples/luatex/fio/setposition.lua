local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.equals(fio.getposition(f), 0)
  assert.equals(fio.setposition(f, 3), 0)
  assert.equals(fio.getposition(f), 3)
  f:close()
end
