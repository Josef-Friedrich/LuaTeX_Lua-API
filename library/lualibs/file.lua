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
---* Corresponding Lua source code: [lualibs-file.lua#L352-L378](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L352-L378)
---
function file.is_writable(name) end

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
function file.strip(name,dir) end

---
---* Corresponding Lua source code: [lualibs-file.lua#L724-L740](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L724-L740)
---
function file.withinbase(path) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.checksum() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.collapsepath() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.expandname() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.isreadable() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.iswritable() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.loadchecksum() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.needs_updating() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.needsupdating() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.readdata() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.savechecksum() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.savedata() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.split_path() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function file.syncmtimes() end
