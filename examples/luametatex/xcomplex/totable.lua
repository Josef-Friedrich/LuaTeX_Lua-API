#! /home/jf/context/tex/texmf-linux-64/bin/context --noconsole --forcelua

local c = xcomplex.new(1, 2)
local t = xcomplex.totable(c)
assert(t[1] == 1)
assert(t[2] == 2)
