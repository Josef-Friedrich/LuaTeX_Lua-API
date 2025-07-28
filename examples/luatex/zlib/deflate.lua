#! luatex --luaonly

print(gzip)

local dataToDeflate = {}
print("Generating test data...")
for i = 0, 10000 do
  table.insert(dataToDeflate, string.sub(tostring(math.random()), 3))
end
local dataToDeflate = table.concat(dataToDeflate)

print("Length of data to deflate", #dataToDeflate)

local buffer = {}
local func = function(data)
  table.insert(buffer, data)
end

local stream = zlib.deflate(func) -- best compression, deflated
stream:write(dataToDeflate)
-- stream:flush("sync")
-- stream:flush()
stream:close()

-- local deflatedData = string.sub(table.concat(buffer), 3)      -- needed for IE
local deflatedData = table.concat(buffer)
print(#deflatedData)

local streamIn = zlib.inflate(deflatedData)
local inflatedData = streamIn:read()
assert(dataToDeflate == inflatedData)
