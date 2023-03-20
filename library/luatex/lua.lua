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
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L416-L417](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L416-L417)
---
---@type string
lua.version = ""

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
---* Corresponding C source code: [llualib.c#L356-L360](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L356-L360)
---
---@return {[integer]: fun(slot: integer)}
function lua.get_functions_table() end

---
---Returns a number indicating
---how much nesting is going on.
---
---It is only of use as a breakpoint when
---checking some mechanism going haywire.
---
---__Reference:__
---
---* `LuaTeX` manual: 10.1.4 Introspection
---* Corresponding C source code: [llualib.c#L370-L374](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L370-L374)
---
---@return integer
function lua.getstacktop() end

---
---Return a number indicating
---how much nesting is going on. It is only of use as a breakpoint when
---checking some mechanism going haywire.
---
---* Corresponding C source code: [llualib.c#L376-L380](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L376-L380)
---
---__Reference:__
---
---* `LuaTeX` manual: 10.1.4 Introspection
---
---@return integer
function lua.getcalllevel() end

---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L249-L315](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L249-L315)
function lua.setbytecode() end

---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L187-L212](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L187-L212)
function lua.getbytecode() end

---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L382-L392](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L382-L392)
function lua.getcodepage() end

---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L318-L339](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L318-L339)
function lua.setluaname() end

---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L341-L354](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L341-L354)
function lua.getluaname() end

---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L362-L368](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L362-L368)
function lua.newtable() end
