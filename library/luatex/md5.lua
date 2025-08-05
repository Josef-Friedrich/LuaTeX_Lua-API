---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

_N._4_3_lua_modules = "page 67"

---
---https://github.com/TeX-Live/luatex/tree/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luamd5
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/517487384d3b0b4b003fb3180ea415f52eeb5f5f/source/texk/web2c/luatexdir/lua/luatex-core.lua#L220-L241
---Changes to upstream:
---* local md5 table
---* additional function md5.sumHEXA()

---
---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/md5

---
---`md5`, by Roberto Ierusalimschy http://www.inf.puc-rio.br/~roberto/md5/md5-5/md5.html.
---
---This library offers basic cryptographic facilities for Lua 5.0: a hash (digest) function, an a pair crypt/decrypt.
---
---All functions are registered inside a table `md5`.
---
---😱 [Types](https://github.com/LuaCATS/md5/blob/main/library/md5.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/md5/pulls)
md5 = {}

---
---Compute the MD5 message-digest of the string `message`.
---
---This function takes as input a message of arbitrary length and content
---and returns as output a 128-bit "fingerprint" (or "message digest")
---of the input.
---
---The output is formated as a binary string with 16 characters.
---It is conjectured that it is computationally infeasible to produce
---two messages having the same message digest, or to produce any
---message having a given pre-specified target message digest.
---(see
---RFC 1321)
---
---__Example:__
---
---```lua
---local function convert_to_hex(str)
---  return (str:gsub('.', function (c)
---      return string.format('%02X', string.byte(c))
---  end))
---end
---local hash = convert_to_hex(md5.sum('test'))
---assert(hash == '098F6BCD4621D373CADE4E832627B4F6')
---```
---
---@param message string
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/md5/blob/main/library/md5.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/md5/pulls)
function md5.sum(message) end

---
---Compute the MD5 lower case hexadecimal message-digest of the string `message`.
---
---Similar to `md5.sum()`,
---but returns its value as a string of 32 hexadecimal digits (lower case letters).
---
---__Example:__
---
---```lua
---local hash = md5.sumhexa('test')
---assert(hash == '098f6bcd4621d373cade4e832627b4f6')
---```
---
---@param message string
---
---@return string # for example `098f6bcd4621d373cade4e832627b4f6`
---
---😱 [Types](https://github.com/LuaCATS/md5/blob/main/library/md5.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/md5/pulls)
function md5.sumhexa(message) end

---
---Compute the MD5 upper case hexadecimal message-digest of the string `message`.
---
---Similar to `md5.sum()`
---but returns its value as a string of 32 hexadecimal digits (upper case letters).
---
---__Example:__
---
---```lua
---local hash = md5.sumHEXA('test')
---assert(hash == '098F6BCD4621D373CADE4E832627B4F6')
---```
---
---@param message string
---
---@return string # for example `098F6BCD4621D373CADE4E832627B4F6`
function md5.sumHEXA(message) end

---
---Encrypt a string, using MD5 in CFB (Cipher-feedback mode).
---
---`message` is an arbitrary binary string to be encrypted.
---`key` is an arbitrary binary string to be used as a key.
---`seed` is an arbitrary binary string to be used as a seed;
---Returns the cyphertext (as a binary string).
---
---If no seed is provided,
---the function uses the result of `os.time()` as a seed.
---It is recommended that you use different seeds for each message;
---the seed itself is not private, and should contain no private data,
---because it goes plain in the beginning of the encrypted message.
---
---The length of the cyphertext is the length of the message plus the
---length of the seed plus one.
---
---__Example:__
---
---```lua
---local function convert_to_hex(str)
---  return (str:gsub('.', function(c)
---      return string.format('%02X', string.byte(c))
---  end))
---end
---
---local result = convert_to_hex(md5.crypt('secret', '123', 'seed'))
---assert(result == '0473656564974C4C1B3848')
---```
---
---@param message string # An arbitrary binary string to be encrypted.
---@param key string # An arbitrary binary string to be used as a key.
---@param seed? string # An optional arbitrary binary string to be used as a seed. If no seed is provided, the function uses the result of `time()` as a seed.
---
---@return string cyphertext # The cyphertext (as a binary string).
---
---😱 [Types](https://github.com/LuaCATS/md5/blob/main/library/md5.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/md5/pulls)
function md5.crypt(message, key, seed) end

---
---Decrypt a string.
---
---The input `message` must be the result of a previous call
---to `crypt`.
---For any `message`, `key`,
---and `seed`, we have that
---
---```lua
---local encrypted = md5.crypt('message', '123', 'seed')
---local message = md5.decrypt(encrypted, '123')
---assert(message == 'message')
---```
---
---@param message string # message to be decrypted (this must be the result of a previous call to `crypt`).
---@param key string # arbitrary binary string to be used as a key.
---
---@return string plaintext # The plaintext.
---
---😱 [Types](https://github.com/LuaCATS/md5/blob/main/library/md5.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/md5/pulls)
function md5.decrypt(message, key) end

---
---Do a bit-a-bit exclusive `or` of strings `s1` and `s2`.
---
---Both strings must have the same length,
---which will be also the length of the resulting string.
---
---__Example:__
---
---```lua
---assert(md5.exor('', '') == '')
---assert(md5.exor('alo alo', '\0\0\0\0\0\0\0') == 'alo alo')
---```
---
---@param s1 string # arbitrary binary string.
---@param s2 string # arbitrary binary string with same length as `s1`.
---
---@return string # a binary string with same length as `s1` and `s2`, where each bit is the exclusive `or` of the corresponding bits in `s1`-`s2`.
---
---😱 [Types](https://github.com/LuaCATS/md5/blob/main/library/md5.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/md5/pulls)
function md5.exor(s1, s2) end
