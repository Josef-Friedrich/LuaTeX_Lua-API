---@meta

---
---The `vf` library can be used when *Lua* code, as defined in the `commands` of the font, is executed. The functions provided are similar as the
---commands: `char`, `down`, `fontid`, `image`, `node`, `nop`, `pop`, `push`, `right`, `rule`, `special` and `pdf`. This library has been present for a while but not been
---advertised and tested much, if only because it's easy to define an invalid font
---(or mess up the *PDF* stream). Keep in mind that the *Lua* snippets are executed
---each time when a character is output.
vf = {}

---
---Typeset a character from the current font, and move right by the character’s width.
---
---* Corresponding C source code: [lfontlib.c#L327-L352](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L327-L352)
---
---@param n integer
function vf.char(n) end

---
---move down on the page
---
---* Corresponding C source code: [lfontlib.c#L354-L367](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L354-L367)
function vf.down() end

---
---* Corresponding C source code: [lfontlib.c#L369-L376](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L369-L376)
function vf.fontid() end

---
---output an image (the argument can be either an `image` variable or an `image_spec` table)
---
---* Corresponding C source code: [lfontlib.c#L378-L387](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L378-L387)
function vf.image() end

---
---output this node (list), and move right by the width of
---this list
---
---* Corresponding C source code: [lfontlib.c#L389-L398](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L389-L398)
function vf.node() end

---
---do nothing
---
---* Corresponding C source code: [lfontlib.c#L400-L406](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L400-L406)
function vf.nop() end

---
---pop position
---
---* Corresponding C source code: [lfontlib.c#L408-L420](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L408-L420)
function vf.pop() end

---
---save current position
---
---* Corresponding C source code: [lfontlib.c#L422-L435](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L422-L435)
function vf.push() end

---
---move right on the page.
---
---* Corresponding C source code: [lfontlib.c#L437-L453](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L437-L453)
function vf.right() end

---
---output a rule ht∗wd, and move right.
---
---* Corresponding C source code: [lfontlib.c#L455-L475](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L455-L475)
---
---@param height integer
---@param width integer
function vf.rule(height, width) end

---
---output a `\special` command
---
---* Corresponding C source code: [lfontlib.c#L477-L489](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L477-L489)
function vf.special() end

---
---output a pdf literal, the first string is one of `origin`,
---`page`, `text`, `font`, `direct` or `raw`; if you have one string
---only `origin` is assumed
---
---* Corresponding C source code: [lfontlib.c#L491-L499](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lfontlib.c#L491-L499)
function vf.pdf() end
