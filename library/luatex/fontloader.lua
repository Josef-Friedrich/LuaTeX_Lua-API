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

_N._12_the_fontloader = 0

_N._12_1_getting_quick_information_on_a_font = 239

---
---* Corresponding C source code: [luafflib.c#L2257-L2284](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2257-L2284)^
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
---This function returns either `nil`, or a `table`, or an array of
---small tables (in the case of a *TrueType* collection). The returned table(s) will
---contain some fairly interesting information items from the font(s) defined by the
---file.
---
---Getting information through this function is (sometimes much) more efficient than
---loading the font properly, and is therefore handy when you want to create a
---dictionary of available fonts based on a directory contents.
---
---* Corresponding C source code: [luafflib.c#L2257-L2284](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2257-L2284)
---
---@param filename string
---
---@return FontInfo
function fontloader.info(filename) end

_N._12_2_loading_an_opentype_or_truetype_file = 0

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
---* Corresponding C source code: [luafflib.c#L198-L263](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L198-L263)
---
---@param filename string
---@param fontname? string
---
---@return userdata font # The first return value is a userdata representation of the font.
---@return table warnings # The second return value is a table containing any warnings and errors reported by fontloader while opening the font. In normal typesetting, you would probably ignore the second argument, but it can be useful for debugging purposes.
function fontloader.open(filename, fontname) end

---
---* Corresponding C source code: [luafflib.c#L2244-L2255](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2244-L2255)
---
---@param font userdata
---
---@return FontloaderField f
function fontloader.to_table(font) end

---
---* Corresponding C source code: [luafflib.c#L265-L280](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L265-L280)
---
---@param font userdata
function fontloader.close(font) end

_N._12_3_applying_a_feature_file = 241

---
---* Corresponding C source code: [luafflib.c#L313-L334](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L313-L334)
---
---@param font userdata
---@param filename string
---
---@return table errors
function fontloader.apply_featurefile(font, filename) end

_N._12_4_applying_an_afm_file = 241

---
---* Corresponding C source code: [luafflib.c#L336-L355](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L336-L355)
---
---@param font userdata
---@param filename string
---
---@return table errors
function fontloader.apply_afmfile(font, filename) end

_N._12_5_fontloader_font_tables = 241

---
---* Corresponding C source code: [luafflib.c#L2491-L2511](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2491-L2511)
---
---@param font userdata
---
---@return table FontloaderField
function fontloader.fields(font) end

---
---* Corresponding C source code: [luafflib.c#L2491-L2511](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2491-L2511)
---
---@param font_glyph userdata
---
---@return table fields
function fontloader.fields(font_glyph) end

_N._12_6_Table_types = 0

_N._main_table = "FontloaderField"

---
---* Corresponding C source code: [luafflib.c#L1900-L2242](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1900-L2242)
---
---@class FontloaderField
---@field table_version number # Indicates the metrics version (currently 0.3)
---@field fontname string # *PostScript* font name, for example `NimbusRoman-Regular`.
---@field fullname string # official (human-oriented) font name, for example `Nimbus Roman Regular`.
---@field familyname string # The family name, for example `Nimbus Roman`.
---@field weight string # The weight indicator
---@field copyright string # The copyright information, for example `Copyright (URW)++,Copyright 2014 by (URW)++ Design & Development`.
---@field filename string # The file name
---@field version string # The font version
---@field italicangle integer # The slant angle
---@field units_per_em integer # `1000` for *PostScript*-based fonts, usually `2048` for *TrueType*
---@field ascent integer # The height of ascender in `units_per_em`
---@field descent integer # The depth of descender in `units_per_em`
---@field upos integer #
---@field uwidth integer #
---@field uniqueid integer #
---@field glyphs FontloaderGlyph[] # The `glyphs` is an array containing the per-character information (quite a few of these are only present if non-zero).
---@field glyphcnt integer # The number of included glyphs
---@field glyphmax integer # The maximum used index the glyphs array
---@field glyphmin integer # The minimum used index the glyphs array
---@field notdef_loc integer # The location of the `.notdef` glyph or `-1` when not present
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
---@field origname string # The file name, as supplied by the user
---@field map FontloaderMap #
---@field public private FontloaderPrivate #
---@field xuid string #
---@field pfminfo FontloaderPfminfo #
---@field names FontloaderLangNames #
---@field cidinfo FontloaderCidinfo #
---@field subfonts table
---@field commments string #
---@field fontlog string #
---@field cvt_names string #
---@field anchor_classes FontloaderAnchorClasses #
---@field ttf_tables FontloaderTtfTables #
---@field ttf_tab_saved FontloaderTtfTables #
---@field kerns FontloaderGlyph[] #
---@field vkerns FontloaderGlyph[] #
---@field texdata FontloaderTexdata #
---@field lookups FontloaderLockup #
---@field gpos FontloaderGpos #
---@field gsub FontloaderGsub #
---@field mm FontloaderMm #
---@field chosenname string #
---@field macstyle integer #
---@field fondname string #
---@field design_size integer
---@field fontstyle_id integer #
---@field fontstyle_name table #
---@field design_range_bottom integer
---@field design_range_top integer
---@field strokewidth integer #
---@field mark_classes FontloaderMarkClasses #
---@field creationtime integer # for example `1495029639`.
---@field modificationtime integer #
---@field os2_version integer #
---@field math table #
---@field validation_state table #
---@field horiz_base FontloaderHorizVertBase #
---@field vert_base FontloaderHorizVertBase #
---@field extrema_bound integer #
---@field truetype integer # signals a *TrueType* font

_N._12_6_2_glyphs = 244

_N._glyphs = "Glyph"

---
---* Corresponding C source code: [luafflib.c#L959-L1120](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L959-L1120)
---
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
---@class FontloaderGlyphKern
---@field char string # for example `afii10065`.
---@field lookup string # for example `pp_l_0_s`.
---@field off integer # for example `7`.

_N._12_6_3_map = 247

---
---The top-level map is a list of encoding mappings. Each of those is a table
---itself.
---
---* Corresponding C source code: [luafflib.c#L1346-L1404](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1346-L1404)
---
---@class FontloaderMap
---@field enccount integer # for example `65537`
---@field encmax integer # for example `65537`
---@field backmax integer # for example `855`
---@field remap FontloaderRemap #
---@field map table<integer, integer> # non-linear array of mappings, for example `{ [32] = 1, [33] = 2, [34] = 3 }`
---@field backmap integer[] # non-linear array of backward mappings, for example `{ 32, 33, 34, 35, 36, 37, 38, 8217 }`
---@field enc FontloaderEnc #
---

---
---* Corresponding C source code: [luafflib.c#L1353-L1359](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1353-L1359)
---
---@class FontloaderRemap
---@field firstenc integer #
---@field lastenc integer #
---@field infont integer #

---
---* Corresponding C source code: [luafflib.c#L1284-L1336](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1284-L1336)
---
---@class FontloaderEnc
---@field enc_name string #
---@field char_cnt integer #
---@field char_max integer #
---@field unicode integer[] array of *Unicode* position numbers
---@field psnames string[] array of *PostScript* glyph names
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

_N._12_6_4_private = 248

---
---This is the font's private *PostScript* dictionary, if any. Keys and values are
---both strings.
---
---* Corresponding C source code: [luafflib.c#L2035-L2039](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2035-L2039)
---@alias FontloaderPrivate string<string, string>

_N._12_6_5_cidinfo = 248

---
---* Corresponding C source code: [luafflib.c#L2053-L2058](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2053-L2058)
---
---@class FontloaderCidinfo
---@field registry string #
---@field ordering string #
---@field supplement integer #
---@field version number #

_N._12_6_6_pfminfo = 248

---
---The `pfminfo` table contains most of the OS/2 information.
---
---* Corresponding C source code: [luafflib.c#L1200-L1281](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1200-L1281)
---
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
---@field os2_typoascent integer #
---@field os2_typodescent integer #
---@field os2_typolinegap integer #
---@field os2_winascent integer #
---@field os2_windescent integer #
---@field os2_subxsize integer #
---@field os2_subysize integer #
---@field os2_subxoff integer #
---@field os2_subyoff integer #
---@field os2_supxsize integer #
---@field os2_supysize integer #
---@field os2_supxoff integer #
---@field os2_supyoff integer #
---@field os2_strikeysize integer #
---@field os2_strikeypos integer #
---@field os2_family_class integer #
---@field os2_xheight integer #
---@field os2_capheight integer #
---@field os2_defaultchar integer #
---@field os2_breakchar integer #
---@field os2_vendor string #
---@field codepages table # A two-number array of encoded code pages
---@field unicoderages table # A four-number array of encoded unicode ranges
---@field panose table #

---
---* Corresponding C source code: [luafflib.c#L1222-L1232](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1222-L1232)
---
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

_N._12_6_7_names = 249

---
---* Corresponding C source code: [luafflib.c#L1418-L1416](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1418-L1416)
---
---@class FontloaderLangNames
---@field lang string # language for this entry
---@field names FontloaderNamesTrueType # The `names` keys are the actual *TrueType* name strings.

---
---* Corresponding C source code: [luafflib.c#L108-L115](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L108-L115)
---
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

_N._12_6_8_anchor_classes = 250

---
---* Corresponding C source code: [luafflib.c#L1448-L1452](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1448-L1452)
---
---@class FontloaderAnchorClasses
---@field name string # a descriptive id of this anchor class
---@field lookup string #
---@field type `mark`|`mkmk`|`curs`|`mklg` # type is actually a lookup subtype, not a feature name. Officially, these strings should be gpos_mark2mark etc.

_N._12_6_9_gpos = 250

---
---* Corresponding C source code: [luafflib.c#L580-L643](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L580-L643)
---
---@class FontloaderGposSub
---@field flags FontloaderGposFlags #
---@field name string #
---@field features FontloaderGposFeatures
---@field subtables FontloaderGposSubtables

---
---The `gpos` table has one array entry for each lookup. (The `gpos_`
---prefix is somewhat redundant.)
---
---* Corresponding C source code: [luafflib.c#L74-L76](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L74-L76)
---
---@class FontloaderGpos: FontloaderGposSub
---@field type `gpos_single`|`gpos_pair`|`gpos_cursive`|`gpos_mark2base`|`gpos_mark2ligature`|`gpos_mark2mark`|`gpos_context`|`gpos_contextchain`

---
---The flags table has a true value for each of the lookup flags that is actually
---set:
---
---* Corresponding C source code: [luafflib.c#L587-L612](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L587-L612)
---
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
---* Corresponding C source code: [luafflib.c#L523-L531](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L523-L531)
---
---@class FontloaderGposFeatures
---@field tag string #
---@field scripts FontloaderGposFeaturesScripts #

---
---The scripts table within features has:
---
---* Corresponding C source code: [luafflib.c#L492-L515](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L492-L515)
---
---@class FontloaderGposFeaturesScripts
---@field script string #
---@field langs string[]
---

---
---The subtables table has:
---
---* Corresponding C source code: [luafflib.c#L541-L572](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L541-L572)
---
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
---* Corresponding C source code: [luafflib.c#L1469-L1518](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1469-L1518)
---
---@class FontloaderGposSubtablesKernclass
---@field firsts string[]
---@field seconds string[]
---@field lookup string # or an array of associated lookup(s)
---@field offsets integer[]

_N._12_6_10_gsub = 251

---
---This has identical layout to the `gpos` table, except for the
---type:
---
---* Corresponding C source code: [luafflib.c#L56-L58](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L56-L58)
---
---@class FontloaderGsub: FontloaderGposSub
---@field type `gsub_single`|`gsub_multiple`|`gsub_alternate`|`gsub_ligature`|`gsub_context`|`gsub_contextchain`|`gsub_reversecontextchain`
---

_N._12_6_11_ttf_tables_and_ttf_tab_saved = 251

---
---* Corresponding C source code: [luafflib.c#L1454-L1461](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1454-L1461)
---
---@class FontloaderTtfTables
---@field tag string #
---@field len integer #
---@field maxlen integer #
---@field data integer #

_N._12_6_12_mm = 251

---
---* Corresponding C source code: [luafflib.c#L1841-L1898](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1841-L1898)
---
---@class FontloaderMm
---@field axes table # array of axis names
---@field instance_count integer #
---@field positions table # array of instance positions (\#axes * instances )
---@field defweights table # array of default weights for instances
---@field cdv string #
---@field ndv string #
---@field axismaps table #

---
---* Corresponding C source code: [luafflib.c#L1820-L1839](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1820-L1839)
---
---@class FontloaderAxismaps
---@field blends table # an array of blend points
---@field designs table # an array of design values
---@field min integer #
---@field def integer #
---@field max integer #

_N._12_6_13_mark_classes = 252

---
---The keys in this table are mark class names, and the values are a
---space-separated string of glyph names in this class.
---
---* Corresponding C source code: [luafflib.c#L2159-L2169](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2159-L2169)
---
---@alias FontloaderMarkClasses string<string, string>

_N._12_6_14_math = 252

---
---The math table has the variables that are also discussed in the chapter aboout
---math
---
---* Corresponding C source code: [luafflib.c#L1706-L1767](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1706-L1767)
---
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

_N._12_6_15_validation_state = 253

---
---* Corresponding C source code: [luafflib.c#L2183-L2229](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2183-L2229)
---
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

_N._12_6_16_horiz_base_and_vert_base = 253

---
---* Corresponding C source code: [luafflib.c#L1785-L1818](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1785-L1818)
---
---@class FontloaderHorizVertBase
---@field tags table # an array of script list tags
---@field scripts FontloaderScripts #

---
---* Corresponding C source code: [luafflib.c#L1785-L1818](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1785-L1818)
---@class FontloaderScripts
---@field baseline table #
---@field default_baseline number #
---@field lang FontloaderLang #

---
---* Corresponding C source code: [luafflib.c#L1769-L1777](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1769-L1777)
---
---@class FontloaderLang
---@field tag string # a script tag
---@field ascent number #
---@field descent number #
---@field features table # The `features` points to an array of tables with the same layout except that in those nested tables, the tag represents a language.

_N._12_6_17_altuni = 253

---
---* Corresponding C source code: [luafflib.c#L692-L714](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L692-L714)
---
---An array of alternate *Unicode* values. Inside that array are hashes with:
---@class FontloaderAltuni
---@field unicode number # this glyph is also used for this unicode
---@field variant number # the alternative is driven by this unicode selector

_N._12_6_18_vert_variants_and_horiz_variants = 253

---
---* Corresponding C source code: [luafflib.c#L914-L930](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L914-L930)
---
---@class FontloaderVertHorizVariants
---@field variants string #
---@field italic_correction number #
---@field parts FontloaderParts[] # The `parts` table is an array of smaller tables.

---
---* Corresponding C source code: [luafflib.c#L914-L930](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L914-L930)
---
---@class FontloaderParts
---@field component string #
---@field extender number #
---@field start number #
---@field end number #
---@field advance number #

_N._12_6_19_mathkern = 254

---
---* Corresponding C source code: [luafflib.c#L943-L957](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L943-L957)
---
---@class FontloaderMathkern
---@field top_right FontloaderMathkernSubtable #
---@field bottom_right FontloaderMathkernSubtable #
---@field top_left FontloaderMathkernSubtable #
---@field bottom_left FontloaderMathkernSubtable #

---
---* Corresponding C source code: [luafflib.c#L932-L941](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L932-L941)
---
---@class FontloaderMathkernSubtable
---@field height number #
---@field kern number #

_N._12_6_20_kerns = 254

---
---# `kerns`
---
---Substructure is identical to the per-glyph subtable.

_N._12_6_21_vkerns = 254

---
---# `vkerns`
---
---Substructure is identical to the per-glyph subtable.

_N._12_6_22_texdata = 254

---
---* Corresponding C source code: [luafflib.c#L2096-L2107](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L2096-L2107)
---
---@class FontloaderTexdata
---@field type `unset`|`text`|`math`|`mathext`
---@field params table # 22 font numeric parameters

_N._12_6_23_lookups = 254

--
---Top-level `lookups` is quite different from the ones at character level.
---The keys in this hash are strings, the values the actual lookups, represented as
---dictionary tables.
---
---* Corresponding C source code: [luafflib.c#L1628-L1661](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1628-L1661)
---
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
---* Corresponding C source code: [luafflib.c#L1558-L1626](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1558-L1626)
---
---@class FontloaderLockupRule
---@field lookups string[] a linear array of lookup names
---@field glyphs FontloaderLockupGlyph[] only if the parent's format is `glyphs`
---@field class FontloaderLockupClass[] only if the parent's format is `class`
---@field coverage FontloaderLockupsCoverage[] only if the parent's format is `coverage`
---@field reversecoverage FontloaderLockupReverseCoverage[] only if the parent's format is `reversecoverage`

---
---* Corresponding C source code: [luafflib.c#L1562-L1568](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1562-L1568)
---
---@class FontloaderLockupGlyph
---@field names string #
---@field back string #
---@field fore string #

---
---* Corresponding C source code: [luafflib.c#L1570-L1580](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1570-L1580)
---
---@class FontloaderLockupClass
---@field before number[]
---@field after number[]

---
---* Corresponding C source code: [luafflib.c#L1582-L1591](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1582-L1591)
---
---@class FontloaderLockupsCoverage
---@field current string[]
---@field before string[]
---@field after string[]

---
---* Corresponding C source code: [luafflib.c#L1593-L1604](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1593-L1604)
---
---@class FontloaderLockupReverseCoverage
---@field current string[]
---@field before string[]
---@field after string[]
---@field replacements string #
