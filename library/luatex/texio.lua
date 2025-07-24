---
---Copyright (C) 2022-2025 by Josef Friedrich <josef@friedrich.rocks>
------------------------------------------------------------------------
---
---This program is free software: you can redistribute it and/or modify it
---under the terms of the GNU General Public License as published by the
---Free Software Foundation, either version 2 of the License, or (at your
---option) any later version.
---
---This program is distributed in the hope that it will be useful, but
---WITHOUT ANY WARRANTY; without even the implied warranty of
---MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
---Public License for more details.
---
---You should have received a copy of the GNU General Public License along
---with this program. If not, see <https://www.gnu.org/licenses/>.
---@meta

---
---The `texio` library takes care of the low-level I/O interface: writing to the log file
---and/or console.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---__Reference:__
---
---* Corresponding C source code: [ltexiolib.c#L119-L126](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L119-L126)
---
---@param target WriteTarget
---@param ... string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.write(target, ...) end

---
---Write all given strings to the same
---location(s) *TeX* writes messages to at this moment.
---
---If `batchmode` is in
---effect, it writes only to the log, otherwise it writes to the log and the
---terminal.
---
---__Reference:__
---
---* Corresponding C source code: [ltexiolib.c#L119-L126](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L119-L126)
---
---@param ... string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.write(...) end

_N._10_5_2_write_nl = "page 214"

---
---Write all given strings to a target.
---
---It makes sure that the given
---strings will appear at the beginning of a new line.
---
---__Reference:__
---
---* Corresponding C source code: [ltexiolib.c#L128-L135](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L128-L135)
---
---@param target WriteTarget
---@param ... string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---__Reference:__
---
---* Corresponding C source code: [ltexiolib.c#L128-L135](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L128-L135)
---
---@param ... string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.write_nl(...) end

_N._10_5_3_setescape = "page 215"

---
---Disable `^^` escaping of control characters.
---
---__Reference:__
---
---* Corresponding C source code: [ltexiolib.c#L148-L156](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L148-L156)
---
---@param escape_controls boolean
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---__Reference:__
---
---* Corresponding C source code: [ltexiolib.c#L158-L171](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexiolib.c#L158-L171)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/texio.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function texio.closeinput() end
