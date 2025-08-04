local equals = require("./resources/utils").assert_equals

equals(sio.readcardinal3le("luatex", 0), 7695360)
equals(sio.readcardinal3le("luatex", 1), 6387052)
equals(sio.readcardinal3le("luatex", 4), 7890292)
equals(sio.readcardinal3le("luatex", 5), nil)
