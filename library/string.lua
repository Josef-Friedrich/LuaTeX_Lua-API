---@meta
---
---# Multibyte `string` functions
---
---The `string` library has a few extra functions, for example `string.explode`. This function takes upto two arguments: `string.explode(s[,m])` and returns an array containing the string argument `s` split into sub-strings based on the value of the string argument `m`.
---The second argument is a string that is either empty (this splits the string into
---characters), a single character (this splits on each occurrence of that
---character, possibly introducing empty strings), or a single character followed by
---the plus sign `+` (this special version does not create empty sub-strings).
---The default value for `m` is “` +`” (multiple spaces). Note:
---`m` is not hidden by surrounding braces as it would be if this function was
---written in *TeX* macros.
---
---
---There is also a two-argument form of `string.dump()`. The second argument
---is a boolean which, if true, strips the symbols from the dumped data. This
---matches an extension made in `luajit`. This is typically a function that
---gets adapted as *Lua* itself progresses.
---
---The `string` library functions `len`, `lower`, `sub`
---etc. are not *Unicode*-aware. For strings in the *UTF-8* encoding, i.e., strings
---containing characters above code point 127, the corresponding functions from the
---`slnunicode` library can be used, e.g., `unicode.utf8.len`, `unicode.utf8.lower` etc. The exceptions are `unicode.utf8.find`, that
---always returns byte positions in a string, and `unicode.utf8.match` and
---`unicode.utf8.gmatch`. While the latter two functions in general {\it
---are} *Unicode*-aware, they fall-back to non-*Unicode*-aware behavior when
---using the empty capture `()` but other captures work as expected. For the
---interpretation of character classes in `unicode.utf8` functions refer to
---the library sources at http://luaforge.net/projects/sln.
---
---Version 5.3 of *Lua* provides some native *UTF-8* support but we have added a few
---similar helpers too: `string.utfvalue`, `string.utfcharacter`
---and `string.utflength`.
---
---* `string.utfvalue(s)`: returns the codepoints of the characters in the
---    given string
---
---* `string.utfcharacter(c,...)`: returns a string with the characters of
---    the given code points
---
---* `string.utflength(s)`: returns the length of the given string
---
---These three functions are relative fast and don't do much checking. They can be
---used as building blocks for other helpers.
---
string = {}

---
---@param s string
---
---@return # an integer value in the *Unicode* range
function string.utfvalues(s) end

---@param s string
---
---@return # a string with a single *UTF-8* token in it
function string.utfcharacters(s) end

---@param s string
---
---@return a string containing one byte
function string.characters(s) end

---
---The `string.characterpairs()` iterator
---is useful especially in the conversion of *UTF-8*16 encoded data into *UTF-8*.
---
---@param s string
---
---@return # two strings each containing one byte or an empty second string if the string length was odd
function string.characterpairs(s) end

---@param s string
---
---@return # a single byte value
function string.bytes(s) end

---
---The `string.bytepairs()` iterator
---is useful especially in the conversion of *UTF-8*16 encoded data into *UTF-8*.
---
---@param s string
---
---@return # two byte values or nil instead of a number as its second return value if the string length was odd
function string.bytepairs(s) end
