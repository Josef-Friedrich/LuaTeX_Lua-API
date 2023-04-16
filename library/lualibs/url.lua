---@meta
---
---https://github.com/latex3/lualibs/blob/main/lualibs-url.lua
---
---This is a specialized library. You can split an url into its components. An URL is constructed like this:
url = {}

_N.split_hashed_construct = ""

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
---
---__Example:__
---
---```lua
---url.hashed("foo://example.com:2010/alpha/beta?gamma=delta#epsilon")
---t = {
---    ["authority"] = "example.com:2010",
---    ["filename"] = "example.com:2010/alpha/beta",
---    ["fragment"] = "epsilon",
---    ["host"] = "example.com",
---    ["noscheme"] = false,
---    ["original"] = "foo://example.com:2010/alpha/beta?gamma=delta#epsilon",
---    ["path"] = "alpha/beta",
---    ["port"] = 2010,
---    ["queries"] = {["gamma"] = "delta"},
---    ["query"] = "gamma=delta",
---    ["scheme"] = "foo"
---}
---
---url.hashed("alpha/beta")
---t = {
---    ["authority"] = "",
---    ["filename"] = "alpha/beta",
---    ["fragment"] = "",
---    ["noscheme"] = true,
---    ["original"] = "alpha/beta",
---    ["path"] = "alpha/beta",
---    ["query"] = "",
---    ["scheme"] = "file"
---}
---```
---
---* Corresponding Lua source code: [lualibs-url.lua#L184-L250](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L184-L250)
---
---@param str string
---
---@return Url
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.hashed(str) end

---
---__Example:__
---
---```lua
---url.split("foo://example.com:2010/alpha/beta?gamma=delta#epsilon")
---t={ "foo", "example.com:2010", "alpha/beta", "gamma=delta", "epsilon" }
---
---url.split("alpha/beta")
---t = {"", "", "", "", ""}
---```
---
---* Corresponding Lua source code: [lualibs-url.lua#L132-L134](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L132-L134)
---
---@param str string
---
---@return string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.split(str) end

---
---* Corresponding Lua source code: [lualibs-url.lua#L289-L322](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L289-L322)
---
---@param hash Url
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.construct(hash) end

_N.hasscheme_addscheme_filename_query = ""

---
---__Example:__
---
---```lua
---url.hasscheme("http://www.pragma-ade.com/cow.png") -- 'http'
---url.hasscheme("www.pragma-ade.com/cow.png") -- false
---```
---
---* Corresponding Lua source code: [lualibs-url.lua#L138-L145](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L138-L145)
---
---@param str string
---
---@return string|false
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.hasscheme(str) end

---
---__Example:__
---
---```lua
---url.addscheme("www.pragma-ade.com/cow.png","http://")
----- http://:///www.pragma-ade.com/cow.png
---
---url.addscheme("www.pragma-ade.com/cow.png")
----- file:///www.pragma-ade.com/cow.png
---```
---
---* Corresponding Lua source code: [lualibs-url.lua#L279-L287](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L279-L287)
---
---@param str string
---@param scheme string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.addscheme(str, scheme) end

---
---__Example:__
---
---```lua
---url.filename("http://www.pragma-ade.com/cow.png")
-----http://www.pragma-ade.com/cow.png
---```
---
---* Corresponding Lua source code: [lualibs-url.lua#L326-L330](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L326-L330)
---
---@param filename string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.filename(filename) end

---
---__Example:__
---
---```lua
---url.query("a=b&c=d")
---t = {
---  ["a"]="b",
---  ["c"]="d",
---}
---```
---
---* Corresponding Lua source code: [lualibs-url.lua#L342-L348](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L342-L348)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---
---@see url.toquery
---
---@param str string
---
---@return table
function url.query(str) end

---
---__Example:__
---
---```lua
---url.toquery({ a = "b", c = "d" }) --"a=b&c=d"
---```
---
---* Corresponding Lua source code: [lualibs-url.lua#L350-L365](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L350-L365)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---
---@see url.query
---
---@param data table
---
---@return string
function url.toquery(data) end

---
---* Corresponding Lua source code: [lualibs-url.lua#L371-L377](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L371-L377)
---
---@param path string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.barepath(path) end

---
---* Corresponding Lua source code: [lualibs-url.lua#L88](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L88)
---
---@param str string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.decode(str) end

---
---* Corresponding Lua source code: [lualibs-url.lua#L89](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L89)
---
---@param str string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.encode(str) end

---
---* Corresponding Lua source code: [lualibs-url.lua#L336-L340](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L336-L340)
---
---@param str string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.escape(str) end

---
---* Corresponding Lua source code: [lualibs-url.lua#L90](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L90)
---
---@param str string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.unescape(str) end

---
---* Corresponding Lua source code: [lualibs-url.lua#L125-L127](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-url.lua#L125-L127)
---
---@param str string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/url.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function url.unescapeget(str) end
