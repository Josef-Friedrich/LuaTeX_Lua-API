---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

---
---@meta
---
---The fontloader library is sort of independent of the rest in the sense that it
---can load font into a *Lua* table that then can be converted into a table suitable
---for *TeX*. The library is an adapted subset of *FontForge* and as such gives a
---similar view on a font (which has advantages when you want to debug).
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
fontloader = {}

_N._12_the_fontloader = "page 237"

_N._12_1_getting_quick_information_on_a_font = "page 237"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2257-L2284](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2257-L2284)^
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontInfo
---@field fontname string # The *PostScript* name of the font
---@field fullname string # The formal name of the font
---@field familyname string # The family name this font belongs to
---@field weight string # A string indicating the color value of the font
---@field version string # The internal font version
---@field italicangle number # The slant angle
---@field units_per_em number # 1000 for *PostScript*-based fonts, usually 2048 for *TrueType*NC \NR
---@field pfminfo FontloaderPfminfo #

---
---Get various information fields from an font file.
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
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2257-L2284](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2257-L2284)
---
---@param filename string
---
---@return FontInfo
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fontloader.info(filename) end

_N._12_2_loading_an_opentype_or_truetype_file = "page 237"

---
---Parse a font file and return a table representing its contents. The optional argument is the name of the desired font in case of font collection files. The optional return value contains any parser error strings.
---
---Open an *OpenType* font.
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
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L198-L263](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L198-L263)
---
---@param filename string
---@param fontname? string
---
---@return userdata font # The first return value is a userdata representation of the font.
---@return table warnings # The second return value is a table containing any warnings and errors reported by fontloader while opening the font. In normal typesetting, you would probably ignore the second argument, but it can be useful for debugging purposes.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fontloader.open(filename, fontname) end

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2244-L2255](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2244-L2255)
---
---@param font userdata
---
---@return FontloaderField f
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fontloader.to_table(font) end

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L265-L280](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L265-L280)
---
---@param font userdata
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fontloader.close(font) end

_N._12_3_applying_a_feature_file = "page 241"

---
---Apply a feature file to a fontloader table.
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L313-L334](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L313-L334)
---
---@param font userdata
---@param filename string
---
---@return table errors
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fontloader.apply_featurefile(font, filename) end

_N._12_4_applying_an_afm_file = "page 241"

---
---Apply an AFM file to a fontloader table.
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L336-L355](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L336-L355)
---
---@param font userdata
---@param filename string
---
---@return table errors
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fontloader.apply_afmfile(font, filename) end

_N._12_5_fontloader_font_tables = "page 241"

---
---__Example:__
---
---```lua
---local f = fontloader.open('/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf')
---
---for _, value in ipairs(fontloader.fields(f)) do
---    print(value, f[value])
---end
---```
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2491-L2511](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2491-L2511)
---
---@param font userdata
---
---@return table FontloaderField
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fontloader.fields(font) end

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2491-L2511](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2491-L2511)
---
---@param font_glyph userdata
---
---@return table fields
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fontloader.fields(font_glyph) end

_N._12_6_table_types = "page 240"

_N._main_table = "FontloaderField"

---
---__Example:__
---
---```lua
---local f = fontloader.open('/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf')
---
---for _, value in ipairs(fontloader.fields(f)) do
---    print(value, f[value])
---end
---```
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1899-2241](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/a4b8e13d3879e95c21e1719af0c3e31722bedd4f/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1899-2241)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderField
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2772-L2774
---@field table_version string # Indicates the metrics version (currently `0.3`), for example `0.5`
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2775-L2777
---@field fontname string # *PostScript* font name, for example `NimbusRoman-Regular`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2778-L2780
---@field fullname string # official (human-oriented) font name, for example `Nimbus Roman Regular`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2781-L2783
---@field familyname string # The family name, for example `Nimbus Roman`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2784-L2786
---@field weight string # The weight indicator, for example `Regular`
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2787-L2789
---@field copyright string # The copyright information, for example `Copyright (URW)++,Copyright 2014 by (URW)++ Design & Development`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2790-L2792
---@field filename string # The file name
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2793-L2795
---@field version string # The font version
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2796-L2798
---@field italicangle integer # The slant angle
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2827-L2829
---@field units_per_em integer # `1000` for *PostScript*-based fonts, usually `2048` for *TrueType*
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2805-L2807
---@field ascent integer # The height of ascender in `units_per_em`
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2808-L2810
---@field descent integer # The depth of descender in `units_per_em`
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2799-L2801
---@field upos integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2802-L2804
---@field uwidth integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2811-L2813
---@field uniqueid integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2838-L2845
---@field glyphs FontloaderGlyph[] # The `glyphs` is an array containing the per-character information (quite a few of these are only present if non-zero).
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2814-L2820
---@field glyphcnt integer # The number of included glyphs
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2821-L2823
---@field glyphmax integer # The maximum used index the glyphs array
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2824-L2826
---@field glyphmin integer # The minimum used index the glyphs array
---@field notdef_loc integer # The location of the `.notdef` glyph or `-1` when not present
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2846-L2848
---@field hasvmetrics integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2849-L2851
---@field onlybitmaps integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2852-L2854
---@field serifcheck integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2855-L2857
---@field isserif integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2858-L2860
---@field issans integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2861-L2863
---@field encodingchanged integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2864-L2866
---@field strokedfont integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2867-L2869
---@field use_typo_metrics integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2870-L2872
---@field weight_width_slope_only integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2873-L2875
---@field head_optimized_for_cleartype integer #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2876-L2878
---@field uni_interp `unset`|`none`|`adobe`|`greek`|`japanese`|`trad_chinese`|`simp_chinese`|`korean`|`ams`, , for example `none`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2887-L2889
---@field origname string # The file name, as supplied by the user
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2879-L2886
---@field map FontloaderMap #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2890-L2897
---@field public private FontloaderPrivate #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2041
---@field xuid string # `[1021 618 1197637146 7437765]`
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2901-L2904
---@field pfminfo FontloaderPfminfo #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2905-L2912
---@field names FontloaderLangNames #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2913-L2919
---@field cidinfo FontloaderCidinfo #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2920-L2930
---@field subfonts? table
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2931-L2933
---@field commments? string #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2934-L2936
---@field fontlog? string #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2937-L2947
---@field cvt_names? table #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2979-L2986
---@field anchor_classes FontloaderAnchorClasses #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2948-L2955
---@field ttf_tables? FontloaderTtfTables #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2956-L2963
---@field ttf_tab_saved? FontloaderTtfTables #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2964-L2978
---@field texdata? FontloaderTexdata #
---
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2987-L2994
---@field kerns? FontloaderGlyph[] #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2995-L3002
---@field vkerns? FontloaderGlyph[] #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2830-L2837
---@field lookups FontloaderLockup #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3011-L3018
---@field gpos FontloaderGpos #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3019-L3026
---@field gsub? FontloaderGsub #
---
---@field features? unknown
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3019-L3026
---@field mm? FontloaderMm #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3027-L3029
---@field chosenname? string #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3030-L3032
---@field macstyle integer # for example `-1`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3033-L3035
---@field fondname? string #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3036-L3038
---@field design_size integer # for example `0`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3039-L3041
---@field fontstyle_id integer # for example `0`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3042-L3049
---@field fontstyle_name? table #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2155
---@field design_range_bottom integer # for example `0`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3053-L3055
---@field design_range_top integer # for example `0`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3056-L3058
---@field strokewidth integer # for example `0`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L3059-L3072
---@field mark_classes? FontloaderMarkClasses|nil #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2171
---@field creationtime integer # for example `1495029639`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2172
---@field modificationtime integer # for example `1495029639`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2174
---@field os2_version integer # for example `3`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1705-L1764
---@field math? FontloaderMath #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2228
---@field validation_state? FontloaderValidationState #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2234
---@field horiz_base? FontloaderHorizVertBase #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2239
---@field vert_base? FontloaderHorizVertBase #
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2241
---@field extrema_bound integer # for example `0`.
---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1931-L1939
---@field truetype integer # signals a *TrueType* font

_N._12_6_2_glyphs = "page 244"

_N._glyphs = "Glyph"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L959-L1120](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L959-L1120)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGlyph
---@field name string # The glyph name, for example `space`.
---@field unicode integer # The unicode code point, or -1 , for example `32`.
---@field boundingbox integer[] Array of four numbers, for example `{ 0, 0, 0, 0 }`.
---@field width integer # Only for horizontal fonts
---@field vwidth integer # Only for vertical fonts
---@field tsidebearing integer # Only for vertical ttf/otf fonts, and only if non-zero
---@field lsidebearing integer # Only if non-zero and not equal to boundingbox[1]
---@field class string # one of "none", "base", "ligature", "mark", "component" (if not present, the glyph class is “automatic”)
---@field kerns FontloaderGlyphKern[] only for horizontal fonts, if set
---@field vkerns table only for vertical fonts, if set
---@field dependents string[] linear array of glyph name strings, only if nonempty
---@field lookups table # only if nonempty
---@field ligatures table # only if nonempty
---@field anchors table # only if set
---@field comment string # only if set
---@field tex_height integer # only if set
---@field tex_depth integer # only if set
---@field italic_correction integer # only if set
---@field top_accent integer # only if set
---@field is_extended_shape integer # only if this character is part of a math extension list
---@field altuni table # alternate *Unicode* items
---@field vert_variants FontloaderVertHorizVariants #
---@field horiz_variants FontloaderVertHorizVariants #
---@field mathkern FontloaderMathkern #

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGlyphKern
---@field char string # for example `afii10065`.
---@field lookup string # for example `pp_l_0_s`.
---@field off integer # for example `7`.

_N._12_6_3_map = "page 247"

---
---The top-level map is a list of encoding mappings. Each of those is a table
---itself.
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1346-L1404](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1346-L1404)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderMap
---@field enccount integer # for example `65537`
---@field encmax integer # for example `65537`
---@field backmax integer # for example `855`
---@field remap FontloaderRemap #
---@field map table<integer, integer> # non-linear array of mappings, for example `{ [32] = 1, [33] = 2, [34] = 3 }`
---@field backmap integer[] # non-linear array of backward mappings, for example `{ 32, 33, 34, 35, 36, 37, 38, 8217 }`
---@field enc FontloaderEnc #

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1353-L1359](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1353-L1359)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderRemap
---@field firstenc integer #
---@field lastenc integer #
---@field infont integer #

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1284-L1336](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1284-L1336)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderEnc
---@field enc_name string #
---@field char_cnt integer #
---@field char_max integer #
---@field unicode integer[] # array of *Unicode* position numbers
---@field psnames string[] # array of *PostScript* glyph names
---@field builtin integer #
---@field hidden integer #
---@field only_1byte integer #
---@field has_1byte integer #
---@field has_2byte integer #
---@field is_unicodebmp integer # only if non-zero
---@field is_unicodefull integer # only if non-zero
---@field is_custom integer # only if non-zero
---@field is_original integer # only if non-zero
---@field is_compact integer # only if non-zero
---@field is_japanese integer # only if non-zero
---@field is_korean integer # only if non-zero
---@field is_tradchinese integer # only if non-zero [name?]
---@field is_simplechinese integer # only if non-zero
---@field low_page integer #
---@field high_page integer #
---@field iconv_name string #
---@field iso_2022_escape string #

_N._12_6_4_private = "page 248"

---
---This is the font's private *PostScript* dictionary, if any. Keys and values are
---both strings.
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2035-L2039](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2035-L2039)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FontloaderPrivate string<string, string>

_N._12_6_5_cidinfo = "page 248"

---
---CID fonts (Character Identifier Fonts) were developed by Adobe to
---display Asian font formats with many different symbols. In CID fonts,
---CIDs (Character Identifiers) are used to address glyph descriptions
---within the font. A so-called CMap (Character Map) is used to
---establish correspondences between the CIDs and the character codes.
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2053-L2058](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2053-L2058)
---* https://www.compart.com/de/glossar/cid-fonts
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderCidinfo
---@field registry string #
---@field ordering string #
---@field supplement integer # For example `0`.
---@field version number # For example `0`.

_N._12_6_6_pfminfo = "page 248"

---
---The `pfminfo` table contains most of the OS/2 information.
---
---PFM stands for PostScript Font Metrics and is the suffix of a file
---associated with a PostScript Type 1 font. The PFM file contains
---metric data such as kerning values.
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1200-L1281](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1200-L1281)
---* https://www.typografie.info/3/wiki.html/p/pfm-r2/
---* https://github.com/fontforge/fontforge/blob/2d4ccf06b68ce1e31386cbfa5822d448378b6500/fontforge/splinefont.h#L1112-L1148
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderPfminfo
---@field pfmset integer #
---@field winascent_add integer #
---@field windescent_add integer #
---@field hheadascent_add integer #
---@field hheaddescent_add integer #
---@field typoascent_add integer #
---@field typodescent_add integer #
---@field subsuper_set integer #
---@field panose_set integer #
---@field hheadset integer #
---@field vheadset integer #
---@field pfmfamily integer #
---@field weight integer #
---@field width integer #
---@field avgwidth integer #
---@field firstchar integer #
---@field lastchar integer #
---@field fstype integer #
---@field linegap integer #
---@field vlinegap integer #
---@field hhead_ascent integer #
---@field hhead_descent number #
---@field os2_typoascent integer # The typographic ascender for this font. This field should be combined with the sTypoDescender and sTypoLineGap values to determine default line spacing. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#stypoascender
---@field os2_typodescent integer # The typographic descender for this font. This field should be combined with the sTypoAscender and sTypoLineGap values to determine default line spacing. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#stypodescender
---@field os2_typolinegap integer # The typographic line gap for this font. This field should be combined with the sTypoAscender and sTypoDescender values to determine default line spacing. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#stypolinegap
---@field os2_winascent integer # https://learn.microsoft.com/en-us/typography/opentype/spec/os2#uswinascent
---@field os2_windescent integer # https://learn.microsoft.com/en-us/typography/opentype/spec/os2#uswindescent
---@field os2_subxsize integer # The recommended horizontal size in font design units for subscripts for this font. Should be > 0. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ysubscriptxsize
---@field os2_subysize integer # The recommended vertical size in font design units for subscripts for this font. Should be > 0. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ysubscriptysize
---@field os2_subxoff integer # The recommended horizontal offset in font design units for subscripts for this font. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ysubscriptxoffset
---@field os2_subyoff integer # The recommended vertical offset in font design units from the baseline for subscripts for this font. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ysubscriptyoffset
---@field os2_supxsize integer # The recommended horizontal size in font design units for superscripts for this font. Should be > 0. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ysuperscriptxsize
---@field os2_supysize integer # The recommended vertical size in font design units for superscripts for this font. Should be > 0. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ysuperscriptysize
---@field os2_supxoff integer # The recommended horizontal offset in font design units for superscripts for this font. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ysuperscriptxoffset
---@field os2_supyoff integer # The recommended vertical offset in font design units from the baseline for superscripts for this font. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ysuperscriptyoffset
---@field os2_strikeysize integer # Thickness of the strikeout stroke in font design units. Should be > 0. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ystrikeoutsize
---@field os2_strikeypos integer # The position of the top of the strikeout stroke relative to the baseline in font design units. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#ystrikeoutposition
---@field os2_family_class integer # This field provides a classification of font-family design. # https://learn.microsoft.com/en-us/typography/opentype/spec/os2#sfamilyclass
---@field os2_xheight integer # the height of lower case letters such as “x”
---@field os2_capheight integer # This metric specifies the distance between the baseline and the approximate height of uppercase letters measured in font design units. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#scapheight
---@field os2_defaultchar integer # This is the Unicode code point, in UTF-16 encoding, of a character that can be used for a default glyph if a requested character is not supported in the font. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#scapheight
---@field os2_breakchar integer # This is the Unicode code point, in UTF-16 encoding, of a character that can be used as a default break character. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#usbreakchar
---@field os2_vendor string # The four character identifier for the vendor of the given typeface. https://learn.microsoft.com/en-us/typography/opentype/spec/os2#achvendid
---@field codepages table # A two-number array of encoded code pages
---@field unicoderages table # A four-number array of encoded unicode ranges
---@field panose table #

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1222-L1232](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1222-L1232)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderPanose
---@field familytype `Any`|`No Fit`|`Text and Display`|`Script`|`Decorative`|`Pictorial` # Values as in the *OpenType* font specification:
---@field serifstyle string # See the *OpenType* font specification for values
---@field weight string # idem
---@field proportion string # idem
---@field contrast string # idem
---@field strokevariation string # idem
---@field armstyle string # idem
---@field letterform string # idem
---@field midline string # idem
---@field xheight string # idem
---

_N._12_6_7_names = "page 249"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1418-L1416](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1418-L1416)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderLangNames
---@field lang string # language for this entry
---@field names FontloaderNamesTrueType # The `names` keys are the actual *TrueType* name strings.

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L108-L115](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L108-L115)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderNamesTrueType
---@field copyright string
---@field family string
---@field subfamily string
---@field uniqueid string
---@field fullname string
---@field version string
---@field postscriptname string
---@field trademark string
---@field manufacturer string
---@field designer string
---@field descriptor string
---@field venderurl string
---@field designerurl string
---@field license string
---@field licenseurl string
---@field idontknow string
---@field preffamilyname string
---@field prefmodifiers string
---@field compatfull string
---@field sampletext string
---@field cidfindfontname string
---@field wwsfamily string
---@field wwssubfamily string

_N._12_6_8_anchor_classes = "page 250"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1448-L1452](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1448-L1452)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderAnchorClasses
---@field name string # a descriptive id of this anchor class
---@field lookup string #
---@field type `mark`|`mkmk`|`curs`|`mklg` # type is actually a lookup subtype, not a feature name. Officially, these strings should be gpos_mark2mark etc.

_N._12_6_9_gpos = "page 250"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L580-L643](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L580-L643)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGposSub
---@field flags FontloaderGposFlags #
---@field name string #
---@field features FontloaderGposFeatures
---@field subtables FontloaderGposSubtables

---
---The `gpos` table has one array entry for each lookup. (The `gpos_`
---prefix is somewhat redundant.)
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L74-L76](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L74-L76)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGpos: FontloaderGposSub
---@field type `gpos_single`|`gpos_pair`|`gpos_cursive`|`gpos_mark2base`|`gpos_mark2ligature`|`gpos_mark2mark`|`gpos_context`|`gpos_contextchain`

---
---The flags table has a true value for each of the lookup flags that is actually
---set:
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L587-L612](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L587-L612)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGposFlags
---@field r2l boolean #
---@field ignorebaseglyphs boolean #
---@field ignoreligatures boolean #
---@field ignorecombiningmarks boolean #
---@field mark_class string #
---

---
---The features subtable items of gpos have
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L523-L531](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L523-L531)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGposFeatures
---@field tag string #
---@field scripts FontloaderGposFeaturesScripts #

---
---The scripts table within features has:
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L492-L515](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L492-L515)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGposFeaturesScripts
---@field script string #
---@field langs string[]
---

---
---The subtables table has:
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L541-L572](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L541-L572)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGposSubtables
---@field name string #
---@field suffix string # (only if used) % used by gpos_single to get a default
---@field anchor_classes number # (only if used)
---@field vertical_kerning number # (only if used)
---@field kernclass FontloaderGposSubtablesKernclass # (only if used)
---

---
---Note: the kernclass (as far as we can see) always has one entry so it could be one level
---deep instead. Also the seconds start at `[2]` which is close to the fontforge
---internals so we keep that too.
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1469-L1518](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1469-L1518)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGposSubtablesKernclass
---@field firsts string[]
---@field seconds string[]
---@field lookup string # or an array of associated lookup(s)
---@field offsets integer[]

_N._12_6_10_gsub = "page 251"

---
---This has identical layout to the `gpos` table, except for the
---type:
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L56-L58](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L56-L58)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderGsub: FontloaderGposSub
---@field type `gsub_single`|`gsub_multiple`|`gsub_alternate`|`gsub_ligature`|`gsub_context`|`gsub_contextchain`|`gsub_reversecontextchain`
---

_N._12_6_11_ttf_tables_and_ttf_tab_saved = "page 251"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1454-L1461](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1454-L1461)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderTtfTables
---@field tag string #
---@field len integer #
---@field maxlen integer #
---@field data integer #

_N._12_6_12_mm = "page 251"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1841-L1898](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1841-L1898)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderMm
---@field axes table # array of axis names
---@field instance_count integer #
---@field positions table # array of instance positions (\#axes * instances )
---@field defweights table # array of default weights for instances
---@field cdv string #
---@field ndv string #
---@field axismaps table #

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1820-L1839](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1820-L1839)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderAxismaps
---@field blends table # an array of blend points
---@field designs table # an array of design values
---@field min integer #
---@field def integer #
---@field max integer #

_N._12_6_13_mark_classes = "page 252"

---
---The keys in this table are mark class names, and the values are a
---space-separated string of glyph names in this class.
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2159-L2169](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2159-L2169)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FontloaderMarkClasses string<string, string>

_N._12_6_14_math = "page 252"

---
---The math table has the variables that are also discussed in the chapter about
---math
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1706-L1767](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1706-L1767)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderMath
---@field ScriptPercentScaleDown integer
---@field ScriptScriptPercentScaleDown integer
---@field DelimitedSubFormulaMinHeight integer
---@field DisplayOperatorMinHeight integer
---@field MathLeading integer
---@field AxisHeight integer
---@field AccentBaseHeight integer
---@field FlattenedAccentBaseHeight integer
---@field SubscriptShiftDown integer
---@field SubscriptTopMax integer
---@field SubscriptBaselineDropMin integer
---@field SuperscriptShiftUp integer
---@field SuperscriptShiftUpCramped integer
---@field SuperscriptBottomMin integer
---@field SuperscriptBaselineDropMax integer
---@field SubSuperscriptGapMin integer
---@field SuperscriptBottomMaxWithSubscript integer
---@field SpaceAfterScript integer
---@field UpperLimitGapMin integer
---@field UpperLimitBaselineRiseMin integer
---@field LowerLimitGapMin integer
---@field LowerLimitBaselineDropMin integer
---@field StackTopShiftUp integer
---@field StackTopDisplayStyleShiftUp integer
---@field StackBottomShiftDown integer
---@field StackBottomDisplayStyleShiftDown integer
---@field StackGapMin integer
---@field StackDisplayStyleGapMin integer
---@field StretchStackTopShiftUp integer
---@field StretchStackBottomShiftDown integer
---@field StretchStackGapAboveMin integer
---@field StretchStackGapBelowMin integer
---@field FractionNumeratorShiftUp integer
---@field FractionNumeratorDisplayStyleShiftUp integer
---@field FractionDenominatorShiftDown integer
---@field FractionDenominatorDisplayStyleShiftDown integer
---@field FractionNumeratorGapMin integer
---@field FractionNumeratorDisplayStyleGapMin integer
---@field FractionRuleThickness integer
---@field FractionDenominatorGapMin integer
---@field FractionDenominatorDisplayStyleGapMin integer
---@field SkewedFractionHorizontalGap integer
---@field SkewedFractionVerticalGap integer
---@field OverbarVerticalGap integer
---@field OverbarRuleThickness integer
---@field OverbarExtraAscender integer
---@field UnderbarVerticalGap integer
---@field UnderbarRuleThickness integer
---@field UnderbarExtraDescender integer
---@field RadicalVerticalGap integer
---@field RadicalDisplayStyleVerticalGap integer
---@field RadicalRuleThickness integer
---@field RadicalExtraAscender integer
---@field RadicalKernBeforeDegree integer
---@field RadicalKernAfterDegree integer
---@field RadicalDegreeBottomRaisePercent integer
---@field MinConnectorOverlap integer
---@field FractionDelimiterSize integer
---@field FractionDelimiterDisplayStyleSize integer

_N._12_6_15_validation_state = "page 253"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2183-L2229](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2183-L2229)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderValidationState
---@field bad_ps_fontname string
---@field bad_glyph_table table
---@field bad_cff_table table
---@field bad_metrics_table table
---@field bad_cmap_table table
---@field bad_bitmaps_table table
---@field bad_gx_table table
---@field bad_ot_table table
---@field bad_os2_version any
---@field bad_sfnt_header any

_N._12_6_16_horiz_base_and_vert_base = "page 253"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1785-L1818](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1785-L1818)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderHorizVertBase
---@field tags table # an array of script list tags
---@field scripts FontloaderScripts #

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1785-L1818](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1785-L1818)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderScripts
---@field baseline table #
---@field default_baseline number #
---@field lang FontloaderLang #

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1769-L1777](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1769-L1777)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderLang
---@field tag string # a script tag
---@field ascent number #
---@field descent number #
---@field features table # The `features` points to an array of tables with the same layout except that in those nested tables, the tag represents a language.

_N._12_6_17_altuni = "page 253"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L692-L714](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L692-L714)
---
---An array of alternate *Unicode* values. Inside that array are hashes with:
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderAltuni
---@field unicode number # this glyph is also used for this unicode
---@field variant number # the alternative is driven by this unicode selector

_N._12_6_18_vert_variants_and_horiz_variants = "page 253"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L914-L930](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L914-L930)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderVertHorizVariants
---@field variants string #
---@field italic_correction number #
---@field parts FontloaderParts[] # The `parts` table is an array of smaller tables.

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L914-L930](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L914-L930)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderParts
---@field component string #
---@field extender number #
---@field start number #
---@field end number #
---@field advance number #

_N._12_6_19_mathkern = "page 254"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L943-L957](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L943-L957)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderMathkern
---@field top_right FontloaderMathkernSubtable #
---@field bottom_right FontloaderMathkernSubtable #
---@field top_left FontloaderMathkernSubtable #
---@field bottom_left FontloaderMathkernSubtable #

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L932-L941](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L932-L941)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderMathkernSubtable
---@field height number #
---@field kern number #

_N._12_6_20_kerns = "page 254"

---
---# `kerns`
---
---Substructure is identical to the per-glyph subtable.

_N._12_6_21_vkerns = "page 254"

---
---# `vkerns`
---
---Substructure is identical to the per-glyph subtable.

_N._12_6_22_texdata = "page 254"

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L2096-L2107](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2096-L2107)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderTexdata
---@field type `unset`|`text`|`math`|`mathext`
---@field params table # 22 font numeric parameters

_N._12_6_23_lookups = "page 254"

--
---Top-level `lookups` is quite different from the ones at character level.
---The keys in this hash are strings, the values the actual lookups, represented as
---dictionary tables.
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1628-L1661](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1628-L1661)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderLockup
---@field type string #
---@field format `glyphs`|`class`|`coverage`|`reversecoverage`
---@field tag string #
---@field current_class string[]
---@field before_class string[]
---@field after_class string[]
---@field rules FontloaderLockupRule[] # an array of rule items

---
---Rule items have one common item and one specialized item:
---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1558-L1626](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1558-L1626)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderLockupRule
---@field lookups string[] a linear array of lookup names
---@field glyphs FontloaderLockupGlyph[] only if the parent's format is `glyphs`
---@field class FontloaderLockupClass[] only if the parent's format is `class`
---@field coverage FontloaderLockupsCoverage[] only if the parent's format is `coverage`
---@field reversecoverage FontloaderLockupReverseCoverage[] only if the parent's format is `reversecoverage`

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1562-L1568](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1562-L1568)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderLockupGlyph
---@field names string #
---@field back string #
---@field fore string #

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1570-L1580](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1570-L1580)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderLockupClass
---@field before number[]
---@field after number[]

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1582-L1591](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1582-L1591)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderLockupsCoverage
---@field current string[]
---@field before string[]
---@field after string[]

---
---__Reference:__
---
---* Corresponding C source code: [luafflib.c#L1593-L1604](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1593-L1604)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fontloader.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FontloaderLockupReverseCoverage
---@field current string[]
---@field before string[]
---@field after string[]
---@field replacements string #
