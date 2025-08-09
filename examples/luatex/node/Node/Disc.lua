local assert = require("utils").assert

assert.node_type("disc", nil, {
  id = "disc (7)",
  subtypes = {
    "discretionary (0)",
    "explicit (1)",
    "automatic (2)",
    "regular (3)",
    "first (4)",
    "second (5)",
  },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "pre (4)",
    "post (5)",
    "replace (6)",
    "penalty (7)",
  },
})
