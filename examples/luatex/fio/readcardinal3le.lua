local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.equals(fio.readcardinal3le(f), 7562612)
  assert.is_nil(fio.readcardinal3le(f))
  f:close()
end
