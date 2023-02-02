---@meta
mplib = {}

_N._11_2_The_mplib_library = 0
_N._11_2_1_new = 0
_N._11_2_2_statistics = 0
_N._11_2_3_execute = 0
_N._11_2_4_finish = 0
_N._11_2_5_Result_table = 0
_N._11_2_5_1_fill = 0
_N._11_2_5_2_outline = 0
_N._11_2_5_3_text = 0
_N._11_2_5_4_special = 0
_N._11_2_5_6_stop_bounds_stop_clip = 0
_N._11_2_6_Subsidiary_table_formats = 0
_N._11_2_6_1_Paths_and_pens = 0
_N._11_2_6_2_Colors = 0
_N._11_2_6_3_Transforms = 0
_N._11_2_6_4_Dashes = 0
_N._11_2_7_Pens_and_pen_info = 0
_N._11_2_8_Character_size_information = 0
_N._11_2_8_1_char_width = 0
_N._11_2_8_2_char_height = 0
_N._11_2_8_3_char_depth = 0
_N._11_2_8_4_get_boolean_numeric_string_path = 0

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
