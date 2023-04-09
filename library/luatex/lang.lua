---@meta

---
---This library provides the interface to *LuaTeX*'s structure representing a
---language, and the associated functions.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
lang = {}

---
---The language object is the first argument to most of the other functions in the `lang` library.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class Language

_N._5_8_1_new_and_id = 83

---
---Create a new language object, with an optional fixed id number.
---
---Create a new userdata object of type `<language>`.
---
---These functions can also be used as if they were object methods, using the colon
---syntax.
---
---* Corresponding C source code: [llanglib.c#L27-L48](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L27-L48)
---
---@param id? integer # Without an argument, the next available internal id number will be assigned to this object. With an argument, an object will be created that links to the internal language with that id number.
---
---@return Language
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.new(id) end

---
---Returns the current internal `language` id number.
---
---* Corresponding C source code: [llanglib.c#L50-L56](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L50-L56)
---
---@param language Language
---
---@return integer # The number returned is the internal `language` id number this object refers to.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.id(language) end

_N._5_8_2_hyphenation = 84

---
---Get or set hyphenation exceptions.
---
---Hyphenate a string directly.
---
---* Corresponding C source code: [llanglib.c#L86-L104](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L86-L104)
---
---@param language Language
---@param n? string
---
---@return string n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.hyphenation(language, n) end

_N._5_8_3_clear_hyphenation_and_clean = 84

---
---Clear the set of hyphenation exceptions.
---
---@param language Language
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L215-L221](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L215-L221)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.clear_hyphenation(language) end

---
---Clear the exception dictionary (string) for this language.
---
---* Corresponding C source code: [llanglib.c#L223-L241](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L223-L241)
---
---@param language Language
---@param o string
---
---@return string n
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.clean(language, o) end

---
---Clear the exception dictionary (string) for this language.
---
---* Corresponding C source code: [llanglib.c#L223-L241](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L223-L241)
---
---@param o string
---
---@return string n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.clean(o) end

_N._5_8_4_patterns_and_clear_patterns = 84

---
---Return the current
---set.
---
---* Corresponding C source code: [llanglib.c#L58-L76](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param language Language
---
---@return string n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.patterns(language) end

---
---Add additional patterns for this language object.
---
---* Corresponding C source code: [llanglib.c#L58-L76](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param language Language
---@param n string
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.patterns(language, n) end

---
---Clear the set of hyphenation patterns.
---
---Clear the pattern dictionary for a language.
---
---* Corresponding C source code: [llanglib.c#L78-L84](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L78-L84)
---
---@param language Language
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.clear_patterns(language) end

_N._5_8_5_hyphenationmin = 84

---
---Gets the value of the *TeX* parameter
---`\hyphenationmin`.
---
---* Corresponding C source code: [llanglib.c#L199-L213](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L199-L213)
---
---@param language Language
---
---@return string n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.hyphenationmin(language) end

---
---Set the value of the *TeX* parameter
---`\hyphenationmin`.
---
---* Corresponding C source code: [llanglib.c#L199-L213](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L199-L213)
---
---@param language Language
---@param n integer
function lang.hyphenationmin(language, n) end

_N._5_8_6_pre_post_ex_hyphenchar = 84

---
---Set the “pre-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L106-L120](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L106-L120)
---
---@param language Language
---@param n integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.prehyphenchar(language, n) end

---
---Get the “pre-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L106-L120](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L106-L120)
---
---@param language Language
---
---@return integer n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.prehyphenchar(language, n) end

---
---Set the “post-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L122-L136](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L122-L136)
---
---@param language Language
---@param n integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.posthyphenchar(language, n) end

---
---Get the “post-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L122-L136](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L122-L136)
---
---@param language Language
---
---@return integer n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.posthyphenchar(language, n) end

---
---Set the “pre-break”  hyphen
---characters for explicit hyphenation in this language.
---
---The hyphen
---character is initially
---decimal `0` (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L138-L152](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L138-L152)
---
---@param language Language
---@param n integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.preexhyphenchar(language, n) end

---
---Get the “pre-break” hyphen
---characters for explicit hyphenation in this language.
---
---The hyphen
---character is initially
---decimal `0` (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L138-L152](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L138-L152)
---
---@param language Language
---
---@return integer n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.preexhyphenchar(language, n) end

---
---Set the “post-break” hyphen
---characters for explicit hyphenation in this language.
---
---The hyphen
---character is initially
---decimal `0` (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L183-L197](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L183-L197)
---
---@param language Language
---@param n integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.postexhyphenchar(language, n) end

---
---Get the “post-break” hyphen
---characters for explicit hyphenation in this language.
---
---The hyphen
---character is initially
---decimal `0` (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L183-L197](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L183-L197)
---
---@param language Language
---
---@return integer n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.postexhyphenchar(language, n) end

_N._5_8_7_hyphenate = 85

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
---* Corresponding C source code: [llanglib.c#L243-L261](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L243-L261)
---
---@param head Node
---@param tail? Node
---
---@return boolean success
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.hyphenate(head, tail) end

_N._5_8_8_set_get_hjcode = 85

---
---Set hj codes.
---
---When you set a hjcode the current sets get initialized unless the set was already
---initialized due to `\savinghyphcodes` being larger than zero.
---
---* Corresponding C source code: [llanglib.c#L154-L169](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L154-L169)
---
---@param language Language
---@param char integer
---@param usedchar integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.sethjcode(language, char, usedchar) end

---
---Query hj codes.
---
---* Corresponding C source code: [llanglib.c#L171-L181](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L171-L181)
---
---@param language Language
---@param char number
---
---@return integer usedchar
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.gethjcode(language, char) end
