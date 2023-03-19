---@meta

---
---This library provides the interface to *LuaTeX*'s structure representing a
---language, and the associated functions.
lang = {}

---
---The language object is the first argument to most of the other functions in the `lang` library.
---@class Language

---
---Create a new userdata object of type `<language>`.
---
---These functions can also be used as if they were object methods, using the colon
---syntax. Without an argument, the next available internal id number will be
---assigned to this object. With an argument, an object will be created that links to
---the internal language with that id number.
---
---* Corresponding C source code: [llanglib.c#L27-L48](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L27-L48)
---
---@param id integer
---
---@return Language
function lang.new(id) end

---
---* Corresponding C source code: [llanglib.c#L50-L56](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L50-L56)
---
---@param l Language
---
---@return integer # The number returned is the internal `language` id number this object refers to.
function lang.id(l) end

---
---Hyphenate a string directly.
---
---* Corresponding C source code: [llanglib.c#L86-L104](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L86-L104)
---
---@param l Language
---@param n? string
---
---@return string n
function lang.hyphenation(l, n) end

---
---@param l Language
---
---__Reference:__
---
---* Corresponding C source code: [llanglib.c#L215-L221](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L215-L221)
function lang.clear_hyphenation(l) end

---
---@param l Language
---@param o string
---
---* Corresponding C source code: [llanglib.c#L223-L241](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L223-L241)
function lang.clean(l, o) end

---
---@param o string
---
---@return string n
---
---* Corresponding C source code: [llanglib.c#L223-L241](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L223-L241)
function lang.clean(o) end

---
---Return the current
---set.
---
---* Corresponding C source code: [llanglib.c#L58-L76](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param l Language
---
---@return string n
function lang.patterns(l) end

---
---Adds additional patterns for this language object.
---
---* Corresponding C source code: [llanglib.c#L58-L76](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param l Language
---@param n string
function lang.patterns(l, n) end

---
---Clear the pattern dictionary for a language.
---
---* Corresponding C source code: [llanglib.c#L78-L84](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L78-L84)
---
---@param l Language
function lang.clear_patterns(l) end

---
---Gets the value of the *TeX* parameter
---`\hyphenationmin`.
---
---* Corresponding C source code: [llanglib.c#L199-L213](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L199-L213)
---
---@param l Language
---
---@return string n
function lang.hyphenationmin(l) end

---
---Set the value of the *TeX* parameter
---`\hyphenationmin`.
---
---* Corresponding C source code: [llanglib.c#L199-L213](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L199-L213)
---
---@param l Language
---@param n integer
function lang.hyphenationmin(l, n) end

---
---Set the “pre-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L106-L120](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L106-L120)
---
---@param l Language
---@param n integer
function lang.prehyphenchar(l, n) end

---
---Get the “pre-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L106-L120](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L106-L120)
---
---@param l Language
---
---@return integer n
function lang.prehyphenchar(l, n) end

---
---Set the “post-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L122-L136](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L122-L136)
---
---@param l Language
---@param n integer
function lang.posthyphenchar(l, n) end

---
---Get the “post-break” hyphen characters for implicit hyphenation in this language.
---
---The
---intial values are decimal 45 (hyphen) and decimal 0 (indicating emptiness).
---
---* Corresponding C source code: [llanglib.c#L122-L136](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L122-L136)
---
---@param l Language
---
---@return integer n
function lang.posthyphenchar(l, n) end

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
---@param l Language
---@param n integer
function lang.preexhyphenchar(l, n) end

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
---@param l Language
---
---@return integer n
function lang.preexhyphenchar(l, n) end

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
---@param l Language
---@param n integer
function lang.postexhyphenchar(l, n) end

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
---@param l Language
---
---@return integer n
function lang.postexhyphenchar(l, n) end

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
function lang.hyphenate(head, tail) end

---
---Set hj codes.
---
---When you set a hjcode the current sets get initialized unless the set was already
---initialized due to `savinghyphcodes` being larger than zero.
---
---* Corresponding C source code: [llanglib.c#L154-L169](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L154-L169)
---
---@param l Language
---@param char integer
---@param usedchar integer
function lang.sethjcode(l, char,  usedchar) end

---
---Query hj codes.
---
---* Corresponding C source code: [llanglib.c#L171-L181](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llanglib.c#L171-L181)
---
---@param l Language
---@param char number
---
---@return integer usedchar
function lang.gethjcode(l, char) end
