---@meta

---
---https://github.com/latex3/lualibs/blob/main/lualibs-os.lua

os = {}

---
---* Corresponding Lua source code: [lualibs-os.lua#L134-L144](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L134-L144)
---
function os.setenv(k, v) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L146-L154](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L146-L154)
---
function os.getenv(k) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L236-L238](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L236-L238)
---
function os.pipeto(command) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L246-L251](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L246-L251)
---
function os.launch(str) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L262-L264](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L262-L264)
---
function os.runtime() end

---
---* Corresponding Lua source code: [lualibs-os.lua#L423-L431](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L423-L431)
---
function os.uuid() end

---
---* Corresponding Lua source code: [lualibs-os.lua#L453-L469](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L453-L469)
---
function os.timezone(difference) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L478-L492](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L478-L492)
---
function os.fulltime(t, default) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L500-L514](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L500-L514)
---
function os.localtime(t, default) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L516-L523](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L516-L523)
---
function os.converttime(t, default) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L527-L529](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L527-L529)
---
function os.today() end

---
---* Corresponding Lua source code: [lualibs-os.lua#L533-L535](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L533-L535)
---
function os.now() end

---
---* Corresponding Lua source code: [lualibs-os.lua#L543-L564](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L543-L564)
---
function os.which(filename) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L580-L587](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L580-L587)
---
function os.sleep() end

---
---* Corresponding Lua source code: [lualibs-os.lua#L595-L599](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L595-L599)
---
function os.isleapyear(year) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L619-L633](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L619-L633)
---
function os.nofdays(year, month, day) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L637-L639](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L637-L639)
---
function os.weekday(day, month, year) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L641-L658](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L641-L658)
---
function os.validdate(year, month, day) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L660-L666](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L660-L666)
---
function os.date(fmt) end

---
---* Corresponding Lua source code: [lualibs-os.lua#L679-L687](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L679-L687)
---
function os.setexitcode(code) end

function os.exit(c) end
function os.gettimeofday() end
function os.resultof(command) end
