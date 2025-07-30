require("lualibs")

assert(
  utilities.strings.collapse(" line1\n\nline2\nline3") == "line1 line2 line3"
)
assert(
  utilities.strings.collapse("\nline1\n\nline2\nline3") == "line1 line2 line3"
)
assert(
  utilities.strings.collapse("\rline1\n\nline2\nline3") == "line1 line2 line3"
)
assert(
  utilities.strings.collapse("\tline1\n\nline2\nline3") == "line1 line2 line3"
)
assert(
  utilities.strings.collapse("line1\n\nline2\nline3") == "line1\n\nline2\nline3"
)
