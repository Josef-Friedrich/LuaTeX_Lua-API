local assert = require("utils").assert

local get_node_info = require("utils").get_node_info
assert.same(get_node_info("attribute_list"), {
  id = "attribute_list",
  id_numeric = 40,
  fields = { [0] = "next", [1] = "id" },
})
