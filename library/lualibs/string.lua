---@meta
---https://github.com/latex3/lualibs/blob/main/lualibs-util-str.lua
---https://github.com/latex3/lualibs/blob/main/lualibs-lpeg.lua

---
---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

_N.string = "lualibs-string.lua"

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
---Escape all occurences of the characters `-`, `.`, `+`, `*`, `%`, `(`, `)`, `[`, and `]` using percent signs (`%`).
---
---__Example:__
---
---```lua
---assert(
---  string.escapedpattern(
---    "Some characters like *, + and ] need to be escaped for formatting."
---  )
---    == "Some characters like %*, %+ and %] need to be escaped for formatting%."
---)
---
---assert(string.escapedpattern(".? .*", true) == "%..? %..*")
---
---assert(string.escapedpattern(".? .*", false) == "%.%? %.%*")
---```
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L168-L170](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L168-L170)
---
---@param text string
---@param simple? boolean
---
---@return string text
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.escapedpattern(text, simple) end

---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L172-L187](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L172-L187)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.topattern(str, lowercase, strict) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-string.lua#L195-L197](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L195-L197)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.valid(text, default) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-string.lua#L201](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L201)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.itself(text) end

---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---* Corresponding Lua source code: [lualibs-string.lua#L208-L210](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L208-L210)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.totable(text, bytes) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-string.lua#L216-L218](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L216-L218)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.tformat(fmt) end

_N.boolean = "lualibs-boolean.lua"

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-boolean.lua#L42-L58](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-boolean.lua#L42-L58)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.booleanstring(text) end

---
---__Reference:__
---
---* Corresponding Lua source code: [](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-boolean.lua#L60-L69
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.is_boolean(text, default, strict) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-boolean.lua#L18-L40](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-boolean.lua#L18-L40)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.toboolean(text, tolerant) end

_N.lpeg = "lualibs-lpeg.lua"

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
---* https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L396-L407
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
---Return a list of substrings of `text` delimited by `separator`.
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
---* https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L439-L448
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---@see lpeg.split
---@see lpeg.checkedsplit
---@see string.split
---
---@param text string
---@param separator string
---
---@return string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.checkedsplit(text, separator) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-lpeg.lua#L420-L422](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L420-L422)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.splitlines(text) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-lpeg.lua#L373-L378](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L373-L378)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.splitup(text, separator) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-lpeg.lua#L1171-L1177](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L1171-L1177)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.tobytes(text) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-lpeg.lua#L1163-L1169](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L1163-L1169)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.todec(text) end

---
---__Example:__
---
---```lua
---assert(string.tohex('\xff') == 'ff')
---assert(string.tohex(string.tobytes('ff')) == 'ff')
---assert(string.tohex('\x00') == '00')
---assert(string.tohex('\xAD\xFE\x03\x45') == 'adfe0345')
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-lpeg.lua#L1155-L1161](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L1155-L1161)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.tohex(text) end

---
---__Example:__
---
---```lua
---assert(string.toHEX('\xff') == 'FF')
---assert(string.toHEX(string.tobytes('ff')) == 'FF')
---assert(string.toHEX('\x00') == '00')
---assert(string.toHEX('\xAD\xFE\x03\x45') == 'ADFE0345')
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-lpeg.lua#L1147-L1153](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L1147-L1153)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.toHEX(text) end

_N.unicode = "lualibs-unicode.lua"

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-unicode.lua#L270-L272](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-unicode.lua#L270-L272)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.toutf(text) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-unicode.lua#L1325-L1341](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-unicode.lua#L1325-L1341)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfpadd(text, n) end

_N.util_dim = "lualibs-util-dim.lua"

---
---__Example:__
---
---```lua
---assert(string.todimen(1) == 1)
---assert(string.todimen("1sp") == 1)
---assert(string.todimen("1pt") == 65536)
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L361-L382](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-dim.lua#L361-L382)
---
---@param text string|number
---
---@return integer scaled_points
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.todimen(text) end

_N.util_str = "lualibs-util-str.lua"

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L426-L438](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L426-L438)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.autodouble(s, sep) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L440-L452](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L440-L452)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.autosingle(s, sep) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L467-L475](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L467-L475)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.tracedchar(b) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L648-L650](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L648-L650)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.escapedquotes(s) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L659-L661](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L659-L661)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.unescapedquotes(s) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L1471-L1473](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L1471-L1473)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.optionalquoted(str) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L1477-L1479](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L1477-L1479)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.replacenewlines(str) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-lpeg.lua#L1198-L1200](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-lpeg.lua#L1198-L1200)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.containsws(text, what) end

---
---| result type    | code   | input type                               |
---|----------------|--------|------------------------------------------|
---| integer        | %...i  | number                                   |
---| integer        | %...d  | number                                   |
---| unsigned       | %...u  | number                                   |
---| utf character  | %...c  | number                                   |
---| hexadecimal    | %...x  | number                                   |
---| HEXADECIMAL    | %...X  | number                                   |
---| octal          | %...o  | number                                   |
---| string         | %...s  | string, number                           |
---| float          | %...f  | number                                   |
---| exponential    | %...e  | number                                   |
---| exponential    | %...E  | number                                   |
---| autofloat      | %...g  | number                                   |
---| autofloat      | %...G  | number                                   |
---| force tostring | %...S  | any                                      |
---| force tostring | %Q     | any                                      |
---| force tonumber | %N     | number (strips leading zeros)            |
---| signed number  | %I     | number                                   |
---| rounded number | %r     | number                                   |
---| 0xhexadecimal  | %...h  | character, number                        |
---| 0xHEXADECIMAL  | %...H  | character, number                        |
---| U+hexadecimal  | %...u  | character, number                        |
---| U+HEXADECIMAL  | %...U  | character, number                        |
---| points         | %p     | number in scaled points (65536sp = 1pt)  |
---| basepoints     | %b     | number in scaled points                  |
---| table concat   | %...t  | table                                    |
---| true or false  | %l     | boolean                                  |
---| TRUE or FALSE  | %L     | boolean                                  |
---| number spaces  | %...w  | number                                   |
---| escaped XML    | %!xml! | string                                   |
---| escaped TeX    | %!tex! | string, number                           |
---
---__Example:__
---
---```lua
---assert(string.formatter("String: %s", "string") == "String: string")
---assert(string.formatter("hexadecimal: %h", 15) == "hexadecimal: 0x0000f")
---assert(string.formatter("Hexadecimal: %H", 15) == "Hexadecimal: 0x0000F")
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L1404](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L1404)
---
---@param text string
---@param ... any
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.formatter(text, ...) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L676](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L676)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.texnewlines(text) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L212-L222](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L212-L222)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.utfpadding(text, n) end

---
---__Example:__
---
---```lua
---local fn = string.wordsplitter('two')
---local result = fn('one two three')
---assert(result[1] == 'one')
---assert(result[2] == 'three')
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L1554-L1556](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L1554-L1556)
---
---@param text string
---
---@return fun(text: string): string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/string.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function string.wordsplitter(text) end
