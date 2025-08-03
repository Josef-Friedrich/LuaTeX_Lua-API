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
---__Example:__
---
---```lua
----- t: decimal=116 hexadecimal=74 binary=01110100
---assert(sio.readcardinal1("test", 1) == 116)
----- e: decimal=101 hexadecimal=65 binary=01100101
---assert(sio.readcardinal1("test", 2) == 101)
----- s: decimal=115 hexadecimal=73 binary=01110011
---assert(sio.readcardinal1("test", 3) == 115)
----- t: decimal=116 hexadecimal=74 binary=01110100
---assert(sio.readcardinal1("test", 4) == 116)
---```
---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L124-L135](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L124-L135)
---
---@see fio.readcardinal1
---
---@param text string # A string to read from.
---@param position integer # The position. `1` reads from the first byte.
---
---@return integer # a 1 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal1(text, position) end

---
---__Example:__
---
---```lua
----- t.e: decimal=29797 hexadecimal=74.65 binary=01110100.01100101
---assert(sio.readcardinal2("test", 1) == 29797)
----- s.t: decimal=29556 hexadecimal=73.74 binary=01110011.01110100
---assert(sio.readcardinal2("test", 3) == 29556)
---```
---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L160-L172](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L160-L172)
---
---@see fio.readcardinal2
---
---@param text string # A string to read from.
---@param position integer # The position. `1` reads from the first byte.
---
---@return integer # a 2 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal2(text, position) end

---
---__Example:__
---
---```lua
----- l.u.a: decimal=7107937 hexadecimal=6C.75.61 binary=01101100.01110101.01100001
---assert(sio.readcardinal3("luatex", 1) == 7107937)
----- t.e.x: decimal=7628152 hexadecimal=74.65.78 binary=01110100.01100101.01111000
---assert(sio.readcardinal3("luatex", 4) == 7628152)
---```
---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L212-L225](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L212-L225)
---
---@see fio.readcardinal3
---
---@param text string # A string to read from.
---@param position integer # The position. `1` reads from the first byte.
---
---@return integer # a 3 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal3(text, position) end

---
---__Example:__
---
---```lua
----- t.e.s.t:
----- decimal=1952805748
----- hexadecimal=74.65.73.74
----- binary=01110100.01100101.01110011.01110100
---assert(sio.readcardinal4("test", 1) == 1952805748)
---```
---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L268-L282](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L268-L282)
---
---@see fio.readcardinal4
---
---@param text string # A string to read from.
---@param position integer # The position. `1` reads from the first byte.
---
---@return integer # a 4 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal4(text, position) end

---
---@see fio.readcardinaltable
---
---@param text string # A string to read from.
---@param n integer
---@param b integer
---
---@return table<integer, integer>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinaltable(text, n, b) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L124-L135](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L124-L135)
---
---little endian variant
---
---@see fio.readcardinal1le
---
---@param text string # A string to read from.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal1le(text) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L173-L185](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L173-L185)
---
---little endian variant
---
---@see fio.readcardinal3le
---
---@param text string # A string to read from.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal3le(text) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L226-L239](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L226-L239)
---
---little endian variant
---
---@see fio.readcardinal3le
---
---@param text string # A string to read from.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal3le(text) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L283-L297](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L283-L297)
---
---little endian variant
---
---@see fio.readcardinal4le
---
---@param text string # A string to read from.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readcardinal4le(text) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L444-L458](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L444-L458)
---
---@see fio.readinteger1
---
---@param text string # A string to read from.
---
---@return integer # a 1 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger1(text) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L485-L500](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L485-L500)
---
---@see fio.readinteger2
---
---@param text string # A string to read from.
---
---@return integer # a 2 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger2(text) end

---
---@see fio.readinteger3
---
---@param text string # A string to read from.
---
---@return integer # a 3 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger3(text) end

---
---@see fio.readinteger4
---
---@param text string # A string to read from.
---
---@return integer # a 4 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger4(text) end

---
---@see fio.readintegertable
---
---@param text string # A string to read from.
---@param n integer
---@param b integer
---
---@return table<integer, integer>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readintegertable(text, n, b) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L444-L458](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L444-L458)
---little endian variant
---
---@see fio.readinteger1le
---
---@param text string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger1le(text) end

---
---__Reference:__
---
---* Corresponding C source code: [liolibext.c#L501-L516](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L501-L516)
---
---little endian variant
---
---@see fio.readinteger2le
---
---@param text string # A string to read from.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger2le(text) end

---
---little endian variant
---
---@see fio.readinteger3le
---
---@param text string # A string to read from.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger3le(text) end

---
---little endian variant
---
---@see fio.readinteger4le
---
---@param text string # A string to read from.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readinteger4le(text) end

---
---@see fio.readfixed2
---
---@param text string # A string to read from.
---
---@return number
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readfixed2(text) end

---
---@see fio.readfixed4
---
---@param text string # A string to read from.
---
---@return number
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readfixed4(text) end

---
---@see fio.read2dot14
---
---@param text string # A string to read from.
---
---@return number
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.read2dot14(text) end

---
---@see fio.setposition
---
---@param text string # A string to read from.
---@param p integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.setposition(text, p) end

---
---@see fio.getposition
---
---@param text string # A string to read from.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.getposition(text) end

---
---@see fio.skipposition
---
---@param text string # A string to read from.
---@param n integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.skipposition(text, n) end

---
---@see fio.readbytes
---
---@param text string # A string to read from.
---@param n integer
---
---@return integer ...
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readbytes(text, n) end

---
---@see fio.readbytetable
---
---@param text string # A string to read from.
---@param n integer
---
---@return table<integer, integer>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readbytetable(text, n) end

---
---@see fio.readline
---
---@param text string # A string to read from.
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/sio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function sio.readline(text) end

return sio
