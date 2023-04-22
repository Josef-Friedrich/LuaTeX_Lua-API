#! luatex --luaonly

local function convert_to_hex(str)
    return (str:gsub('.', function (c)
        return string.format('%02X', string.byte(c))
    end))
end
local hash = convert_to_hex(md5.sum('test'))
assert(hash == '098F6BCD4621D373CADE4E832627B4F6', hash)
print(hash)
