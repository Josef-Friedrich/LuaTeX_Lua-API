require("lualibs")

assert(
  string.collapsespaces("Multiple   \t\f\v\n\rspaces") == "Multiple \n\rspaces"
)
