---@meta
---https://github.com/latex3/lualibs/blob/main/lualibs-util-tab.lua
---https://github.com/contextgarden/context/blob/main/tex/context/base/mkiv/util-tab.lua

---
---https://github.com/contextgarden/context/blob/main/tex/context/base/mkiv/l-table.lua

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

---
---* Corresponding Lua source code: [lualibs-table.lua#L965-L974](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L965-L974)
---* Corresponding Lua source code: [lualibs-util-tab.lua#L715-L909](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L715-L909)
---
function table.serialize(root, name, specification) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L987-L1013](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L987-L1013)
---
function table.tofile(filename, root, name, specification) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1015-L1044](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1015-L1044)
---
function table.flattened(t, f, depth) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1048-L1063](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1048-L1063)
---
function table.collapsed(t, f, h) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1065-L1078](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1065-L1078)
---
function table.collapsedhash(t, h) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1083-L1100](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1083-L1100)
---
function table.unnest(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1106-L1132](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1106-L1132)
---
function table.are_equal(a, b, n, m) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1134-L1150](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1134-L1150)
---
function table.identical(a, b) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1155-L1170](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1155-L1170)
---
function table.sparse(old, nest, keeptables) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1174-L1176](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1174-L1176)
---
function table.compact(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1178-L1187](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1178-L1187)
---
function table.contains(t, v) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1189-L1195](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1189-L1195)
---
function table.count(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1197-L1208](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1197-L1208)
---
function table.swapped(t, s) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1210-L1215](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1210-L1215)
---
function table.hashed(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1217-L1224](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1217-L1224)
---
function table.mirrored(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1226-L1239](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1226-L1239)
---
function table.reversed(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1241-L1251](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1241-L1251)
---
function table.reverse(t) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1255-L1304](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1255-L1304)
---
function table.sequenced(t, sep, simple) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1308-L1314](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1308-L1314)
---
function table.print(t) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L262-L275](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L262-L275)
---
function table.toxml(t, specification) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L333-L488](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L333-L488)
---
function table.fastserialize(t, prefix) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L490-L503](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L490-L503)
---
function table.deserialize(str) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L507-L521](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L507-L521)
---
function table.load(filename, loader) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L523-L525](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L523-L525)
---
function table.save(filename, t, n) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L562-L570](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L562-L570)
---
function table.drop(t, slow) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L583-L600](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L583-L600)
---
function table.twowaymapper(t) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L949-L951](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L949-L951)
---
function table.orderedhash() end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L953-L971](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L953-L971)
---
function table.ordered(t) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L982-L996](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L982-L996)
---
function table.combine(target, source) end

function table.filtered(t, pattern, sort, cmp) end
function table.getmetatablekey(t, key, value) end
function table.has_one_entry(t) end
function table.is_empty(t) end
function table.loweredkeys(t) end
function table.makeweak(t) end
function table.reverse_hash(h) end
function table.setmetatablecall(t, f) end
function table.setmetatableindex(t, f) end
function table.setmetatableindices(t, f, n, c) end
function table.setmetatablekey(t, key, value) end
function table.setmetatablenewindex(t, f) end
function table.sorted(t) end
function table.sub(t, i, j) end
function table.tocsv(t, specification) end
function table.tohandle(_handle, root, name, specification) end
function table.unique(old) end
function table.values(t, s) end
