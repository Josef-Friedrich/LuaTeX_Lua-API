local assert = require("utils").assert

assert.equals(sio.readinteger4le("test", 0), 1936028672)
assert.equals(sio.readinteger4le("test", 1), 1953719668)
assert.equals(sio.readinteger4le("test", 2), nil)
