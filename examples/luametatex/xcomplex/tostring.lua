#! /home/jf/context/tex/texmf-linux-64/bin/context --noconsole --forcelua

local c = xcomplex.new(1, 2)
assert(xcomplex.tostring(c) == "1.0+2.0i")
