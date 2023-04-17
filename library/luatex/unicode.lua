_N._4_3_lua_modules = "page 67"

---
---`slnunicode`, from the `selene` libraries, http://luaforge.net/projects/sln. This library has been slightly extended
---so that the `unicode.utf8.*` functions also accept the first 256 values
---of plane 18. This is the range *LuaTeX* uses for raw binary output, as
---explained above. We have no plans to provide more like this because you can
---basically do all that you want in *Lua*.
---
---Changes to the upstream project: global unicode table
---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/slnunicode

---
---There are four string-like ctype closures:
---`ascii`, `latin1`, `utf8` and `grapheme`
---
---`ascii` and `latin1` are single-byte like string,
---but use the `unicode` table for upper/lower and character classes.
---`ascii` does not touch bytes > 127 on upper/lower.
---
---`ascii` or `latin1` can be used as locale-Independent string replacement.
---(There is a compile switch to do this automatically for `ascii`).
--
---UTF-8 operates on UTF-8 sequences as of RFC 3629:
---1 byte 0-7F, 2 byte 80-7FF, 3 byte 800-FFFF, 4 byte 1000-10FFFF
---(not exclusing UTF-16 surrogate characters)
---Any byte not part of such a sequence is treated as it's (Latin-1) value.
---
---Grapheme takes care of grapheme clusters, which are characters followed by
---"grapheme extension" characters (Mn+Me) like combining diacritical marks.
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
unicode = {}

---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
unicode.ascii = {}

---
---Return the internal numeric codes of the characters `s[i], s[i+1], ..., s[j]`.
---
---@see string.byte
---
---@param s string
---@param i? integer
---@param j? integer
---
---@return integer ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.byte(s, i, j) end

---
---Return a string with length equal to the number of arguments, in which each character has the internal numeric code equal to its corresponding argument.
---
---@see string.char
---
---@param byte integer
---@param ... integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.char(byte, ...) end

---
---Return a string containing a binary representation (a binary chunk) of the given function.
---
---@see string.dump
---
---@param f fun(...: any):...unknown
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.dump(f) end

---
---Look for the first match of pattern in the string.
---
---@see string.find
---
---@param s string
---@param pattern string
---@param init? integer
---
---@return integer start
---@return integer end
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.find(s, pattern, init) end

---
---Return a formatted version of its variable number of arguments following the description given in its first argument.
---
---@see string.format
---
---@param s any
---@param ... any
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.format(s, ...) end

---
---Return an iterator function that, each time it is called, returns the next captures from `pattern` over the string `s`.
---
---@see string.gmatch
---
---@param s string
---@param pattern string
---
---@return fun(): string, ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.gmatch(s, pattern) end

---
---Return a copy of `s` in which all (or the first `n`, if given) occurrences of the pattern have been replaced by a replacement string specified by `repl`.
---
---@see string.gsub
---
---@param s string
---@param pattern string
---@param repl string|number|table|function
---@param n? integer
---
---@return string
---@return integer count
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.gsub(s, pattern, repl, n) end

---
---Return its length.
---
---@see string.len
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.len(s) end

---
---Return a copy of this string with all uppercase letters changed to lowercase.
---
---@see string.lower
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.lower(s) end

---
---Look for the first match of pattern in the string.
---
---@see string.gmatch
---
---@param s string
---@param pattern string
---@param init? integer
---
---@return any ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.match(s, pattern, init) end

---
---Return a string that is the concatenation of `n` copies of the string `s`.
---
---@see string.rep
---
---@param s string
---@param n integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.rep(s, n) end

---
---Return a string that is the string `s` reversed.
---
---@see string.reverse
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.reverse(s) end

---
---Return the substring of the string that starts at `i` and continues until `j`.
---
---@see string.sub
---
---@param s string
---@param i integer
---@param j? integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.sub(s, i, j) end

---
---Return a copy of this string with all lowercase letters changed to uppercase.
---
---@see string.upper
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.ascii.upper(s) end

---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
unicode.latin1 = {}

---
---Return the internal numeric codes of the characters `s[i], s[i+1], ..., s[j]`.
---
---@see string.byte
---
---@param s string
---@param i? integer
---@param j? integer
---
---@return integer ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.byte(s, i, j) end

---
---Return a string with length equal to the number of arguments, in which each character has the internal numeric code equal to its corresponding argument.
---
---@see string.char
---
---@param byte integer
---@param ... integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.char(byte, ...) end

---
---Return a string containing a binary representation (a binary chunk) of the given function.
---
---@param f fun(...: any):...unknown
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.dump(f) end

---
---Look for the first match of pattern in the string.
---
---@see string.find
---
---@param s string
---@param pattern string
---@param init? integer
---
---@return integer start
---@return integer end
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.find(s, pattern, init) end

---
---Return a formatted version of its variable number of arguments following the description given in its first argument.
---
---@see string.format
---
---@param s any
---@param ... any
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.format(s, ...) end

---
---Return an iterator function that, each time it is called, returns the next captures from `pattern` over the string `s`.
---
---@see string.gmatch
---
---@param s string
---@param pattern string
---
---@return fun(): string, ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.gmatch(s, pattern) end

---
---Return a copy of `s` in which all (or the first `n`, if given) occurrences of the pattern have been replaced by a replacement string specified by `repl`.
---
---@see string.gsub
---
---@param s string
---@param pattern string
---@param repl string|number|table|function
---@param n? integer
---
---@return string
---@return integer count
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.gsub(s, pattern, repl, n) end

---
---Return its length.
---
---@see string.len
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.len(s) end

---
---Return a copy of this string with all uppercase letters changed to lowercase.
---
---@see string.lower
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.lower(s) end

---
---Look for the first match of pattern in the string.
---
---@see string.match
---
---@param s string
---@param pattern string
---@param init? integer
---
---@return any ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.match(s, pattern, init) end

---
---Return a string that is the concatenation of `n` copies of the string `s`.
---
---@see string.rep
---
---@param s string
---@param n integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.rep(s, n) end

---
---Return a string that is the string `s` reversed.
---
---@see string.reverse
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.reverse(s) end

---
---Return the substring of the string that starts at `i` and continues until `j`.
---
---@see string.sub
---
---@param s string
---@param i integer
---@param j? integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.sub(s, i, j) end

---
---Return a copy of this string with all lowercase letters changed to uppercase.
---
---@see string.upper
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.latin1.upper(s) end

---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
unicode.grapheme = {}

---
---Return the internal numeric codes of the characters `s[i], s[i+1], ..., s[j]`.
---
---@see string.byte
---
---@param s string
---@param i? integer
---@param j? integer
---
---@return integer ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.byte(s, i, j) end

---
---Return a string with length equal to the number of arguments, in which each character has the internal numeric code equal to its corresponding argument.
---
---@see string.char
---
---@param byte integer
---@param ... integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.char(byte, ...) end

---
---Return a string containing a binary representation (a binary chunk) of the given function.
---
---@see string.dump
---
---@param f fun(...: any): ...unknown
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.dump(f) end

---
---Look for the first match of pattern in the string.
---
---@see string.find
---
---@param s string
---@param pattern string
---@param init? integer
---
---@return integer start
---@return integer end
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.find(s, pattern, init) end

---
---Return a formatted version of its variable number of arguments following the description given in its first argument.
---
---@see string.format
---
---@param s any
---@param ... any
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.format(s, ...) end

---
---Return an iterator function that, each time it is called, returns the next captures from `pattern` over the string `s`.
---
---@see string.gmatch
---
---@param s string
---@param pattern string
---
---@return fun(): string, ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.gmatch(s, pattern) end

---
---Return a copy of `s` in which all (or the first `n`, if given) occurrences of the pattern have been replaced by a replacement string specified by `repl`.
---
---@see string.gsub
---
---@param s string
---@param pattern string
---@param repl string|number|table|function
---@param n? integer
---
---@return string
---@return integer count
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.gsub(s, pattern, repl, n) end

---
---Return its length.
---
---@see string.len
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.len(s) end

---
---Return a copy of this string with all uppercase letters changed to lowercase.
---
---@see string.lower
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.lower(s) end

---
---Look for the first match of pattern in the string.
---
---@see string.match
---
---@param s string
---@param pattern string
---@param init? integer
---
---@return any ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.match(s, pattern, init) end

---
---Return a string that is the concatenation of `n` copies of the string `s`.
---
---@see string.rep
---
---@param s string
---@param n integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.rep(s, n) end

---
---Return a string that is the string `s` reversed.
---
---@see string.reverse
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.reverse(s) end

---
---Return the substring of the string that starts at `i` and continues until `j`.
---
---@see string.sub
---
---@param s string
---@param i integer
---@param j? integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.sub(s, i, j) end

---
---Return a copy of this string with all lowercase letters changed to uppercase.
---
---@see string.upper
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.grapheme.upper(s) end

---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
unicode.utf8 = {}

---
---Return the internal numeric codes of the characters `s[i], s[i+1], ..., s[j]`.
---
---@see string.byte
---
---@param s string
---@param i? integer
---@param j? integer
---
---@return integer ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.byte(s, i, j) end

---
---Return a string with length equal to the number of arguments, in which each character has the internal numeric code equal to its corresponding argument.
---
---@see string.char
---
---@param byte integer
---@param ... integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.char(byte, ...) end

---
---Return a string containing a binary representation (a binary chunk) of the given function.
---
---@see string.dump
---
---@param f fun(...: any):...unknown
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.dump(f) end

---
---Look for the first match of pattern in the string.
---
---@see string.find
---
---@param s string
---@param pattern string
---@param init? integer
---
---@return integer start
---@return integer end
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.find(s, pattern, init) end

---
---Return a formatted version of its variable number of arguments following the description given in its first argument.
---
---@see string.format
---
---@param s any
---@param ... any
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.format(s, ...) end

---
---Return an iterator function that, each time it is called, returns the next captures from `pattern` over the string `s`.
---
---@see string.gmatch
---
---@param s string
---@param pattern string
---
---@return fun(): string, ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.gmatch(s, pattern) end

---
---Return a copy of `s` in which all (or the first `n`, if given) occurrences of the pattern have been replaced by a replacement string specified by `repl`.
---
---@see string.gsub
---
---@param s string
---@param pattern string
---@param repl string|number|table|function
---@param n? integer
---
---@return string
---@return integer count
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.gsub(s, pattern, repl, n) end

---
---Return its length.
---
---@see string.len
---
---@param s string
---
---@return integer
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.len(s) end

---
---Return a copy of this string with all uppercase letters changed to lowercase.
---
---@see string.lower
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.lower(s) end

---
---Look for the first match of pattern in the string.
---
---@param s string
---@param pattern string
---@param init? integer
---
---@return any ...
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.match(s, pattern, init) end

---
---Return a string that is the concatenation of `n` copies of the string `s`.
---
---@see string.rep
---
---@param s string
---@param n integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.rep(s, n) end

---
---Return a string that is the string `s` reversed.
---
---@see string.reverse
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.reverse(s) end

---
---Return the substring of the string that starts at `i` and continues until `j`.
---
---@see string.sub
---
---@param s string
---@param i integer
---@param j? integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.sub(s, i, j) end

---
---Return a copy of this string with all lowercase letters changed to uppercase.
---
---@see string.upper
---
---@param s string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/slnunicode/blob/main/library/unicode.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/slnunicode/pulls)
function unicode.utf8.upper(s) end

return unicode
