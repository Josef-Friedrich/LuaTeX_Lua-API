local assert = require("utils").assert

assert.node_type("dir", nil, {
  id = "dir (10)",
  subtypes = { "normal (0)", "cancel (1)" },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "dir (4)",
    "level (5)",
  },
})
