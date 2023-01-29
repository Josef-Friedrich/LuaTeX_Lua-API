---@meta
lua = {}

---
---Version information: This library contains one read-only item:
---
---```lua
---<string> s = lua.version
---```
---
---This returns the *Lua* version identifier string.
---
---@type string
lua.version = ''

---
---The `\directlua` commands involves tokenization of its argument (after
---picking up an optional name or number specification). The tokenlist is then
---converted into a string and given to *Lua* to turn into a function that is
---called. The overhead is rather small but when you have millions of calls it can
---have some impact. For this reason there is a variant call available: `\luafunction`. This command is used as follows:
---
---```tex
---\directlua {
---    local t = lua.get_functions_table()
---    t[1] = function() tex.print("!") end
---    t[2] = function() tex.print("?") end
---}
---
---\luafunction1
---\luafunction2
---```
---
---Of course the functions can also be defined in a separate file. There is no limit
---on the number of functions apart from normal *Lua* limitations. Of course there
---is the limitation of no arguments but that would involve parsing and thereby give
---no gain. The function, when called in fact gets one argument, being the index, so
---in the following example the number `8` gets typeset.
---
---```tex
---\directlua {
---    local t = lua.get_functions_table()
---    t[8] = function(slot) tex.print(slot) end
---}
---```
--- ---
---
---```lua
---token.set_lua("mycode",id)
---token.set_lua("mycode",id,"global","protected")
---```
---
---This creates a token that refers to a *Lua* function with an entry in the table
---that you can access with `lua.get_functions_table`. It is the companion
---to `luadef`.
---
---__Reference:__
---
---* `LuaTeX` manual: 2.4.4 `\luafunction`, `\luafunctioncall` and `\luadef`
---* `LuaTeX` manual: 10.6.4 Macros
---
---@return {[integer]: fun(slot: integer)}
function lua.get_functions_table() end

---
---The `getstacktop` function returns a number indicating
---how much nesting is going on. It is only of use as a breakpoint when
---checking some mechanism going haywire.
---
---__Reference:__
---
---* `LuaTeX` manual: 10.1.4 Introspection
---
---@return integer
function lua.getstacktop() end

---
---The `getcalllevel` function returns a number indicating
---how much nesting is going on. It is only of use as a breakpoint when
---checking some mechanism going haywire.
---
---__Reference:__
---
---* `LuaTeX` manual: 10.1.4 Introspection
---
---@return integer
function lua.getcalllevel() end

------------------------------------------------------------------------
---Undocumented functions listed in alphabetical order
---
---Document them by sliding them up and place them in the order of the
---official documentation
------------------------------------------------------------------------

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lua.getbytecode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lua.getcodepage() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lua.getluaname() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lua.newtable() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lua.setbytecode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function lua.setluaname() end
