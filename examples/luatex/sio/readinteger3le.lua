local assert = require("utils").assert

assert.equals(sio.readinteger3le("test", 0), 6648832)
assert.equals(sio.readinteger3le("test", 1), 7562612)
assert.equals(sio.readinteger3le("test", 2), 7631717)
assert.is_nil(sio.readinteger3le("test", 3))
