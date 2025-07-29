---@meta
---https://github.com/latex3/lualibs/blob/main/lualibs-util-str.lua
---https://github.com/latex3/lualibs/blob/main/lualibs-lpeg.lua

---
---Surround `text` with double quotes.
---
---__Example:__
---
---```lua
---local quoted = string.quoted("lorem")
---assert(quoted == '"lorem"')
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L51-L53](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L51-L53)
---
---@see string.unquoted
---
---@param text string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.quoted(text) end

---
---Surround `text` with double quotes.
---
---__Example:__
---
---```lua
---local quote = string.quote("lorem")
---assert(quote == '"lorem"')
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L222](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L222)
---
---@deprecated Use `string.quoted` instead.
---
---@see string.quoted
---@see string.unquoted
---
---@param text string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.quote(text) end

---
---Return `text` with surrounding quotes removed if they are of the same kind (ascii single/double quote only).
---
---__Example:__
---
---```lua
---print(string.unquoted([["Do you see any quotes around here?"]]))
---print(string.unquoted([['Do you see any quotes around here?']]))
---print(string.unquoted([["Do you see any quotes around here?']])) -- Doesn't match
---print(string.unquoted([[“Do you see any quotes around here?”]])) -- Doesn't match
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L40-L42](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L40-L42)
---
---@see string.quoted
---
---@param text string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.unquoted(text) end

---
---Return `text` with surrounding quotes removed if they are of the same kind (ascii single/double quote only).
---
---__Example:__
---
---```lua
---print(string.unquote([["Do you see any quotes around here?"]]))
---print(string.unquote([['Do you see any quotes around here?']]))
---print(string.unquote([["Do you see any quotes around here?']])) -- Doesn't match
---print(string.unquote([[“Do you see any quotes around here?”]])) -- Doesn't match
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L223](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L223)
---
---@see string.quoted
---@see string.unquoted
---
---@deprecated Use `string.unquoted` instead.
---
---@param text string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.unquote(text) end

---
---Return the `count` of matches for `pattern` in `text`.
---
---__Example:__
---
---```lua
---assert(string.count("How many a's?", "a") == 2)
---assert(string.count("How many many's?", "many") == 2)
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L55-L61](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L55-L61)
---
---@param text string
---@param pattern string
---
---@return integer count
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.count(text, pattern) end

---
---Returns the `text` capped at position `max` (minus the byte count of `tail`) with tail appended. The optional `tail` defaults to "...".
---
---__Example:__
---
---```lua
---local text = "This string is too long for our purpose."
---print(string.limit(text, 15))
---print(string.limit(text, 15, " …")) -- "…" seems to be three bytes long.
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L63-L70](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L63-L70)
---
---@param text string
---@param max string
---@param tail? string
---
---@return string text
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.limit(text, max, tail) end

---
---Yields `text` with leading and trailing whitespace (spaces ` `, horizontal `\t` and vertical tabs `\v`, form feeds `\f`) removed.
---
---__Example:__
---
---```lua
---assert(
---  string.strip(" \t\f\vI once used to be surrounded by whitespace. \t\f\v")
---    == "I once used to be surrounded by whitespace."
---)
---
---assert(string.strip("\nline breaks\n") == "\nline breaks\n")
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L78-L80](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L78-L80)
---* Corresponding Lua source code: [lualibs-lpeg.lua#L198](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L198)
---
---@param text string
---
---@return string text
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.strip(text) end

---
---Yields `text` with leading and trailing whitespace (line feeds `\n`, carriage returns `\r`, spaces ` `, horizontal `\t` and vertical tabs `\v`, form feeds `\f`) removed.
---
---__Example:__
---
---```lua
---assert(
---  string.fullstrip("\n\r I once used to be surrounded by whitespace. \n\r")
---    == "I once used to be surrounded by whitespace."
---)
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-string.lua#L82-L84](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L82-L84)
---* Corresponding Lua source code: [lualibs-lpeg.lua#L198](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L198)
---
---@param text string
---
---@return string text
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.fullstrip(text) end

---
---__Example:__
---
---```lua
---assert(string.collapsespaces("Multiple   \t\f\v\n\rspaces") == "Multiple \n\rspaces")
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-string.lua#L86-L88](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L86-L88)
---* Corresponding Lua source code: [lualibs-lpeg.lua#L202](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L202)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.collapsespaces(str) end

---
---__Example:__
---
---```lua
---assert(string.nospaces("Multiple   \t\f\v\n\rspaces") == "Multiplespaces")
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-string.lua#L90-L92](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L90-L92)
---* Corresponding Lua source code: [lualibs-lpeg.lua#L203](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L203)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.nospaces(str) end

---
---__Example:__
---
---```lua
---assert(string.longtostring("multiple   spaces") == "multiple spaces")
---assert(string.longtostring("multiple\t\t\ttabs") == "multiple tabs")
---assert(string.longtostring("multiple\n\n\nnewlines") == "multiple newlines")
---assert(
---  string.longtostring('quoted multiple "   " whitespaces')
---    == 'quoted multiple "   " whitespaces'
---)
---assert(
---  string.longtostring('quoted multiple "\t\t\t" tabs')
---    == 'quoted multiple "\t\t\t" tabs'
---)
---assert(
---  string.longtostring("single quoted multiple '\t\t\t' tabs")
---    == "single quoted multiple '\t\t\t' tabs"
---)
---assert(string.longtostring("string") == "string")
---assert(string.longtostring("") == "")
---assert(string.longtostring() == "")
---assert(string.longtostring(1) == "1")
---assert(string.longtostring(1.0) == "1.0")
---assert(string.longtostring(nil) == "")
---assert(string.longtostring(false) == "")
----- assert(string.longtostring(true) == "") bad argument #2 to 'lpegmatch' (string expected, g ot boolean)
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-string.lua#L94-L96](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L94-L96)
---* Corresponding Lua source code: [lualibs-lpeg.lua#L296](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L296)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.longtostring(str) end

---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L106-L112](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L106-L112)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.is_empty(str) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L426-L438](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L426-L438)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.autodouble(s, sep) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L440-L452](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L440-L452)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.autosingle(s, sep) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L467-L475](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L467-L475)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.tracedchar(b) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L648-L650](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L648-L650)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.escapedquotes(s) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L659-L661](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L659-L661)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.unescapedquotes(s) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L1471-L1473](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L1471-L1473)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.optionalquoted(str) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L1477-L1479](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L1477-L1479)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.replacenewlines(str) end

---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L168-L170](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L168-L170)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.escapedpattern(str, simple) end

---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L172-L187](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L172-L187)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.topattern(str, lowercase, strict) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L195-L197](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L195-L197)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.valid(str, default) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L201](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L201)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.itself(s) end

---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L208-L210](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L208-L210)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.totable(str, bytes) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L216-L218](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L216-L218)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.tformat(fmt) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.booleanstring(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.containsws(str, what) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.formatter(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.is_boolean(str, default, strict) end

---
---Return a list of substrings of `string` delimited by `separator`.
---
---Consecutive separators result in the empty string; its counterpart `string.checkedsplit` does not match these sequences, returning `nil` instead.
---
---__Example:__
---
---```lua
---local theory =
---  [[All brontosauruses are thin at one end, much much thicker in the middle, and then thin again at the far end.]]
---
---local theorems = string.split(theory, lpeg.P(", ") * lpeg.P("and ") ^ -1)
---
---for n, element in ipairs(theorems) do
---  io.write(string.format("Theorem %u: %s\n", n, element))
---end
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---@see string.checkedsplit
---@see lpeg.split
---@see lpeg.checkedsplit
---
---@param string string
---@param separator string
---
---@return string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.split(string, separator) end

---
---Return a list of substrings of `string` delimited by `separator`.
---
---Consecutive separators result in `nil`.
---
---__Example:__
---
---```lua
---local theory =
---  [[All brontosauruses are thin at one end, much much thicker in the middle, and then thin again at the far end.]]
---
---local theorems = string.checkedsplit(theory, lpeg.P(", ") * lpeg.P("and ") ^ -1)
---
---for n, element in ipairs(theorems) do
---  io.write(string.format("Theorem %u: %s\n", n, element))
---end
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---@see lpeg.split
---@see lpeg.checkedsplit
---@see string.split
---
---@param string string
---@param separator string
---
---@return string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.checkedsplit(string, separator) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.splitlines(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.splitup(str, separator) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.texnewlines(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.toboolean(str, tolerant) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.tobytes(s) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.todec(s) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.todimen(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.tohex(s) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.toHEX(s) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.toutf(s) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utflength() end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfpadd(s, n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfpadding(s, n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.wordsplitter(s) end
