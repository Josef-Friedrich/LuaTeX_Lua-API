---@meta
file = {}

---
---* Corresponding Lua source code: [lualibs-file.lua#L122-L124](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L122-L124)
---
function file.pathpart(name, default) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L169](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L169)
---@see file.pathpart
---@deprecated
function file.dirname(name, default) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L128-L130](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L128-L130)
---
function file.basename(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L141-L143](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L141-L143)
---
function file.nameonly(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L147-L149](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L147-L149)
---
function file.suffixonly(name) end

---
---* Corresponding C source code: [lualibs-file.lua#L170](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L170)
---
function file.extname(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L147-L149](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L147-L149)
---
---@see file.suffixonly
function file.suffix(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L153-L159](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L153-L159)
---
function file.suffixesonly(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L153-L159](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L153-L159)
---
---@see file.suffixesonly
function file.suffixes(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L190-L198](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L190-L198)
---
function file.splitname(str, splitdrive) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L200-L206](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L200-L206)
---
function file.splitbase(str) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L210-L234](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L210-L234)
---
function file.nametotable(str, splitdrive) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L253-L255](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L253-L255)
---
function file.removesuffix(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L271-L303](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L271-L303)
---
function file.addsuffix(filename, suffix, criterium) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L317-L323](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L317-L323)
---
function file.replacesuffix(name, suffix) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L329-L331](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L329-L331)
---
function file.reslash(str) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L394](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L394)
---@see file.is_writable
---@deprecated
function file.iswritable() end

---
---* Corresponding Lua source code: [lualibs-file.lua#L352-L378](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L352-L378)
---
function file.is_writable(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L393](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L393)
---@see file.is_readable
---@deprecated
function file.isreadable() end

---
---* Corresponding Lua source code: [lualibs-file.lua#L382-L389](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L382-L389)
---
function file.is_readable(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L396-L403](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L396-L403)
---
function file.size(name) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L405-L407](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L405-L407)
---
function file.splitpath(str, separator) end

---
---* Corresponding Lua source code: [lualibs-compat.lua#L30](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-compat.lua#L30)
---@see file.splitpath
function file.split_path() end

---
---* Corresponding Lua source code: [lualibs-file.lua#L409-L411](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L409-L411)
---
function file.joinpath(tab, separator) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L455-L480](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L455-L480)
---
function file.join(one, two, three, ...) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L545-L597](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L545-L597)
---
function file.collapsepath() end

---
---* Corresponding Lua source code: [lualibs-file.lua#L545-L597](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L545-L597)
---@see file.collapsepath
---@deprecated
function file.collapse_path(str, anchor) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L617-L626](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L617-L626)
---
function file.robustname(str, strict) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L634-L641](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L634-L641)
---
function file.copy(oldname, newname) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L660-L662](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L660-L662)
---
function file.is_qualified_path(filename) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L664-L666](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L664-L666)
---
function file.is_rootbased_path(filename) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L686-L691](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L686-L691)
---
function file.strip(name, dir) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L724-L740](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L724-L740)
---
function file.withinbase(path) end

---
---* Corresponding Lua source code: [lualibs-md5.lua#L62-L78](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L62-L78)
---
function file.needsupdating() end
---
---* Corresponding Lua source code: [lualibs-md5.lua#L62-L78](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L62-L78)
---
---@see file.needsupdating
---@deprecated
function file.needs_updating() end

---
---* Corresponding Lua source code: [lualibs-md5.lua#L82-L87](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L82-L87)
---
function file.syncmtimes() end

---
---* Corresponding Lua source code: [lualibs-md5.lua#L89-L97](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L89-L97)
---
function file.checksum() end

---
---* Corresponding Lua source code: [lualibs-md5.lua#L101-L107](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L101-L107)
---
function file.loadchecksum() end

---
---* Corresponding Lua source code: [lualibs-md5.lua#L109-L116](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L109-L116)
---
function file.savechecksum() end

---
---* Corresponding Lua source code: [lualibs-dir.lua#L601](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-dir.lua#L601)
---@see dir.expandname
function file.expandname() end

---
---* Corresponding Lua source code: [lualibs-file.lua#L631](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L631)
---@see io.loaddata
function file.readdata() end

---
---* Corresponding Lua source code: [lualibs-file.lua#L632](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L632)
---@see io.savedata
function file.savedata() end
