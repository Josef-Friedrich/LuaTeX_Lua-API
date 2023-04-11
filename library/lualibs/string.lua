---@meta
---https://github.com/latex3/lualibs/blob/main/lualibs-util-str.lua
---https://github.com/latex3/lualibs/blob/main/lualibs-lpeg.lua

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L426-L438](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L426-L438)
---
function string.autodouble(s, sep) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L440-L452](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L440-L452)
---
function string.autosingle(s, sep) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L467-L475](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L467-L475)
---
function string.tracedchar(b) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L648-L650](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L648-L650)
---
function string.escapedquotes(s) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L659-L661](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L659-L661)
---
function string.unescapedquotes(s) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L1471-L1473](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L1471-L1473)
---
function string.optionalquoted(str) end

---
---* Corresponding Lua source code: [lualibs-util-str.lua#L1477-L1479](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-str.lua#L1477-L1479)
---
function string.replacenewlines(str) end

function string.booleanstring(str) end
function string.checkedsplit(str, separator) end
function string.collapsespaces(str) end
function string.containsws(str, what) end
function string.count(str, pattern) end
function string.escapedpattern(str, simple) end
function string.formatter(str) end
function string.fullstrip(str) end
function string.is_boolean(str, default, strict) end
function string.is_empty(str) end
function string.itself(s) end
function string.limit(str, n, sentinel) end
function string.longtostring(str) end
function string.nospaces(str) end
function string.quote(str) end
function string.quoted(str) end
function string.split(str, separator) end
function string.splitlines(str) end
function string.splitup(str, separator) end
function string.strip(str) end
function string.texnewlines(str) end
function string.tformat(fmt) end
function string.toHEX(s) end
function string.toboolean(str, tolerant) end
function string.tobytes(s) end
function string.todec(s) end
function string.todimen(str) end
function string.tohex(s) end
function string.topattern(str, lowercase, strict) end
function string.totable(str, bytes) end
function string.toutf(s) end
function string.unquote(str) end
function string.unquoted(str) end
function string.utflength() end
function string.utfpadd(s, n) end
function string.utfpadding(s, n) end
function string.valid(str, default) end
function string.wordsplitter(s) end
