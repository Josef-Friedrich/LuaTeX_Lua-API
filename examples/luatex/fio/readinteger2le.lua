local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert(fio.readinteger2le(f) == 25972)
  assert(fio.readinteger2le(f) == 29811)
  assert(fio.readinteger2le(f) == nil)
  f:close()
end
