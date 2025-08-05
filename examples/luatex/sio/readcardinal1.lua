local assert = require("utils").assert

assert.is_nil(sio.readcardinal1("test", 0))
-- t: decimal=116 hexadecimal=74 binary=01110100
assert.equals(sio.readcardinal1("test", 1), 116)
-- e: decimal=101 hexadecimal=65 binary=01100101
assert.equals(sio.readcardinal1("test", 2), 101)
-- s: decimal=115 hexadecimal=73 binary=01110011
assert.equals(sio.readcardinal1("test", 3), 115)
-- t: decimal=116 hexadecimal=74 binary=01110100
assert.equals(sio.readcardinal1("test", 4), 116)
assert.is_nil(sio.readcardinal1("test", 5))
