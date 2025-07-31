require("lualibs")

assert(string.utfpadding("äöü", 0) == "")
assert(string.utfpadding("äöü", 1) == "")
assert(string.utfpadding("äöü", 2) == "")
assert(string.utfpadding("äöü", 3) == "")
assert(string.utfpadding("äöü", 4) == " ")
assert(string.utfpadding("äöü", 5) == "  ")
assert(string.utfpadding("äöü", -5) == "  ")
