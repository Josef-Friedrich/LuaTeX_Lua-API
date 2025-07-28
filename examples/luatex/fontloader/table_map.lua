local inspect = require("inspect")
local f = fontloader.open(
  "/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf"
)

local fields = fontloader.to_table(f)

print(inspect(fields.map))

fontloader.close(f)
