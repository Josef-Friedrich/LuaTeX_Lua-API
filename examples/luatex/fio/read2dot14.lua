local function compare_numbers(a, b, epsilon)
  epsilon = epsilon or 1e-6
  return a == b or math.abs(a - b) < epsilon
end

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert(compare_numbers(fio.read2dot14(f), 1.8186645507812))
  fio.setposition(f, 1)
  assert(compare_numbers(fio.read2dot14(f), 1.5851440429688))
  fio.setposition(f, 2)
  assert(compare_numbers(fio.read2dot14(f), 1.803955078125))
  assert(sio.read2dot14("test", 4) == nil)
  f:close()
end
