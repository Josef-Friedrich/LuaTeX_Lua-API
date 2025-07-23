_N._4_2_5_multibyte_string_functions = "page 63"

---
---@meta
---
---The `string` library has a few extra functions.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
string = {}

---
---Break a string into pieces.
---
---This functions splits a stringa into sub-strings based
---on the value of the string argument `separator`.
---The second argument is a string that is either empty (this splits the string into
---characters), a single character (this splits on each occurrence of that
---character, possibly introducing empty strings), or a single character followed by
---the plus sign `+` (this special version does not create empty sub-strings).
---The default value for `separator` is ` +` (multiple spaces). Note:
---`separator` is not hidden by surrounding braces as it would be if this function was
---written in *TeX* macros.
---
---```lua
---for _, word in ipairs(string.explode("one  two three")) do
---  print(word)
---end
----- one
----- two
----- three
---
---for _, word in ipairs(string.explode("one,,two,three", ',')) do
---  print(word)
---end
---
----- one
-----
----- two
----- three
---
---for _, word in ipairs(string.explode("one,,two,three", ',+')) do
---  print(word)
---end
----- one
----- two
----- three
---```
---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L247-309](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/4f2b914d365bab8a2747afe6e8c86d0f1c8475f7/source/texk/web2c/luatexdir/lua/lstrlibext.c#L247-309)
---* https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/4f2b914d365bab8a2747afe6e8c86d0f1c8475f7/manual/luatex-lua.tex#L399-409
---
---@param text string # A text that is to be divided into several substrings.
---@param separator? string # A separator that is used to split the string (default ` +`).
---
---@return string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.explode(text, separator) end

---
---Return the codepoints of the characters in the given string.
---
---```lua
---local a = string.utfvalue("abc")
---print(a) -- 97
---
---local a, b, c = string.utfvalue("abc")
---print(a, b, c) -- 97 98 99
---
---print(string.utfvalue("abc")) -- 97 98 99
---```
---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L421-L461](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lstrlibext.c#L421-L461)
---
---@see string.utfvalues
---
---@param text string A string from whose characters the corresponding code points are to be determined.
---
---@return integer, integer ...  # The Unicode codepoints of the characters in the given string.
---
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfvalue(text) end

---@alias UtfValuesInterator fun(): integer index, integer code_point

---
---Iterator that returns a value representing a single UTF-8 token.
---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L183-L189](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lstrlibext.c#L183-L189)
---
---@see string.utfvalue
---
---@param text string
---
---@return fun(): integer index, integer code_point  # an integer value in the *Unicode* range
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfvalues(text) end

---
---Convert unicode code point
---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L402-L412](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lstrlibext.c#L402-L412)
---
---@param code_point integer # A Unicode code point
---@param ... integer # For each character a integer argument
---
---@return string # A string with the characters of the given code points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfcharacter(code_point, ...) end

---
---Iterator that returns a string representing a single UTF-8 token.
---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L128-L134](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lstrlibext.c#L128-L134)
---
---@param text string
---
---@return function # a string with a single *UTF-8* token in it
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfcharacters(text) end

---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L465-L488](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lstrlibext.c#L465-L488)
---
---@param s string
---
---@return integer # returns the length of the given string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utflength(s) end

---
---Iterator that returns a string representing a single 8-byte token.
---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L239-L245](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lstrlibext.c#L239-L245)
---
---@param s string
---
---@return function # a string containing one byte
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.characters(s) end

---
---Iterator that returns two strings representing two single UTF-8 tokens.
---
---The `string.characterpairs()` iterator
---is useful especially in the conversion of *UTF-8*16 encoded data into *UTF-8*.
---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L216-L222](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lstrlibext.c#L216-L222)
---
---@param s string
---
---@return function # two strings each containing one byte or an empty second string if the string length was odd
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.characterpairs(s) end

---
---Iterator that returns a value representing a single 8-byte token.
---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L85-L91](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lstrlibext.c#L85-L91)
---
---@param s string
---
---@return function # a single byte value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.bytes(s) end

---
---Iterator that returns two values representing two single 8-byte tokens.
---
---The `string.bytepairs()` iterator
---is useful especially in the conversion of *UTF-8*16 encoded data into *UTF-8*.
---
---__Reference:__
---
---* Corresponding C source code: [lstrlibext.c#L62-L68](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lstrlibext.c#L62-L68)
---
---@param s string
---
---@return function # two byte values or nil instead of a number as its second return value if the string length was odd
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.bytepairs(s) end
