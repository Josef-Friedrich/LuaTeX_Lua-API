local function to_hex(str)
  return (str:gsub('.', function (c)
      return string.format('%02x', string.byte(c))
  end))
end

print(to_hex(sha2.digest256('test')))
