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
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class Language

_N._5_8_1_new_and_id = "page 83"

---
---Create a new language object, with an optional fixed id number.
---
---Create a new userdata object of type `<language>`.
---
---These functions can also be used as if they were object methods, using the colon
---syntax.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L27-L48](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L27-L48)
---
---@param id? integer # Without an argument, the next available internal id number will be assigned to this object. With an argument, an object will be created that links to the internal language with that id number.
---
---@return Language
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.new(id) end

---
---Returns the current internal `language` id number.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L50-L56](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L50-L56)
---
---@param language Language
---
---@return integer # The number returned is the internal `language` id number this object refers to.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.id(language) end

_N._5_8_2_hyphenation = "page 84"

---
---Set hyphenation exceptions.
---
---Hyphenate a string directly.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L86-L104](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L86-L104)
---
---@param language Language
---@param n string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.hyphenation(language, n) end

---
---Get hyphenation exceptions.
---
---Hyphenate a string directly.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L86-L104](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L86-L104)
---
---@param language Language
---
---@return string n
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.hyphenation(language) end

_N._5_8_3_clear_hyphenation_and_clean = "page 84"

---
---Clear the set of hyphenation exceptions.
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
---Clear the exception dictionary (string) for this language.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L223-L241](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L223-L241)
---
---@param language Language
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
---@param o string
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
---@param language Language
---@param patterns string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.patterns(language, patterns) end

---
---Return the current
---set.
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L58-L76](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param language Language
---
---@return string pattterns
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.patterns(language) end

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
---@param language Language
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
---@param language Language
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
---@param language Language
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
---@param language Language
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
---@param language Language
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
---@param language Language
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
---@param language Language
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
---@param language Language
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
---@param language Language
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
---@param language Language
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
---@param language Language
---@param char number
---
---@return integer used_char
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lang.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lang.gethjcode(language, char) end
