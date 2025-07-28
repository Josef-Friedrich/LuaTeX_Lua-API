#! luatex --luaonly

-- line(' deflate/inflate')
local us
local f = io.open("all.lua") -- f = io.open('../all.tar')
assert(f)
us = f:read("*a")
f:close()

do -- local block
  local f, cs, zd, zi, aux_res, res, ret, count

  print("file length              : " .. string.len(us))

  cs = ""
  zd = zlib.compressobj(1)
  print("deflate stream           : " .. tostring(zd))

  cs = cs .. zd:compress(string.sub(us, 1, 10))
  cs = cs .. zd:compress(string.sub(us, 11))
  cs = cs .. zd:flush()

  print("compressed length        : " .. string.len(cs))
  print("compressed adler         : " .. tostring(zd:adler()))
  zd:close()

  zi = zlib.decompressobj()
  print("inflate stream           : " .. tostring(zi))
  res = ""
  res = res .. zi:decompress(string.sub(cs, 1, 10))
  res = res .. zi:decompress(string.sub(cs, 11))
  res = res .. zi:flush()
  print("uncompressed length      : " .. string.len(res))
  print("uncompressed adler       : " .. tostring(zi:adler()))
  zi:close()
  print("result == uncompressed   : " .. tostring(res == us))
  print(
    "compression ratio        : " .. tostring(string.len(us) / string.len(cs))
  )
end -- local block
