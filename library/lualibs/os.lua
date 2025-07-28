---@meta

---
---https://github.com/latex3/lualibs/blob/main/lualibs-os.lua

os = {}

_N.resultof_launch = ""
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.resultof(command) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L246-L251](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L246-L251)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.launch(str) end

_N.type_name_platform_libsuffix_binsuffix = ""

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L404](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L404)
---
os.platform = ""

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L210-L214](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L210-L214)
---
os.libsuffix = ""

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L210-L214](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L210-L214)
---
os.binsuffix = ""

_N.runtime = ""

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L262-L264](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L262-L264)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.runtime() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L453-L469](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L453-L469)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.timezone(difference) end

_N.runtime = ""

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L423-L431](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L423-L431)
---
---@return string uuid
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.uuid() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L236-L238](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L236-L238)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.pipeto(command) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L478-L492](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L478-L492)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.fulltime(t, default) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L500-L514](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L500-L514)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.localtime(t, default) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L516-L523](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L516-L523)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.converttime(t, default) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L527-L529](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L527-L529)
---
---@return osdate
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.today() end

---
---Return the UTC time without timezone, for example `2021-10-22 08:22:54`.
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L533-L535](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L533-L535)
---
---@return string # for example `2021-10-22 08:22:54`.
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.now() end

---
---__Example:__
---
---```lua
---print(os.which("inkscape.exe"))
---print(os.which("inkscape"))
---print(os.which("gs.exe"))
---print(os.which("ps2pdf"))
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L543-L564](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L543-L564)
---
---@see os.where
---
---@param filename string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.which(filename) end

---
---__Example:__
---
---```lua
---print(os.where("inkscape.exe"))
---print(os.where("inkscape"))
---print(os.where("gs.exe"))
---print(os.where("ps2pdf"))
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L543-L564](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L543-L564)
---
---@see os.which
---
---@param filename string
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.where(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L595-L599](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L595-L599)
---
---@param year integer
---
---@return boolean
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.isleapyear(year) end

---
---Calculate the number of days.
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L619-L633](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L619-L633)
---
---@param year integer
---@param month? integer
---@param day? integer
---
---@return integer number_of_days # Calculates the number of days of a month if the parameter `day` is missing. Calculates the number of days of the year if the parameters `month` and `day` are missing.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.nofdays(year, month, day) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L637-L639](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L637-L639)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.weekday(day, month, year) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L641-L658](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L641-L658)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.validdate(year, month, day) end

---
---Return a string or a table containing date and time, formatted according to the given string format.
---
---If the parameter `format` is missing the format string `%Y-%m-%d %H:%M` is used.
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L660-L666](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L660-L666)
---
---@param format? string
---@param time? integer
---
---@return string|osdate
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.date(format, time) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L675-L677](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L675-L677)
---
---@see os.exit
---
---@param code integer|string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.setexitcode(code) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-os.lua#L679-L687](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L679-L687)
---
---@see os.setexitcode
---
---@param code? integer|string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.exit(code) end
