#! luahbtex --luaonly

local face = luaharfbuzz.Face.new('/usr/share/fonts/truetype/noto/NotoSans-Regular.ttf')
if face == nil then error("Font not found!") end

local name_id = 0
local name
repeat
  name = face:get_name(name_id)
  print(name_id, name)
  name_id = name_id + 1
until (name == nil)
