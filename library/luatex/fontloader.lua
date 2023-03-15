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
fontloader = {}

_N._12_The_fontloader = 0
_N._12_1_Getting_quick_information_on_a_font = 0
_N._12_2_Loading_an_OPENTYPE_or_TRUETYPE_file = 0
_N._12_3_Applying_a_feature_file = 0
_N._12_4_Applying_an_AFM_file = 0
_N._12_5_Fontloader_font_tables = 0
_N._12_6_Table_types = 0
_N._12_6_2_glyphs = 0
_N._12_6_3_map = 0
_N._12_6_4_private = 0
_N._12_6_5_cidinfo = 0
_N._12_6_6_pfminfo = 0
_N._12_6_7_names = 0
_N._12_6_8_anchor_classes = 0
_N._12_6_9_gpos = 0
_N._12_6_10_gsub = 0
_N._12_6_11_ttf_tables_and_ttf_tab_saved = 0
_N._12_6_12_mm = 0
_N._12_6_13_mark_classes = 0
_N._12_6_14_math = 0
_N._12_6_15_validation_state = 0
_N._12_6_16_horiz_base_and_vert_base = 0
_N._12_6_17_altuni = 0
_N._12_6_18_vert_variants_and_horiz_variants = 0
_N._12_6_19_mathkern = 0
_N._12_6_20_kerns = 0
_N._12_6_21_vkerns = 0
_N._12_6_22_texdata = 0
_N._12_6_23_lookups = 0

---
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

_N._main_table = "FontloaderField"

---
---@class FontloaderField
---@field table_version number # indicates the metrics version (currently 0.3)
---@field fontname string # *PostScript* font name
---@field fullname string # official (human-oriented) font name
---@field familyname string # family name
---@field weight string # weight indicator
---@field copyright string # copyright information
---@field filename string # the file name
---@field version string # font version
---@field italicangle number # slant angle
---@field units_per_em integer # 1000 for *PostScript*-based fonts, usually 2048 for *TrueType*
---@field ascent integer # height of ascender in `units_per_em`
---@field descent integer # depth of descender in `units_per_em`
---@field upos number #
---@field uwidth number #
---@field uniqueid integer #
---@field glyphs Glyph[]
---@field glyphcnt integer # number of included glyphs
---@field glyphmax integer # maximum used index the glyphs array
---@field glyphmin integer # minimum used index the glyphs array
---@field notdef_loc integer # location of the `.notdef` glyph or `-1` when not present
---@field hasvmetrics integer #
---@field onlybitmaps integer #
---@field serifcheck integer #
---@field isserif integer #
---@field issans integer #
---@field encodingchanged integer #
---@field strokedfont integer #
---@field use_typo_metrics integer #
---@field weight_width_slope_only integer #
---@field head_optimized_for_cleartype integer #
---@field uni_interp `unset`|`none`|`adobe`|`greek`|`japanese`|`trad_chinese`|`simp_chinese`|`korean`|`ams`
---@field origname string # the file name, as supplied by the user
---@field map table #
---@field public private number #
---@field xuid string #
---@field pfminfo table #
---@field names table #
---@field cidinfo table #
---@field subfonts table
---@field commments string #
---@field fontlog string #
---@field cvt_names string #
---@field anchor_classes table #
---@field ttf_tables table #
---@field ttf_tab_saved table #
---@field kerns table #
---@field vkerns table #
---@field texdata table #
---@field lookups table #
---@field gpos table #
---@field gsub table #
---@field mm table #
---@field chosenname string #
---@field macstyle integer #
---@field fondname string #
---@field design_size number
---@field fontstyle_id integer #
---@field fontstyle_name table #
---@field design_range_bottom number
---@field design_range_top number
---@field strokewidth number #
---@field mark_classes table #
---@field creationtime integer #
---@field modificationtime integer #
---@field os2_version integer #
---@field math table #
---@field validation_state table #
---@field horiz_base table #
---@field vert_base table #
---@field extrema_bound integer #
---@field truetype integer # signals a *TrueType* font

_N._glyphs = "Glyph"

---
---The `glyphs` is an array containing the per-character
---information (quite a few of these are only present if non-zero).
---@class Glyph
---@field name string # the glyph name
---@field unicode number # unicode code point, or -1
---@field boundingbox integer[] array of four numbers, see note below
---@field width number # only for horizontal fonts
---@field vwidth number # only for vertical fonts
---@field tsidebearing number # only for vertical ttf/otf fonts, and only if non-zero
---@field lsidebearing number # only if non-zero and not equal to boundingbox[1]
---@field class string # one of "none", "base", "ligature", "mark", "component" (if not present, the glyph class is “automatic”)
---@field kerns table only for horizontal fonts, if set
---@field vkerns table only for vertical fonts, if set
---@field dependents string[] linear array of glyph name strings, only if nonempty
---@field lookups table # only if nonempty
---@field ligatures table # only if nonempty
---@field anchors table # only if set
---@field comment string # only if set
---@field tex_height number # only if set
---@field tex_depth number # only if set
---@field italic_correction number # only if set
---@field top_accent number # only if set
---@field is_extended_shape number # only if this character is part of a math extension list
---@field altuni table # alternate *Unicode* items
---@field vert_variants table #
---@field horiz_variants table #
---@field mathkern table #

---
---@param font userdata
---
---@return table FontloaderField
function fontloader.fields(font) end

---
---@param font_glyph userdata
---
---@return table fields
function fontloader.fields(font_glyph) end
