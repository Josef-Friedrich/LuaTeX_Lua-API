---@meta

---
---https://github.com/latex3/lualibs/blob/main/lualibs-io.lua
io = {}

---
---* Corresponding Lua source code: [lualibs-io.lua#L56-L65](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L56-L65)
---
function io.readall(f) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L69-L82](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L69-L82)
---
function io.loaddata(filename, textmode) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L126-L148](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L126-L148)
---
function io.copydata(source, target, action) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L150-L169](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L150-L169)
---
function io.savedata(filename, data, joiner, append) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L179-L235](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L179-L235)
---
function io.loadlines(filename, n) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L239-L248](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L239-L248)
---
function io.loadchunk(filename, n) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L250-L258](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L250-L258)
---
function io.exists(filename) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L260-L269](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L260-L269)
---
function io.size(filename) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L271-L290](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L271-L290)
---
function io.noflines(f) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L317-L321](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L317-L321)
---
function io.characters(f, n) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L368-L374](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L368-L374)
---
function io.bytes(f, n) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L376-L408](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L376-L408)
---
function io.ask(question, default, options) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L410-L448](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L410-L448)
---
function io.readnumber(f, n, m) end

---
---* Corresponding Lua source code: [lualibs-io.lua#L452-L459](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-io.lua#L452-L459)
---
function io.readstring(f, n, m) end
