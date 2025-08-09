local assert = require("utils").assert

assert.node_type("adjust", nil, {
  id = "adjust (5)",
  subtypes = { "normal (0)", "pre (1)" },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "head (4)",
  },
})
