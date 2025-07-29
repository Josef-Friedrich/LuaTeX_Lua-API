require("lualibs")

assert(string.nospaces("Multiple   \t\f\v\n\rspaces") == "Multiplespaces")
