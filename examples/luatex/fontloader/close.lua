local f = fontloader.open(
              '/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf')
print(fontloader.to_table(f)) -- table: 0x3d23b50
fontloader.close(f)
print(fontloader.to_table(f)) -- false
