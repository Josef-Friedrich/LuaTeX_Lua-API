local inspect = require("inspect")
local utils = require("./resources/utils")
local f = fontloader.open(
  "/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf"
)

for index, value in ipairs(fontloader.fields(f)) do
  print(value, inspect(f[value]))
end
