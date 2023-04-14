---@meta

---
---https://github.com/latex3/lualibs/blob/main/lualibs-util-zip.lua

gzip = {}

---
---* Corresponding Lua source code: [lualibs-util-zip.lua#L536-L540](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-zip.lua#L536-L540)
---
function gzip.suffix(filename) end

---
---* Corresponding Lua source code: [lualibs-util-zip.lua#L542-L544](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-zip.lua#L542-L544)
---
function gzip.compressed(s) end

---
---* Corresponding Lua source code: [lualibs-util-zip.lua#L634-L648](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-zip.lua#L634-L648)
---
function gzip.load(filename) end

---
---* Corresponding Lua source code: [lualibs-util-zip.lua#L650-L661](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-zip.lua#L650-L661)
---
function gzip.save(filename, data, level, originalname) end

---
---* Corresponding Lua source code: [lualibs-util-zip.lua#L663-L674](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-zip.lua#L663-L674)
---
function gzip.compress(s, level) end

---
---* Corresponding Lua source code: [lualibs-util-zip.lua#L676-L682](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-zip.lua#L676-L682)
---
function gzip.decompress(s) end
