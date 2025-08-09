local assert = require("utils").assert

assert.node_type("kern", nil, {
  id = "kern (13)",
  subtypes = {
    "fontkern (0)",
    "userkern (1)",
    "accentkern (2)",
    "italiccorrection (3)",
  },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "kern (4)",
    "expansion_factor (5)",
  },
})
