#! luatex --luaonly

-- https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/test_gzip.lua

for line in gzip.lines('test.gz') do print(line) end
