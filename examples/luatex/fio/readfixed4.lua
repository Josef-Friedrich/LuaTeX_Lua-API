local function compare_numbers(a, b, epsilon)
  epsilon = epsilon or 1e-6
  return a == b or math.abs(a - b) < epsilon
end

local f = io.open("tmp.txt", "w+")
if f then
  f:write("test")
  fio.setposition(f, 0)
  assert(compare_numbers(fio.readfixed4(f), 29797.45098877))
  assert(fio.readfixed4(f) == nil)
  f:close()
end
