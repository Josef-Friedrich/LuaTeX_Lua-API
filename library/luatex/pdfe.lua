---@meta

pdfe = {}

_N._14_2_The_pdfe_library = 0
_N._14_2_1_Introduction = 0
_N._14_2_2_open_new_getstatus_close_unencrypt = 0

---
---* Corresponding C source code: [lpdfelib.c#L834-L851](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L834-L851)
function pdfe.open() end

---
---* Corresponding C source code: [lpdfelib.c#L853-L917](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L853-L917)
function pdfe.new() end

---
---* Corresponding C source code: [lpdfelib.c#L1031-L1038](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1031-L1038)
function pdfe.getstatus() end

---
---* Corresponding C source code: [lpdfelib.c#L945-L948](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L945-L948)
function pdfe.close() end

---
---* Corresponding C source code: [lpdfelib.c#L963-L991](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L963-L991)
function pdfe.unencrypt() end

_N._14_2_3_getsize_getversion_getnofobjects_getnofpages_getmemoryusage = 0

---
---* Corresponding C source code: [lpdfelib.c#L1008-L1015](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1008-L1015)
function pdfe.getsize() end

---
---* Corresponding C source code: [lpdfelib.c#L1017-L1029](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1017-L1029)
function pdfe.getversion() end

---
---* Corresponding C source code: [lpdfelib.c#L1040-L1047](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1040-L1047)
function pdfe.getnofobjects() end

---
---* Corresponding C source code: [lpdfelib.c#L1049-L1056](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1049-L1056)
function pdfe.getnofpages() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getmemoryusage() end

_N._14_2_4_get_catalog_trailer_info = 0

---
---* Corresponding C source code: [lpdfelib.c#L465-L471](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L465-L471)
function pdfe.getcatalog() end

---
---* Corresponding C source code: [lpdfelib.c#L473-L479](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L473-L479)
function pdfe.gettrailer() end

---
---* Corresponding C source code: [lpdfelib.c#L481-L487](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L481-L487)
function pdfe.getinfo() end

_N._14_2_5_getpage_getbox = 0

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getpage() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getbox() end

_N._14_2_6_get_string_integer_number_boolean_name_type = 0

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getstring() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getinteger() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getnumber() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getboolean() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getname() end

---
---* Corresponding C source code: [lpdfelib.c#L224-L235](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L224-L235)
function pdfe.type() end

_N._14_2_7_get_dictionary_array_stream = 0

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getdictionary() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getarray() end

---
---* Corresponding C source code: [lpdfelib.c#L544-L570](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L544-L570)
function pdfe.getfromstream() end

_N._14_2_8_open_close_readfrom_whole_stream = 0

---
---* Corresponding C source code: [lpdfelib.c#L764-L778](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L764-L778)
function pdfe.openstream() end

---
---* Corresponding C source code: [lpdfelib.c#L780-L791](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L780-L791)
function pdfe.closestream() end

---
---* Corresponding C source code: [lpdfelib.c#L793-L812](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L793-L812)
function pdfe.readfromstream() end

---
---* Corresponding C source code: [lpdfelib.c#L728-L750](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L728-L750)
function pdfe.readwholestream() end

_N._14_2_9_getfrom_dictionary_array = 0

---
---* Corresponding C source code: [lpdfelib.c#L517-L542](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L517-L542)
function pdfe.getfromdictionary() end

---
---* Corresponding C source code: [lpdfelib.c#L501-L515](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lpdfelib.c#L501-L515)
function pdfe.getfromarray() end

_N._14_2_10_dictionary_array_totable = 0

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.arraytotable() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.dictionarytotable() end

_N._14_2_11_getfromreference = 0

--
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getfromreference() end

_N._14_3_Memory_streams = 0

---
------------------------------------------------------------------------
---Undocumented functions listed in alphabetical order
---
---Document them by sliding them up and place them in the order of the
---official documentation
------------------------------------------------------------------------

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getpages() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.getstream() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdfe.pagestotable() end
