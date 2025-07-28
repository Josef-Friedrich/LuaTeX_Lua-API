local inspect = require("inspect")
local f = fontloader.open(
  "/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf"
)

local function p(value)
  print(inspect(value))
end

local i = 0
if f.glyphcnt > 0 then
  for i = f.glyphmin, f.glyphmax do
    local g = f.glyphs[i]
    if g then
      print(g.name)
    end
    i = i + 1
  end
end

local fields = fontloader.to_table(f)

for i, glyph in pairs(fields.glyphs) do
  print(i)
  print(inspect(glyph))
end

p(fields.glyphs[733].kerns)
fontloader.close(f)
