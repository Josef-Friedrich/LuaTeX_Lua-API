local assert = require("utils").assert

assert.equals(sio.readinteger3("test", 0), 29797)
assert.equals(sio.readinteger3("test", 1), 7628147)
assert.equals(sio.readinteger3("test", 2), 6648692)
assert.is_nil(sio.readinteger3("test", 3))
