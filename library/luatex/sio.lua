---
---Copyright (C) 2022-2025 by Josef Friedrich <josef@friedrich.rocks>
------------------------------------------------------------------------
---
---This program is free software: you can redistribute it and/or modify it
---under the terms of the GNU General Public License as published by the
---Free Software Foundation, either version 2 of the License, or (at your
---option) any later version.
---
---This program is distributed in the hope that it will be useful, but
---WITHOUT ANY WARRANTY; without even the implied warranty of
---MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
---Public License for more details.
---
---You should have received a copy of the GNU General Public License along
---with this program. If not, see <https://www.gnu.org/licenses/>.
---@meta

_N._4_2_8_binary_input_from_strings_with_sio = "page 66"

---
---# Binary input from strings with `sio`
---
---A similar set of function as in the `fio` library is available in the `sio` library: `sio.readcardinal1`, `sio.readcardinal2`,
---`sio.readcardinal3`, `sio.readcardinal4`, `sio.readcardinaltable`, `sio.readinteger1`, `sio.readinteger2`,
---`sio.readinteger3`, `sio.readinteger4`, `sio.readintegertable`, `sio.readfixed2`, `sio.readfixed4`,
---`sio.read2dot14`, `sio.setposition`, `sio.getposition`, `sio.skipposition`, `sio.readbytes` and
---`sio.readbytetable`. Here the first argument is a string instead of a
---file handle. More details can be found in the previous section.
---
---|                            |                                     |
---|----------------------------|-------------------------------------|
---| `readcardinal1(s)`         | a 1 byte unsigned integer           |
---| `readcardinal2(s)`         | a 2 byte unsigned integer           |
---| `readcardinal3(s)`         | a 3 byte unsigned integer           |
---| `readcardinal4(s)`         | a 4 byte unsigned integer           |
---| `readcardinaltable(s,n,b)` | `n` cardinals of `b` bytes          |
---| `readinteger1(s)`          | a 1 byte signed integer             |
---| `readinteger2(s)`          | a 2 byte signed integer             |
---| `readinteger3(s)`          | a 3 byte signed integer             |
---| `readinteger4(s)`          | a 4 byte signed integer             |
---| `readintegertable(s,n,b)`  | `n` integers of `b` bytes           |
---| `readfixed2(s)`            | a 2 byte float (used in font files) |
---| `readfixed4(s)`            | a 4 byte float (used in font files) |
---| `read2dot14(s)`            | a 2 byte float (used in font files) |
---| `setposition(s,p)`         | goto position `p`                   |
---| `getposition(s)`           | get the current position            |
---| `skipposition(s,n)`        | skip `n` positions                  |
---| `readbytes(s,n)`           | `n` bytes                           |
---| `readbytetable(f,n)`       | `n` bytes                           |
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
sio = {}

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L124-L135](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L124-L135)
---
---@param s string
---
---@return integer # a 1 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal1(s) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L160-L172](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L160-L172)
---
---@param s string
---
---@return integer # a 2 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal2(s) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L212-L225](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L212-L225)
---
---@param s string
---
---@return integer # a 3 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal3(s) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L268-L282](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L268-L282)
---
---@param s string
---
---@return integer # a 4 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal4(s) end

---
---@param s string
---@param n integer
---@param b integer
---
---@return table<integer, integer>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinaltable(s, n, b) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L124-L135](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L124-L135)
---
---little endian variant
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal1le(s) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L173-L185](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L173-L185)
---
---little endian variant
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal2le(s) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L226-L239](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L226-L239)
---
---little endian variant
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal3le(s) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L283-L297](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L283-L297)
---
---little endian variant
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal4le(s) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L444-L458](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L444-L458)
---
---@param s string
---
---@return integer # a 1 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger1(s) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L485-L500](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L485-L500)
---
---@param s string
---
---@return integer # a 2 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger2(s) end

---
---@param s string
---
---@return integer # a 3 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger3(s) end

---
---@param s string
---
---@return integer # a 4 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger4(s) end

---
---@param s string
---@param n integer
---@param b integer
---
---@return table<integer, integer>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readintegertable(s, n, b) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L444-L458](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L444-L458)
---little endian variant
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger1le(s) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L501-L516](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L501-L516)
---
---little endian variant
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger2le(s) end

---
---little endian variant
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger3le(s) end

---
---little endian variant
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger4le(s) end

---
---@param s string
---
---@return number
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readfixed2(s) end

---
---@param s string
---
---@return number
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readfixed4(s) end

---
---@param s string
---
---@return number
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.read2dot14(s) end

---
---@param s string
---@param p integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.setposition(s, p) end

---
---@param s string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.getposition(s) end

---
---@param s string
---@param n integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.skipposition(s, n) end

---
---@param s string
---@param n integer
---
---@return integer ...
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readbytes(s, n) end

---
---@param s string
---@param n integer
---
---@return table<integer, integer>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readbytetable(s, n) end

---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readline(s) end

return sio
