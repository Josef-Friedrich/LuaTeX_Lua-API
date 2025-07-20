local inspect = require('inspect')

local f = fontloader.open('/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf')

print(inspect(fontloader.to_table(f)))
