local assert = require("utils").assert

assert.node_type("noad", nil, {
  id = "noad (18)",
  subtypes = {
    "ord (0)",
    "opdisplaylimits (1)",
    "oplimits (2)",
    "opnolimits (3)",
    "bin (4)",
    "rel (5)",
    "open (6)",
    "close (7)",
    "punct (8)",
    "inner (9)",
    "under (10)",
    "over (11)",
    "vcenter (12)",
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
  },
})
