---@meta
---
---The fontloader library is sort of independent of the rest in the sense that it
---can load font into a *Lua* table that then can be converted into a table suitable
---for *TeX*. The library is an adapted subset of *FontForge* and as such gives a
---similar view on a font (which has advantages when you want to debug).
fontloader = {}

---@class FontInfo
---@field fontname string # the *PostScript* name of the font
---@field fullname string # the formal name of the font
---@field familyname string # the family name this font belongs to
---@field weight string # a string indicating the color value of the font
---@field version string # the internal font version
---@field italicangle number # the slant angle
---@field units_per_em number # 1000 for *PostScript*-based fonts, usually 2048 for *TrueType*NC \NR
---@field pfminfo table # see fontloaderpfminfotable

---
---This function returns either `nil`, or a `table`, or an array of
---small tables (in the case of a *TrueType* collection). The returned table(s) will
---contain some fairly interesting information items from the font(s) defined by the
---file.
---
---Getting information through this function is (sometimes much) more efficient than
---loading the font properly, and is therefore handy when you want to create a
---dictionary of available fonts based on a directory contents.
---
---@param filename string
---
---@return FontInfo
function fontloader.info(filename) end

---
---If you want to use an *OpenType* font, you have to get the metric information
---from somewhere. Using the `fontloader` library, the simplest way to get
---that information is thus:
---
---```lua
---function load_font (filename)
---  local metrics = nil
---  local font = fontloader.open(filename)
---  if font then
---     metrics = fontloader.to_table(font)
---     fontloader.close(font)
---  end
---  return metrics
---end
---
---myfont = load_font('/opt/tex/texmf/fonts/data/arial.ttf')
---```
---
---@param filename string
---@param fontname string
---
---@return userdata f # The first return value is a userdata representation of the font.
---@return table w # The second return value is a table containing any warnings and errors reported by fontloader while opening the font. In normal typesetting, you would probably ignore the second argument, but it can be useful for debugging purposes.
function fontloader.open(filename, fontname) end

---
---@param font userdata
---
---@return table f
function fontloader.to_table(font) end

---
---@param font userdata
function fontloader.close(font) end

---
---@param font userdata
---@param filename string
---
---@return table errors
function fontloader.apply_featurefile(font, filename) end

---
---@param font userdata
---@param filename string
---
---@return table errors
function fontloader.apply_afmfile(font, filename) end

---
---@param font userdata
---
---@return table fields
function fontloader.fields(font) end

---
---@param font_glyph userdata
---
---@return table fields
function fontloader.fields(font_glyph) end
