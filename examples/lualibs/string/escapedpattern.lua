require("lualibs")

assert(
  string.escapedpattern(
    "Some characters like *, + and ] need to be escaped for formatting."
  )
    == "Some characters like %*, %+ and %] need to be escaped for formatting%."
)

assert(string.escapedpattern(".? .*", true) == "%..? %..*")

assert(string.escapedpattern(".? .*", false) == "%.%? %.%*")
