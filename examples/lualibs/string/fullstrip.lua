require("lualibs")

print(
  "#"
    .. string.fullstrip("\n\r I once used to be surrounded by whitespace. \n\r")
    .. "#"
)

assert(
  string.fullstrip("\n\r I once used to be surrounded by whitespace. \n\r")
    == "I once used to be surrounded by whitespace."
)
