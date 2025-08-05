local assert = require("utils").assert

local b1, b2, b3, b4 = sio.readbytes("test", 1, 4)
-- t: decimal=116 hexadecimal=74 binary=01110100
assert.equals(b1, 116)
-- e: decimal=101 hexadecimal=65 binary=01100101
assert.equals(b2, 101)
-- s: decimal=115 hexadecimal=73 binary=01110011
assert.equals(b3, 115)
-- t: decimal=116 hexadecimal=74 binary=01110100
assert.equals(b4, 116)
