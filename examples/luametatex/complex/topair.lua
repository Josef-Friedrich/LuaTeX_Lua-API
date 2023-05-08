#! /home/jf/context/tex/texmf-linux-64/bin/context --noconsole --forcelua

local c = xcomplex.new(1, 2)
local r, i = xcomplex.topair(c)
assert(r == 1)
assert(i == 2)
