#! luatex --luaonly

local info = status.list()
for key, value in pairs(info) do
  print(key, value)
end
assert(info)
assert(info.luatex_engine == 'luatex')
