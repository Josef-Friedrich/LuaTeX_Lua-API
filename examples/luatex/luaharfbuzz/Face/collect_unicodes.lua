#! luahbtex --luaonly

local face =
  luaharfbuzz.Face.new("/usr/share/fonts/truetype/noto/NotoSans-Regular.ttf")
if face == nil then
  error("Font not found!")
end

for _, char in ipairs(face:collect_unicodes()) do
  print(char, unicode.utf8.char(char))
end
