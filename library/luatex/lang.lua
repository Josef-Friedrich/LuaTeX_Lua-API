---@meta

---
---This library provides the interface to *LuaTeX*'s structure representing a
---language, and the associated functions.
lang = {}

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
---* Corresponding C source code: [llanglib.c#L27-L48](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L27-L48)
---
---@param id integer
---
---@return Language
function lang.new(id) end

---
---* Corresponding C source code: [llanglib.c#L50-L56](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L50-L56)
---
---@param l Language
---
---@return integer # The number returned is the internal `language` id number this object refers to.
function lang.id(l) end

---
---Hyphenate a string directly.
---
---* Corresponding C source code: [llanglib.c#L86-L104](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L86-L104)
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
---* Corresponding C source code: [llanglib.c#L215-L221](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L215-L221)
function lang.clear_hyphenation(l) end

---
---@param l Language
---@param o string
---
---* Corresponding C source code: [llanglib.c#L223-L241](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L223-L241)
function lang.clean(l, o) end

---
---@param o string
---
---@return string n
---
---* Corresponding C source code: [llanglib.c#L223-L241](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L223-L241)
function lang.clean(o) end

---
---* Corresponding C source code: [llanglib.c#L58-L76](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param l Language
---
---@return string n
function lang.patterns(l) end

---
---* Corresponding C source code: [llanglib.c#L58-L76](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L58-L76)
---
---@param l Language
---@param n string
function lang.patterns(l, n) end

---
---* Corresponding C source code: [llanglib.c#L78-L84](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L78-L84)
---
---@param l Language
function lang.clear_patterns(l) end

---
---* Corresponding C source code: [llanglib.c#L199-L213](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L199-L213)
---
---@param l Language
---
---@return string n
function lang.hyphenationmin(l) end

---
---* Corresponding C source code: [llanglib.c#L199-L213](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L199-L213)
---
---@param l Language
---@param n integer
function lang.hyphenationmin(l, n) end

---
---* Corresponding C source code: [llanglib.c#L243-L261](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L243-L261)
function lang.hyphenate() end

---
---* Corresponding C source code: [llanglib.c#L183-L197](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L183-L197)
function lang.postexhyphenchar() end

---
---
---* Corresponding C source code: [llanglib.c#L138-L152](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L138-L152)
function lang.preexhyphenchar() end

---
---* Corresponding C source code: [llanglib.c#L106-L120](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L106-L120)
function lang.prehyphenchar() end

---
---* Corresponding C source code: [llanglib.c#L122-L136](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L122-L136)
function lang.posthyphenchar() end

---
---* Corresponding C source code: [llanglib.c#L154-L169](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L154-L169)
function lang.sethjcode() end

---
---* Corresponding C source code: [llanglib.c#L171-L181](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/llanglib.c#L171-L181)
function lang.gethjcode() end
