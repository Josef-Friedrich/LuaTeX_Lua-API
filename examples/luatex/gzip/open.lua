#! luatex --luaonly

-- https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/test_gzip.lua

local g_file = gzip.open('test.gz', 'rb')
assert(g_file)
