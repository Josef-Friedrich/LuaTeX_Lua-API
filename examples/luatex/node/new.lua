local assert = require("utils").assert

for type_id, node_type in pairs(node.types()) do
  if node_type == "whatsit" then
    for subtype_id, subtype in pairs(node.whatsits()) do
      local n = node.new(node_type, subtype)
      assert.equals(n.id, type_id)
      assert.equals(n.subtype, subtype_id)
    end
  else
    local n = node.new(node_type)
    assert.equals(n.id, type_id)
  end
end
