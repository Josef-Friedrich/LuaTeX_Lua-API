---@meta
dir = {}

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L74-L76](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L74-L76)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.current() end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L169-L182](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L169-L182)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.globpattern(path, patt, recurse, method) end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L188-L221](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L188-L221)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.collectpattern(path, patt, recurse, result) end

---
---__Example:__
---
---```lua
---local list = dir.glob("e:/**")
---local list = dir.glob("t:/sources/**")
---local list = dir.glob("**/*.tif")
---```
---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L259-L302](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L259-L302)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.glob(str, t) end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L321-L348](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L321-L348)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.globfiles(path, recurse, func, files) end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L352-L378](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L352-L378)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.globdirs(path, recurse, func, files) end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L391-L393](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L391-L393)
---
---@param pattern string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.ls(pattern) end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L402-L536](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L402-L536)
---
---@param ... string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.makedirs(...) end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L402-L536](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L402-L536)
---
---@param ... string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.mkdirs(...) end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L553-L597](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L553-L597)
---
---@param str string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.expandname(str) end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L605-L613](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L605-L613)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.push() end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L615-L621](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L615-L621)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.pop() end

---
---__Reference:__
---
---* Corresponding source code: [lualibs-dir.lua#L623-L640](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L623-L640)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/dir.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function dir.found() end
