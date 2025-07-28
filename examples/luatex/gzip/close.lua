#! luatex --luaonly

local g_file = gzip.open("test.gz", "rb")
assert(g_file)
local success = gzip.close(g_file)
assert(success == true)
-- gzip.close(g_file) -> attempt to use a closed file
