---@meta
---https://github.com/latex3/lualibs/blob/main/lualibs-util-tab.lua
---https://github.com/contextgarden/context/blob/main/tex/context/base/mkiv/util-tab.lua

---
---https://github.com/contextgarden/context/blob/main/tex/context/base/mkiv/l-table.lua

---
---* Corresponding Lua source code: [lualibs-table.lua#L24-L26](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L24-L26)
---
---@param tab table
function table.getn(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L28-L41](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L28-L41)
---
---@param tab table
function table.strip(tab) end

---
---__Example:__
---
---```lua
---table.keys({ [1] = 2, c = 3, [true] = 1 })
---t = { 1, true, "c" }
---```
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---
---* Corresponding Lua source code: [lualibs-table.lua#L43-L55](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L43-L55)
---
---@param tab table
function table.keys(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L247-L255](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L247-L255)
---
---@param tab table
function table.allkeys(tab) end

---
---Provide a sorted list of keys.
---
---__Example:__
---
---```lua
---table.sortedkeys({ [1] = 2, c = 3, [true] = 1 })
---t = { 1, "c", true }
---```
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---* Corresponding Lua source code: [lualibs-table.lua#L148-L188](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L148-L188)
---
---@param tab table
function table.sortedkeys(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L190-L207](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L190-L207)
---
---@param tab table
---
---@return any[]
function table.sortedhashonly(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L209-L226](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L209-L226)
---
---@param tab table
function table.sortedindexonly(tab) end

---
---__Example:__
---
---```lua
---table.sortedhashkeys({ a = 2, c = 3, b = 1 })
---t = { "a", "b", "c" }
---```
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---* Corresponding Lua source code: [lualibs-table.lua#L228-L245](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L228-L245)
---
---@param tab table
---
---@return string[]
function table.sortedhashkeys(tab, cmp) end

---
---Because a sorted list is often processed there is also an iterator:
---
---__Example:__
---
---```lua
---for key, value in table.sortedhash(t) do
---  print(key,value)
---end
---```
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
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
---@param tab table
function table.tohash(tab, value) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L516-L526](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L516-L526)
---
---@param tab table
function table.fromhash(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L536-L598](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L536-L598)
---
---@param tab table
function table.is_simple_table(tab, hexify, accurate) end

---
---converts a table into a verbose representation
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---* Corresponding Lua source code: [lualibs-table.lua#L965-L974](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L965-L974)
---* Corresponding Lua source code: [lualibs-util-tab.lua#L715-L909](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L715-L909)
---
function table.serialize(root, name, specification) end

---
---writes the table to a file, using reasonable chunks so that less memory is used
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---
---* Corresponding Lua source code: [lualibs-table.lua#L987-L1013](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L987-L1013)
---
function table.tofile(filename, root, name, specification) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1015-L1044](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1015-L1044)
---
---@param tab table
function table.flattened(tab, f, depth) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1048-L1063](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1048-L1063)
---
---@param tab table
function table.collapsed(tab, f, h) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1065-L1078](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1065-L1078)
---
---@param tab table
function table.collapsedhash(tab, h) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1083-L1100](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1083-L1100)
---
---@param tab table
function table.unnest(tab) end

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
---@param tab table
function table.compact(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1178-L1187](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1178-L1187)
---
---@param tab table
function table.contains(tab, v) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1189-L1195](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1189-L1195)
---
---@param tab table
function table.count(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1197-L1208](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1197-L1208)
---
---@param tab table
function table.swapped(tab, s) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1210-L1215](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1210-L1215)
---
---@param tab table
function table.hashed(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1217-L1224](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1217-L1224)
---
---@param tab table
function table.mirrored(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1226-L1239](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1226-L1239)
---
---@param tab table
function table.reversed(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1241-L1251](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1241-L1251)
---
---@param tab table
function table.reverse(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1255-L1304](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1255-L1304)
---
---@param tab table
function table.sequenced(tab, sep, simple) end

---
---prints the result to the console which is handy for tracing
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---* Corresponding Lua source code: [lualibs-table.lua#L1308-L1314](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1308-L1314)
---
---@param tab table
function table.print(tab) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L262-L275](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L262-L275)
---
---@param tab table
function table.toxml(tab, specification) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L333-L488](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L333-L488)
---
---@param tab table
function table.fastserialize(tab, prefix) end

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
---@param tab table
function table.drop(tab, slow) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L583-L600](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L583-L600)
---
---@param tab table
function table.twowaymapper(tab) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L949-L951](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L949-L951)
---
function table.orderedhash() end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L953-L971](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L953-L971)
---
---@param tab table
function table.ordered(tab) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L982-L996](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L982-L996)
---
function table.combine(target, source) end
---@param tab table
function table.sorted(tab) end

---
---@param tab table
function table.filtered(tab, pattern, sort, cmp) end

---
---@param tab table
function table.getmetatablekey(tab, key, value) end

---
---@param tab table
function table.has_one_entry(tab) end

---
---@param tab table
function table.is_empty(tab) end

---
---@param tab table
function table.loweredkeys(tab) end

---
---@param tab table
function table.makeweak(tab) end

function table.reverse_hash(h) end

---
---@param tab table
function table.setmetatablecall(tab, f) end

---
---@param tab table
function table.setmetatableindex(tab, f) end

---
---@param tab table
function table.setmetatableindices(tab, f, n, c) end

---
---@param tab table
function table.setmetatablekey(tab, key, value) end

---
---@param tab table
function table.setmetatablenewindex(tab, f) end

---
---@param tab table
function table.sub(tab, i, j) end

---
---@param tab table
function table.tocsv(tab, specification) end

---
---takes a handle so that you can do whatever you like with the result.
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
function table.tohandle(handle, root, name, specification) end
function table.unique(old) end

---
---@param tab table
function table.values(tab, s) end
