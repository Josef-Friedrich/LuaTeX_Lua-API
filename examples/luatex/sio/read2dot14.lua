local function compare_numbers(a, b, epsilon)
  epsilon = epsilon or 1e-6
  return a == b or math.abs(a - b) < epsilon
end

assert(compare_numbers(sio.read2dot14("test", 1), 1.8186645507812))
assert(compare_numbers(sio.read2dot14("test", 2), 1.5851440429688))
assert(compare_numbers(sio.read2dot14("test", 3), 1.803955078125))
assert(sio.read2dot14("test", 4) == nil)
