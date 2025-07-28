#! luahbtex --luaonly

local serpent = require("serpent")

print("Shapers:", serpent.line({ luaharfbuzz.shapers() }, { comment = false }))
--Shapers:	{"graphite2", "ot", "fallback"}
