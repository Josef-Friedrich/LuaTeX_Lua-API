local assert = require("utils").assert

assert.equals(sio.readcardinal3le("luatex", 0), 7695360)
assert.equals(sio.readcardinal3le("luatex", 1), 6387052)
assert.equals(sio.readcardinal3le("luatex", 4), 7890292)
assert.is_nil(sio.readcardinal3le("luatex", 5))
