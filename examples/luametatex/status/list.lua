#! /home/jf/context/tex/texmf-linux-64/bin/context --noconsole --forcelua

local info = status.list()
for key, value in pairs(info) do print(key, value) end
