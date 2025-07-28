local a = string.utfvalue("abc")
print(a) -- 97

local a, b, c = string.utfvalue("abc")
print(a, b, c) -- 97 98 99

print(string.utfvalue("abc")) -- 97 98 99

print(string.utfvalue("")) --
