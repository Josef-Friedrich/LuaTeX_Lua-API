local assert = require("utils").assert

assert.numbers(sio.read2dot14("test", 1), 1.8186645507812)
assert.numbers(sio.read2dot14("test", 2), 1.5851440429688)
assert.numbers(sio.read2dot14("test", 3), 1.803955078125)
assert.is_nil(sio.read2dot14("test", 4))
