require("lualibs")

assert(string.longtostring("multiple   spaces") == "multiple spaces")
assert(string.longtostring("multiple\t\t\ttabs") == "multiple tabs")
assert(string.longtostring("multiple\n\n\nnewlines") == "multiple newlines")
assert(
  string.longtostring('quoted multiple "   " whitespaces')
    == 'quoted multiple "   " whitespaces'
)
assert(
  string.longtostring('quoted multiple "\t\t\t" tabs')
    == 'quoted multiple "\t\t\t" tabs'
)
assert(
  string.longtostring("single quoted multiple '\t\t\t' tabs")
    == "single quoted multiple '\t\t\t' tabs"
)
assert(string.longtostring("string") == "string")
assert(string.longtostring("") == "")
assert(string.longtostring() == "")
assert(string.longtostring(1) == "1")
assert(string.longtostring(1.0) == "1.0")
assert(string.longtostring(nil) == "")
assert(string.longtostring(false) == "")
-- assert(string.longtostring(true) == "") bad argument #2 to 'lpegmatch' (string expected, g ot boolean)
