require("lualibs")

assert(string.tohex("\xff") == "ff")
assert(string.tohex(string.tobytes("ff")) == "ff")
assert(string.tohex("\x00") == "00")
assert(string.tohex("\xAD\xFE\x03\x45") == "adfe0345")
