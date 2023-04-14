---@meta

---
---https://github.com/latex3/lualibs/blob/main/lualibs-url.lua

---
---This is a specialized library. You can split an url into its components. An URL is constructed like this:

url = {}

---
---Example `foo://example.com:2010/alpha/beta?gamma=delta#epsilon`
---@class Url
---@field scheme string # for example `foo`.
---@field authority string # for example `example.com:2010`.
---@field filename string # for example `example.com:2010/alpha/beta`.
---@field path string # for example `alpha/beta`.
---@field port string # for example `2010`.
---@field query string # for example `gamma=delta`.
---@field queries table # for example `{["gamma"]="delta"}`.
---@field fragment string # for example `epsilon`.
---@field original string # for example `foo://example.com:2010/alpha/beta?gamma=delta#epsilon"`.
---@field noscheme boolean # for example `false`.

---
---A string is split into a hash table with these keys using the following function:
---The hash variant is more tolerant than the split. In the hash there is also a key `original` that holds
---the original URL and and the boolean noscheme indicates if there is a scheme at all.
---@param str string
---
---@return Url
---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.hashed(str) end

---
---@param str string
---
---@return string[]
---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.split(str) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.addscheme(str, scheme) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.barepath(path) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.construct(hash) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.decode(str) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.encode(str) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.escape(str) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.filename(filename) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.hasscheme(str) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.query() end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.toquery(data) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.unescape(str) end

---
--- 😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.unescapeget(str) end
