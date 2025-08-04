local function compare_numbers(a, b, epsilon)
  epsilon = epsilon or 1e-6
  return a == b or math.abs(a - b) < epsilon
end

assert(compare_numbers(sio.readfixed2("test", 0), 0.453125))
assert(compare_numbers(sio.readfixed2("test", 1), 116.39453125))
assert(sio.readfixed2("test", 2) == nil)
assert(sio.readfixed2("test", 3) == nil)
