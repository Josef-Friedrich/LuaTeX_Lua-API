local assert = require("utils").assert

assert.equals(sio.readinteger4("test", 0), 7628147)
assert.equals(sio.readinteger4("test", 1), 1952805748)
assert.is_nil(sio.readinteger4("test", 2))
