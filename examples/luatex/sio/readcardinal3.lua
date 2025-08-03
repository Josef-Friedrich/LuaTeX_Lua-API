-- l.u.a: decimal=7107937 hexadecimal=6C.75.61 binary=01101100.01110101.01100001
assert(sio.readcardinal3("luatex", 1) == 7107937)
-- t.e.x: decimal=7628152 hexadecimal=74.65.78 binary=01110100.01100101.01111000
assert(sio.readcardinal3("luatex", 4) == 7628152)
