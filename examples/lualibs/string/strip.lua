require("lualibs")

print(
  "#"
    .. string.strip(" \t\f\vI once used to be surrounded by whitespace. \t\f\v")
    .. "#"
)

assert(
  string.strip(" \t\f\vI once used to be surrounded by whitespace. \t\f\v")
    == "I once used to be surrounded by whitespace."
)

assert(string.strip("\nline breaks\n") == "\nline breaks\n")
