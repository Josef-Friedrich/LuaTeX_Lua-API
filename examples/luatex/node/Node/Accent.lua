local assert = require("utils").assert

assert.node_type("accent", nil, {
  id = "accent (21)",
  subtypes = {
    "bothflexible (0)",
    "fixedtop (1)",
    "fixedbottom (2)",
    "fixedboth (3)",
  },
  fields = {
    "prev (-1)",
    "next (0)",
    "id (1)",
    "subtype (2)",
    "attr (3)",
    "nucleus (4)",
    "sub (5)",
    "sup (6)",
    "accent (7)",
    "bot_accent (8)",
    "top_accent (9)",
    "overlay_accent (10)",
    "fraction (11)",
  },
})
