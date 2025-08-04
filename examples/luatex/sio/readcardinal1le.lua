local equals = require("./resources/utils").assert_equals

equals(sio.readcardinal1le("test", 0), nil)
equals(sio.readcardinal1le("test", 1), 116)
equals(sio.readcardinal1le("test", 2), 101)
equals(sio.readcardinal1le("test", 3), 115)
equals(sio.readcardinal1le("test", 4), 116)
equals(sio.readcardinal1le("test", 5), nil)
