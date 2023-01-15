---@meta

---
---This library provides the interface to *LuaTeX*'s structure representing a
---language, and the associated functions.
lang = {}

---@class Language

---
---Create a new userdata object of type `<language>`.
---
---This object the first argument to most of the other functions in the `lang` library.
---These functions can also be used as if they were object methods, using the colon
---syntax. Without an argument, the next available internal id number will be
---assigned to this object. With argument, an object will be created that links to
---the internal language with that id number.
---
---@param id integer
---
---@return Language
function lang.new(id) end

---
---@param l Language
---
---@return integer # The number returned is the internal `language` id number this object refers to.
function lang.id(l) end

---
---Hyphenate a string directly.
---
---@param l Language
---@param n? string
---
---@return string n
function lang.hyphenation(l, n) end

---
---@param l Language
function lang.clear_hyphenation(l) end

---
---@param l Language
---@param o string
function lang.clean(l, o) end

---
---@param o string
---
---@return string n
function lang.clean(o) end

---
---@param l Language
---
---@return string n
function lang.patterns(l) end

---
---@param l Language
---@param n string
function lang.patterns(l, n) end

---
---@param l Language
function lang.clear_patterns(l) end

---
---@param l Language
---
---@return string n
function lang.hyphenationmin(l) end

---
---@param l Language
---@param n integer
function lang.hyphenationmin(l, n) end

------------------------------------------------------------------------
---Undocumented functions listed in alphabetical order
---
---Document them by sliding them up and place them in the order of the
---official documentation
------------------------------------------------------------------------

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lang.gethjcode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lang.hyphenate() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lang.postexhyphenchar() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lang.posthyphenchar() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lang.preexhyphenchar() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lang.prehyphenchar() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lang.sethjcode() end
