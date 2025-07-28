#! luahbtex --luaonly

local face = luaharfbuzz.Face.new("xxx")
print(face) -- nil

face =
  luaharfbuzz.Face.new("/usr/share/fonts/truetype/noto/NotoSans-Regular.ttf")
if face ~= nil then
  print(face) -- harfbuzz.Face: 0x12426a8
end
