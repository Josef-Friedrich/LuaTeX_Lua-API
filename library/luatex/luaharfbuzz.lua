---@meta

luaharfbuzz = {}

---
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
function luaharfbuzz.shape_full() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luaharfbuzz.shapers() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luaharfbuzz.version() end

---https://github.com/ufyTeX/luaharfbuzz/blob/master/src/harfbuzz.luadoc

-----------
---Lua bindings to Harfbuzz.
---* [Wiki](http://github.com/ufytex/luaharfbuzz/wiki)
---* [Source on Github](https://github.com/ufytex/luaharfbuzz)
---* [API Coverage Status](https://github.com/ufytex/luaharfbuzz/blob/master/status/done.txt)
--
---@author Deepak Jois <<deepak.jois@gmail.com>>
---@copyright 2016
---@license MIT
---@module harfbuzz

---Wraps `hb_version`
function version() end

---Wraps `hb_shape`.
---@param font Font # `Font` to use for shaping
--
---@param buffer Buffer # `Buffer` to shape
--
---@param options? # table containing one or more supported options:
--
---* `direction`: A `Direction` object representing the object.
---* `script`: A `Script` object representing the script.
---* `language`: A `Language` object representing the language.
---* `features`: features to enable, specified as either of the following.
----- comma-separated list of features. See [feature string syntax reference](https://github.com/ufytex/luaharfbuzz/wiki/Feature-Strings)
----- table of `Feature` objects
function shape(font, buffer, options) end

---Lua wrapper for `hb_blob_t` type
---@class Blob
local Blob = {}

---Wraps `hb_blob_create`.
---Initializes a new `hb_blob_t`.
---@param data string # lua string containing binary or character data.
function Blob.new(data) end

---Wraps `hb_blob_create_from_file`.
---Initializes a new `hb_blob_t`.
---@param filename string # lua string.
function Blob.new_from_file(filename) end

---Wraps `hb_blob_get_length`.
function Blob:get_length() end

---Wraps `hb_blob_get_data`.
function Blob:get_data() end

---Lua wrapper for `hb_face_t` type
---@class Face
local Face = {}

---Wraps `hb_face_create`.
---Initializes a new `hb_face_t` from a `Blob` object.
---@param blob Blob # `Blob` to read the font from.
---@param[opt=0] font_index index of font to read.
function Face.new_from_blob(blob) end

---Create a new `Face` from a file.
---Makes a call to `Face:new_from_blob` after creating a `Blob` from the
---file contents.
---@param file string # path to font file.
---@param[opt=0] font_index index of font to read.
function Face.new(file) end

---Wraps `hb_face_collect_unicodes`.
---@return table of codepoints supported by the face.
function Face:collect_unicodes() end

---Wraps `hb_face_get_glyph_count`.
function Face:get_glyph_count() end

---Wraps `hb_face_reference_table`.
---@param tag Tag # `Tag` object of the table.
---@return # `Blob` object for the face table of `tag`.
function Face:get_table(tag) end

---Wraps `hb_face_get_table_tags`.
---@return Tag[] # table of `Tag`s representing face table tags.
function Face:get_table_tags() end

---Wraps `hb_face_get_upem`.
function Face:get_upem() end

---Wraps `hb_ot_color_has_palettes`.
function Face:ot_color_has_palettes() end

---Wraps `hb_ot_color_palette_get_count`.
function Face:ot_color_palette_get_count() end

---Wraps `hb_ot_color_palette_get_colors`.
function Face:ot_color_palette_get_colors() end

---Wraps `hb_ot_color_has_layers`.
function Face:ot_color_has_layers() end

---Wraps `hb_ot_color_glyph_get_layers`.
function Face:ot_color_glyph_get_layers() end

---Wraps `hb_ot_color_has_png`.
function Face:ot_color_has_png() end

---Wraps `hb_ot_layout_table_get_script_tags`.
function Face:ot_layout_get_script_tags() end

---Wraps `hb_ot_layout_script_get_language_tags`.
function Face:ot_layout_get_language_tags() end

---Wraps `hb_ot_layout_language_get_feature_tags`.
function Face:ot_layout_get_feature_tags() end

---Wraps `hb_ot_layout_table_find_script`.
function Face:ot_layout_find_script() end

---Wraps `hb_ot_layout_script_find_language`.
function Face:ot_layout_find_language() end

---Wraps `hb_ot_layout_language_find_feature`.
function Face:ot_layout_find_feature() end

---Lua wrapper for `hb_font_t` type
---@class Font
local Font = {}

---Wraps `hb_font_create`, and sets up some defaults for scale and shaping functions.
---Initializes a new `hb_font_t` from a `Face` object. Sets the default scale
---to the face’s upem value, and sets the font shaping functions by
---calling `hb_ot_font_set_funcs` on it.
---@param face Face # `Face` object.
function Font.new(face) end

---Wraps `hb_font_get_scale`.
---@return # two values for the x-scale and y-scale of the font.
function Font:get_scale() end

---Wraps `hb_font_set_scale`.
---@param x_scale number # desired x-scale of font.
---@param y_scale number # desired y-scale of font.
function Font:set_scale(x_scale, y_scale) end

---Wraps `hb_font_get_h_extents`.
---@return # font extents table for horizontal direction, contains the following
---or `nil` if HarfBuzz fails to load font extents:
--
---* `ascender`: typographic ascender.
---* `descender`: typographic descender.
---* `line_gap`: line spacing gap.
function Font:get_h_extents() end

---Wraps `hb_font_get_v_extents`.
---@return # font extents table for vertical direction, similar to
---`Font:get_h_extents`, or `nil` if HarfBuzz fails to load font extents:
function Font:get_v_extents() end

---Wraps `hb_font_get_glyph_extents`.
---@param glyph integer # index inside the font.
---@return # extents table contains the following or `nil` if HarfBuzz fails to
---load glyph extents:
--
---* `x_bearing`: left side of glyph from origin.
---* `y_bearing`: top side of glyph from origin.
---* `width`: distance from left to right side.
---* `height`: distance from top to bottom side.
function Font:get_glyph_extents(glyph) end

---Wraps `hb_font_get_glyph_name`.
---@param glyph integer # index inside the font.
---@return # name of the glyph or nil.
function Font:get_glyph_name(glyph) end

---Wraps `hb_font_get_glyph_from_name`.
---@param name string # name of the glyph.
---@return # glyph index inside the font or nil.
function Font:get_glyph_from_name(name) end

---Wraps `hb_font_get_glyph_h_advance`.
---@param glyph integer # glyph index inside the font.
---@return # advance glyph advance of the glyph in horizontal direction.
function Font:get_glyph_h_advance(glyph) end

---Wraps `hb_font_get_glyph_v_advance`.
---@param glyph integer # glyph index inside the font.
---@return # advance glyph advance of the glyph in vertical direction.
function Font:get_glyph_v_advance(glyph) end

---Wraps `hb_font_get_nominal_glyph`.
---@param codepoint integer
---@return # glyph index or `nil` if `codepoint` is not supported by the font.
function Font:get_nominal_glyph(codepoint) end

---Wraps `hb_ot_color_glyph_get_png`.
function Font:ot_color_glyph_get_png() end

---Lua wrapper for `hb_buffer_t` type.
---@class Buffer
local Buffer = {}

---Wraps `hb_buffer_create`.
function Buffer.new() end

---Wraps `hb_buffer_add_utf8`.
---@param text UTF8 encoded string.
---@param[opt=0] item_offset 0-indexed offset in `text`, from where to start adding.
---@param[opt=-1] item_length length to add from `item_offset`. `-1` adds till end of `text`.
function Buffer:add_utf8() end

---Wraps `hb_buffer_add_codepoints`.
---@param text table with codepoints as lua numbers.
---@param[opt=0] item_offset 0-indexed offset in `text`, from where to start adding.
---@param[opt=-1] item_length length to add from `item_offset`. `-1` adds till end of&nbsp;`text`.
function Buffer:add_codepoints() end

---Wraps `hb_buffer_set_direction`.
---@param dir  A `Direction` object.
function Buffer:set_direction() end

---Wraps `hb_buffer_get_direction`.
---@return # A `Direction` object.
function Buffer:get_direction() end

---Wraps `hb_buffer_set_script`.
---@param script  A `Script` object.
function Buffer:set_script() end

---Wraps `hb_buffer_get_script`.
---@return # A `Script` object.
function Buffer:get_script() end

---Wraps `hb_buffer_set_language`.
---@param lang Language A `Language` object
function Buffer:set_language(lang) end

---Wraps `hb_buffer_get_language`.
---@return # A `Language` object
function Buffer:get_language() end

---Wraps `hb_buffer_reverse`.
function Buffer:reverse() end

---Wraps `hb_buffer_get_length`.
function Buffer:get_length() end

---Wraps `hb_buffer_get_cluster_level`.
---@return # see [Cluster Levels](#Cluster_Levels)
function Buffer:get_cluster_level() end

---Wraps `hb_buffer_set_cluster_level`.
---@param level see [Cluster Levels](#Cluster_Levels)
function Buffer:set_cluster_level() end

---Wraps `hb_buffer_guess_segment_properties`.
function Buffer:guess_segment_properties() end

---Helper method to get shaped glyph data.
---Calls `hb_buffer_get_glyph_infos`, `hb_buffer_get_glyph_positions` and
---`hb_glyph_info_get_glyph_flags`, and assembles the data into a Lua table.
---@return table containing data for each glyph, in a nested table. Each nested
---table contains the following:
--
---* `x_advance`: horizontal advance.
---* `y_advance`: vertical advance.
---* `x_offset`: horizontal displacement.
---* `y_offset`: vertical displacement.
---* `cluster`: glyph cluster index within input.
---* `codepoint`: glyph index inside the font _(this field name is a bit misleading, but that’s what Harfbuzz uses)_.
---* `flags`: glyph flags
function Buffer:get_glyphs() end

---Cluster Levels.
---See [Harfbuzz docs](http://behdad.github.io/harfbuzz/clusters.html) for more details
---about what each of these levels mean.
---@section

---Wraps `HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES`.
---@field Buffer.CLUSTER_LEVEL_MONOTONE_GRAPHEMES

---Wraps `HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS`.
---@field Buffer.CLUSTER_LEVEL_MONOTONE_CHARACTERS

---Wraps `HB_BUFFER_CLUSTER_LEVEL_CHARACTERS`.
---@field Buffer.CLUSTER_LEVEL_CHARACTERS

---Wraps `HB_BUFFER_CLUSTER_LEVEL_DEFAULT`.
---@field Buffer.CLUSTER_LEVEL_DEFAULT

---Wraps `HB_GLYPH_FLAG_UNSAFE_TO_BREAK`.
---@field Buffer.GLYPH_FLAG_UNSAFE_TO_BREAK

---Wraps `HB_GLYPH_FLAG_DEFINED`.
---@field Buffer.GLYPH_FLAG_DEFINED

---Lua wrapper for `hb_feature_t` type
---@class Feature
local Feature = {}

---Wraps `hb_feature_from_string`
---@param feature_string See [feature string syntax reference](https://github.com/ufytex/luaharfbuzz/wiki/Feature-Strings)
function Feature.new() end

---Wraps `hb_feature_to_string`.
---Enables nice output with `tostring(…)`.
function Feature:__tostring() end

---Lua wrapper for `hb_tag_t` type.
---@class Tag
local Tag = {}

---Wraps `hb_tag_from_string`.
---@param string to be converted to a `Tag` object.
---@return # a `Tag` object.
function Tag.new() end

---Wraps `hb_tag_to_string`. Enable nice output with `tostring(…)`.
---@return Returns a string representation for the tag object.
function Tag:__to_string() end

---Enables equality comparisions with `==` between two tags.
---@return # `true` or `false` depending on whether the two tags are equal.
function Tag:__eq() end

---Lua wrapper for `hb_script_t` type.
---@class Script
local Script = {}

---Wraps `hb_script_from_string`.
---@param script string # 4-letter script code according to the [ISO 15924 standard](http://www.unicode.org/iso15924/iso15924-num.html).
---@return Script # a `Script` object.
function Script.new(script) end

---Wraps `hb_script_from_iso15924_tag`
---@param tag Tag # a `Tag` object representing a [ISO 15924 script](http://www.unicode.org/iso15924/iso15924-num.html).
function Script.from_iso15924_tag(tag) end

---Wraps `hb_script_to_iso15924_tag`.
---@return Tag # a `Tag` object representing the script.
function Script:to_iso15924_tag() end

---Enable nice output with `tostring(…)`
---@return Returns a 4-letter [ISO 15924 script code](http://www.unicode.org/iso15924/iso15924-num.html) for the script object.
function Script:__to_string() end

---Enables equality comparisions with `==` between two scripts.
---@return `true` or `false` depending on whether the two scripts are equal.
function Script:__eq() end

---Predefined Script Codes.
---Predefined directions that correspond to their original definitions in Harfbuzz.
---@section

---Wraps `HB_SCRIPT_COMMON`.
---@field Script.COMMON

---Wraps `HB_SCRIPT_INHERITED`.
---@field Script.INHERITED

---Wraps `HB_SCRIPT_UNKNOWN`.
---@field Script.UNKNOWN

---Wraps `HB_SCRIPT_INVALID`.
---@field Script.INVALID

---Lua wrapper for `hb_direction_t` type.
---@class Direction
local Direction = {}

---Wraps `hb_direction_from_string`.
---@param dir `ltr`|`rtl`|`ttb`|`btt`|`invalid` # can be one of `ltr`, `rtl`, `ttb`, `btt` or `invalid`.
---@return Direction # a `Direction` object.
function Direction.new(dir) end

---Wraps `hb_direction_to_string`. Enable nice output with `tostring(…)`.
---@return string # Returns a string representation for direction.
function Direction:__to_string() end

---Enables equality comparisions with `==` between two directions.
---@return boolean # `true` or `false` depending on whether the two tags are equal.
function Direction:__eq() end

---Wraps `HB_DIRECTION_IS_VALID`.
---@return boolean # a boolean value
function Direction:is_valid() end

---Wraps `HB_DIRECTION_IS_HORIZONTAL`.
---@return boolean # a boolean value
function Direction:is_horizontal() end

---Wraps `HB_DIRECTION_IS_VERTICAL`.
---@return boolean # a boolean value
function Direction:is_vertical() end

---Wraps `HB_DIRECTION_IS_FORWARD`.
---@return boolean # a boolean value
function Direction:is_forward() end

---Wraps `HB_DIRECTION_IS_BACKWARD`.
---@return boolean # a boolean value
function Direction:is_backward() end

---Predefined directions.
---Predefined directions that correspond to their original definitions in Harfbuzz.
---@section

---Wraps `HB_DIRECTION_LTR`.
---@field Direction.LTR

---Wraps `HB_DIRECTION_RTL`.
---@field Direction.RTL

---Wraps `HB_DIRECTION_TTB`.
---@field Direction.TTB

---Wraps `HB_DIRECTION_LTR`.
---@field Direction.BTT

---Lua wrapper for `hb_language_t` type.
---@class Language
local Language = {}

---Wraps `hb_language_from_string`.
---@param lang string [three-letter language tag](http://www.microsoft.com/typography/otspec/languagetags.htm) to be converted to a `Language` object.
---@return Language # a `Language` object.
function Language.new(lang) end

---Wraps `hb_language_to_string`. Enable nice output with `tostring(…)`.
---@return string # Returns a string representation for the language object.
function Language:__to_string() end

---Enables equality comparisions with `==` between two languages.
---@return boolean # `true` or `false` depending on whether the two languages are equal.
function Language:__eq() end

---Wraps `HB_LANGUAGE_INVALID`.
Language.INVALID = true

---Unicode functions.
---@class unicode
local unicode = {}

---Wraps `hb_unicode_script`
---@param char integer # Unicode codepoint
---@return Script # a `Script` object.
function unicode.script(char) end

---Predefined Name IDs.
---Predefined OpenType 'name' table name identifier.
---@class ot
---@field NAME_ID_COPYRIGHT string # Wraps `HB_OT_NAME_ID_COPYRIGHT`
---@field NAME_ID_FONT_FAMILY string # Wraps `HB_OT_NAME_ID_FONT_FAMILY`
---@field NAME_ID_FONT_SUBFAMILY string # Wraps `HB_OT_NAME_ID_FONT_SUBFAMILY`
---@field NAME_ID_UNIQUE_ID string # Wraps `HB_OT_NAME_ID_UNIQUE_ID`
---@field NAME_ID_FULL_NAME string # Wraps `HB_OT_NAME_ID_FULL_NAME`
---@field NAME_ID_VERSION_STRING string # Wraps `HB_OT_NAME_ID_VERSION_STRING`
---@field NAME_ID_POSTSCRIPT_NAME string # Wraps `HB_OT_NAME_ID_POSTSCRIPT_NAME`
---@field NAME_ID_TRADEMARK string # Wraps `HB_OT_NAME_ID_TRADEMARK`
---@field NAME_ID_MANUFACTURER string # Wraps `HB_OT_NAME_ID_MANUFACTURER`
---@field NAME_ID_DESIGNER string # Wraps `HB_OT_NAME_ID_DESIGNER`
---@field NAME_ID_DESCRIPTION string # Wraps `HB_OT_NAME_ID_DESCRIPTION`
---@field NAME_ID_VENDOR_URL string # Wraps `HB_OT_NAME_ID_VENDOR_URL`
---@field NAME_ID_DESIGNER_URL string # Wraps `HB_OT_NAME_ID_DESIGNER_URL`
---@field NAME_ID_LICENSE string # Wraps `HB_OT_NAME_ID_LICENSE`
---@field NAME_ID_LICENSE_URL string # Wraps `HB_OT_NAME_ID_LICENSE_URL`
---@field NAME_ID_TYPOGRAPHIC_FAMILY string # Wraps `HB_OT_NAME_ID_TYPOGRAPHIC_FAMILY`
---@field NAME_ID_TYPOGRAPHIC_SUBFAMILY string # Wraps `HB_OT_NAME_ID_TYPOGRAPHIC_SUBFAMILY`
---@field NAME_ID_MAC_FULL_NAME string # Wraps `HB_OT_NAME_ID_MAC_FULL_NAME`
---@field NAME_ID_SAMPLE_TEXT string # Wraps `HB_OT_NAME_ID_SAMPLE_TEXT`
---@field NAME_ID_CID_FINDFONT_NAME string # Wraps `HB_OT_NAME_ID_CID_FINDFONT_NAME`
---@field NAME_ID_WWS_FAMILY string # Wraps `HB_OT_NAME_ID_WWS_FAMILY`
---@field NAME_ID_WWS_SUBFAMILY string # Wraps `HB_OT_NAME_ID_WWS_SUBFAMILY`
---@field NAME_ID_LIGHT_BACKGROUND string # Wraps `HB_OT_NAME_ID_LIGHT_BACKGROUND`
---@field NAME_ID_DARK_BACKGROUND string # Wraps `HB_OT_NAME_ID_DARK_BACKGROUND`
---@field NAME_ID_VARIATIONS_PS_PREFIX string # Wraps `HB_OT_NAME_ID_VARIATIONS_PS_PREFIX`
---@field NAME_ID_INVALID string # Wraps `HB_OT_NAME_ID_INVALID`
---@field LAYOUT_NO_SCRIPT_INDEX string # Wraps `HB_OT_LAYOUT_NO_SCRIPT_INDEX`
---@field LAYOUT_NO_FEATURE_INDEX string # Wraps `HB_OT_LAYOUT_NO_FEATURE_INDEX`
---@field LAYOUT_DEFAULT_LANGUAGE_INDEX string # Wraps `HB_OT_LAYOUT_DEFAULT_LANGUAGE_INDEX`
---@field LAYOUT_NO_VARIATIONS_INDEX string # Wraps `HB_OT_LAYOUT_NO_VARIATIONS_INDEX`
