local assert = require("utils").assert

assert.numbers(sio.readfixed2("test", 0), 0.453125)
assert.numbers(sio.readfixed2("test", 1), 116.39453125)
assert.is_nil(sio.readfixed2("test", 2))
assert.is_nil(sio.readfixed2("test", 3))
