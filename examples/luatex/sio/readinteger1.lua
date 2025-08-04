assert(sio.readinteger1le("test", 0) == nil)
-- t: decimal=116 hexadecimal=74 binary=01110100
assert(sio.readinteger1le("test", 1) == 116)
-- e: decimal=101 hexadecimal=65 binary=01100101
assert(sio.readinteger1le("test", 2) == 101)
-- s: decimal=115 hexadecimal=73 binary=01110011
assert(sio.readinteger1le("test", 3) == 115)
-- t: decimal=116 hexadecimal=74 binary=01110100
assert(sio.readinteger1le("test", 4) == 116)
assert(sio.readinteger1le("test", 5) == nil)
