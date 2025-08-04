local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert(fio.readinteger3le(f) == 7562612)
  assert(fio.readinteger3le(f) == nil)
  f:close()
end
