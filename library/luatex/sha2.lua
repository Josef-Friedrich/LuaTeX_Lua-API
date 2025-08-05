-- ----------------------------------------------------------------------------
-- Copyright (C) 2022-2025 by Josef Friedrich <josef@friedrich.rocks>
-- ----------------------------------------------------------------------------
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
-- ----------------------------------------------------------------------------

---
---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

_N._4_2_9_hashes_conform_sha2 = "page 66"

---
---@meta

---
---# Hashes conform `sha2`
---
---This library is a side effect of the `pdfe` library that needs such
---helpers. The `sha2.digest256`, `sha2.digest384` and
---`sha2.digest512` functions accept a string and return a string with the
---hash.
---
---https://github.com/contextgarden/pplib
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/libs/pplib/pplib-src/src/util/utilsha.c
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sha2.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
sha2 = {}

---
---__Example:__
---
---```lua
---local function to_hex(str)
---  return (str:gsub('.', function (c)
---      return string.format('%02x', string.byte(c))
---  end))
---end
---
---print(to_hex(sha2.digest256('test')))
--- -- 9f86d081... (length 64)
---```
---
---__Reference:__
---
---* Corresponding C source code: [md5lib.c#L199-L210](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luamd5/md5lib.c#L199-L210)
---
---@param data string
---
---@return string # binary string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sha2.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sha2.digest256(data) end

---
---__Example:__
---
---```lua
---local function to_hex(str)
---  return (str:gsub('.', function (c)
---      return string.format('%02x', string.byte(c))
---  end))
---end
---
---print(to_hex(sha2.digest384('test')))
--- -- 76841232... (length 96)
---```
---
---__Reference:__
---
---* Corresponding C source code: [md5lib.c#L212-L223](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luamd5/md5lib.c#L212-L223)
---
---@param data string
---
---@return string # binary string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sha2.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sha2.digest384(data) end

---
---__Example:__
---
---```lua
---local function to_hex(str)
---  return (str:gsub('.', function (c)
---      return string.format('%02x', string.byte(c))
---  end))
---end
---
---print(to_hex(sha2.digest512('test')))
--- -- ee26b0dd ... (length 128)
---```
---
---__Reference:__
---
---* Corresponding C source code: [md5lib.c#L225-L236](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luamd5/md5lib.c#L225-L236)
---
---@param data string
---
---@return string # binary string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sha2.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sha2.digest512(data) end
