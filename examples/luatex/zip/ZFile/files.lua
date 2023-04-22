#! luatex --luaonly

local zfile = zip.open('../test.zip')
assert(zfile)

for internal in zfile:files() do
  assert(internal.filename)
  assert(internal.compression_method)
  assert(internal.compressed_size)
  assert(internal.uncompressed_size)
end
