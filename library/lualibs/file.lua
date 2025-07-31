---@meta
file = {}

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L122-L124](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L122-L124)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.pathpart(filename, default) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L169](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L169)
---
---@see file.pathpart
---@deprecated
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.dirname(filename, default) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L128-L130](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L128-L130)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.basename(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L141-L143](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L141-L143)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.nameonly(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L147-L149](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L147-L149)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.suffixonly(filename) end

---
---__Reference:__
---
---* Corresponding C source code: [lualibs-file.lua#L170](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L170)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.extname(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L147-L149](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L147-L149)
---
---@see file.suffixonly
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.suffix(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L153-L159](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L153-L159)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.suffixesonly(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L153-L159](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L153-L159)
---
---@see file.suffixesonly
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.suffixes(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L190-L198](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L190-L198)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.splitname(filename, splitdrive) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L200-L206](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L200-L206)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.splitbase(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L210-L234](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L210-L234)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.nametotable(filename, splitdrive) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L253-L255](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L253-L255)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.removesuffix(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L271-L303](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L271-L303)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.addsuffix(filename, suffix, criterium) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L317-L323](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L317-L323)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.replacesuffix(filename, suffix) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L329-L331](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L329-L331)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.reslash(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L394](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L394)
---
---@see file.is_writable
---@deprecated
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.iswritable(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L352-L378](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L352-L378)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.is_writable(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L393](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L393)
---
---@see file.is_readable
---@deprecated
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.isreadable(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L382-L389](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L382-L389)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.is_readable(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L396-L403](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L396-L403)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.size(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L405-L407](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L405-L407)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.splitpath(filename, separator) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-compat.lua#L30](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-compat.lua#L30)
---
---@see file.splitpath
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.split_path(filename, separator) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L409-L411](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L409-L411)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.joinpath(tab, separator) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L455-L480](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L455-L480)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.join(one, two, three, ...) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L545-L597](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L545-L597)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.collapsepath(filename, anchor) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L545-L597](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L545-L597)
---
---@see file.collapsepath
---@deprecated
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.collapse_path(filename, anchor) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L617-L626](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L617-L626)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.robustname(filename, strict) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L634-L641](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L634-L641)
---
---@param oldname string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.copy(oldname, newname) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L660-L662](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L660-L662)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.is_qualified_path(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L664-L666](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L664-L666)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.is_rootbased_path(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L686-L691](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L686-L691)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.strip(filename, dir) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L724-L740](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L724-L740)
---
---@param filename string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.withinbase(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-md5.lua#L62-L78](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L62-L78)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.needsupdating() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-md5.lua#L62-L78](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L62-L78)
---
---@see file.needsupdating
---@deprecated
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.needs_updating() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-md5.lua#L82-L87](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L82-L87)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.syncmtimes() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-md5.lua#L89-L97](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L89-L97)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.checksum() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-md5.lua#L101-L107](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L101-L107)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.loadchecksum() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-md5.lua#L109-L116](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-md5.lua#L109-L116)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.savechecksum() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-dir.lua#L601](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-dir.lua#L601)
---
---@see dir.expandname
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.expandname() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L631](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L631)
---
---@see io.loaddata
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.readdata() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-file.lua#L632](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-file.lua#L632)
---
---@see io.savedata
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/file.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function file.savedata() end
