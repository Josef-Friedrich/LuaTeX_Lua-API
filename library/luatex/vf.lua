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
---Move down on the page.
---
---@param down integer
---
---* Corresponding C source code: [lfontlib.c#L354-L367](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L354-L367)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.down(down) end

---
---* Corresponding C source code: [lfontlib.c#L369-L376](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L369-L376)
---
---@param fontid integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.fontid(fontid) end

---
---Output an image (the argument can be either an `image` variable or an `image_spec` table)
---
---* Corresponding C source code: [lfontlib.c#L378-L387](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L378-L387)
---
---@param image Image|ImageSpec
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.image(image) end

---
---Output this node (list), and move right by the width of
---this list.
---
---* Corresponding C source code: [lfontlib.c#L389-L398](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L389-L398)
---
---@param list Node
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.node(list) end

---
---Do nothing.
---
---* Corresponding C source code: [lfontlib.c#L400-L406](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L400-L406)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.nop() end

---
---Pop position.
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
---Move right on the page.
---
---@param right integer
---
---* Corresponding C source code: [lfontlib.c#L437-L453](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L437-L453)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.right(right) end

---
---Output a rule (height * width) and move right.
---
---* Corresponding C source code: [lfontlib.c#L455-L475](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L455-L475)
---
---@param height integer
---@param width integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.rule(height, width) end

---
---Output a `\special` command.
---
---@param special string
---
---* Corresponding C source code: [lfontlib.c#L477-L489](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L477-L489)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.special(special) end

---
---Output a pdf literal.
---
---The first string is one of `origin`,
---`page`, `text`, `font`, `direct` or `raw`
---
---* Corresponding C source code: [lfontlib.c#L491-L499](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L491-L499)
---* Corresponding C source code: [lpdflib.c#L25-L87](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L25-L87)
---
---@param mode `origin`|`page`|`text`|`font`|`direct`|`raw`
---@param general_text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.pdf(mode, general_text) end

---
---Output a pdf literal.
---
---If you have one string
---only `origin` is assumed.
---
---* Corresponding C source code: [lfontlib.c#L491-L499](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lfontlib.c#L491-L499)
---* Corresponding C source code: [lpdflib.c#L25-L87](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L25-L87)
---
---@param general_text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/vf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function vf.pdf(general_text) end
