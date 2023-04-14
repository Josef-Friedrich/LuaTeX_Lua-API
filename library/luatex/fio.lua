_N._4_2_7_binary_input_from_files_with_fio = "page 66"

---
---@meta

---
---# Binary input from files with `fio`
---
---There is a whole set of helpers for reading numbers and strings from a file:
---`fio.readcardinal1`, `fio.readcardinal2`, `fio.readcardinal3`, `fio.readcardinal4`, `fio.readcardinaltable`, `fio.readinteger1`, `fio.readinteger2`,
---`fio.readinteger3`, `fio.readinteger4`, `fio.readintegertable`, `fio.readfixed2`, `fio.readfixed4`,
---`fio.read2dot14`, `fio.setposition`, `fio.getposition`, `fio.skipposition`, `fio.readbytes`, `fio.readbytetable`. They work on normal *Lua* file handles.
---
---This library provides a set of functions for reading numbers from a file and
---in addition to the regular `io` library functions.
---
---|                            |                                     |
---|----------------------------|-------------------------------------|
---| `readcardinal1(f)`         | a 1 byte unsigned integer           |
---| `readcardinal2(f)`         | a 2 byte unsigned integer           |
---| `readcardinal3(f)`         | a 3 byte unsigned integer           |
---| `readcardinal4(f)`         | a 4 byte unsigned integer           |
---| `readcardinaltable(f,n,b)` | `n` cardinals of `b` bytes          |
---| `readinteger1(f)`          | a 1 byte signed integer             |
---| `readinteger2(f)`          | a 2 byte signed integer             |
---| `readinteger3(f)`          | a 3 byte signed integer             |
---| `readinteger4(f)`          | a 4 byte signed integer             |
---| `readintegertable(f,n,b)`  | `n` integers of `b` bytes           |
---| `readfixed2(f)`            | a 2 byte float (used in font files) |
---| `readfixed4(f)`            | a 4 byte float (used in font files) |
---| `read2dot14(f)`            | a 2 byte float (used in font files) |
---| `setposition(f,p)`         | goto position `p`                   |
---| `getposition(f)`           | get the current position            |
---| `skipposition(f,n)`        | skip `n` positions                  |
---| `readbytes(f,n)`           | `n` bytes                           |
---| `readbytetable(f,n)`       | `n` bytes                           |
---
---There are eight additional little endian variants for the `cardinal[1-4]`
---and `integer[1-4]` readers: `cardinal[1-4]le` and `integer[1-4]le`.
---
--- https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
fio = {}

---
---* Corresponding C source code: [liolibext.c#L114-L122](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L114-L122)
---
---@param f file* # A file handle.
---
---@return integer # a 1 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readcardinal1(f) end

---
---* Corresponding C source code: [liolibext.c#L137-L147](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L137-L147)
---
---@param f file* # A file handle.
---
---@return integer # a 2 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readcardinal2(f) end

---
---* Corresponding C source code: [liolibext.c#L187-L198](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L187-L198)
---
---@param f file* # A file handle.
---
---@return integer # a 3 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readcardinal3(f) end

---
---* Corresponding C source code: [liolibext.c#L241-L253](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L241-L253)
---
---@param f file* # A file handle.
---
---@return integer # a 4 byte unsigned integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readcardinal4(f) end

---
---@param f file* # A file handle.
---@param n integer
---@param b integer
---
---@return table<integer, integer>
function fio.readcardinaltable(f, n, b) end

---
---* Corresponding C source code: [liolibext.c#L137-L147](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L137-L147)
---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readcardinal1le(f) end

---
---* Corresponding C source code: [liolibext.c#L148-L158](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L148-L158)
---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readcardinal2le(f) end

---
---* Corresponding C source code: [liolibext.c#L199-L210](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L199-L210)
---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readcardinal3le(f) end

---
---* Corresponding C source code: [liolibext.c#L254-L266](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L254-L266)
---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readcardinal4le(f) end

---
---* Corresponding C source code: [liolibext.c#L432-L442](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L432-L442)
---
---@param f file* # A file handle.
---
---@return integer # a 1 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readinteger1(f) end

---
---* Corresponding C source code: [liolibext.c#L460-L471](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L460-L471)
---
---@param f file* # A file handle.
---
---@return integer # a 2 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readinteger2(f) end

---
---@param f file* # A file handle.
---
---@return integer # a 3 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readinteger3(f) end

---
---@param f file* # A file handle.
---
---@return integer # a 4 byte signed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readinteger4(f) end

---
---@param f file* # A file handle.
---@param n integer
---@param b integer
---
---@return table<integer, integer>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readintegertable(f, n, b) end

---
------* Corresponding C source code: [liolibext.c#L432-L442](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/liolibext.c#L432-L442)
---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readinteger1le(f) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readinteger2le(f) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readinteger3le(f) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readinteger4le(f) end

---
---@param f file* # A file handle.
---
---@return number # a 2 byte float (used in font files)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readfixed2(f) end

---
---@param f file* # A file handle.
---
---@return number # a 4 byte float (used in font files)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readfixed4(f) end

---
---@param f file* # A file handle.
---
---@return number # a 2 byte float (used in font files)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.read2dot14(f) end

---
---goto position `p`
---
---@param f file* # A file handle.
---@param p integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.setposition(f, p) end

---
---get the current position
---
---@param f file* # A file handle.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.getposition(f) end

---
---skip `n` positions.
---
---@param f file* # A file handle.
---@param n integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.skipposition(f, n) end

---
---Read `n` bytes.
---
---@param f file* # A file handle.
---@param n integer
---
---@return integer ...
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readbytes(f, n) end

---
---Read `n` bytes as a table.
---
---@param f file* # A file handle.
---@param n integer
---
---@return table<integer, integer>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readbytetable(f, n) end

---
---@param f file* # A file handle.
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/fio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function fio.readline(f) end
