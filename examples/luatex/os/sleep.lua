#! luatex --luaonly

local start_time = os.gettimeofday()
print(start_time)
os.sleep(1)
local end_time = os.gettimeofday()
print(end_time)

assert(end_time - start_time > 1)
os.sleep(1) -- second
os.sleep(1, 10) -- decisecond
os.sleep(1, 100) -- centisecond
os.sleep(1, 1000) -- millisecond
