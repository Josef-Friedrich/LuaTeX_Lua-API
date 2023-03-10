---@meta

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
sio = {}

---
---@param s string
---
---@return integer # a 1 byte unsigned integer
function sio.readcardinal1(s) end

---
---@param s string
---
---@return integer # a 2 byte unsigned integer
function sio.readcardinal2(s) end

---
---@param s string
---
---@return integer # a 3 byte unsigned integer
function sio.readcardinal3(s) end

---
---@param s string
---
---@return integer # a 4 byte unsigned integer
function sio.readcardinal4(s) end

---
---@param s string
---@param n integer
---@param b integer
---
---@return table<integer, integer>
function sio.readcardinaltable(s, n, b) end

---
---little endian variant
---
---@param s string
---
---@return integer
function sio.readcardinal1le(s) end

---
---little endian variant
---
---@param s string
---
---@return integer
function sio.readcardinal2le(s) end

---
---little endian variant
---
---@param s string
---
---@return integer
function sio.readcardinal3le(s) end

---
---little endian variant
---
---@param s string
---
---@return integer
function sio.readcardinal4le(s) end

---
---@param s string
---
---@return integer # a 1 byte signed integer
function sio.readinteger1(s) end

---
---@param s string
---
---@return integer # a 2 byte signed integer
function sio.readinteger2(s) end

---
---@param s string
---
---@return integer # a 3 byte signed integer
function sio.readinteger3(s) end

---
---@param s string
---
---@return integer # a 4 byte signed integer
function sio.readinteger4(s) end

---
---@param s string
---@param n integer
---@param b integer
---
---@return table<integer, integer>
function sio.readintegertable(s, n, b) end

---
---little endian variant
---
---@param s string
---
---@return integer
function sio.readinteger1le(s) end

---
---little endian variant
---
---@param s string
---
---@return integer
function sio.readinteger2le(s) end

---
---little endian variant
---
---@param s string
---
---@return integer
function sio.readinteger3le(s) end

---
---little endian variant
---
---@param s string
---
---@return integer
function sio.readinteger4le(s) end

---
---@param s string
---
---@return number
function sio.readfixed2(s) end

---
---@param s string
---
---@return number
function sio.readfixed4(s) end

---
---@param s string
---
---@return number
function sio.read2dot14(s) end

---
---@param s string
---@param p integer
function sio.setposition(s, p) end

---
---@param s string
function sio.getposition(s) end

---
---@param s string
---@param n integer
function sio.skipposition(s, n) end

---
---@param s string
---@param n integer
---
---@return integer ...
function sio.readbytes(s, n) end

---
---@param s string
---@param n integer
---
---@return table<integer, integer>
function sio.readbytetable(s, n) end

---
---@param s string
---
---@return string
function sio.readline(s) end

return sio
