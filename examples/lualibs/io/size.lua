local check1 = io.size("moretext.txt")
local check2 = tonumber(
  io.popen([[du -b moretext.txt | sed -e 's/^\([0-9]*\).*/\1/']]):read("*all")
)

io.write(
  "I counted "
    .. check1
    .. " bytes, and it's got "
    .. check2
    .. " bytes according to ‘du’.\nTherefore "
)
io.write(
  check1 == check2 and "the size info should be reasonably accurate.\n"
    or "something's thoroughly wrong.\n"
)
