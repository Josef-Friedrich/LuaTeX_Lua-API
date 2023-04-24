#! luatex --luaonly

local hash = md5.sumHEXA('test')
assert(hash == '098F6BCD4621D373CADE4E832627B4F6', hash)
