#! luatex --luaonly

local time = os.gettimeofday()
print(time)
assert(time > 1682153121.3217)
