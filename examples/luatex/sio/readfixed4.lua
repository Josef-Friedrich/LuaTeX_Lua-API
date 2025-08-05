local assert = require("utils").assert

assert.numbers(sio.readfixed4("test", 0), 116.39628601074)
assert.numbers(sio.readfixed4("test", 1), 29797.45098877)
assert.is_nil(sio.readfixed4("test", 2))
