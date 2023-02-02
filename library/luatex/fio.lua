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
--- https://github.com/TeX-Live/luatex/blob/eee644d052c295920d378ef579a96fcca497af9a/source/texk/web2c/luatexdir/lua/liolibext.c
fio = {}

---
---@param f file* # A file handle.
---
---@return integer # a 1 byte unsigned integer
function fio.readcardinal1(f) end

---
---@param f file* # A file handle.
---
---@return integer # a 2 byte unsigned integer
function fio.readcardinal2(f) end

---
---@param f file* # A file handle.
---
---@return integer # a 3 byte unsigned integer
function fio.readcardinal3(f) end

---
---@param f file* # A file handle.
---
---@return integer # a 4 byte unsigned integer
function fio.readcardinal4(f) end

---
---@param f file* # A file handle.
---@param n integer
---@param b integer
---
---@return table<integer, integer>
function fio.readcardinaltable(f, n, b) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
function fio.readcardinal1le(f) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
function fio.readcardinal2le(f) end

---
---little endian variant
---
---@param f file*
---
---@return integer
function fio.readcardinal3le(f) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
function fio.readcardinal4le(f) end

---
---@param f file* # A file handle.
---
---@return integer # a 1 byte signed integer
function fio.readinteger1(f) end

---
---@param f file* # A file handle.
---
---@return integer # a 2 byte signed integer
function fio.readinteger2(f) end

---
---@param f file* # A file handle.
---
---@return integer # a 3 byte signed integer
function fio.readinteger3(f) end

---
---@param f file* # A file handle.
---
---@return integer # a 4 byte signed integer
function fio.readinteger4(f) end

---
---@param f file* # A file handle.
---@param n integer
---@param b integer
---
---@return table<integer, integer>
function fio.readintegertable(f, n, b) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
function fio.readinteger1le(f) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
function fio.readinteger2le(f) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
function fio.readinteger3le(f) end

---
---little endian variant
---
---@param f file* # A file handle.
---
---@return integer
function fio.readinteger4le(f) end

---
---@param f file* # A file handle.
---
---@return number
function fio.readfixed2(f) end

---
---@param f file* # A file handle.
---
---@return number
function fio.readfixed4(f) end

---
---@param f file* # A file handle.
---
---@return number
function fio.read2dot14(f) end

---
---@param f file* # A file handle.
---@param p integer
function fio.setposition(f, p) end

---
---@param f file* # A file handle.
function fio.getposition(f) end

---
---@param f file* # A file handle.
---@param n integer
function fio.skipposition(f, n) end

---
---@param f file* # A file handle.
---@param n integer
---
---@return integer ...
function fio.readbytes(f, n) end

---
---@param f file* # A file handle.
---@param n integer
---
---@return table<integer, integer>
function fio.readbytetable(f, n) end

---
---@param f file* # A file handle.
---
---@return string
function fio.readline(f) end
