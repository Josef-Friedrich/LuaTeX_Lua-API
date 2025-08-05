local assert = require("utils").assert

local hlist = node.new("hlist") --[[@as HlistNode]]
hlist.width = 1
hlist.height = 2
hlist.depth = 3
local width, height, depth, expansion_factor =
node.direct.getwhd(node.direct.todirect(hlist))
assert.equals(width, 1)
assert.equals(height, 2)
assert.equals(depth, 3)
assert.is_nil(expansion_factor)

local glpyh = node.new("glyph") --[[@as GlyphNode]]
glpyh.expansion_factor = 3
local _, _, _, expansion_factor =
  node.direct.getwhd(node.direct.todirect(glpyh), true)
assert.equals(expansion_factor, 3)
