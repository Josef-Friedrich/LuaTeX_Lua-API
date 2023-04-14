---@meta

_N._6_4_the_vf_library = "page 97"

---
---The `vf` library can be used when *Lua* code, as defined in the `commands` of the font, is executed. The functions provided are similar as the
---commands: `char`, `down`, `fontid`, `image`, `node`, `nop`, `pop`, `push`, `right`, `rule`, `special` and `pdf`. This library has been present for a while but not been
---advertised and tested much, if only because it's easy to define an invalid font
---(or mess up the *PDF* stream). Keep in mind that the *Lua* snippets are executed
---each time when a character is output.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
vf = {}

---
---Typeset a character from the current font, and move right by the character’s width.
---
---* Corresponding C source code: [lfontlib.c#L327-L352](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L327-L352)
---
---@param n integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.char(n) end

---
---move down on the page
---
---* Corresponding C source code: [lfontlib.c#L354-L367](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L354-L367)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.down() end

---
---* Corresponding C source code: [lfontlib.c#L369-L376](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L369-L376)
---
---@param fontid integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.fontid(fontid) end

---
---output an image (the argument can be either an `image` variable or an `image_spec` table)
---
---* Corresponding C source code: [lfontlib.c#L378-L387](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L378-L387)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.image() end

---
---Output this node (list), and move right by the width of
---this list.
---
---* Corresponding C source code: [lfontlib.c#L389-L398](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L389-L398)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.node() end

---
---do nothing
---
---* Corresponding C source code: [lfontlib.c#L400-L406](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L400-L406)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.nop() end

---
---pop position
---
---* Corresponding C source code: [lfontlib.c#L408-L420](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L408-L420)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.pop() end

---
---Save the current position.
---
---* Corresponding C source code: [lfontlib.c#L422-L435](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L422-L435)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.push() end

---
---move right on the page.
---
---* Corresponding C source code: [lfontlib.c#L437-L453](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L437-L453)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.right() end

---
---output a rule ht∗wd, and move right.
---
---* Corresponding C source code: [lfontlib.c#L455-L475](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L455-L475)
---
---@param height integer
---@param width integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.rule(height, width) end

---
---output a `\special` command
---
---* Corresponding C source code: [lfontlib.c#L477-L489](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L477-L489)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.special() end

---
---output a pdf literal, the first string is one of `origin`,
---`page`, `text`, `font`, `direct` or `raw`; if you have one string
---only `origin` is assumed
---
---* Corresponding C source code: [lfontlib.c#L491-L499](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L491-L499)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.pdf() end
