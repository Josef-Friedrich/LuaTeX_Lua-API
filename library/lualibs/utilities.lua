---@meta
utilities = {}

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-deb.lua
utilities.debugger = {}

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-deb.lua#L162-L249](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-deb.lua#L162-L249)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.debugger.showstats(printer, threshold) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-deb.lua#L272-L278](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-deb.lua#L272-L278)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.debugger.savestats(filename, threshold) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-deb.lua#L280-L298](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-deb.lua#L280-L298)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.debugger.enable() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-deb.lua#L300-L307](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-deb.lua#L300-L307)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.debugger.disable() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-deb.lua#L326-L343](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-deb.lua#L326-L343)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.debugger.showtraceback(rep) end

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-fil.lua
utilities.files = {}

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L22-L28](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L22-L28)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.open(filename, zb) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L30-L33](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L30-L33)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.close(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L35-L40](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L35-L40)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.size(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L42](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L42)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.getsize(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L44-L50](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L44-L50)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.setposition() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L52-L58](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L52-L58)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.getposition() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L60-L69](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L60-L69)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.look(f, n, chars) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L71-L77](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L71-L77)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.skip(f, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L79-L81](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L79-L81)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readbyte() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L83-L85](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L83-L85)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readbytes() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L87-L91](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L87-L91)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readbytetable() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L93-L95](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L93-L95)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readchar(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L97-L99](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L97-L99)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readstring(f, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L101-L108](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L101-L108)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readinteger1() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L110](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L110)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readcardinal1() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L111](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L111)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readcardinal() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L112](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L112)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readinteger() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L113](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L113)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readsignedbyte() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L115-L118](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L115-L118)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readcardinal2() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L120-L123](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L120-L123)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readcardinal2le(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L125-L132](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L125-L132)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readinteger2() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L134-L141](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L134-L141)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readinteger2le(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L143-L146](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L143-L146)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readcardinal3() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L148-L151](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L148-L151)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readcardinal3le(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L153-L160](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L153-L160)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readinteger3() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L162-L169](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L162-L169)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readinteger3le(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L171-L174](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L171-L174)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readcardinal4() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L176-L179](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L176-L179)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readcardinal4le(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L181-L188](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L181-L188)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readinteger4() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L190-L197](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L190-L197)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readinteger4le(f) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L208-L215](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L208-L215)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readfixed2() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L228-L235](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L228-L235)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readfixed4() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L244-L253](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L244-L253)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.read2dot14() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L257-L259](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L257-L259)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.skipshort(f, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L261-L263](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L261-L263)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.skiplong(f, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L271-L287](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L271-L287)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.writecardinal2(f, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L291-L300](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L291-L300)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.writecardinal4(f, n) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L302-L304](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L302-L304)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.writestring(f, s) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L306-L308](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L306-L308)
---
---@param f file*
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.writebyte(f, b) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L359-L366](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L359-L366)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readcardinaltable() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L373-L380](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L373-L380)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.readintegertable() end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-fil.lua#L332](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-fil.lua#L332)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.files.skipposition() end

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-jsn.lua
utilities.json = {}

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.json.load(filename) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.json.tojson(value) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.json.tolua(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.json.tostring(value, pretty) end

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-lua.lua
utilities.lua = {}

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.lua.checkmemory(previous, threshold, trace) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.lua.compile(luafile, lucfile, cleanup, strip, fallback) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.lua.loadedluacode(fullname, forcestrip, name, macros) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.lua.loadstring(code, name) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.lua.loadstripped() end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.lua.registerfinalizer(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.lua.strippedloadstring(code, name, forcestrip) end

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-prs.lua
utilities.parsers = {}

---
---Parse and write directly into table.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.add_settings_to_array(t, str) end

---
---Parse arguments, return table.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.arguments_to_table(str) end

---
---Concatenates a with custom sep or comma.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.array_to_string(a, separator) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.csvsplitter(specification) end

---
---Write `settings_to_hash` to an array with a metatable. A metatable is a sort of parent: when a table is accessed, undefined values will be looked up in the metatable.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.getparameters(self, class, parentclass, settings) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.groupedsplitat(symbol, withaction) end

---
---Turn a hash into a string, with optional strictness settings.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.hash_to_string(
  h,
  separator,
  yes,
  no,
  strict,
  omit
)
end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.iterator(str, separator) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.keq_to_hash(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.listitem(str) end

---
---Returns parser pattern for strict, tolerant, or normal arg-parsing.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.make_settings_to_hash_pattern(set, how) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.mergehashes(hash, list) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.options_to_array(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.options_to_hash(str, target) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.process_stripped_settings(str, action) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.rfc4180splitter(specification) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.runtime(time) end

---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.settings_to_array(str, strict) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.settings_to_array_obey_fences(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.settings_to_array_with_repeat(str, expand) end

---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.settings_to_hash(str, existing) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.settings_to_hash_colon_too(str) end

---
---Like `settings_to_hash` with strict parsing.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.settings_to_hash_strict(str, existing) end

---
---Like `settings_to_hash` with tolerant parsing.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.settings_to_hash_tolerant(str, existing) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.settings_to_numbers(str) end

---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.settings_to_set(str) end

---
---Concatenate the values of a hash.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.simple_hash_to_string(h, separator) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.splitmethod(str, default) end

---
---Turns 12345678.44 into 12,345,678.44.
---
---__Reference:__
---
---* ConTeXt wiki: [ConTeXt and Lua programming/Extensions to the Lua IO library/String manipulation](https://wiki.contextgarden.net/ConTeXt_and_Lua_programming/Extensions_to_the_Lua_IO_library/String_manipulation)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.splitthousands(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.stepper(str, n, action) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.stripped_settings_to_array(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.totime(str) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.unittotex(str, textmode) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.parsers.unittoxml(str) end

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-sac.lua
utilities.streams = {}

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.close() end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.getposition(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.getsize(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.getstring(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.look(f, n, chars) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.open(filename, zerobased) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.openstring(f, zerobased) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.read2dot14(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readbyte(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readbytes(f, n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readbytetable(f, n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcardinal(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcardinal1(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcardinal2(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcardinal2le(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcardinal3(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcardinal3le(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcardinal4(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcardinal4le(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcardinaltable(f, n, b) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readchar(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readcstring(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readfixed2(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readfixed4(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readinteger(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readinteger1(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readinteger2(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readinteger2le(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readinteger3(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readinteger3le(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readinteger4(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readinteger4le(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readintegertable(f, n, b) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readsignedbyte(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.readstring(f, n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.setposition(f, i) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.size(f) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.skip(f, n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.skipbytes(f, n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.skiplong(f, n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.skipshort(f, n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.tocardinal1() end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.tocardinal1le() end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.tocardinal2(n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.tocardinal2le(n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.tocardinal3(n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.tocardinal3le(n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.tocardinal4(n) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.streams.tocardinal4le(n) end

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-sta.lua
utilities.stacker = {}

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.stacker.new(name) end

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-sto.lua
utilities.storage = {}

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.storage.allocate(t) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.storage.checked(t) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.storage.mark(t) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.storage.marked(t) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.storage.setinitializer(data, initialize) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.storage.sparse(t) end

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-str.lua
utilities.strings = {}

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L294-L304
---@alias StriplinePattern
---|`prune`
---|`prune and collapse`
---|`prune and no empty`
---|`prune and to space`
---|`retain`
---|`retain and collapse`
---|`retain and no empty`
---|`collapse all`
---|`collapse`

---
---https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L294-L304
---@type table<StriplinePattern, Pattern>
utilities.strings.striplinepatterns = {}

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L144-L146](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L144-L146)
---
---@param text string
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.strings.collapsecrlf(text) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L152-L175](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L152-L175)
---
---@param text string
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.strings.newrepeater(text, offset) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L207-L210](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L207-L210)
---
---@param text string
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.strings.tabtospace(text, tab) end

---
---__Example:__
---
---```lua
---local str = table.concat({
---  "  ",
---  "    aap",
---  "  noot mies",
---  "  ",
---  "    ",
---  " zus    wim jet",
---  "zus    wim jet",
---  "       zus    wim jet",
---  "    ",
---}, "\n")
---
---for k, v in table.sortedhash(utilities.strings.striplinepatterns) do
---  print(
---    "\n__`" .. k .. "`:__\n\n",
---    "\n```\n" .. utilities.strings.striplines(str, k) .. "\n```"
---  )
---end
---```
---
---__`collapse`:__
---
---```
---
--- aap
--- noot mies
---
--- zus wim jet
---zus wim jet
--- zus wim jet
---
---```
---
---__`collapse all`:__
---
---```
--- aap noot mies zus wim jet zus wim jet zus wim jet
---```
---
---__`prune`:__
---
---```
---aap
---noot mies
---
---zus    wim jet
---zus    wim jet
---zus    wim jet
---```
---
---__`prune and collapse`:__
---
---```
---aap
---noot mies
---
---zus    wim jet
---zus    wim jet
---zus    wim jet
---```
---
---__`prune and no empty`:__
---
---```
---aap
---noot mies
---zus    wim jet
---zus    wim jet
---zus    wim jet
---```
---
---__`prune and to space`:__
---
---```
---aap noot mies zus wim jet zus wim jet zus wim jet
---```
---
---__`retain`:__
---
---```
---
---aap
---noot mies
---
---zus    wim jet
---zus    wim jet
---zus    wim jet
---
---```
---
---__`retain and collapse`:__
---
---```
---
---aap
---noot mies
---
---zus    wim jet
---zus    wim jet
---zus    wim jet
---
---```
---
---__`retain and no empty`:__
---
---```
---
---aap
---noot mies
---zus    wim jet
---zus    wim jet
---zus    wim jet
---
---```
---
---__Reference:__
---
---* Context Lua Documents, July 8, 2023: [page 90-94](https://www.pragma-ade.nl/general/manuals/cld-mkiv.pdf)
---* Corresponding Lua source code: [lualibs-util-str.lua#L310-L312](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L310-L312)
---
---@see utilities.strings.striplong
---
---@param text string
---@param how StriplinePattern
---
---@return string text
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.strings.striplines(text, how) end

---
---Alias of `utilities.strings.striplines`
---
---__Example:__
---
---```lua
---local str = table.concat({
---  "  ",
---  "    aap",
---  "  noot mies",
---  "  ",
---  "    ",
---  " zus    wim jet",
---  "zus    wim jet",
---  "       zus    wim jet",
---  "    ",
---}, "\n")
---
---for k, v in table.sortedhash(utilities.strings.striplinepatterns) do
---  print(
---    "\n__`" .. k .. "`:__\n\n",
---    "\n```\n" .. utilities.strings.striplines(str, k) .. "\n```"
---  )
---end
---```
---
---__`collapse`:__
---
---```
---
--- aap
--- noot mies
---
--- zus wim jet
---zus wim jet
--- zus wim jet
---
---```
---
---__`collapse all`:__
---
---```
--- aap noot mies zus wim jet zus wim jet zus wim jet
---```
---
---__`prune`:__
---
---```
---aap
---noot mies
---
---zus    wim jet
---zus    wim jet
---zus    wim jet
---```
---
---__`prune and collapse`:__
---
---```
---aap
---noot mies
---
---zus    wim jet
---zus    wim jet
---zus    wim jet
---```
---
---__`prune and no empty`:__
---
---```
---aap
---noot mies
---zus    wim jet
---zus    wim jet
---zus    wim jet
---```
---
---__`prune and to space`:__
---
---```
---aap noot mies zus wim jet zus wim jet zus wim jet
---```
---
---__`retain`:__
---
---```
---
---aap
---noot mies
---
---zus    wim jet
---zus    wim jet
---zus    wim jet
---
---```
---
---__`retain and collapse`:__
---
---```
---
---aap
---noot mies
---
---zus    wim jet
---zus    wim jet
---zus    wim jet
---
---```
---
---__`retain and no empty`:__
---
---```
---
---aap
---noot mies
---zus    wim jet
---zus    wim jet
---zus    wim jet
---
---```
---
---__Reference:__
---
---* Context Lua Documents, July 8, 2023: [page 90-94](https://www.pragma-ade.nl/general/manuals/cld-mkiv.pdf)
---* Corresponding Lua source code: [lualibs-util-str.lua#L323](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L323)
---
---@see utilities.strings.striplines
---@deprecated use `utilities.strings.striplines`
---
---@param text string
---@param how StriplinePattern
---
---@return string text
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.strings.striplong(text, how) end

---
---__Example:__
---
---```lua
---assert(
---  utilities.strings.collapse(" line1\n\nline2\nline3") == "line1 line2 line3"
---)
---assert(
---  utilities.strings.collapse("\nline1\n\nline2\nline3") == "line1 line2 line3"
---)
---assert(
---  utilities.strings.collapse("\rline1\n\nline2\nline3") == "line1 line2 line3"
---)
---assert(
---  utilities.strings.collapse("\tline1\n\nline2\nline3") == "line1 line2 line3"
---)
---assert(
---  utilities.strings.collapse("line1\n\nline2\nline3") == "line1\n\nline2\nline3"
---)
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L314-L316](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L314-L316)
---
---@param text string
---
---@return string text
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.strings.collapse(text) end

---
---__Example:__
---
---```lua
---assert(utilities.strings.nice("colon:::colon") == "colon colon")
---assert(utilities.strings.nice("minus---minus") == "minus minus")
---assert(utilities.strings.nice("plus+++plus") == "plus plus")
---assert(
---  utilities.strings.nice("underscore___underscore") == "underscore underscore"
---)
----- assert(utilities.strings.nice("percent%%%percent") == "percent percent") ?
---```
---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L354-L357](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L354-L357)
---
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.strings.nice(text) end

---
---__Reference:__
---
---* Corresponding Lua source code: [lualibs-util-str.lua#L1488-L1502](https://github.com/latex3/lualibs/blob/a86c5cdf063692ff7d31da439bddd88c1a3ec0c9/lualibs-util-str.lua#L1488-L1502)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.strings.newcollector() end

-- https://github.com/latex3/lualibs/blob/main/lualibs-util-tpl.lua
utilities.templates = {}

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.templates.load(filename, mapping, how, recurse) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.templates.replace(str, mapping, how, recurse) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.templates.replacer(str, how, recurse) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/utilities.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function utilities.templates.resolve(t, mapping, how, recurse) end
