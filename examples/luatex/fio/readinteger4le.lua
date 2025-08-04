local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert(fio.readinteger4le(f) == 1953719668)
  assert(fio.readinteger4le(f) == nil)
  f:close()
end
