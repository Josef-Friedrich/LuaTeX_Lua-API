local function compare_numbers(a, b, epsilon)
  epsilon = epsilon or 1e-6
  return a == b or math.abs(a - b) < epsilon
end

assert(compare_numbers(sio.readfixed4("test", 0), 116.39628601074))
assert(compare_numbers(sio.readfixed4("test", 1), 29797.45098877))
assert(sio.readfixed4("test", 2) == nil)
