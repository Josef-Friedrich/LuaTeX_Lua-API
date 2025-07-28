#! luatex --luaonly

local z_file = zip.open("../test.zip")
assert(z_file)

for info in z_file:files() do
  assert(info.filename)
  assert(info.compression_method)
  assert(info.compressed_size)
  assert(info.uncompressed_size)
end
