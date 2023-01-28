---@meta

---This is a specialized library. You can split an url into its components. An URL is constructed like this:
---https://github.com/latex3/lualibs/blob/main/lualibs-url.lua

url = {}

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

---A string is split into a hash table with these keys using the following function:
---The hash variant is more tolerant than the split. In the hash there is also a key `original` that holds
---the original URL and and the boolean noscheme indicates if there is a scheme at all.
---@param str string
---
---@return Url
function url.hashed(str) end

---
---@param str string
---
---@return string[]
function url.split(str) end

------------------------------------------------------------------------
---Undocumented functions listed in alphabetical order
---
---Document them by sliding them up and place them in the order of the
---official documentation
------------------------------------------------------------------------

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.addscheme(str, scheme) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.barepath(path) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.construct(hash) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.decode(str) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.encode(str) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.escape(str) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.filename(filename) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.hasscheme(str) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.query() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.toquery(data) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.unescape(str) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function url.unescapeget(str) end
