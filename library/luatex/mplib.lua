---@meta
mplib = {}

---
---* Corresponding C source code: [lmplib.c#L532-L627](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L532-L627)
function mplib.new() end

---
---* Corresponding C source code: [lmplib.c#L771-L792](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L771-L792)
function mplib.statistics() end

---
---* Corresponding C source code: [lmplib.c#L692-L711](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L692-L711)
function mplib.execute() end

---
---* Corresponding C source code: [lmplib.c#L713-L728](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L713-L728)
function mplib.finish() end

---
---Get the list of accessible values for a particular object
---
---* Corresponding C source code: [lmplib.c#L1548-L1591](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L1548-L1591)
function mplib.fields(obj) end

---
---* Corresponding C source code: [lmplib.c#L1474-L1539](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L1474-L1539)
function mplib.pen_info() end

---
---* Corresponding C source code: [lmplib.c#L748-L751](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L748-L751)
function mplib.char_width() end

---
---* Corresponding C source code: [lmplib.c#L758-L761](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L758-L761)
function mplib.char_height() end

---
---* Corresponding C source code: [lmplib.c#L753-L756](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L753-L756)
function mplib.char_depth() end

---
---* Corresponding C source code: [lmplib.c#L497-L510](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L497-L510)
function mplib.get_boolean() end

---
---Not documented alias for get_numeric
---function mplib.get_number() end

---
---* Corresponding C source code: [lmplib.c#L482-L495](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L482-L495)
function mplib.get_numeric() end

---
---* Corresponding C source code: [lmplib.c#L512-L528](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L512-L528)
function mplib.get_string() end

---
---* Corresponding C source code: [lmplib.c#L1649-L1693](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L1649-L1693)
function mplib.get_path() end

---
---* Corresponding C source code: [lmplib.c#L763-L769](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L763-L769)
---
---@return string version # for example `2.02`
function mplib.version() end

---
---* Corresponding C source code: [lmplib.c#L978-L1195](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/mplibdir/lmplib.c#L978-L1195)
function mplib.solve_path() end
