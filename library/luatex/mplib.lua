---@meta
mplib = {}

_N._11_2_The_mplib_library = 0
_N._11_2_1_new = 232
---
---* Corresponding C source code: [lmplib.c#L532-L627](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L532-L627)
function mplib.new() end

_N._11_2_2_statistics = 233

---
---* Corresponding C source code: [lmplib.c#L771-L792](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L771-L792)
function mplib.statistics() end

_N._11_2_3_execute = 233

---
---* Corresponding C source code: [lmplib.c#L692-L711](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L692-L711)
function mplib.execute() end

_N._11_2_4_finish = 233

---
---* Corresponding C source code: [lmplib.c#L713-L728](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L713-L728)
function mplib.finish() end

_N._11_2_5_Result_table = 233
_N._11_2_5_1_fill = 234
_N._11_2_5_2_outline = 234
_N._11_2_5_3_text = 234
_N._11_2_5_4_special = 236
_N._11_2_5_6_stop_bounds_stop_clip = 236
_N._11_2_6_Subsidiary_table_formats = 236
_N._11_2_6_1_Paths_and_pens = 236

---Paths and pens (that are really just a special type of paths as far as mplib is
---concerned) are represented by an array where each entry is a table that
---represents a knot.
---
---@class MpPathPen
---@field left_type string # when present: endpoint, but usually absent
---@field right_type string # like `left_type`
---@field x_coord number # X coordinate of this knot
---@field y_coord number # Y coordinate of this knot
---@field left_x number # X coordinate of the precontrol point of this knot
---@field left_y number # Y coordinate of the precontrol point of this knot
---@field right_x number # X coordinate of the postcontrol point of this knot
---@field right_y number # Y coordinate of the postcontrol point of this knot
---
---There is one special case: pens that are (possibly transformed) ellipses have an
---extra string-valued key `type` with value `elliptical` besides the
---array part containing the knot list.
---

_N._11_2_6_2_Colors = 236

---A color is an integer array with 0, 1, 3 or 4 values:
---
--- field   type  explanation
---
--- `0`  marking only  no values
--- `1`  greyscale     one value in the range `(0,1)`, “black” is `0`
--- `3`  \RGB          three values in the range `(0,1)`, “black” is `0,0,0`
--- `4`  \CMYK         four values in the range `(0,1)`, “black” is `0,0,0,1`
---
---If the color model of the internal object was `uninitialized`, then it was
---initialized to the values representing “black” in the colorspace `defaultcolormodel` that was in effect at the time of the `shipout`.
---
---@type table MpColor

_N._11_2_6_3_Transforms = 237

---Each transform is a six-item array.
---
---@class MPTransform
---@field item1 number # represents x
---@field item2 number # represents y
---@field item3 number # represents xx
---@field item4 number # represents yx
---@field item5 number # represents xy
---@field item6 number # represents yy
---
---Note that the translation (index 1 and 2) comes first. This differs from the
---ordering in *PostScript*, where the translation comes last.

_N._11_2_6_4_Dashes = 237

---Each `dash` is two-item hash, using the same model as *PostScript* for the
---representation of the dashlist. `dashes` is an array of “on” and
---“off”, values, and `offset` is the phase of the pattern.
---
--- field   type  explanation
---
---@class MpDash
---@field dashes  table    an array of on-off numbers
---@field offset number # the starting offset value

_N._11_2_7_Pens_and_pen_info = 237

---There is helper function (`pen_info(obj)`) that returns a table containing
---a bunch of vital characteristics of the used pen (all values are floats):
---
---@class PenInfo
---@field width number # width of the pen
---@field sx number # `x` scale
---@field rx number # `xy` multiplier
---@field ry number # `yx` multiplier
---@field sy number # `y` scale
---@field tx number # `x` offset
---@field ty number # `y` offset
---
---
---* Corresponding C source code: [lmplib.c#L1474-L1539](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L1474-L1539)
---@return PenInfo
function mplib.pen_info() end

_N._11_2_8_Character_size_information = 238
_N._11_2_8_1_char_width = 238

---These functions find the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `w` is in AFM units.
---
---
---```
---<number> w = char_width(mp,<string> fontname, <number> char)
---```
---
---* Corresponding C source code: [lmplib.c#L748-L751](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L748-L751)
function mplib.char_width() end

_N._11_2_8_2_char_height = 238

---These functions find the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `w` is in AFM units.
---
---
---```
---<number> w = char_height(mp,<string> fontname, <number> char)
---```
---
---
---* Corresponding C source code: [lmplib.c#L758-L761](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L758-L761)
function mplib.char_height() end

_N._11_2_8_3_char_depth = 238

---These functions find the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `w` is in AFM units.
---
---```
---<number> w = char_depth(mp,<string> fontname, <number> char)
---```
---
---* Corresponding C source code: [lmplib.c#L753-L756](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L753-L756)
function mplib.char_depth() end

_N._11_2_8_4_get_boolean_numeric_string_path = 238

---
---Get the list of accessible values for a particular object
---
---* Corresponding C source code: [lmplib.c#L1548-L1591](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L1548-L1591)
function mplib.fields(obj) end

---```
---<boolean> w = get_boolean(mp,<string> name)
---```
---
---* Corresponding C source code: [lmplib.c#L497-L510](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L497-L510)
function mplib.get_boolean() end

---
---Not documented alias for get_numeric
---function mplib.get_number() end

---```
---<number>  n = get_numeric(mp,<string> name)
---```
---
---* Corresponding C source code: [lmplib.c#L482-L495](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L482-L495)
function mplib.get_numeric() end

---```
---<string>  s = get_string (mp,<string> name)
---```
---
---* Corresponding C source code: [lmplib.c#L512-L528](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L512-L528)
function mplib.get_string() end

---```
---<table>   p = get_path   (mp,<string> name)
---```
---
---* Corresponding C source code: [lmplib.c#L1649-L1693](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L1649-L1693)
function mplib.get_path() end

---
---* Corresponding C source code: [lmplib.c#L763-L769](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L763-L769)
---
---@return string version # for example `2.02`
function mplib.version() end

---
---* Corresponding C source code: [lmplib.c#L978-L1195](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L978-L1195)
function mplib.solve_path() end
