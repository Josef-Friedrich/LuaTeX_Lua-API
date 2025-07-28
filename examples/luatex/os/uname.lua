#! luatex --luaonly

local uname = os.uname()
assert(type(uname.machine) == "string")
assert(type(uname.nodename) == "string")
assert(type(uname.release) == "string")
assert(type(uname.sysname) == "string")
assert(type(uname.version) == "string")
