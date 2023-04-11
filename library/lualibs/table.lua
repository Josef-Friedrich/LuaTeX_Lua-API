---@meta
---https://github.com/latex3/lualibs/blob/main/lualibs-util-tab.lua

---
---* Corresponding Lua source code: [lualibs-table.lua#L24-L26](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L24-L26)
---
function table.getn(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L28-L41](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L28-L41)
---
function table.strip(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L43-L55](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L43-L55)
---
function table.keys(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L247-L255](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L247-L255)
---
function table.allkeys(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L148-L188](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L148-L188)
---
function table.sortedkeys(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L190-L207](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L190-L207)
---
function table.sortedhashonly(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L209-L226](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L209-L226)
---
function table.sortedindexonly(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L228-L245](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L228-L245)
---
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

---
---first one is target
---
---* Corresponding Lua source code: [lualibs-table.lua#L357-L367](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L357-L367)
---
---@param tab table
---@param ... table
---
---@return table tab
function table.merge(tab, ...) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L379-L387](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L379-L387)
---
---@param ... table
---
---@return table new_tab
function table.merged(...) end

---
---first one is target
---
---* Corresponding Lua source code: [lualibs-table.lua#L401-L411](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L401-L411)
---
---@param tab any[]
---@param ... any[]
---
---@return any[] tab
function table.imerge(tab, ...) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L425-L436](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L425-L436)
---
---@param ... any[]
---
---@return any[] new_tab
function table.imerged(...) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L438-L459](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L438-L459)
---
---@param tab table
---@param metatabletoo? boolean
---
---@return table new_tab
function table.fastcopy(tab, metatabletoo) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L463-L492](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L463-L492)
---
---@param tab table
---@param tables? table
---
---@return table new_tab
function table.copy(tab, tables) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L497-L503](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L497-L503)
---
function table.derive(parent) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L505-L514](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L505-L514)
---
function table.tohash(tab, value) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L516-L526](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L516-L526)
---
function table.fromhash(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L536-L598](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L536-L598)
---
function table.is_simple_table(tab, hexify, accurate) end

function table.are_equal(a, b, n, m) end
function table.collapsed(t, f, h) end
function table.collapsedhash(t, h) end
function table.combine(target, source) end
function table.compact(t) end
function table.concat() end
function table.contains(t, v) end
function table.count(t) end
function table.deserialize(str) end
function table.drop(t, slow) end
function table.fastserialize(t, prefix) end
function table.filtered(t, pattern, sort, cmp) end
function table.flattened(t, f, depth) end
function table.getmetatablekey(t, key, value) end
function table.has_one_entry(t) end
function table.hashed(t) end
function table.identical(a, b) end

function table.insert() end
function table.is_empty(t) end
function table.load(filename, loader) end
function table.loweredkeys(t) end
function table.makeweak(t) end
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
function table.sub(t, i, j) end
function table.swapped(t, s) end
function table.tocsv(t, specification) end
function table.tofile(filename, root, name, specification) end
function table.tohandle(_handle, root, name, specification) end
function table.toxml(t, specification) end
function table.twowaymapper(t) end
function table.unique(old) end
function table.unnest(t) end
function table.unpack() end
function table.values(t, s) end
