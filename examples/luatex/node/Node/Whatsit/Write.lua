local assert = require("utils").assert

assert.node_type("whatsit", "write", {
  id = "whatsit (8)",
  subtype = "write (1)",
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "stream (4)",
    "data (5)",
  },
})
