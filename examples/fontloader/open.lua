local inspect = require('inspect')

local f = fontloader.open('/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf')

print(f.fontname)

fontloader.close(f)
