local assert = require("utils").assert

assert.node_type("rule", nil, {
  id = "rule (2)",
  subtypes = {
    "normal (0)",
    "box (1)",
    "image (2)",
    "empty (3)",
    "user (4)",
    "over (5)",
    "under (6)",
    "fraction (7)",
    "radical (8)",
    "outline (9)",
  },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "width (4)",
    "depth (5)",
    "height (6)",
    "dir (7)",
    "index (8)",
    "left (9)",
    "right (10)",
  },
})
