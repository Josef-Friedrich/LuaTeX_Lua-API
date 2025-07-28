#! luatex --luaonly

-- https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/test_gzip.lua

local g_file = gzip.open("test.gz", "wb9")
assert(g_file)
for i = 1, 10 do
  g_file:write("This is line " .. i, "\n")
end
g_file:close()
