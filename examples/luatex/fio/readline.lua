local assert = require("utils").assert

local f = io.open("tmp.txt", "w+")
if f then
  f:write("line1\nline2\nline3\n")
  fio.setposition(f, 0)
  assert.equals(fio.readline(f), "line1")
  assert.equals(fio.readline(f), "line2")
  assert.equals(fio.readline(f), "line3")
  f:close()
end
