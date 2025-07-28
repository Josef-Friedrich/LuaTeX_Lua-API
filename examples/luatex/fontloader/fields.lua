local utils = require("./resources/utils")

local inspect = require("inspect")
local f = fontloader.open(
  "/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf"
)

print(inspect(fontloader.fields(f)))

-- {
--     "table_version", "fontname", "fullname", "familyname", "weight",
--     "copyright", "filename", "version", "italicangle", "upos", "uwidth",
--     "ascent", "descent", "uniqueid", "glyphcnt", "glyphmax", "glyphmin",
--     "units_per_em", "lookups", "glyphs", "hasvmetrics", "onlybitmaps",
--     "serifcheck", "isserif", "issans", "encodingchanged", "strokedfont",
--     "use_typo_metrics", "weight_width_slope_only",
--     "head_optimized_for_cleartype", "uni_interp", "map", "origname", "private",
--     "xuid", "pfminfo", "names", "cidinfo", "subfonts", "comments", "fontlog",
--     "cvt_names", "ttf_tables", "ttf_tab_saved", "texdata", "anchor_classes",
--     "kerns", "vkerns", "gsub", "gpos", "features", "mm", "chosenname",
--     "macstyle", "fondname", "design_size", "fontstyle_id", "fontstyle_name",
--     "design_range_bottom", "design_range_top", "strokewidth", "mark_classes",
--     "creationtime", "modificationtime", "os2_version", "sfd_version", "math",
--     "validation_state", "horiz_base", "vert_base", "extrema_bound", "notdef_loc"
-- }

-- print(inspect(fontloader.fields(f.glyphs[1])))

utils.convert_string_array_to_alias_union(fontloader.fields(f.glyphs[1]))

-- {
--     "name", "unicode", "boundingbox", "vwidth", "width", "lsidebearing",
--     "class", "kerns", "vkerns", "dependents", "lookups", "ligatures", "comment",
--     "anchors", "altuni", "tex_height", "tex_depth", "is_extended_shape",
--     "italic_correction", "top_accent", "vert_variants", "horiz_variants",
--     "mathkern"
-- }

-- for _, value in ipairs(fontloader.fields(f)) do
--   print(value, inspect(f[value]))
-- end
