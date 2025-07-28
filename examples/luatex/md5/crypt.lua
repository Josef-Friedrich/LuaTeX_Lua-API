#! luatex --luaonly

local function convert_to_hex(str)
  return (
    str:gsub(".", function(c)
      return string.format("%02X", string.byte(c))
    end)
  )
end

local result = convert_to_hex(md5.crypt("secret", "123", "seed"))
assert(
  result == "0473656564974C4C1B3848",
  "This encrypted messages expected: " .. result
)
