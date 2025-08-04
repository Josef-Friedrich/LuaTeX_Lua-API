local function compare_numbers(a, b, epsilon)
  epsilon = epsilon or 1e-6
  return a == b or math.abs(a - b) < epsilon
end

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert(compare_numbers(fio.readfixed2(f), 116.39453125))
  assert(compare_numbers(fio.readfixed2(f), 115.453125))
  assert(fio.readfixed2(f) == nil)
  f:close()
end
