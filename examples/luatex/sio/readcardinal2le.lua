local equals = require("./resources/utils").assert_equals

equals(sio.readcardinal2le("test", 0), 29696)
equals(sio.readcardinal2le("test", 1), 25972)
equals(sio.readcardinal2le("test", 3), 29811)
equals(sio.readcardinal2le("test", 4), nil)
