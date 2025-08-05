local assert = require("utils").assert

assert.equals(sio.readinteger2le("test", 0), 29696)
assert.equals(sio.readinteger2le("test", 1), 25972)
assert.equals(sio.readinteger2le("test", 2), 29541)
assert.equals(sio.readinteger2le("test", 3), 29811)
assert.is_nil(sio.readinteger2le("test", 4))
