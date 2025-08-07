local utils = require("utils")

local times = os.times()
assert(type(times.cstime) == "number")
assert(type(times.cutime) == "number")
assert(type(times.stime) == "number")
assert(type(times.utime) == "number")
utils.pinspect(times)
-- {
--   cstime = 0.0,
--   cutime = 0.0,
--   stime = 0.02,
--   utime = 0.15
-- }
