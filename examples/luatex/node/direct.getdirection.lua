local n = node.new("hlist")
local d = node.direct.todirect(n)
node.direct.setdir(d, "LTL")
print(node.direct.getdirection(d))
