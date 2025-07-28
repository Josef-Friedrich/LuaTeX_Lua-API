---@meta

---
---https://github.com/latex3/lualibs/blob/main/lualibs-io.lua
io = {}

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L56-L65](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L56-L65)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.readall(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L69-L82](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L69-L82)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.loaddata(filename, textmode) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L126-L148](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L126-L148)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.copydata(source, target, action) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L150-L169](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L150-L169)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.savedata(filename, data, joiner, append) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L179-L235](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L179-L235)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.loadlines(filename, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L239-L248](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L239-L248)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.loadchunk(filename, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L250-L258](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L250-L258)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.exists(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L260-L269](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L260-L269)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.size(filename) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L271-L290](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L271-L290)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.noflines(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L317-L321](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L317-L321)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.characters(f, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L368-L374](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L368-L374)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.bytes(f, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L376-L408](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L376-L408)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.ask(question, default, options) end

---
---Reads `count` next bytes from a file `object`, optionally starting at byte `offset`. The bytes are treated as representing a single integer which is then returned in base 10. Valid byte counts are 1, 2, 4, 8, and 12; throws an error when there are fewer bytes left from the current position to the end of file than count.
---
---__Example:__
---
---```lua
---io.savedata("nums.txt", "\001\001\001\001\002\002\002\002\003\003\003\003")
---
---f = io.open("nums.txt", "r")
---print(io.readnumber(f, 1))
---print(io.readnumber(f, 5, 1))
---print(io.readnumber(f, 4))
---print(io.readnumber(f, 2))
---f:close()
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L410-L448](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L410-L448)
---* https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library
---
---@param object string
---@param offset integer
---@param count integer
---
---@return integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.readnumber(object, offset, count) end

---
---Reads `count` next bytes from a file `object`, optionally starting at byte `offset`. The bytes are treated as representing a single integer which is then returned in base 10. Valid byte counts are 1, 2, 4, 8, and 12; throws an error when there are fewer bytes left from the current position to the end of file than count.
---
---__Example:__
---
---```lua
---io.savedata("nums.txt", "\001\001\001\001\002\002\002\002\003\003\003\003")
---
---f = io.open("nums.txt", "r")
---print(io.readnumber(f, 1))
---print(io.readnumber(f, 5, 1))
---print(io.readnumber(f, 4))
---print(io.readnumber(f, 2))
---f:close()
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L410-L448](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L410-L448)
---* https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library
---
---@param object string
---@param count integer
---
---@return integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.readnumber(object,  count) end


---
---Returns the next `length` bytes from `object`, starting from the current position or, optionally, the `byte` offset.
---
---__Example:__
---
---```lua
---f = io.open("text.txt", "r")
---str = io.readstring(f, 5, 3)
---print(str)
---f:close()
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L452-L459](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L452-L459)
---* https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library
---
---@param object string
---@param offset integer
---@param length integer
---
---@return string
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.readstring(object, offset, length) end

---
---Returns the next `length` bytes from `object`, starting from the current position or, optionally, the `byte` offset.
---
---
---__Example:__
---
---```lua
---f = io.open("text.txt", "r")
---str = io.readstring(f, 5, 3)
---print(str)
---f:close()
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-io.lua#L452-L459](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L452-L459)
---* https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library
---
---@param object string
---@param length integer
---
---@return string
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/io.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function io.readstring(object, length) end
