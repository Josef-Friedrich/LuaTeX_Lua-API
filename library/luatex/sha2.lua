---@meta

---
---# Hashes conform `sha2`
---
---This library is a side effect of the `pdfe` library that needs such
---helpers. The `sha2.digest256`, `sha2.digest384` and
---`sha2.digest512` functions accept a string and return a string with the
---hash.
---

-- https://github.com/contextgarden/pplib

-- https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/libs/pplib/pplib-src/src/util/utilsha.c

sha2 = {}

---
---__Example:__
---
---```lua
---local function to_hex(str)
---  return (str:gsub('.', function (c)
---      return string.format('%02x', string.byte(c))
---  end))
---end
---
---print(to_hex(sha2.digest256('test')))
--- -- 9f86d081... (length 64)
---```
---
---@param data string
---
---@return string # binary string
function sha2.digest256(data) end

---
---__Example:__
---
---```lua
---local function to_hex(str)
---  return (str:gsub('.', function (c)
---      return string.format('%02x', string.byte(c))
---  end))
---end
---
---print(to_hex(sha2.digest384('test')))
--- -- 76841232... (length 96)
---```
---
---@param data string
---
---@return string # binary string
function sha2.digest384(data) end

---
---__Example:__
---
---```lua
---local function to_hex(str)
---  return (str:gsub('.', function (c)
---      return string.format('%02x', string.byte(c))
---  end))
---end
---
---print(to_hex(sha2.digest512('test')))
--- -- ee26b0dd ... (length 128)
---```
---
---@param data string
---
---@return string # binary string
function sha2.digest512(data) end

return sha2
