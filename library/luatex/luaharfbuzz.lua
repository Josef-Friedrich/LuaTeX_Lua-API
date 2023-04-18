_N._13_1_The_luaharfbuzz_library = "page 255"

---
---Changes to upstream: global luaharfbuzz table

---
---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/luaharfbuzz

---
---https://github.com/ufyTeX/luaharfbuzz/blob/master/src/harfbuzz.luadoc
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
luaharfbuzz = {}

---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class LuaHarfBuzzOptions
---@field direction Direction # A `Direction` object representing the object.
---@field script Script # A `Script` object representing the script.
---@field language Language # A `Language` object representing the language.
---@field features string|Feature[] # features to enable, specified as either of the following.
----- comma-separated list of features. See [feature string syntax reference](https://github.com/ufytex/luaharfbuzz/wiki/Feature-Strings)
----- table of `Feature` objects

---
---* Corresponding C source code: [luaharfbuzz.c#L16-L51](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luaharfbuzz/src/luaharfbuzz/luaharfbuzz.c#L16-L51)
---
---@param font Font
---@param buffer Buffer
---@param features Feature[]
---@param shapers string[]
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function luaharfbuzz.shape_full(font, buffer, features, shapers) end

---
---* Corresponding C source code: [luaharfbuzz.c#L44-L53](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/luaharfbuzz.c#L44-L53)
---
---@return string ...  # for example: `graphite2 ot fallback`
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function luaharfbuzz.shapers() end

---
---Return the library version as a string with three components.
---
---* Corresponding C source code: [luaharfbuzz.c#L39-L42](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/luaharfbuzz.c#L39-L42)
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function luaharfbuzz.version() end

---
---Shape `buffer` using `font` turning its Unicode characters content to positioned glyphs.
---
---* Corresponding C source code: [harfbuzz.lua#L22-L53](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/harfbuzz.lua#L22-L53)
---
---@param font Font # `Font` to use for shaping
---@param buffer Buffer # `Buffer` to shape
---@param options? LuaHarfBuzzOptions
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function luaharfbuzz.shape(font, buffer, options) end

---
---Blobs wrap a chunk of binary data to handle lifecycle management of data while it is passed between client and HarfBuzz. Blobs are primarily used to create font faces, but also to access font face tables, as well as pass around other binary data.
---
---@class Blob
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
local Blob = {}
luaharfbuzz.Blob = Blob

---
---Create a new "blob" object wrapping data.
---
---* Corresponding C source code: [blob.c#L3-L14](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/blob.c#L3-L14)
---
---@param data string # A Lua string containing binary or character data.
---
---@return Blob
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Blob.new(data) end

---
---Create a new blob containing the data from the specified binary font file.
---
---* Corresponding C source code: [blob.c#L16-L26](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/blob.c#L16-L26)
---
---@param filename string # lua string.
---
---@return Blob
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Blob.new_from_file(filename) end

---
---Fetch the length of a blob's data.
---
---* Corresponding C source code: [blob.c#L28-L33](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/blob.c#L28-L33)
---
---@return integer
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Blob:get_length() end

---
---Fetch the data from a blob.
---
---* Corresponding C source code: [blob.c#L35-L44](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/blob.c#L35-L44)
---
---@return string data # the byte data of blob as a string
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Blob:get_data() end

---
---A font face is an object that represents a single face from within a font family.
---
---More precisely, a font face represents a single face in a binary font file. Font faces are typically built from a binary blob and a face index. Font faces are used to create fonts.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class Face
local Face = {}
luaharfbuzz.Face = Face

---
---Constructs a new face object from the specified blob and a face index into that blob.
---
---The face index is used for blobs of file formats such as TTC and DFont that can contain more than one face. Face indices within such collections are zero-based.
---
---* Corresponding C source code: [face.c#L28-L45](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L28-L45)
---
---@param blob Blob # `Blob` to read the font from.
---@param font_index? integer # index of font to read.
---
---@return Face|nil
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face.new_from_blob(blob, font_index) end

---
---Create a new `Face` from a file.
---
---Makes a call to `Face:new_from_blob` after creating a `Blob` from the
---file contents.
---
---* Corresponding C source code: [face.c#L7-L26](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L7-L26)
---
---@param file string # path to font file.
---@param font_index? integer # index of font to read.
---
---@return Face|nil
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face.new(file, font_index) end

---
---Collect all of the Unicode characters covered by face.
---
---* Corresponding C source code: [face.c#L264-L284](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L264-L284)
---
---@return table # of codepoints supported by the face.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:collect_unicodes() end

---
---Fetch the glyph-count value of the specified face object.
---
---* Corresponding C source code: [face.c#L47-L52](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L47-L52)
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:get_glyph_count() end

---
---Fetch a reference to the specified table within the specified face.
---
---Wraps `hb_face_reference_table`.
---
---* Corresponding C source code: [face.c#L82-L94](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L82-L94)
---
---@param tag Tag # `Tag` object of the table.
---
---@return Blob # `Blob` object for the face table of `tag`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:get_table(tag) end

---
---Fetches a list of all table tags for a face, if possible. The list returned will begin at the offset provided.
---
---Wraps `hb_face_get_table_tags`.
---
---* Corresponding C source code: [face.c#L96-L124](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L96-L124)
---
---@return Tag[] # table of `Tag`s representing face table tags.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:get_table_tags() end

---
---Wraps `hb_face_get_upem`.
---
---* Corresponding C source code: [face.c#L286-L291](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L286-L291)
---
---@return integer
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:get_upem() end

---
---Wraps `hb_ot_color_has_palettes`.
---
---* Corresponding C source code: [face.c#L293-L298](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L293-L298)
---
---@return boolean
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_color_has_palettes() end

---
---Wraps `hb_ot_color_palette_get_count`.
---
---* Corresponding C source code: [face.c#L300-L305](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L300-L305)
---
---@return integer
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_color_palette_get_count() end

---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class LuaHarfBuzzColor
---@field red integer
---@field green integer
---@field blue integer
---@field alpha integer

---
---Wraps `hb_ot_color_palette_get_colors`.
---
---* Corresponding C source code: [face.c#L307-L347](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L307-L347)
---
---@return LuaHarfBuzzColor[]
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_color_palette_get_colors() end

---
---Wraps `hb_ot_color_has_layers`.
---
---* Corresponding C source code: [face.c#L349-L354](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L349-L354)
---@return boolean
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_color_has_layers() end

---
---Wraps `hb_ot_color_glyph_get_layers`.
---
---* Corresponding C source code: [face.c#L356-L392](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L356-L392)
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_color_glyph_get_layers() end

---
---Wraps `hb_ot_color_has_png`.
---
---* Corresponding C source code: [face.c#L394-L399](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L394-L399)
---
---@return boolean
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_color_has_png() end

---
---Wraps `hb_ot_layout_table_get_script_tags`.
---
---* Corresponding C source code: [face.c#L126-L156](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L126-L156)
---
---@return Tag[]
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_layout_get_script_tags() end

---
---Wraps `hb_ot_layout_script_get_language_tags`.
---
---* Corresponding C source code: [face.c#L158-L189](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L158-L189)
---
---@return Tag[]
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_layout_get_language_tags() end

---
---Wraps `hb_ot_layout_language_get_feature_tags`.
---
---* Corresponding C source code: [face.c#L191-L223](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L191-L223)
---
---@return Tag[]
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_layout_get_feature_tags() end

---
---Wraps `hb_ot_layout_table_find_script`.
---
---* Corresponding C source code: [face.c#L225-L235](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L225-L235)
---
---@return boolean found
---@return integer index
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_layout_find_script() end

---
---Wraps `hb_ot_layout_script_find_language`.
---
---* Corresponding C source code: [face.c#L237-L248](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L237-L248)
---
---@return boolean found
---@return integer index
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_layout_find_language() end

---
---Wraps `hb_ot_layout_language_find_feature`.
---
---* Corresponding C source code: [face.c#L250-L262](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/face.c#L250-L262)
---
---@return boolean found
---@return integer index
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Face:ot_layout_find_feature() end

---
---Lua wrapper for `hb_font_t` type
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class Font
local Font = {}
luaharfbuzz.Font = Font

---
---Wraps `hb_font_create`, and sets up some defaults for scale and shaping functions.
---Initializes a new `hb_font_t` from a `Face` object. Sets the default scale
---to the face’s upem value, and sets the font shaping functions by
---calling `hb_ot_font_set_funcs` on it.
---
---@param face Face # `Face` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font.new(face) end

---
---Wraps `hb_font_get_scale`.
---
---* Corresponding C source code: [font.c#L31-L40](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/font.c#L31-L40)
---
---@return integer # x-scale of the font.
---@return integer # y-scale of the font.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:get_scale() end

---
---Wraps `hb_font_set_scale`.
---
---* Corresponding C source code: [font.c#L22-L29](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/font.c#L22-L29)
---
---@param x_scale integer # desired x-scale of font.
---@param y_scale integer # desired y-scale of font.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:set_scale(x_scale, y_scale) end

---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class FontExtens
---@field ascender integer # typographic ascender.
---@field descender integer # typographic descender.
---@field line_gap integer # line spacing gap.

---
---Wraps `hb_font_get_h_extents`.
---
---@param glyph integer # index inside the font.
---
---@return FontExtens|nil # font extents table for horizontal direction, contains the following or `nil` if HarfBuzz fails to load font extents:
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:get_h_extents(glyph) end

---
---Wraps `hb_font_get_v_extents`.
---
---@param glyph integer # index inside the font.
---
---@return FontExtens|nil # font extents table for vertical direction, similar to `Font:get_h_extents`, or `nil` if HarfBuzz fails to load font extents:
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:get_v_extents(glyph) end

---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class GlyphExtens
---@field x_bearing integer # left side of glyph from origin.
---@field y_bearing integer # top side of glyph from origin.
---@field width integer # distance from left to right side.
---@field height integer # distance from top to bottom side.

---
---Wraps `hb_font_get_glyph_extents`.
---
---@param glyph integer # index inside the font.
---
---@return GlyphExtens|nil # extents table contains the following or `nil` if HarfBuzz fails to
---load glyph extents
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:get_glyph_extents(glyph) end

---
---Wraps `hb_font_get_glyph_name`.
---
---@param glyph integer # index inside the font.
---
---@return string # name of the glyph or nil.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:get_glyph_name(glyph) end

---
---Wraps `hb_font_get_glyph_from_name`.
---
---@param name string # name of the glyph.
---
---@return integer # glyph index inside the font or nil.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:get_glyph_from_name(name) end

---
---Wraps `hb_font_get_glyph_h_advance`.
---
---@param glyph integer # glyph index inside the font.
---
---@return integer # advance glyph advance of the glyph in horizontal direction.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:get_glyph_h_advance(glyph) end

---
---Wraps `hb_font_get_glyph_v_advance`.
---
---@param glyph integer # glyph index inside the font.
---
---@return integer # advance glyph advance of the glyph in vertical direction.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:get_glyph_v_advance(glyph) end

---
---Wraps `hb_font_get_nominal_glyph`.
---
---@param codepoint integer
---
---@return integer|nil # glyph index or `nil` if `codepoint` is not supported by the font.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:get_nominal_glyph(codepoint) end

---
---Wraps `hb_ot_color_glyph_get_png`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Font:ot_color_glyph_get_png() end

---
---Lua wrapper for `hb_buffer_t` type.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class Buffer
local Buffer = {}
luaharfbuzz.Buffer = Buffer

---
---Wraps `hb_buffer_create`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer.new() end

---
---Wraps `hb_buffer_add_utf8`.
---
---@param text string # UTF8 encoded string.
---@param opt? integer [opt=0] item_offset 0-indexed offset in `text`, from where to start adding. [opt=-1] item_length length to add from `item_offset`. `-1` adds till end of `text`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:add_utf8(text, opt) end

---
---Wraps `hb_buffer_add_codepoints`.
---
---@param text integer[] # with codepoints as lua numbers.
---@param opt? integer [opt=0] item_offset 0-indexed offset in `text`, from where to start adding. [opt=-1] item_length length to add from `item_offset`. `-1` adds till end of `text`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:add_codepoints(text, opt) end

---
---Wraps `hb_buffer_set_direction`.
---
---@param dir Direction # A `Direction` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:set_direction(dir) end

---
---Wraps `hb_buffer_get_direction`.
---
---@return Direction # A `Direction` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:get_direction() end

---
---Wraps `hb_buffer_set_script`.
---
---@param script Script # A `Script` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:set_script(script) end

---
---Wraps `hb_buffer_get_script`.
---
---@return Script # A `Script` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:get_script() end

---
---Wraps `hb_buffer_set_language`.
---
---@param lang Language A `Language` object
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:set_language(lang) end

---
---Wraps `hb_buffer_get_language`.
---
---@return Language # A `Language` object
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:get_language() end

---
---Wraps `hb_buffer_reverse`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:reverse() end

---
---Wraps `hb_buffer_get_length`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:get_length() end

---
---Wraps `hb_buffer_get_cluster_level`.
---
---@return integer level # see Cluster Levels
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:get_cluster_level() end

---
---Wraps `hb_buffer_set_cluster_level`.
---
---@param level integer # see Cluster Levels
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:set_cluster_level(level) end

---
---Wraps `hb_buffer_guess_segment_properties`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:guess_segment_properties() end

---
---containing data for each glyph, in a nested table. Each nested
---table contains the following:
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class Glyph
---@field x_advance number # horizontal advance.
---@field y_advance number # vertical advance.
---@field x_offset number # horizontal displacement.
---@field y_offset number # vertical displacement.
---@field cluster integer # glyph cluster index within input.
---@field codepoint integer # glyph index inside the font _(this field name is a bit misleading, but that’s what Harfbuzz uses)_.
---@field flags number # glyph flags

---
---Helper method to get shaped glyph data.
---Calls `hb_buffer_get_glyph_infos`, `hb_buffer_get_glyph_positions` and
---`hb_glyph_info_get_glyph_flags`, and assembles the data into a Lua table.
---
---@return Glyph[]
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Buffer:get_glyphs() end

---
---Cluster Levels.
---See [Harfbuzz docs](http://behdad.github.io/harfbuzz/clusters.html) for more details
---about what each of these levels mean.
---
---Wraps `HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Buffer.CLUSTER_LEVEL_MONOTONE_GRAPHEMES = 0

---
---Wraps `HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Buffer.CLUSTER_LEVEL_MONOTONE_CHARACTERS = 1

---
---Wraps `HB_BUFFER_CLUSTER_LEVEL_CHARACTERS`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Buffer.CLUSTER_LEVEL_CHARACTERS = 2

---
---Wraps `HB_BUFFER_CLUSTER_LEVEL_DEFAULT`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Buffer.CLUSTER_LEVEL_DEFAULT = 0

---
---Wraps `HB_GLYPH_FLAG_UNSAFE_TO_BREAK`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Buffer.GLYPH_FLAG_UNSAFE_TO_BREAK = 1

---
---Wraps `HB_GLYPH_FLAG_DEFINED`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Buffer.GLYPH_FLAG_DEFINED = 3

---
---Lua wrapper for `hb_feature_t` type
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class Feature
local Feature = {}
luaharfbuzz.Feature = Feature

---
---Wraps `hb_feature_from_string`
---@param feature_string string # See [feature string syntax reference](https://github.com/ufytex/luaharfbuzz/wiki/Feature-Strings)
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Feature.new(feature_string) end

---
---Wraps `hb_feature_to_string`.
---Enables nice output with `tostring(…)`.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Feature:__tostring() end

---
---Lua wrapper for `hb_tag_t` type.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class Tag
local Tag = {}
luaharfbuzz.Tag = Tag

---
---Wraps `hb_tag_from_string`.
---
---@param s string # to be converted to a `Tag` object.
---
---@return Tag # a `Tag` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Tag.new(s) end

---
---Wraps `hb_tag_to_string`. Enable nice output with `tostring(…)`.
---
---@return string # Returns a string representation for the tag object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Tag:__to_string() end

---
---Enables equality comparisions with `==` between two tags.
---
---@return boolean# `true` or `false` depending on whether the two tags are equal.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Tag:__eq() end

---
---Lua wrapper for `hb_script_t` type.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class Script
local Script = {}
luaharfbuzz.Script = Script

---
---Wraps `hb_script_from_string`.
---
---@param script string # 4-letter script code according to the [ISO 15924 standard](http://www.unicode.org/iso15924/iso15924-num.html).
---
---@return Script # a `Script` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Script.new(script) end

---
---Wraps `hb_script_from_iso15924_tag`
---
---* HarfBuzz online documentation: [harfbuzz-hb-common.html#hb-script-from-iso15924-tag](https://harfbuzz.github.io/harfbuzz-hb-common.html#hb-script-from-iso15924-tag)
---
---@param tag Tag # a `Tag` object representing a [ISO 15924 script](http://www.unicode.org/iso15924/iso15924-num.html).
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Script.from_iso15924_tag(tag) end

---
---Wraps `hb_script_to_iso15924_tag`.
---
---* HarfBuzz online documentation: [harfbuzz-hb-common.html#hb-script-to-iso15924-tag](https://harfbuzz.github.io/harfbuzz-hb-common.html#hb-script-to-iso15924-tag)
---
---@return Tag # a `Tag` object representing the script.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Script:to_iso15924_tag() end

---
---Enable nice output with `tostring(…)`
---
---@return string # Returns a 4-letter [ISO 15924 script code](http://www.unicode.org/iso15924/iso15924-num.html) for the script object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Script:__to_string() end

---
---Enables equality comparisions with `==` between two scripts.
---@return boolean `true` or `false` depending on whether the two scripts are equal.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Script:__eq() end

---
---Wraps `HB_SCRIPT_COMMON`.
---
---* [HarfBuzz online documentation](https://harfbuzz.github.io/harfbuzz-hb-common.html#HB-SCRIPT-COMMON:CAPS)
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Script.COMMON = "Zyyy"

---
---Wraps `HB_SCRIPT_INHERITED`.
---
---* [HarfBuzz online documentation](https://harfbuzz.github.io/harfbuzz-hb-common.html#HB-SCRIPT-INHERITED:CAPS)
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Script.INHERITED = "Zinh"

---
---Wraps `HB_SCRIPT_UNKNOWN`.
---
---* [HarfBuzz online documentation](https://harfbuzz.github.io/harfbuzz-hb-common.html#HB-SCRIPT-UNKNOWN:CAPS)
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Script.UNKNOWN = "Zzzz"

---
---Wraps `HB_SCRIPT_INVALID`.
---
---* [HarfBuzz online documentation](https://harfbuzz.github.io/harfbuzz-hb-common.html#HB-SCRIPT-INVALID:CAPS)
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
Script.INVALID = "No script set"

---
---Lua wrapper for `hb_direction_t` type.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
---@class Direction
local Direction = {}
luaharfbuzz.Direction = Direction

---
---Wraps `hb_direction_from_string`.
---@param dir `ltr`|`rtl`|`ttb`|`btt`|`invalid` # can be one of `ltr`, `rtl`, `ttb`, `btt` or `invalid`.
---
---@return Direction # a `Direction` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Direction.new(dir) end

---
---Wraps `hb_direction_to_string`. Enable nice output with `tostring(…)`.
---
---@return string # Returns a string representation for direction.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Direction:__to_string() end

---
---Enables equality comparisions with `==` between two directions.
---
---@return boolean # `true` or `false` depending on whether the two tags are equal.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Direction:__eq() end

---
---Wraps `HB_DIRECTION_IS_VALID`.
---
---@return boolean # a boolean value
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Direction:is_valid() end

---
---Wraps `HB_DIRECTION_IS_HORIZONTAL`.
---
---@return boolean # a boolean value
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Direction:is_horizontal() end

---
---Wraps `HB_DIRECTION_IS_VERTICAL`.
---
---@return boolean # a boolean value
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Direction:is_vertical() end

---
---Wraps `HB_DIRECTION_IS_FORWARD`.
---
---@return boolean # a boolean value
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Direction:is_forward() end

---
---Wraps `HB_DIRECTION_IS_BACKWARD`.
---
---@return boolean # a boolean value
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Direction:is_backward() end

---
---Wraps `HB_DIRECTION_LTR`.
---
---Predefined directions that correspond to their original definitions in Harfbuzz.
---@type integer|nil
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
luaharfbuzz.Direction.LTR = 4

---
---Wraps `HB_DIRECTION_RTL`.
---
---Predefined directions that correspond to their original definitions in Harfbuzz.
---@type integer|nil
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
luaharfbuzz.Direction.RTL = 0

---
---Wraps `HB_DIRECTION_TTB`.
---
---Predefined directions that correspond to their original definitions in Harfbuzz.
---@type integer|nil
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
luaharfbuzz.Direction.TTB = 0

---
---Wraps `HB_DIRECTION_LTR`.
---
---Predefined directions that correspond to their original definitions in Harfbuzz.
---@type integer|nil
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
luaharfbuzz.Direction.BTT = 0

---
---Data type for languages. Each lanauge object corresponds to a BCP 47 language tag.
---
---Lua wrapper for `hb_language_t` type.
---
---* HarfBuzz online documentation: [hb_language_t](https://harfbuzz.github.io/harfbuzz-hb-common.html#hb-language-t)
---
---@class Language
local Language = {}

---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
luaharfbuzz.Language = Language

---
---Convert a string representing a BCP 47 language tag to the corresponding language object.
---
---Wraps `hb_language_from_string`.
---
---* HarfBuzz online documentation: [hb_language_from_string](https://harfbuzz.github.io/harfbuzz-hb-common.html#hb-language-from-string)
---
---@param language_tag string [three-letter language tag](http://www.microsoft.com/typography/otspec/languagetags.htm) to be converted to a `Language` object.
---
---@return Language # a `Language` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Language.new(language_tag) end

---
---Wraps `hb_language_to_string`. Enable nice output with `tostring(…)`.
---
---* Corresponding C source code: [language.c#L19-L25](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/language.c#L19-L25)
---
---@return string # Returns a string representation for the language object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Language:__tostring() end

---
---Enables equality comparisions with `==` between two languages.
---
---* Corresponding C source code: [language.c#L27-L34](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/luaharfbuzz/language.c#L27-L34)
---
---@param lang Language
---
---@return boolean # `true` or `false` depending on whether the two languages are equal.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function Language:__eq(lang) end

---
---Value to represent a nonexistent name ID.
---
---Wraps `HB_LANGUAGE_INVALID`.
---
---* HarfBuzz online documentation: [HB_LANGUAGE_INVALID](https://harfbuzz.github.io/harfbuzz-hb-common.html#HB-LANGUAGE-INVALID:CAPS)
---* Corresponding C source code: [harfbuzz.lua#L20](https://github.com/ufyTeX/luaharfbuzz/blob/b3bdf5dc7a6e3f9b674226140c3dfdc73d2970cd/src/harfbuzz.lua#L20)
---
---@type Language
Language.INVALID = nil

---
---Unicode functions.
---@class unicode
local unicode = {}
luaharfbuzz.unicode = unicode

---
---Retrieve the `Script` object to which code point `unicode` belongs.
---
---Wraps `hb_unicode_script`
---
---* HarfBuzz online documentation: [hb_unicode_script](https://harfbuzz.github.io/harfbuzz-hb-unicode.html#hb-unicode-script)
---
---@param char integer # Unicode codepoint
---
---@return Script # a `Script` object.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
function unicode.script(char) end

---
---Predefined Name IDs.
---Predefined OpenType 'name' table name identifier.
---
---😱 [Types](https://github.com/LuaCATS/luaharfbuzz/blob/main/library/luaharfbuzz.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luaharfbuzz/pulls)
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
local ot = {}
luaharfbuzz.ot = ot

return luaharfbuzz
