local assert = require("utils").assert

local times = os.times()
assert.is_type(times.cstime, "number")
assert.is_type(times.cutime, "number")
assert.is_type(times.stime, "number")
assert.is_type(times.utime, "number")
