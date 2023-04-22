#! luatex --luaonly

local times = os.times()
assert(type(times.cstime) == 'number')
assert(type(times.cutime) == 'number')
assert(type(times.stime) == 'number')
assert(type(times.utime) == 'number')
