local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.equals(fio.readcardinal1le(f), 116)
  assert.equals(fio.readcardinal1le(f), 101)
  assert.equals(fio.readcardinal1le(f), 115)
  assert.equals(fio.readcardinal1le(f), 116)
  assert.is_nil(fio.readcardinal1le(f))
  f:close()
end
