local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  -- t.e.s.t:
  -- decimal=1952805748
  -- hexadecimal=74.65.73.74
  -- binary=01110100.01100101.01110011.01110100
  assert(fio.readcardinal4(f) == 1952805748)
  f:close()
end
