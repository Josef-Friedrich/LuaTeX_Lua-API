---@meta
---
number = {}

---
---https://github.com/latex3/lualibs/blob/main/lualibs-number.lua
---https://github.com/latex3/lualibs/blob/main/lualibs-util-dim.lua
---https://github.com/latex3/lualibs/blob/main/lualibs-util-str.lua

---
---* Corresponding Lua source code: [lualibs-number.lua#L25-L99](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-number.lua#L25-L99)
---
function number.tobitstring(b, m, w) end

---
---* Corresponding Lua source code: [ualibs-number.lua#L101-L103](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-number.lua#L101-L103)
---
function number.valid(str, default) end

---
---* Corresponding Lua source code: [lualibs-number.lua#L105-L112](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-number.lua#L105-L112)
---
function number.toevenhex(n) end

---
---* Corresponding Lua source code: [lualibs-number.lua#L169-L178](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-number.lua#L169-L178)
---
function number.bytetodecimal(b) end

---
---* Corresponding Lua source code: [lualibs-number.lua#L180-L189](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-number.lua#L180-L189)
---
function number.decimaltobyte(d) end

---
---* Corresponding Lua source code: [lualibs-number.lua#L191-L193](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-number.lua#L191-L193)
---
function number.idiv(i, d) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L34](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L34)
---
function number.tonumberf(n) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L35](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L35)
---
function number.tonumberg(n) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L97-L111](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L97-L111)
---
function number.todimen(n, unit, fmt) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L121](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L121)
---
function number.topoints(n, fmt) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L122](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L122)
---
function number.toinches(n, fmt) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L123](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L123)
---
function number.tocentimeters(n, fmt) end

---
---* Corresponding Lua source code: [](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L124)
---
function number.tomillimeters(n, fmt) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L125-L126](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L125-L126)
---
function number.toscaledpoints(n) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L127](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L127)
---
function number.tobasepoints(n, fmt) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L128](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L128)
---
function number.topicas(n, fmt) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L129](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L129)
---
function number.todidots(n, fmt) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L130](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L130)
---
function number.tociceros(n, fmt) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L151-L153](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L151-L153)
---
function number.splitdimen(str) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L435-L437](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L435-L437)
---
function number.toscaled(d) end

---
---* Corresponding Lua source code: [lualibs-util-dim.lua#L448-L454](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-util-dim.lua#L448-L454)
---
function number.percent(n, d) end

function number.basepoints(n) end
function number.compactfloat(n, fmt) end
function number.formatted(n, sep1, sep2) end
function number.formattedfloat(n, b, a) end
function number.nubasepoints(n) end
function number.nupoints(n) end

function number.points(n) end
function number.signed(i) end
function number.sparseexponent(f, n) end

function number.to16dot16(n) end
