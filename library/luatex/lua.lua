---@meta
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.get_functions_table() end

---
---Return a number indicating
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
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getstacktop() end

---
---Return a number indicating
---how much nesting is going on.
---
---It is only of use as a breakpoint when
---checking some mechanism going haywire.
---
---* Corresponding C source code: [llualib.c#L376-L380](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L376-L380)
---
---__Reference:__
---
---* `LuaTeX` manual: 10.1.4 Introspection
---
---@return integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getcalllevel() end

---
---Use the `bytecode` table to store *Lua* code chunks. The accepted values for
---assignments are functions and `nil`. Likewise, the retrieved value is
---either a function or `nil`.
---
---The contents of the `lua.bytecode` array is stored inside the format file
---as actual *Lua* bytecode, so it can also be used to preload *Lua* code. The
---function must not contain any upvalues.
---@type table<integer, function|nil>
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
lua.bytecode = {}

---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L249-L315](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L249-L315)
---
---@param n integer
---@param f function|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.setbytecode(n, f) end

---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L187-L212](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L187-L212)
---
---@return function|nil f
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getbytecode() end

---
---Return two numbers, one for the command handler and one for the graphical user interface (on Microsoft Windows).
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L382-L392](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L382-L392)
---
---@return integer # command handler
---@return integer # graphical user interface
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getcodepage() end

---
---There is an array of 65536 (0--65535) potential chunk names for use with the
---`directlua` and `latelua` primitives.
---
---```
---lua.name[<number> n] = <string> s
---<string> s = lua.name[<number> n]
---```
---
---@type table<integer, string>
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
lua.name = {}

---
---Set a Lua chunk name.
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L318-L339](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L318-L339)-
---
---@param s string|nil # If you want to unset a *Lua* name, you can assign `nil` to it.
---@param n integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.setluaname(s, n) end

---
---Return a Lua chunk name.
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L341-L354](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L341-L354)
---
---@param n number
---
---@return string|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getluaname(n) end

---
---Create a new empty table and push it onto the stack.
---
---Parameter `index` is a hint for how many elements the table will have as a sequence; parameter `hash` is a hint for how many other elements the table will have. Lua may use these hints to preallocate memory for the new table. This preallocation is useful for performance when you know in advance how many elements the table will have.
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L362-L368](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L362-L368)
---* [lua_createtable](https://pgl.yoyo.org/luai/i/lua_createtable)-
---
---@param index integer
---@param hash integer
---
---@return table
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.newtable(index, hash) end
