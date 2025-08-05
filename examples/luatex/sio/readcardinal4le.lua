local assert = require("utils").assert

assert.equals(sio.readcardinal4le("test", 0), 1936028672)
assert.equals(sio.readcardinal4le("test", 1), 1953719668)
assert.is_nil(sio.readcardinal4le("test", 2))
