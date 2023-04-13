---@meta

---
---The `texio` library takes care of the low-level I/O interface: writing to the log file
---and/or console.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
texio = {}

_N._10_5_the_texio_library = "page 214"
_N._10_5_1_write = "page 214"

---
---The optional `target` can be one of three possibilities: `term`, `log` or `term and log`.
---@alias WriteTarget
---|'term'
---|'log'
---|'term and log'

---
---Write all given strings to a target.
---
---* Corresponding C source code: [ltexiolib.c#L119-L126](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L119-L126)
---
---@param target WriteTarget
---@param ... string
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.write(target, ...) end

---
---Write all given strings to the same
---location(s) *TeX* writes messages to at this moment.
---
---If `batchmode` is in
---effect, it writes only to the log, otherwise it writes to the log and the
---terminal.
---
---* Corresponding C source code: [ltexiolib.c#L119-L126](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L119-L126)
---
---@param ... string
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.write(...) end

_N._10_5_2_write_nl = "page 214"

---
---Write all given strings to a target.
---
---It makes sure that the given
---strings will appear at the beginning of a new line.
---
---* Corresponding C source code: [ltexiolib.c#L128-L135](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L128-L135)
---
---@param target WriteTarget
---@param ... string
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.write_nl(target, ...) end

---
---Write all given strings to the same
---location(s) *TeX* writes messages to at this moment. It makes sure that the given
---strings will appear at the beginning of a new line.
---
---Note: If several strings are given, and if the first of these strings is or might
---be one of the targets above, the `target` must be specified explicitly to
---prevent *Lua* from interpreting the first string as the target.
---
---* Corresponding C source code: [ltexiolib.c#L128-L135](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L128-L135)
---
---@param ... string
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.write_nl(...) end

_N._10_5_3_setescape = "page 215"

---
---Disable `^^` escaping of control characters.
---
---* Corresponding C source code: [ltexiolib.c#L148-L156](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L148-L156)
---
---@param escape_controls boolean
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.setescape(escape_controls) end

_N._10_5_4_closeinput = "page 215"

---
---Force a jump back to *TeX*.
---
---This function should be used with care. It acts as `endinput` but at
---the *Lua* end. Normally
---*Lua* will just collect prints and at the end bump an input level and flush these
---prints. This function can help you stay at the current level but you need to know
---what you're doing (or more precise: what *TeX* is doing with input).
---
---* Corresponding C source code: [ltexiolib.c#L158-L171](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L158-L171)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.closeinput() end
