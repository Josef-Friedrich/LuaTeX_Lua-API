local inspect = require('inspect')
local f = fontloader.open('/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf')

local i = 0
if f.glyphcnt > 0 then
    for i = f.glyphmin, f.glyphmax do
        local g = f.glyphs[i]
        if g then print(g.name) end
        i = i + 1
    end
end

local fields = fontloader.to_table(f)

print(inspect(fields.glyphs))

fontloader.close(f)
