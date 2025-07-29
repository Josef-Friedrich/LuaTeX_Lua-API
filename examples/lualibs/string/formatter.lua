require("lualibs")

assert(string.formatter("String: %s", "string") == "String: string")
assert(string.formatter("hexadecimal: %h", 15) == "hexadecimal: 0x0000f")
assert(string.formatter("Hexadecimal: %H", 15) == "Hexadecimal: 0x0000F")
