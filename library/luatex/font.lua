---@meta
---The font library provides the interface into the internals of the font system,
---and it also contains helper functions to load traditional *TeX* font metrics
---formats. Other font loading functionality is provided by the `fontloader`
---library that will be discussed in the next section.
font = {}

---
---Load a TFM (`TeX` font metric) file.
---
---__Example:__
---
---```lua
---font.read_tfm('cmr10', tex.sp('10pt'))
---```
---
---@param name string
---@param s integer # If `s` is positive, it specifies an “at size” in scaled points. If `s` is negative, its absolute value represents a “scaled” setting relative to the designsize of the font.
---
---@return table
function font.read_tfm(name, s) end

---
---Load a VF (virtual font) file.
---
---__Example:__
---
---```lua
---font.read_vf('ptmr8t', tex.sp('8pt'))
---```
---
---The meaning of the number `s` and the format of the returned table are
---similar to the ones in the `read_tfm` function.
---@param s integer # If `s` is positive, it specifies an “at size” in scaled points. If `s` is negative, its absolute value represents a “scaled” setting relative to the designsize of the font.
function font.read_vf(name, s) end

---
---The whole table of *TeX* fonts is accessible from *Lua* using a virtual array.
---Because this is a virtual array, you cannot call `pairs` on it, but see
---below for the `font.each` iterator.
font.fonts = {}

---
---@param n integer
---@param f table
function font.setfont(n, f) end

---
---Note that at the moment, each access to the `font.fonts` or call to `font.getfont` creates a *Lua* table for the whole font unless you cached it.
---@param n integer
---
---@return table f
function font.getfont(n) end

---
---Copy the internal data of a font.
---
---@param n integer
---
---@return table f
function font.getcopy(n) end

---
---Return a table of the parameters as known to *TeX*. These can be
---different from the ones in the cached table.
---
---@param n integer
---
---@return table p
function font.getparameters(n) end

---
---Test for the status of a font
---
---The return value is one of `true` (unassignable), `false` (can be
---changed) or `nil` (not a valid font at all).
---@param n integer
---
---@return boolean|nil
function font.frozen(n) end

---
---Define a font into `font.fonts`.
---
---@param f table
---
---@return integer i
function font.define(f) end

---
---An alternative call is:
---
---Where the first argument is a reserved font id (see below).
---
---@param n integer
---@param f table
---
---@return integer i
function font.define(n, f) end

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
function font.originaleach() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function font.setexpansion() end
