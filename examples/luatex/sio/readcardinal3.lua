local assert = require("utils").assert

assert.equals(sio.readcardinal3("test", 0), 29797)
-- l.u.a: decimal=7107937 hexadecimal=6C.75.61 binary=01101100.01110101.01100001
assert.equals(sio.readcardinal3("luatex", 1), 7107937)
-- t.e.x: decimal=7628152 hexadecimal=74.65.78 binary=01110100.01100101.01111000
assert.equals(sio.readcardinal3("luatex", 4), 7628152)
assert.is_nil(sio.readcardinal3("test", 5))
