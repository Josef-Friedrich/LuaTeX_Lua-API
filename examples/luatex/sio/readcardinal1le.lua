local assert = require("utils").assert

assert.is_nil(sio.readcardinal1le("test", 0))
assert.equals(sio.readcardinal1le("test", 1), 116)
assert.equals(sio.readcardinal1le("test", 2), 101)
assert.equals(sio.readcardinal1le("test", 3), 115)
assert.equals(sio.readcardinal1le("test", 4), 116)
assert.is_nil(sio.readcardinal1le("test", 5))
