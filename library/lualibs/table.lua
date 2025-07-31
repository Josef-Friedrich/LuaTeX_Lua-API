---@meta
---https://github.com/latex3/lualibs/blob/main/lualibs-util-tab.lua
---https://github.com/contextgarden/context/blob/main/tex/context/base/mkiv/util-tab.lua

---
---https://github.com/contextgarden/context/blob/main/tex/context/base/mkiv/l-table.lua

_N.sorted = "page "

_N.table = "lualibs-table.lua"

---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.sorted(tab) end

_N.keys_sortedkeys_sortedhashkeys_sortedhash = "page "

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
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.keys(tab) end

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
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.sortedkeys(tab) end

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
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.sortedhash(tab, cmp) end

---
---a synonym of sortedhash which sometimes looks more natural
---when used alongside the pairs and ipairs iterators.
---
---* Corresponding Lua source code: [lualibs-table.lua#L264-L288](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L264-L288)
---@deprecated
---
---@param tab table
---@param cmp? function
---
---@return fun(): key: integer, value: any
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.sortedpairs(tab, cmp) end

_N.serialize_print_tohandle_tofile = ""

---
---Convert a table into a verbose representation.
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---* Corresponding Lua source code: [lualibs-table.lua#L965-L974](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L965-L974)
---* Corresponding Lua source code: [lualibs-util-tab.lua#L715-L909](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L715-L909)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.serialize(root, name, specification) end

---
---Print the result to the console which is handy for tracing.
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---* Corresponding Lua source code: [lualibs-table.lua#L1308-L1314](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1308-L1314)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.print(tab) end

---
---Write the table to a file, using reasonable chunks so that less memory is used.
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---* Corresponding Lua source code: [lualibs-table.lua#L987-L1013](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L987-L1013)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.tofile(filename, root, name, specification) end

---
---Take a handle so that you can do whatever you like with the result.
---
---__Reference:__
---
---* Context Lua Documents, July 25. 2021, page 77
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.tohandle(handle, root, name, specification) end

_N.identical_are_equal = ""

---
---Operate on a hash.
---
---* Corresponding Lua source code: [lualibs-table.lua#L1134-L1150](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1134-L1150)
---
---@param a table
---@param b table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.identical(a, b) end

---
---Assume an indexed table.
---
---* Corresponding Lua source code: [lualibs-table.lua#L1106-L1132](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1106-L1132)
---
---@param a table
---@param b table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.are_equal(a, b, n, m) end

_N.tohash_fromhash_swapped_swaphash_reversed_reverse_mirrored = ""

---
---Convert a list into a hash so
---that we can easily check if (a string) is in a given set.
---
---* Corresponding Lua source code: [lualibs-table.lua#L505-L514](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L505-L514)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.tohash(tab, value) end

---
---Create a list of keys from a hashed table where
---each value that is not `false` or `nil` is present.
---
---* Corresponding Lua source code: [lualibs-table.lua#L516-L526](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L516-L526)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.fromhash(tab) end

---
---Turns keys into values.
---
---* Corresponding Lua source code: [lualibs-table.lua#L1197-L1208](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1197-L1208)
---
---@param tab any[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.swapped(tab, s) end

---
------Reverse the values in an indexed table.
---
---* Corresponding Lua source code: [lualibs-table.lua#L1241-L1251](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1241-L1251)
---
---@param tab any[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.reverse(tab) end

---
---Reverse the values in an indexed table and reverses the table itself (inplace).
---
---* Corresponding Lua source code: [lualibs-table.lua#L1226-L1239](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1226-L1239)
---
---@param tab any[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.reversed(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1217-L1224](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1217-L1224)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.mirrored(tab) end

_N.append_prepend = ""

---
---The first table gets
---appended by the second. The first table is returned as well.
---
---* Corresponding Lua source code: [lualibs-table.lua#L324-L331](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L324-L331)
---
---@param tab any[]
---@param list any[]
---
---@return any[] tab
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.append(tab, list) end

---
---The first table gets
---prepended by the second. The first table is returned as well.
---
---* Corresponding Lua source code: [lualibs-table.lua#L333-L344](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L333-L344)
---
---@param tab any[]
---@param list any[]
---
---@return any[] tab
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.prepend(tab, list) end

_N.merge_merged_imerge_imerged = ""

---
---Merge multiple hashes
---
---first one is target
---
---* Corresponding Lua source code: [lualibs-table.lua#L357-L367](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L357-L367)
---
---@param tab table
---@param ... table
---
---@return table tab
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.merge(tab, ...) end

---
---Merge multiple indexed tables.
---
---first one is target
---
---* Corresponding Lua source code: [lualibs-table.lua#L401-L411](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L401-L411)
---
---@param tab any[]
---@param ... any[]
---
---@return any[] tab
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.imerge(tab, ...) end

---
---Merge multiple hashes.
---
---The variants ending with a `d` merge the given list of tables and return
---the result leaving the first argument untouched.
---
---* Corresponding Lua source code: [lualibs-table.lua#L379-L387](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L379-L387)
---
---@param ... table
---
---@return table new_tab
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.merged(...) end

---
---Merge multiple indexed tables.
---
---The variants ending with a `d` merge the given list of tables and return
---the result leaving the first argument untouched.
---
---* Corresponding Lua source code: [lualibs-table.lua#L425-L436](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L425-L436)
---
---@param ... any[]
---
---@return any[] new_tab
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.imerged(...) end

_N.copy_fastcopy = ""

---
---Make a real and deep copy.
---
---Thisfunction is an adapted version from the *Lua* wiki.
---
---* Corresponding Lua source code: [lualibs-table.lua#L463-L492](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L463-L492)
---
---@param tab table
---@param tables? table
---
---@return table new_tab
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.copy(tab, tables) end

---
---Make a real and deep copy.
---
---This function is faster than table.copy()
---because it does not check for circular references and does not share tables when
---possible. In practice using the fast variant is okay.
---
---* Corresponding Lua source code: [lualibs-table.lua#L438-L459](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L438-L459)
---
---@param tab table
---@param metatabletoo? boolean
---
---@return table new_tab
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.fastcopy(tab, metatabletoo) end

_N.flattened = ""

---
---* Corresponding Lua source code: [lualibs-table.lua#L1015-L1044](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1015-L1044)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.flattened(tab, f, depth) end

_N.loweredkeys = ""

---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.loweredkeys(tab) end

_N.contains = ""

---
---* Corresponding Lua source code: [lualibs-table.lua#L1178-L1187](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1178-L1187)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.contains(tab, v) end

_N.unique = ""

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.unique(old) end

_N.count = ""

---
---* Corresponding Lua source code: [lualibs-table.lua#L1189-L1195](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1189-L1195)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.count(tab) end

_N.sequenced = ""

---
---* Corresponding Lua source code: [lualibs-table.lua#L1255-L1304](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1255-L1304)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.sequenced(tab, sep, simple) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L24-L26](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L24-L26)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.getn(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L28-L41](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L28-L41)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.strip(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L247-L255](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L247-L255)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.allkeys(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L190-L207](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L190-L207)
---
---@param tab table
---
---@return any[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.sortedhashonly(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L209-L226](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L209-L226)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.sortedindexonly(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L497-L503](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L497-L503)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.derive(parent) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L536-L598](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L536-L598)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.is_simple_table(tab, hexify, accurate) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1048-L1063](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1048-L1063)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.collapsed(tab, f, h) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1065-L1078](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1065-L1078)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.collapsedhash(tab, h) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1083-L1100](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1083-L1100)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.unnest(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1155-L1170](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1155-L1170)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.sparse(old, nest, keeptables) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1174-L1176](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1174-L1176)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.compact(tab) end

---
---* Corresponding Lua source code: [lualibs-table.lua#L1210-L1215](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-table.lua#L1210-L1215)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.hashed(tab) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-table.lua#L1330-L1332
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.is_empty(tab) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-table.lua#L1324-L1326
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.sub(tab, i, j) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-table.lua#L1334-L1336
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.has_one_entry(tab) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-table.lua#L1372-L1391
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.values(tab, s) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-table.lua#L1399-L1437
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.filtered(tab, pattern, sort, cmp) end

_N.util_tab = "lualibs-util-tab.lua"

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L262-L275](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L262-L275)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.toxml(tab, specification) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L333-L488](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L333-L488)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.fastserialize(tab, prefix) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L490-L503](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L490-L503)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.deserialize(str) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L507-L521](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L507-L521)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.load(filename, loader) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L523-L525](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L523-L525)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.save(filename, t, n) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L562-L570](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L562-L570)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.drop(tab, slow) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L583-L600](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L583-L600)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.twowaymapper(tab) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L949-L951](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L949-L951)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.orderedhash() end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L953-L971](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L953-L971)
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.ordered(tab) end

---
---* Corresponding Lua source code: [lualibs-util-tab.lua#L982-L996](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-tab.lua#L982-L996)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.combine(target, source) end

_N.util_sto = "lualibs-util-sto.lua"

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-sto.lua#L199-L210
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.makeweak(tab) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-sto.lua#L116-L128
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.setmetatableindex(tab, f) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-sto.lua#L134-L146
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.setmetatablenewindex(tab, f) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-sto.lua#L148-L159
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.setmetatablecall(tab, f) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-sto.lua#L164-L182
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.setmetatableindices(tab, f, n, c) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-sto.lua#L184-L192
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.setmetatablekey(tab, key, value) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-sto.lua#L194-L197
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.getmetatablekey(tab, key, value) end

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-tab.lua#L147-L181
---
---@param tab table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.tocsv(tab, specification) end

_N.compat = "lualibs-compat.lua"

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-compat.lua#L13-L19
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/table.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function table.reverse_hash(h) end
