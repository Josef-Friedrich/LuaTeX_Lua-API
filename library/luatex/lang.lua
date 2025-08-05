-- ----------------------------------------------------------------------------
-- Copyright (C) 2022-2025 by Josef Friedrich <josef@friedrich.rocks>
-- ----------------------------------------------------------------------------
--
-- This program is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation, either version 2 of the License, or (at your
-- option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
-- Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program. If not, see <https://www.gnu.org/licenses/>.
--
-- ----------------------------------------------------------------------------

---
---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

_N._5_8_the_lang_library = "page 83"

---
---@meta
---
---This library provides the interface to *LuaTeX*'s structure representing a
---language, and the associated functions.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
lang = {}

---
---The language object is the first argument to most of the other functions in the `lang` library.
---
---__Reference:__
---
---* Corresponding C source code: [texlang.c#L55-62](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lang/texlang.c#L55-62)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class Language
Language = {}

_N._5_8_1_new_and_id = "page 83"

---
---Create a new language object, with an optional fixed id number.
---
---__Example:__
---
---```lua
---local l1 = lang.new()
---print(l1:id())
----- 1
---
---local l42 = lang.new(42)
---print(l42:id())
----- 42
---```
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L27-L48](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L27-L48)
---* https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-languages.tex#L944-954
---
---@param id? integer # Without an argument, the next available internal id number will be assigned to this object. With an argument, an object will be created that links to the internal language with that id number.
---
---@return Language # The language object.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.new(id) end

---
---Return the current internal `language` id number.
---
---__Example:__
---
---```lua
---local l = lang.new(123)
---print(lang.id(l))
----- 123
---```
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L50-L56](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L50-L56)
---* https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-languages.tex#L956-960
---
---@param language Language # The language object.
---
---@return integer # The number returned is the internal `language` id number this object refers to.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.id(language) end

---
---Return the current internal `language` id number.
---
---__Example:__
---
---```lua
---local l = lang.new(123)
---print(l:id())
----- 123
---```
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L50-L56](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L50-L56)
---* https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-languages.tex#L956-960
---
---@return integer # The number returned is the internal `language` id number this object refers to.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function Language:id() end

_N._5_8_2_hyphenation = "page 84"

---
---Add hyphenation exceptions.
---
---__Example:__
---
---```lua
---local l = lang.new()
---lang.hyphenation(l, "man-u-script")
---print(lang.hyphenation(l)) -- man-u-script
---lang.hyphenation(l, "ca-tas-tro-phe")
---print(lang.hyphenation(l)) -- man-u-script ca-tas-tro-phe
---```
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L86-L104](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L86-L104)
---* https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-languages.tex#L968-980
---
---@param language Language # The language object.
---@param hyphenation_exceptions string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.hyphenation(language, hyphenation_exceptions) end

---
---Add hyphenation exceptions.
---
---__Example:__
---
---```lua
---local l = lang.new()
---l:hyphenation("man-u-script")
---print(l:hyphenation()) -- man-u-script
---l:hyphenation("ca-tas-tro-phe")
---print(l:hyphenation()) -- man-u-script ca-tas-tro-phe
---```
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L86-L104](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L86-L104)
---* https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-languages.tex#L968-980
---
---@param hyphenation_exceptions string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function Language:hyphenation(hyphenation_exceptions) end

---
---Get the hyphenation exceptions.
---
---__Example:__
---
---```lua
---local l = lang.new()
---lang.hyphenation(l, "man-u-script")
---print(lang.hyphenation(l)) -- man-u-script
---```
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L86-L104](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L86-L104)
---* https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-languages.tex#L968-980
---
---@param language Language # The language object.
---
---@return string|nil hyphenation_exceptions
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.hyphenation(language) end

---
---Get the hyphenation exceptions.
---
---__Example:__
---
---```lua
---local l = lang.new()
---l:hyphenation("man-u-script")
---print(l:hyphenation()) -- man-u-script
---```
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L86-L104](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L86-L104)
---* https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-languages.tex#L968-980
---
---@return string|nil hyphenation_exceptions
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function Language:hyphenation() end

_N._5_8_3_clear_hyphenation_and_clean = "page 84"

---
---Clear the set of hyphenation exceptions.
---
---__Example:__
---
---```lua
---local l = lang.new()
---print(lang.hyphenation(l)) -- nil
---lang.hyphenation(l, "man-u-script")
---lang.hyphenation(l, "ca-tas-tro-phe")
---print(lang.hyphenation(l)) --  man-u-script ca-tas-tro-phe
---lang.clear_hyphenation(l)
---print(lang.hyphenation(l)) -- nil
---```
---
---@param language Language
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L215-L221](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L215-L221)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.clear_hyphenation(language) end

---
---Clear the set of hyphenation exceptions.
---
---__Example:__
---
---```lua
---local l = lang.new()
---print(l:hyphenation()) -- nil
---lang.hyphenation(l, "man-u-script")
---lang.hyphenation(l, "ca-tas-tro-phe")
---print(lang.hyphenation(l)) --  man-u-script ca-tas-tro-phe
---lang.clear_hyphenation(l)
---print(lang.hyphenation(l)) -- nil
---```
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L215-L221](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L215-L221)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function Language:clear_hyphenation() end

---
---Clear the exception dictionary (string) for this language.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L223-L241](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L223-L241)
---
---@param language Language # The language object.
---@param o string
---
---@return string n
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.clean(language, o) end

---
---Clear the exception dictionary (string) for this language.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L223-L241](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L223-L241)
---
---@param o string # The language object.
---
---@return string n
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.clean(o) end

_N._5_8_4_patterns_and_clear_patterns = "page 84"

---
---Add additional patterns for this language object.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L58-L76](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param language Language # The language object.
---@param patterns string # For example `.ab3a .abb2 .ab5erk`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.patterns(language, patterns) end

---
---Add additional patterns for this language object.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L58-L76](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param patterns string # For example `.ab3a .abb2 .ab5erk`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function Language:patterns(patterns) end

---
---Return the current set of patterns.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L58-L76](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param language Language # The language object.
---
---@return string|nil pattterns # For example `.ab3a .abb2 .ab5erk`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.patterns(language) end

---
---Return the current set of patterns.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L58-L76](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@return string|nil pattterns # For example `.ab3a .abb2 .ab5erk`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function Language:patterns() end

---
---Clear the set of hyphenation patterns.
---
---Clear the pattern dictionary for a language.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L78-L84](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L78-L84)
---
---@param language Language
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.clear_patterns(language) end

_N._5_8_5_hyphenationmin = "page 84"

---
---Set the value of the *TeX* parameter
---`\hyphenationmin`.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L199-L213](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L199-L213)
---
---@param language Language
---@param min integer
function lang.hyphenationmin(language, min) end

---
---Get the value of the *TeX* parameter
---`\hyphenationmin`.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L199-L213](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L199-L213)
---
---@param language Language # The language object.
---
---@return integer min
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.hyphenationmin(language) end

_N._5_8_6_pre_post_ex_hyphenchar = "page 84"

---
---Set the “pre-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L106-L120](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L106-L120)
---
---@param language Language # The language object.
---@param char integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.prehyphenchar(language, char) end

---
---Get the “pre-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L106-L120](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L106-L120)
---
---@param language Language # The language object.
---
---@return integer char
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.prehyphenchar(language) end

---
---Set the “post-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L122-L136](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L122-L136)
---
---@param language Language # The language object.
---@param char integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.posthyphenchar(language, char) end

---
---Get the “post-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L122-L136](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L122-L136)
---
---@param language Language # The language object.
---
---@return integer char
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.posthyphenchar(language) end

---
---Set the “pre-break” hyphen
---characters for explicit hyphenation in this language.
---
---The hyphen
---character is initially
---decimal `0` (indicating emptiness).
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L138-L152](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L138-L152)
---
---@param language Language # The language object.
---@param char integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.preexhyphenchar(language, char) end

---
---Get the “pre-break” hyphen
---characters for explicit hyphenation in this language.
---
---The hyphen
---character is initially
---decimal `0` (indicating emptiness).
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L138-L152](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L138-L152)
---
---@param language Language # The language object.
---
---@return integer char
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.preexhyphenchar(language) end

---
---Set the “post-break” hyphen
---characters for explicit hyphenation in this language.
---
---The hyphen
---character is initially
---decimal `0` (indicating emptiness).
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L183-L197](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L183-L197)
---
---@param language Language # The language object.
---@param char integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.postexhyphenchar(language, char) end

---
---Get the “post-break” hyphen
---characters for explicit hyphenation in this language.
---
---The hyphen
---character is initially
---decimal `0` (indicating emptiness).
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L183-L197](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L183-L197)
---
---@param language Language # The language object.
---
---@return integer char
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.postexhyphenchar(language) end

_N._5_8_7_hyphenate = "page 85"

---
---Hyphenate a node list.
---
---Insert hyphenation points (discretionary nodes) in a node list.
---
---If
---`tail` is given as argument, processing stops on that node. Currently,
---`success` is always true if `head` (and `tail`, if specified)
---are proper nodes, regardless of possible other errors.
---
---Hyphenation works only on “characters”, a special subtype of all the glyph
---nodes with the node subtype having the value `1`. Glyph modes with
---different subtypes are not processed.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L243-L261](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L243-L261)
---
---@param head Node
---@param tail? Node
---
---@return boolean success
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.hyphenate(head, tail) end

_N._5_8_8_set_get_hjcode = "page 85"

---
---Set hj codes.
---
---When you set a hjcode the current sets get initialized unless the set was already
---initialized due to `\savinghyphcodes` being larger than zero.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L154-L169](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L154-L169)
---
---@param language Language # The language object.
---@param char integer
---@param used_char integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.sethjcode(language, char, used_char) end

---
---Query hj codes.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L171-L181](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L171-L181)
---
---@param language Language # The language object.
---@param char number
---
---@return integer used_char
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.gethjcode(language, char) end
