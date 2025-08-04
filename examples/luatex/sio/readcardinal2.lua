assert(sio.readcardinal2("test", 0) == 116)
-- t.e: decimal=29797 hexadecimal=74.65 binary=01110100.01100101
assert(sio.readcardinal2("test", 1) == 29797)
-- s.t: decimal=29556 hexadecimal=73.74 binary=01110011.01110100
assert(sio.readcardinal2("test", 3) == 29556)
assert(sio.readcardinal2("test", 4) == nil)
