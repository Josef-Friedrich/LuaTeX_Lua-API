---@meta
---
---The `string` library has a few extra functions.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
string = {}

---
---The function `string.explode` function takes upto two arguments: `string.explode(s[,m])` and returns an array containing the string argument `s` split into sub-strings based on the value of the string argument `m`.
---The second argument is a string that is either empty (this splits the string into
---characters), a single character (this splits on each occurrence of that
---character, possibly introducing empty strings), or a single character followed by
---the plus sign `+` (this special version does not create empty sub-strings).
---The default value for `m` is “` +`” (multiple spaces). Note:
---`m` is not hidden by surrounding braces as it would be if this function was
---written in *TeX* macros.
---
---@param s string
---@param m string
---
---@return table
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.explode(s, m) end

---
---This function is relative fast and don’t do much checking. Ti can be
---used as a building block for other helpers.
---
---@param s string
---
---@return integer # returns the codepoints of the characters in the given string
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfvalue(s) end

---
---This function is relative fast and don’t do much checking. Ti can be
---used as a building block for other helpers.
---
---@param c integer
---@param ... integer
---
---@return string # a string with the characters of the given code points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfcharacter(c, ...) end

---
---This function is relative fast and don’t do much checking. Ti can be
---used as a building block for other helpers.
---
---@param s string
---
---@return integer # returns the length of the given string
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utflength(s) end

---
---@param s string
---
---@return function # an integer value in the *Unicode* range
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfvalues(s) end

---
---@param s string
---
---@return function # a string with a single *UTF-8* token in it
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfcharacters(s) end

---
---@param s string
---
---@return function # a string containing one byte
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.characters(s) end

---
---The `string.characterpairs()` iterator
---is useful especially in the conversion of *UTF-8*16 encoded data into *UTF-8*.
---
---@param s string
---
---@return function # two strings each containing one byte or an empty second string if the string length was odd
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.characterpairs(s) end

---
---@param s string
---
---@return function # a single byte value
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.bytes(s) end

---
---The `string.bytepairs()` iterator
---is useful especially in the conversion of *UTF-8*16 encoded data into *UTF-8*.
---
---@param s string
---
---@return function # two byte values or nil instead of a number as its second return value if the string length was odd
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.bytepairs(s) end
