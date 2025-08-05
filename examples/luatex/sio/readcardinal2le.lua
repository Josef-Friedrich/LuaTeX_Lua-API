local assert = require("utils").assert

assert.equals(sio.readcardinal2le("test", 0), 29696)
assert.equals(sio.readcardinal2le("test", 1), 25972)
assert.equals(sio.readcardinal2le("test", 3), 29811)
assert.is_nil(sio.readcardinal2le("test", 4))
