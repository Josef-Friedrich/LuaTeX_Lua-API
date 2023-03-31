---@meta
---The font library provides the interface into the internals of the font system,
---and it also contains helper functions to load traditional *TeX* font metrics
---formats. Other font loading functionality is provided by the `fontloader`
---library that will be discussed in the next section.
font = {}

---
---|  command  | arguments | type             | description |
---|-----------|-----------|------------------|-------------|
---| `font`    | 1         | number           | select a new font from the local `fonts table |
---| `char`    | 1         | number           | typeset this character number from the current font, and move right by the character's width |
---| `node`    | 1         | node             | output this node # (list), and move right by the width of this list |
---| `slot`    | 2         | 2 numbers        | a shortcut for the combination of a font and char command |
---| `push`    | 0         |                  | save current position |
---| `nop`     | 0         |                  | do nothing |
---| `pop`     | 0         |                  | pop position |
---| `rule`    | 2         | 2 numbers        | output a rule `ht*wd`, and move right. |
---| `down`    | 1         | number           | move down on the page |
---| `right`   | 1         | number           | move right on the page |
---| `special` | 1         | string           | output a `special` command |
---| `pdf`     | 2         | 2 strings        | output a *PDF* literal, the first string is one of `origin`, `page`, `text`, `font`, `direct` or `raw`; if you have one string only `origin` is assumed |
---| `lua`     | 1         | string, function | execute a *Lua* script when the glyph is embedded; in case of a function it gets the font id and character code passed |
---| `image`   | 1         | image            | output an image (the argument can be either an `<image>` variable or an `image_spec` table) |
---| `comment` | any       | any              | the arguments of this command are ignored |
---
---__Example:__
---
---```lua
---commands = {
---    { "push" },                     -- remember where we are
---    { "right", 5000 },              -- move right about 0.08pt
---    { "font", 3 },                  -- select the fonts[3] entry
---    { "char", 97 },                 -- place character 97 (ASCII 'a')
--- -- { "slot", 2, 97 },              -- an alternative for the previous two
---    { "pop" },                      -- go all the way back
---    { "down", -200000 },            -- move upwards by about 3pt
---    { "special", "pdf: 1 0 0 rg" }  -- switch to red color
--- -- { "pdf", "origin", "1 0 0 rg" } -- switch to red color (alternative)
---    { "rule", 500000, 20000 }       -- draw a bar
---    { "special", "pdf: 0 g" }       -- back to black
--- -- { "pdf", "origin", "0 g" }      -- back to black (alternative)
---}
---```
---
---@alias Commands any[]

---
---@class Character
---@field width number # The character's width, in sp (default 0)
---@field height number # The character's height, in sp (default 0)
---@field depth number # The character's depth, in sp (default 0)
---@field italic number # The character's italic correction, in sp (default zero)
---@field top_accent number # The character's top accent alignment place, in sp (default zero)
---@field bot_accent number # The character's bottom accent alignment place, in sp (default zero)
---@field left_protruding number # The character's `lpcode`
---@field right_protruding number # The character's `rpcode`
---@field expansion_factor number # The character's `efcode`
---@field tounicode string # The character's *Unicode* equivalent(s), in *UTF-8*-16BE hexadecimal format
---@field next number # The “next larger” character index
---@field extensible table # The constituent parts of an extensible recipe
---@field vert_variants table # The constituent parts of a vertical variant set
---@field horiz_variants table # The constituent parts of a horizontal variant set
---@field kerns table # The kerning information
---@field ligatures table # lThe igaturing information
---@field commands Commands # The virtual font commands
---@field name string # The character (*PostScript*) name
---@field index number # The (*OpenType* or *TrueType*) font glyph index
---@field used boolean # Already typeset (default: false)
---@field mathkern table # The math cut-in specifications

---
---@alias FontType
---|`real` # this is a base font
---|`virtual` # this is a virtual font

---
---@alias FontFormat
---|`type1` # this is a *PostScript* *Type1* font
---|`type3` # this is a bitmapped (*pk*) font
---|`truetype` # this is a *TrueType* or *TrueType*-based *OpenType* font
---|`opentype` # this is a *PostScript*-based *OpenType* font
---

---
---@alias FontEmbedding
---|`no` # don't embed the font at all
---|`subset` # include and atttempt to subset the font
---|`full` # include this font in its entirety

---
---All *TeX* fonts are represented to *Lua* code as tables, and internally as
---*C code* structures. All keys in the table below are saved in the internal font
---structure if they are present in the table returned by the `define_font`
---callback, or if they result from the normal *tfm*/*vf* reading routines if there
---is no `define_font` callback defined.
---
---@class Font
---@field name string # metric (file) name
---@field area string # (directory) location, typically empty
---@field used boolean # indicates usage (initial: false)
---@field characters table<integer, Character> # the defined glyphs of this font
---@field checksum number # default: 0
---@field designsize number # expected size (default: 655360 == 10pt)
---@field direction number # default: 0
---@field encodingbytes number # default: depends on `format`
---@field encodingname string # encoding name
---@field fonts table # locally used fonts
---@field psname string # This is the *PostScript* fontname in the incoming font source, and it's used as fontname identifier in the *PDF* output. This has to be a valid string, e.g.\ no spaces and such, as the backend will not do a cleanup. This gives complete control to the loader.
---@field fullname string # output font name, used as a fallback in the *PDF* output if the `psname` is not set
---@field subfont number # default: 0, index in (`ttc`) font with multiple fonts
---@field header string # header comments, if any
---@field hyphenchar number # default: *TeX*'s `hyphenchar`
---@field parameters table # default: 7 parameters, all zero
---@field size number # the required scaling (by default the same as designsize)
---@field skewchar number # default: *TeX*'s `skewchar`
---@field type FontType # basic type of this font
---@field format FontFormat # disk format type
---@field embedding FontEmbedding # *PDF* inclusion
---@field filename string # the name of the font on disk
---@field tounicode number # When this is set to 1 *LuaTeX* assumes per-glyph tounicode entries are present in the font.
---@field stretch number # the “stretch” value from `expandglyphsinfont`
---@field shrink number # the “shrink” value from `expandglyphsinfont`
---@field step number # the “step” value from `expandglyphsinfont`
---@field expansion_factor number # the actual expansion factor of an expanded font
---@field attributes string # the `pdffontattr`
---@field cache string # This key controls caching of the *Lua* table on the *TeX* end where `yes` means: use a reference to the table that is passed to *LuaTeX* (this is the default), and `no` means: don't store the table reference, don't cache any *Lua* data for this font while `renew` means: don't store the table reference, but save a reference to the table that is created at the first access to one of its fields in the font.
---@field nomath boolean # This key allows a minor speedup for text fonts. If it is present and true, then *LuaTeX* will not check the character entries for math-specific keys.
---@field oldmath boolean # This key flags a font as representing an old school *TeX* math font and disables the *OpenType* code path.
---@field slant number # This parameter will tilt the font and does the same as `SlantFont` in the map file for *Type1* fonts.
---@field extend number # This parameter will scale the font horizontally and does the same as `ExtendFont` in the map file for *Type1* fonts.
---@field squeeze number # This parameter will scale the font vertically and has no equivalent in the map file.
---@field width number # The backend will inject *PDF* operators that set the penwidth. The value is (as usual in *TeX*) divided by 1000. It works with the `mode` file.
---@field mode number # The backend will inject *PDF* operators that relate to the drawing mode with 0 being a fill, 1 being an outline, 2 both draw and fill and 3 no painting at all.
---

---
---@class VfFont
---@field name string # metric (file) name
---@field characters table<integer, Character> # the defined glyphs of this font
---@field checksum number # default: 0
---@field fonts table # locally used fonts
---@field header string # header comments, if any
---@field type string # basic type of this font

---
---@class TfmFont
---@field name string # metric (file) name
---@field area string # (directory) location, typically empty
---@field used boolean # indicates usage (initial: false)
---@field characters table<integer, Character> # the defined glyphs of this font
---@field checksum number # default: 0
---@field designsize number # expected size (default: 655360 == 10pt)
---@field direction number # default: 0
---@field parameters table # default: 7 parameters, all zero
---@field size number # the required scaling (by default the same as designsize)
---@field tounicode number # When this is set to 1 *LuaTeX* assumes per-glyph tounicode entries are present in the font.

---
---Load a TFM (`TeX` font metric) file.
---
---__Example:__
---
---```lua
---font.read_tfm('cmr10', tex.sp('10pt'))
---```
---
---* Corresponding C source code: [lfontlib.c#L38-L64](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L38-L64)
---
---@param name string
---@param at_size integer # If `at_size` is positive, it specifies an “at size” in scaled points. If `at_size` is negative, its absolute value represents a “scaled” setting relative to the designsize of the font.
---
---@return TfmFont
function font.read_tfm(name, at_size) end

---
---Load a VF (virtual font) file.
---
---__Example:__
---
---```lua
---font.read_vf('ptmr8t', tex.sp('8pt'))
---```
---
---The meaning of the number `at_size` and the format of the returned table are
---similar to the ones in the `read_tfm` function.
---
---* Corresponding C source code: [lfontlib.c#L67-L83](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L67-L83)
---
---@param at_size integer # If `s` is positive, it specifies an “at size” in scaled points. If `at_size` is negative, its absolute value represents a “scaled” setting relative to the designsize of the font.
---
---@return VfFont
function font.read_vf(name, at_size) end

---
---The whole table of *TeX* fonts is accessible from *Lua* using a virtual array.
---Because this is a virtual array, you cannot call `pairs` on it
font.fonts = {}

---
---* Corresponding C source code: [lfontlib.c#L156-L173](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L156-L173)
---
---@param font_id integer
---@param f Font
function font.setfont(font_id, f) end

---
---Note that at the moment, each access to the `font.fonts` or call to `font.getfont` creates a *Lua* table for the whole font unless you cached it.
---
---* Corresponding C source code: [lfontlib.c#L251-L258](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L251-L258)
---
---@param font_id integer
---
---@return table Font
function font.getfont(font_id) end

---
---Copy the internal data of a font.
---
---* Corresponding C source code: [lfontlib.c#L260-L267](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L260-L267)
---
---@param font_id integer
---
---@return table Font
function font.getcopy(font_id) end

---
---Return a table of the parameters as known to *TeX*. These can be
---different from the ones in the cached table.
---
---* Corresponding C source code: [lfontlib.c#L269-L276](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L269-L276)
---
---@param font_id integer
---
---@return table p
function font.getparameters(font_id) end

---
---Test for the status of a font
---
---The return value is one of `true` (unassignable), `false` (can be
---changed) or `nil` (not a valid font at all).
---
---* Corresponding C source code: [lfontlib.c#L135-L153](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L135-L153)
---
---@param font_id integer
---
---@return boolean|nil
function font.frozen(font_id) end

---
---Define a font into `font.fonts`.
---
---* Corresponding C source code: [lfontlib.c#L209-L235](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L209-L235)
---
---@param f Font
---
---@return integer font_id
function font.define(f) end

---
---An alternative call is:
---
---Where the first argument is a reserved font id (see below).
---
---@param font_id integer
---@param f Font
---
---@return integer i
function font.define(font_id, f) end

---
---Add characters to a font.
---
---The table passed can have the fields `characters` which is a (sub)table
---like the one used in `font.define()`, and for virtual fonts a `fonts` table can be
---added. The characters defined in the `characters` table are added (when not
---yet present) or replace an existing entry. Keep in mind that replacing can have
---side effects because a character already can have been used. Instead of posing
---restrictions we expect the user to be careful. (The `setfont` helper is
---a more drastic replacer.)
---
---__Example:__
---
---```lua
---local newcharacters = {}
---for gid = 0, #glyphs do
---  local glyph = glyphs[gid]
---  if glyph.used then
---    local character = characters[gid + gid_offset]
---    newcharacters[gid + gid_offset] = character
---    local unicode = nominals[gid]
---    if unicode then
---      newcharacters[unicode] = character
---    end
---    character.tounicode = glyph.tounicode or unicode or "FFFD"
---    character.used = true
---  end
---end
---font.addcharacters(font_id, { characters = newcharacters })
---```
---
---* Corresponding C source code: [lfontlib.c#L175-L188](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L175-L188)
---
---@param font_id integer
---@param f Font
function font.addcharacters(font_id, f) end

---
---Return the font id number that would be returned by a `font.define`
---call if it was executed at this spot in the code flow.
---
---This is useful for virtual
---fonts that need to reference themselves. If you pass `true` as argument,
---the id gets reserved and you can pass to `font.define` as first argument.
---This can be handy when you create complex virtual fonts.
---
---* Corresponding C source code: [lfontlib.c#L240-L249](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L240-L249)
---
---@return integer font_id
function font.nextid() end

---
---Return the font id associated with `csname`, or `-1` if `csname` is not defined.
---
---* Corresponding C source code: [lfontlib.c#L278-L296](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L278-L296)
---
---@param csname string
---
---@return integer font_id
function font.id(csname) end

---
---Get the largest used index in `font.fonts`.
---
---* Corresponding C source code: [lfontlib.c#L102-L106](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L102-L106)
---
---@return integer max_font_id # The largest used index in `font.fonts`.
function font.max() end

---
---Set the currently used font number.
---
---* Corresponding C source code: [lfontlib.c#L85-L100](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L85-L100)
---
---@param font_id integer
function font.current(font_id) end

---
---Get the currently used font number.
---
---* Corresponding C source code: [lfontlib.c#L85-L100](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L85-L100)
---
---@return integer font_id
function font.current(font_id) end

---
---Iterate over all fonts.
---
---This is an iterator over each of the defined *TeX* fonts. The first returned
---value is the index in `font.fonts`, the second the font itself, as a *Lua*
---table. The indices are listed incrementally, but they do not always form an array
---of consecutive numbers: in some cases there can be holes in the sequence.
---
---__Example:__
---
---```lua
---local inspect = require('inspect')
---for font_id, font in font.each() do
---  print(font_id, inspect(font))
---end
---```
---
---* Corresponding C source code: [lfontlib.c#L127-L133](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L127-L133)
---
---@return fun(): font_id: integer, font: Font
function font.each() end

---
---* Corresponding C source code: [lfontlib.c#L190-L204](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L190-L204)
---
---@param font_id integer
---@param stretch integer
---@param shrink integer
---@param step integer
function font.setexpansion(font_id, stretch, shrink, step) end
