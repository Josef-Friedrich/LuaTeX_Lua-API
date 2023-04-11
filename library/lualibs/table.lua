---@meta
---https://github.com/latex3/lualibs/blob/main/lualibs-util-tab.lua

function table.sortedkeys(tab) end

function table.sortedhashonly(tab) end

function table.sortedindexonly(tab) end

function table.sortedhashkeys(tab, cmp) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L264-L288](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L264-L288)
---
---@param tab table
---@param cmp? function
---
---@return fun(): key: integer, value: any
function table.sortedhash(tab, cmp) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L264-L288](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L264-L288)
---@deprecated
---
---@param tab table
---@param cmp? function
---
---@return fun(): key: integer, value: any
function table.sortedpairs(tab, cmp) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L324-L331](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L324-L331)
---
---@param tab any[]
---@param list any[]
---
---@return any[] tab
function table.append(tab, list) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L333-L344](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L333-L344)
---
---@param tab any[]
---@param list any[]
---
---@return any[] tab
function table.prepend(tab, list) end

function table.allkeys(t) end
function table.are_equal(a, b, n, m) end
function table.collapsed(t, f, h) end
function table.collapsedhash(t, h) end
function table.combine(target, source) end
function table.compact(t) end
function table.concat() end
function table.contains(t, v) end
function table.copy(t, tables) end
function table.count(t) end
function table.derive(parent) end
function table.deserialize(str) end
function table.drop(t, slow) end
function table.fastcopy(old, metatabletoo) end
function table.fastserialize(t, prefix) end
function table.filtered(t, pattern, sort, cmp) end
function table.flattened(t, f, depth) end
function table.fromhash(t) end
function table.getmetatablekey(t, key, value) end
function table.getn(t) end
function table.has_one_entry(t) end
function table.hashed(t) end
function table.identical(a, b) end
function table.imerge(t) end
function table.imerged() end
function table.insert() end
function table.is_empty(t) end
function table.is_simple_table(t, hexify, accurate) end
function table.keys(t) end
function table.load(filename, loader) end
function table.loweredkeys(t) end
function table.makeweak(t) end
function table.merge(t) end
function table.merged() end
function table.mirrored(t) end
function table.move() end
function table.ordered(t) end
function table.orderedhash() end
function table.pack() end
function table.print(t) end
function table.remove() end
function table.reverse(t) end
function table.reverse_hash(h) end
function table.reversed(t) end
function table.save(filename, t, n) end
function table.sequenced(t, sep, simple) end
function table.serialize(root, name, specification) end
function table.setmetatablecall(t, f) end
function table.setmetatableindex(t, f) end
function table.setmetatableindices(t, f, n, c) end
function table.setmetatablekey(t, key, value) end
function table.setmetatablenewindex(t, f) end
function table.sort() end
function table.sorted(t) end

function table.sparse(old, nest, keeptables) end
function table.strip(tab) end
function table.sub(t, i, j) end
function table.swapped(t, s) end
function table.tocsv(t, specification) end
function table.tofile(filename, root, name, specification) end
function table.tohandle(_handle, root, name, specification) end
function table.tohash(t, value) end
function table.toxml(t, specification) end
function table.twowaymapper(t) end
function table.unique(old) end
function table.unnest(t) end
function table.unpack() end
function table.values(t, s) end
