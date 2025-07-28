#! luahbtex --luaonly

local face =
  luaharfbuzz.Face.new("/usr/share/fonts/truetype/noto/NotoSans-Regular.ttf")
if face == nil then
  error("Font not found!")
end
print("\nGlyph count: " .. face:get_glyph_count())
