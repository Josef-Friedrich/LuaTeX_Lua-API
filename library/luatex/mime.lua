---@meta

---https://github.com/LuaCATS/luasocket/blob/main/library/mime.lua
---https://github.com/TeX-Live/luatex/blob/trunk/source/texk/web2c/luatexdir/luasocket/src/mime.lua
mime = {}

--- https://lunarmodules.github.io/luasocket/mime.html
---https://github.com/TeX-Live/luatex/blob/trunk/source/texk/web2c/luatexdir/luasocket/src/mime.lua
---
---The `mime` namespace offers filters that apply and remove common
---content transfer encodings, such as Base64 and Quoted-Printable.
---It also provides functions to break text into lines and change
---the end-of-line convention.
---MIME is described mainly in
---RFC 2045,
---2046,
---2047,
---2048, and
---2049.
---
---All functionality provided by the MIME module
---follows the ideas presented in
---
---LTN012, Filters sources and sinks.
---
---To obtain the `mime` namespace, run:
---
---```
----- loads the MIME module and everything it requires
---local mime = require("mime")
---```
local mime = {}

---Returns a filter that decodes data from a given transfer content
---encoding.
---
---In the Quoted-Printable case, the user can specify whether the data is
---textual or binary, by passing the `mode` strings "`text`" or
---"`binary`". `Mode` defaults to "`text`".
---
---@param name 'base64'|'quoted-printable'
function mime.decode(name) end

---Returns a filter that encodes data according to a given transfer content
---encoding.
---
---In the Quoted-Printable case, the user can specify whether the data is
---textual or binary, by passing the `mode` strings "`text`" or
---"`binary`". `Mode` defaults to "`text`".
---comment
---@param name 'base64'|'quoted-printable'
---@param mode? 'text'|'binary'
function mime.encode(name, mode) end

---Converts most common end-of-line markers to a specific given marker.
---
---`Marker` is the new marker. It defaults to CRLF, the canonic
---end-of-line marker defined by the MIME standard.
---
---The function returns a filter that performs the conversion.
---
---Note: There is no perfect solution to this problem. Different end-of-line
---markers are an evil that will probably plague developers forever.
---This function, however, will work perfectly for text created with any of
---the most common end-of-line markers, i.e. the Mac OS (CR), the Unix (LF),
---or the DOS (CRLF) conventions. Even if the data has mixed end-of-line
---markers, the function will still work well, although it doesn't
---guarantee that the number of empty lines will be correct.
function mime.normalize(marker) end

---Creates and returns a filter that performs stuffing of SMTP messages.
---
---Note: The `smtp.send`function
---uses this filter automatically. You don't need to chain it with your
---source, or apply it to your message body.
function mime.stuff() end

---
---Returns a filter that breaks data into lines.
---
---The "`text`" line-wrap filter simply breaks text into lines by
---inserting CRLF end-of-line markers at appropriate positions.
---`Length` defaults 76.
---The "`base64`" line-wrap filter works just like the default
---"`text`" line-wrap filter with default length.
---The function can also wrap "`quoted-printable`" lines, taking care
---not to break lines in the middle of an escaped character. In that case, the
---line length is fixed at 76.
---
---For example, to create an encoding filter for the Quoted-Printable transfer content encoding of text data, do the following:
---
---```
---qp = ltn12.filter.chain(
---  mime.normalize(),
---  mime.encode("quoted-printable"),
---  mime.wrap("quoted-printable")
---)
---```
---
---Note: To break into lines with a different end-of-line convention, apply
---a normalization filter after the line break filter.
---
---@param name 'text'|'base64'|'quoted-printable'
---@param length integer
function mime.wrap(name, length) end

---
---Low-level filter to perform Base64 encoding.
---
---If `D` is `nil`, `A` is padded with
---the encoding of the remaining bytes of `C`.
---
---Note: The simplest use of this function is to encode a string into it's
---Base64 transfer content encoding. Notice the extra parenthesis around the
---call to `mime.b64`, to discard the second return value.
---
---```
---print((mime.b64("diego:password")))
-----&gt; ZGllZ286cGFzc3dvcmQ=
---```
---
---@param C string
---@param D? string
---
---@return string A - `A` is the encoded version of the largest prefix of `C..D` that can be encoded unambiguously.
---@return string B -  `B` has the remaining bytes of `C..D`, before encoding.
function mime.b64(C, D) end

---
---Low-level filter to perform SMTP stuffing and enable transmission of
---messages containing the sequence "CRLF.CRLF".
---
---Note: The message body is defined to begin with
---an implicit CRLF. Therefore, to stuff a message correctly, the
---first `m` should have the value 2.
---
---```
---print((string.gsub(mime.dot(2, ".\r\nStuffing the message.\r\n.\r\n."), "\r\n", "\\n")))
-----&gt; ..\nStuffing the message.\n..\n..
---```
---
---Note: The `smtp.send`function
---uses this filter automatically. You don't need to
---apply it again.
---
---@param m integer - '`m`' should tell the same, but for the previous chunk.
---@param B? string
---
---@return string A - `A` is the stuffed version of `B`.
---@return integer n - `n` gives the number of characters from the sequence CRLF seen in the end of `B`.
function mime.dot(m, B) end

---
---A, B = mime.eol(C [, D, marker])
---
---Low-level filter to perform end-of-line marker translation.
---For each chunk, the function needs to know if the last character of the
---previous chunk could be part of an end-of-line marker or not. This is the
---context the function receives besides the chunk.  An updated version of
---the context is returned after each new chunk.
---
---`A` is the translated version of `D`. `C` is the
---ASCII value of the last character of the previous chunk, if it was a
---candidate for line break, or 0 otherwise.
---`B` is the same as `C`, but for the current
---chunk. `Marker` gives the new end-of-line marker and defaults to CRLF.
---
---```
----- translates the end-of-line marker to UNIX
---unix = mime.eol(0, dos, "\n")
---```
function mime.eol() end

---
---A, B = mime.qp(C [, D, marker])
---
---Low-level filter to perform Quoted-Printable encoding.
---
---`A` is the encoded version of the largest prefix of
---`C..D`
---that can be encoded unambiguously. `B` has the remaining bytes of
---`C..D`, beforeencoding.
---If `D` is `nil`, `A` is padded with
---the encoding of the remaining bytes of `C`.
---Throughout encoding, occurrences of CRLF are replaced by the
---`marker`, which itself defaults to CRLF.
---
---Note: The simplest use of this function is to encode a string into it's
---Quoted-Printable transfer content encoding.
---Notice the extra parenthesis around the call to `mime.qp`, to discard the second return value.
---
---```
---print((mime.qp("ma��")))
-----&gt; ma=E7=E3=
---```
function mime.qp() end

---
---A, m = mime.qpwrp(n [, B, length])
---
---Low-level filter to break Quoted-Printable text into lines.
---
---`A` is a copy of `B`, broken into lines of at most
---`length` bytes (defaults to 76).
---'`n`' should tell how many bytes are left for the first
---line of `B` and '`m`' returns the number of bytes
---left in the last line of `A`.
---
---Note: Besides breaking text into lines, this function makes sure the line
---breaks don't fall in the middle of an escaped character combination. Also,
---this function only breaks lines that are bigger than `length` bytes.
function mime.qpwrp() end

---
---Low-level filter to perform Base64 decoding.
---
---If `D` is `nil`, `A` is the empty string
---and `B` returns whatever couldn't be decoded.
---
---Note: The simplest use of this function is to decode a string from it's
---Base64 transfer content encoding.
---Notice the extra parenthesis around the call to `mime.unqp`, to discard the second return value.
---
---```
---print((mime.unb64("ZGllZ286cGFzc3dvcmQ=")))
-----&gt; diego:password
---```
---
---@param C string
---@param D? string
---
---@return string A - `A` is the decoded version of the largest prefix of `C..D` that can be decoded unambiguously.
---@return string B - `B` has the remaining bytes of `C..D`, before decoding.
function mime.unb64(C, D) end

---
---A, B = mime.unqp(C [, D])
---
---Low-level filter to remove the Quoted-Printable transfer content encoding
---from data.
---
---`A` is the decoded version of the largest prefix of
---`C..D`
---that can be decoded unambiguously. `B` has the remaining bytes of
---`C..D`, beforedecoding.
---If `D` is `nil`, `A` is augmented with
---the encoding of the remaining bytes of `C`.
---
---Note: The simplest use of this function is to decode a string from it's
---Quoted-Printable transfer content encoding.
---Notice the extra parenthesis around the call to `mime.unqp`, to discard the second return value.
---
---```
---print((mime.qp("ma=E7=E3=")))
-----&gt; ma��
---```
function mime.unqp() end

---A, m = mime.wrp(n [, B, length])
---
---Low-level filter to break text into lines with CRLF marker.
---Text is assumed to be in the `normalize`form.
---
---`A` is a copy of `B`, broken into lines of at most
---`length` bytes (defaults to 76).
---'`n`' should tell how many bytes are left for the first
---line of `B` and '`m`' returns the number of bytes
---left in the last line of `A`.
---
---Note: This function only breaks lines that are bigger than
---`length` bytes. The resulting line length does not include the CRLF
---marker.
---
---
function mime.wrp() end
