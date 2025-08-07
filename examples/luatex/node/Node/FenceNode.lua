local assert = require("utils").assert

assert.node_type("fence", nil, {
  id = "fence (22)",
  subtypes = { "unset (0)", "left (1)", "middle (2)", "right (3)", "no (4)" },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "delim (4)",
    "italic (5)",
    "height (6)",
    "depth (7)",
    "options (8)",
    "class (9)",
  },
})
