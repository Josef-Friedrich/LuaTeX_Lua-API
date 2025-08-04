local equals = require('./resources/utils').assert_equals

equals(sio.readcardinal4le("test", 0), 1936028672)
equals(sio.readcardinal4le("test", 1), 1953719668)
equals(sio.readcardinal4le("test", 2), nil)
