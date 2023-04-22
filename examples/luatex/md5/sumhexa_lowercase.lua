#! luatex --luaonly

local hash = md5.sumhexa('test')
assert(hash == '098f6bcd4621d373cade4e832627b4f6', hash)
print(hash)
