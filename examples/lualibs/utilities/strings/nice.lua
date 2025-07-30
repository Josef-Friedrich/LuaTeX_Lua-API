require("lualibs")

assert(utilities.strings.nice("colon:::colon") == "colon colon")
assert(utilities.strings.nice("minus---minus") == "minus minus")
assert(utilities.strings.nice("plus+++plus") == "plus plus")
assert(
  utilities.strings.nice("underscore___underscore") == "underscore underscore"
)
-- assert(utilities.strings.nice("percent%%%percent") == "percent percent") ?
