local assert = require("utils").assert

assert.node_type("penalty", nil, {
  id = "penalty (14)",
  subtypes = {
    "userpenalty (0)",
    "linebreakpenalty (1)",
    "linepenalty (2)",
    "wordpenalty (3)",
    "finalpenalty (4)",
    "noadpenalty (5)",
    "beforedisplaypenalty (6)",
    "afterdisplaypenalty (7)",
    "equationnumberpenalty (8)",
  },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "penalty (4)",
  },
})
