local assert = require("utils").assert

assert.equals(sio.readcardinal4("test", 0), 7628147)
-- t.e.s.t:
-- decimal=1952805748
-- hexadecimal=74.65.73.74
-- binary=01110100.01100101.01110011.01110100
assert.equals(sio.readcardinal4("test", 1), 1952805748)
assert.is_nil(sio.readcardinal4("test", 2))
