require("lualibs")

assert(string.texnewlines("line1\nline2") == "line1\rline2")
assert(string.texnewlines("line1\n\nline2") == "line1\r\rline2")
assert(string.texnewlines("line1\nline2\n") == "line1\rline2\r")
