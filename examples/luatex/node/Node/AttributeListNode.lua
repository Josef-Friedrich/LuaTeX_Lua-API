local assert = require("utils").assert

assert.node_type("attribute_list", nil, {
  id = "attribute_list",
  id_numeric = 40,
  fields = { "next", "id" },
})
