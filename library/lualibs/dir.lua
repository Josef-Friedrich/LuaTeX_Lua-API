---@meta
dir = {}

---
---* Corresponding source code: [lualibs-dir.lua#L74-L76](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L74-L76)
function dir.current() end

---
---* Corresponding source code: [lualibs-dir.lua#L169-L182](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L169-L182)
---
function dir.globpattern(path, patt, recurse, method) end

---
---* Corresponding source code: [lualibs-dir.lua#L188-L221](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L188-L221)
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
---* Corresponding source code: [lualibs-dir.lua#L259-L302](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L259-L302)
function dir.glob(str, t) end

---
---* Corresponding source code: [lualibs-dir.lua#L321-L348](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L321-L348)
function dir.globfiles(path, recurse, func, files) end

---
---* Corresponding source code: [lualibs-dir.lua#L352-L378](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L352-L378)
function dir.globdirs(path, recurse, func, files) end

---
---* Corresponding source code: [lualibs-dir.lua#L391-L393](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L391-L393)
---
---@param pattern string
---
---@return string
function dir.ls(pattern) end

---
---* Corresponding source code: [lualibs-dir.lua#L402-L536](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L402-L536)
---
---@param ... string
function dir.makedirs(...) end

---
---* Corresponding source code: [lualibs-dir.lua#L402-L536](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L402-L536)
---
---@param ... string
function dir.mkdirs(...) end

---
---* Corresponding source code: [lualibs-dir.lua#L553-L597](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L553-L597)
---
---@param str string
function dir.expandname(str) end

---
---* Corresponding source code: [lualibs-dir.lua#L605-L613](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L605-L613)
---
function dir.push() end

---
---* Corresponding source code: [lualibs-dir.lua#L615-L621](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L615-L621)
function dir.pop() end

---
---* Corresponding source code: [lualibs-dir.lua#L623-L640](https://github.com/latex3/lualibs/blob/116ffb3eddeb32663879200b91bc3177d74ee1ff/lualibs-dir.lua#L623-L640)
---
function dir.found() end
