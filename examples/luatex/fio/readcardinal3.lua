local f = io.open("tmp.txt", "w+")
if f then
  f:write("luatex")
  fio.setposition(f, 0)
  -- l.u.a: decimal=29797 hexadecimal=6C.75.61 binary=01101100.01110101.01100001
  assert(fio.readcardinal3(f) == 7107937)
  -- t.e.x: decimal=29556 hexadecimal=74.65.78 binary=01110100.01100101.01111000
  assert(fio.readcardinal3(f) == 7628152)
  f:close()
end
