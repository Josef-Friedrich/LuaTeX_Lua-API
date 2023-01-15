---@meta

--- `md5`, by Roberto Ierusalimschy http://www.inf.puc-rio.br/~roberto/md5/md5-5/md5.html.
---https://github.com/latex3/lualibs/blob/main/lualibs-md5.lua
---https://github.com/TeX-Live/luatex/tree/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/luamd5
---https://github.com/TeX-Live/luatex/blob/517487384d3b0b4b003fb3180ea415f52eeb5f5f/source/texk/web2c/luatexdir/lua/luatex-core.lua#L220-L241
---
---All functions are registered inside a table `md5`.
md5 = {}

---
---Computes the MD5 message-digest of the string `message`.
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
---@param message string
---
---@return string
function md5.sum(message) end

---
---Similar to `md5.sum()`,
---but returns its value as a string of 32 hexadecimal digits (lower case letters).
---
---@param message string
---
---@return string # for example `098f6bcd4621d373cade4e832627b4f6`
function md5.sumhexa(message) end

---
---Similar to `md5.sum()`
---but returns its value as a string of 32 hexadecimal digits (upper case letters).
---
---@param message string
---
---@return string # for example `098F6BCD4621D373CADE4E832627B4F6`
function md5.sumHEXA(message) end

---
---Encrypts a string, using MD5 in CFB (Cipher-feedback mode).
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
---@param message string # An arbitrary binary string to be encrypted.
---@param key string # An arbitrary binary string to be used as a key.
---@param seed? string # An optional arbitrary binary string to be used as a seed. If no seed is provided, the function uses the result of `time()` as a seed.
------
---__Example:__
---
---```lua
---function convert_to_hex(str)
---return (str:gsub('.', function (c)
---    return string.format('%02X', string.byte(c))
---end))
---end
---tex.print(convert_to_hex(md5.crypt('secret', '123')))
---```
---
---@return string # The cyphertext (as a binary string).
function md5.crypt(message, key, seed) end

---
---Decrypts a string.
---The input `message` must be the result of a previous call
---to `crypt`.
---For any `msg`, `key`,
---and `seed`, we have that
---
---```lua
---md5.decrypt(md5.crypt(msg, key, seed), key) == msg
---md5.decrypt(md5.crypt('secret', '123', 'seed'), '123') == 'secret'
---```
---
---@param message string # message to be decrypted (this must be the result of a previous call to `crypt`).
---@param key string # arbitrary binary string to be used as a key.
---
---@return string # The plaintext.
function md5.decrypt(message, key) end

---
---Does a bit-a-bit exclusive or of strings `s1` and `s2`.
---Both strings must have the same length,
---which will be also the length of the resulting string.
---
---@param s1 string # arbitrary binary string.
---@param s2 string # arbitrary binary string with same length as s1.
---
---@return string # a binary string with same length as s1 and s2, where each bit is the exclusive-or of the corresponding bits in s1-s2.
function md5.exor(s1, s2) end
