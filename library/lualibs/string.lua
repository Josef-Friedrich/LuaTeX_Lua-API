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

---
---* Corresponding Lua source code: [lualibs-string.lua#L40-L42](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L40-L42)
---
function string.unquoted(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L51-L53](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L51-L53)
---
function string.quoted(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L222](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L222)
---
---@deprecated
function string.quote(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L223](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L223)
---
---@deprecated
function string.unquote(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L55-L61](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L55-L61)
---
function string.count(str, pattern) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L63-L70](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L63-L70)
---
function string.limit(str, n, sentinel) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L78-L80](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L78-L80)
---
function string.strip(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L82-L84](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L82-L84)
---
function string.fullstrip(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L86-L88](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L86-L88)
---
function string.collapsespaces(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L90-L92](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L90-L92)
---
function string.nospaces(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L94-L96](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L94-L96)
---
function string.longtostring(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L106-L112](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L106-L112)
---
function string.is_empty(str) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L168-L170](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L168-L170)
---
function string.escapedpattern(str, simple) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L172-L187](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L172-L187)
---
function string.topattern(str, lowercase, strict) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L195-L197](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L195-L197)
---
function string.valid(str, default) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L201](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L201)
---
function string.itself(s) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L208-L210](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L208-L210)
---
function string.totable(str, bytes) end

---
---* Corresponding Lua source code: [lualibs-string.lua#L216-L218](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-string.lua#L216-L218)
---
function string.tformat(fmt) end

function string.booleanstring(str) end
function string.checkedsplit(str, separator) end
function string.containsws(str, what) end
function string.formatter(str) end
function string.is_boolean(str, default, strict) end
function string.split(str, separator) end
function string.splitlines(str) end
function string.splitup(str, separator) end
function string.texnewlines(str) end
function string.toboolean(str, tolerant) end
function string.tobytes(s) end
function string.todec(s) end
function string.todimen(str) end
function string.tohex(s) end
function string.toHEX(s) end
function string.toutf(s) end
function string.utflength() end
function string.utfpadd(s, n) end
function string.utfpadding(s, n) end
function string.wordsplitter(s) end
