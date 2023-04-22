#! luatex --luaonly

local function convert_to_hex(str)
    return (str:gsub('.', function(c)
        return string.format('%02X', string.byte(c))
    end))
end

local result = convert_to_hex(md5.crypt('secret', '123', '123'))

assert(result == '033132335D6D57ECC683')
print(result)
