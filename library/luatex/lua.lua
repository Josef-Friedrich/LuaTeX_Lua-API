-- -----------------------------------------------------------------------------
-- Copyright (C) 2022-2025 by Josef Friedrich <josef@friedrich.rocks>
-- -----------------------------------------------------------------------------
--
-- This program is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation, either version 2 of the License, or (at your
-- option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
-- Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program. If not, see <https://www.gnu.org/licenses/>.
--
-- -----------------------------------------------------------------------------

-- A helper table to better navigate through the documentation using the
-- outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

---
---@meta

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
lua = {}

_N._10_1_the_lua_library = "page 187"
_N._10_1_1_version_information = "page 187"

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
---* Corresponding C source code: [llualib.c#L416-L417](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L416-L417)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
lua.version = ""

_N._10_1_2_bytecode_registers = "page 187"

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
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
lua.bytecode = {}

---
---Save a function in a bytecode register.
---
---__Example:__
---
---```lua
---lua.setbytecode(13, function () print('A message') end)
---local print_message = lua.getbytecode(13)
---print_message() -- 'A message'
---```
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L249-L315](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L249-L315)
---
---@param n integer
---@param f function|nil
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.setbytecode(n, f) end

---
---Return a previously stored function from a bytecode register.
---
---__Example:__
---
---```lua
---lua.setbytecode(13, function () print('A message') end)
---local print_message = lua.getbytecode(13)
---print_message() -- 'A message'
---```
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L187-L212](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L187-L212)
---
---@param n integer
---
---@return function|nil f
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getbytecode(n) end

---
---Return two numbers, one for the command handler and one for the graphical user interface (on Microsoft Windows).
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L382-L392](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L382-L392)
---
---@return integer # command handler
---@return integer # graphical user interface
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getcodepage() end

_N._10_1_3_chunk_name_registers = "page 187"

---
---There is an array of 65536 (0-65535) potential chunk names for use with the
---`directlua` and `latelua` primitives.
---
---```
---lua.name[<number> n] = <string> s
---<string> s = lua.name[<number> n]
---```
---@see lua.getluaname
---@see lua.setluaname
---
---@type table<integer, string>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
lua.name = {}

---
---Set a Lua chunk name.
---
---When a chunk name starts with
---a `@` it will be displayed as a file name. This is a side effect of the way Lua implements error
---handling.
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L318-L339](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L318-L339)-
---
---@param chunk_name string|nil # If you want to unset a *Lua* name, you can assign `nil` to it.
---@param index integer
---
---@see lua.name
---@see lua.getluaname
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.setluaname(chunk_name, index) end

---
---Return a Lua chunk name.
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L341-L354](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L341-L354)
---
---@param index number
---
---@return string|nil
---
---@see lua.name
---@see lua.setluaname
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getluaname(index) end

---
---Create a new empty table and push it onto the stack.
---
---Parameter `index` is a hint for how many elements the table will have as a sequence; parameter `hash` is a hint for how many other elements the table will have. Lua may use these hints to preallocate memory for the new table. This preallocation is useful for performance when you know in advance how many elements the table will have.
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L362-L368](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L362-L368)
---* [lua_createtable](https://pgl.yoyo.org/luai/i/lua_createtable)
---
---@param index integer
---@param hash integer
---
---@return table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.newtable(index, hash) end

_N._10_1_4_introspection = "page 188"

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
---* Corresponding C source code: [llualib.c#L370-L374](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L370-L374)
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getstacktop() end

---
---Return a number indicating
---how much nesting is going on.
---
---It is only of use as a breakpoint when
---checking some mechanism going haywire.
---
---__Reference:__
---
---* Corresponding C source code: [llualib.c#L376-L380](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L376-L380)
---* `LuaTeX` manual: 10.1.4 Introspection
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.getcalllevel() end

_N._2_4_4_luafunction_luafunctioncall_and_luadef = "page 25"

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
---token.set_lua("mycode", id)
---token.set_lua("mycode", id, "global", "protected")
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
---* Corresponding C source code: [llualib.c#L356-L360](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/llualib.c#L356-L360)
---
---@return {[integer]: fun(slot: integer)}
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lua.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function lua.get_functions_table() end
