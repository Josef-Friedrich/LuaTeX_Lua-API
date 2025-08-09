local assert = require("utils").assert

assert.node_type("math", nil, {
  id = "math (11)",
  subtypes = { "beginmath (0)", "endmath (1)" },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "surround (4)",
    "width (5)",
    "stretch (6)",
    "shrink (7)",
    "stretch_order (8)",
    "shrink_order (9)",
  },
})
