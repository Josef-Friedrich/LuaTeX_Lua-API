
for index, value in ipairs(string.utfvalues("abc")) do

end

local a, b, c = string.utfvalue("abc")
print(a, b, c) -- 97 98 99

print(string.utfvalues("abc")) -- 97 98 99

print(string.utfvalue('')) --
