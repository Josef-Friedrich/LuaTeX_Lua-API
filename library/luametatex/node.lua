---@meta

node = {}

node.direct = {}

---
---Create a new `vlist` by packaging the list that begins at node `head` into a vertical box.
---
---With only a single argument, this box is created using
---the natural height of its components.
---
---Caveat: there can be unexpected side-effects to this function, like updating
---some of the `marks` and `\inserts`. Also note that the content of
---`new_head` is the original node list `head`: if you call `node.free(new_head)`
---you will also free the node list itself, unless you explicitly set the `list` field to `nil` beforehand. And in a similar way, calling `node.free(head)` will invalidate `new_head` as well!
---
---__Reference:__
---
---* Corresponding C source code: [lmtnodelib.c#L4546-L4590](https://github.com/contextgarden/luametatex/blob/d61acf6b6f8411eb6be6f958d1309ef829287eb3/source/lua/lmtnodelib.c#L4546-L4590)
---
---@param head integer # The index number of the node in the memory table for direct access.
---@param height? integer # The additional (`\vbox spread`) or exact (`\vbox to`) height to be used.
---@param info? 'additional'|'exactly' # Must be either `additional` (`\vbox spread`) or `exactly` (`\vbox to`).
---@param dir? DirectionSpecifier|DirectionSpecifierId
---
---@return integer new_head
---@return integer badness # The second return value is the badness of the generated box.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luametatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.vpack(head, height, info, dir) end
