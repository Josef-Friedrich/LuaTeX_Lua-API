local assert = require("utils").assert

local glyph = node.direct.todirect(node.new("glyph"))
for _, field in ipairs({
  "prev",
  "next",
  "id",
  "subtype",
  "attr",
  "char",
  "font",
  "lang",
  "left",
  "right",
  "uchyph",
  "components",
  "xoffset",
  "yoffset",
  "width",
  "height",
  "depth",
  "expansion_factor",
  "data",
}) do
  assert.is_true(node.direct.has_field(glyph, field))
end

assert.is_false(node.direct.has_field(glyph, "xxx"))
