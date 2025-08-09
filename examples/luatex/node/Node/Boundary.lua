local assert = require("utils").assert

assert.node_type("boundary", nil, {
  id = "boundary (6)",
  subtypes = { "cancel (0)", "user (1)", "protrusion (2)", "word (3)" },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "value (4)",
  },
})
