local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert.numbers(fio.read2dot14(f), 1.8186645507812)
  fio.setposition(f, 1)
  assert.numbers(fio.read2dot14(f), 1.5851440429688)
  fio.setposition(f, 2)
  assert.numbers(fio.read2dot14(f), 1.803955078125)
  assert.is_nil(sio.read2dot14("test", 4))
  f:close()
end
