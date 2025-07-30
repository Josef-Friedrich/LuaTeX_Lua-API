require("lualibs")

assert(string.toHEX("\xff") == "FF")
assert(string.toHEX(string.tobytes("ff")) == "FF")
assert(string.toHEX("\x00") == "00")
assert(string.toHEX("\xAD\xFE\x03\x45") == "ADFE0345")
