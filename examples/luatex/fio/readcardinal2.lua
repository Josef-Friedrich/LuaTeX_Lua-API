local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  -- t.e: decimal=29797 hexadecimal=74.65 binary=01110100.01100101
  assert(fio.readcardinal2(f) == 29797)
  -- s.t: decimal=29556 hexadecimal=73.74 binary=01110011.01110100
  assert(fio.readcardinal2(f) == 29556)
  f:close()
end
