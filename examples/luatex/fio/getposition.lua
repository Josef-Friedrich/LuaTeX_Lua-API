local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  fio.readcardinal1(f)
  assert.equals(fio.getposition(f), 1)
  fio.readcardinal1(f)
  assert.equals(fio.getposition(f), 2)
  fio.readcardinal1(f)
  assert.equals(fio.getposition(f), 3)
  fio.readcardinal1(f)
  assert.equals(fio.getposition(f), 4)
  f:close()
end
