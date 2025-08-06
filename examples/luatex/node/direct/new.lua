local assert = require("utils").assert

for type_id, node_type in pairs(node.types()) do
  if node_type == "whatsit" then
    for subtype_id, subtype in pairs(node.whatsits()) do
      local direct = node.direct.new(node_type, subtype)
      local n = node.direct.tonode(direct)
      assert.equals(n.id, type_id)
      assert.equals(n.subtype, subtype_id)
    end
  else
    local direct = node.direct.new(node_type)
    local n = node.direct.tonode(direct)
    assert.equals(n.id, type_id)
  end
end
