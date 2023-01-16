---@meta
---The font library provides the interface into the internals of the font system,
---and it also contains helper functions to load traditional *TeX* font metrics
---formats. Other font loading functionality is provided by the `fontloader`
---library that will be discussed in the next section.
font = {}

---
---The number is a bit special:
---
---* If it is positive, it specifies an “at size” in scaled points.
---
---* If it is negative, its absolute value represents a “scaled”
---    setting relative to the designsize of the font.
---
---@param name string
---@param s number
---
---@return table
function font.read_tfm(name, s) end

---
---The table passed can have the fields `characters` which is a (sub)table
---like the one used in define, and for virtual fonts a `fonts` table can be
---added. The characters defined in the `characters` table are added (when not
---yet present) or replace an existing entry. Keep in mind that replacing can have
---side effects because a character already can have been used. Instead of posing
---restrictions we expect the user to be careful. (The `setfont` helper is
---a more drastic replacer.)
function font.addcharacters(n, t) end

---
---Return the font id number that would be returned by a `font.define`
---call if it was executed at this spot in the code flow.
---
---This is useful for virtual
---fonts that need to reference themselves. If you pass `true` as argument,
---the id gets reserved and you can pass to `font.define` as first argument.
---This can be handy when you create complex virtual fonts.
---
---@return integer i
function font.nextid() end

---
---Return the font id associated with `csname`, or `-1` if `csname` is not defined.
---
---@param csname string
---
---@return integer i
function font.id(csname) end

---
---Get the largest used index in `font.fonts`.
---
---@return integer i # The largest used index in `font.fonts`.
function font.max() end

---
---Get or set the currently used font number.
---
---@param i? integer
---
---@return number i
function font.current(i) end

---
---Iterate over all fonts.
---
---This is an iterator over each of the defined *TeX* fonts. The first returned
---value is the index in `font.fonts`, the second the font itself, as a *Lua*
---table. The indices are listed incrementally, but they do not always form an array
---of consecutive numbers: in some cases there can be holes in the sequence.
function font.each() end

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
function font.define() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function font.frozen() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function font.getcopy() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function font.getfont() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function font.getparameters() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function font.originaleach() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function font.read_vf() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function font.setexpansion() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function font.setfont() end
