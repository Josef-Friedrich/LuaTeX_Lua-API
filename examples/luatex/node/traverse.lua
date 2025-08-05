local assert = require("utils").assert

--tex: test
callback.register("post_linebreak_filter", function(head)
  for n, type, subtype in node.traverse(head.head) do
    assert.is_type(n, "userdata")
    assert.is_type(type, "number")
    assert.is_type(subtype, "number")
  end
  return head
end)
