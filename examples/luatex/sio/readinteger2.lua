local assert = require("utils").assert

assert.equals(sio.readinteger2("test", 0), 116)
assert.equals(sio.readinteger2("test", 1), 29797)
assert.equals(sio.readinteger2("test", 2), 25971)
assert.equals(sio.readinteger2("test", 3), 29556)
assert.is_nil(sio.readinteger2("test", 4))
