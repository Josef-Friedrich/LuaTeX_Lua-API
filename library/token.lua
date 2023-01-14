---@meta

---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

---
---The token library provides means to intercept the input and deal with it at the
---Lua level. The library provides a basic scanner infrastructure that can be used
---to write macros that accept a wide range of arguments. This interface is on
---purpose kept general and as performance is quite ok. One can build additional
---parsers without too much overhead. It's up to macro package writers to see how
---they can benefit from this as the main principle behind LuaTeX is to provide a
---minimal set of tools and no solutions. The scanner functions are probably the
---most intriguing.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2091-L2098](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2091-L2098)
---
token = {}

---10.6 The token library
_N._1_scanner = 215

---
---returns true if the given keyword is gobbled; as with the regular *TeX* keyword scanner this is case insensitive (and ASCII based)
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L304-L318](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L304-L318)
---
---@param keyword string
function token.scan_keyword(keyword) end

---
---returns true if the given keyword is gobbled; this variant is case sensitive and also suitable for *UTF-8*
--
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L320-L334](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L320-L334)
---
---@param keyword string
function token.scan_keyword_cs(keyword) end

---
---returns an integer
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L356-L366](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L356-L366)
---
---@return integer
function token.scan_int() end

---
---returns a number from e.g. `1`,  `1.1`, `.1` with optional collapsed signs
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L495-L498](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L495-L498)
---
---@return number
function token.scan_real() end

---
---returns a number from e.g. `1`,  `1.1`, `.1`, `1.1E10`, `.1e-10` with optional collapsed signs
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L490-L493](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L490-L493)
---
---@return number
function token.scan_float() end

---
---returns a number representing a dimension and or two numbers being the filler and order
---
---__Example:__
---
---Parameter `inf`:
---
---```tex
---\directlua{token.scan_dimen(true)}1fi % 1
---\directlua{token.scan_dimen(true)}1fil % 2
---\directlua{token.scan_dimen(true)}1fill % 3
---\directlua{token.scan_dimen(true)}1filll % 4
---
---```
---
---Parameter `mu`:
---
---```tex
---\directlua{token.scan_dimen(false, true)}1mu % 65536
---\directlua{token.scan_dimen(false, true)}1cm % Illegal unit of measure (mu inserted).
---```
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L500-L522](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L500-L522)
---
---@param inf? boolean # inf values allowed
---@param mu? boolean # mu (math units) units required
---
---@return integer
function token.scan_dimen(inf, mu) end

---
---returns a glue spec node
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L524-L538](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L524-L538)
---
function token.scan_glue(mu_units) end

---
---returns a table of tokens tokens
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L540-L567](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L540-L567)
---
function token.scan_toks(definer, expand) end

---
---returns a character if its category is in the given bitset (representing catcodes)
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L695-L721](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L695-L721)
---
function token.scan_code(bitset) end

---
---returns a string given between `{` `}`, as `\macro` or as sequence of characters with catcode 11 or 12
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L569-L606](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L569-L606)
---
function token.scan_string() end

---
---this one is simular to `scanstring` but also accepts a `\cs`
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L608-L667](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L608-L667)
---
function token.scan_argument(boolean) end

---
---returns a sequence of characters with catcode 11 or 12 as string
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L669-L693](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L669-L693)
---
function token.scan_word() end

---
---returns `foo` after scanning `\foo`
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L336-L354](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L336-L354)
---
function token.scan_csname() end

---
---picks up a box specification and returns a `[h|v]list` node
function token.scan_list() end

_N._1_picking_one_token = 218

---
---The scanners look for a sequence. When you want to pick up one token from the
---input you use `get_next`. This creates a token with the (low level)
---properties. This token is just the next one.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2237-L2239](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2237-L2239)
---
---@return Token
function token.get_next() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_token() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.expand() end

_N._3_creating = 218

---
---A token object has the properties of the `relax`
---primitive. The possible properties of tokens are:
---
---Alternatively you can use a getter `get_<fieldname>` to access a property
---of a token.
---
---The numbers that represent a catcode are the same as in *TeX* itself, so using
---this information assumes that you know a bit about *TeX*'s internals. The other
---numbers and names are used consistently but are not frozen. So, when you use them
---for comparing you can best query a known primitive or character first to see the
---values.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2285-L2310](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2285-L2310)
---
---@class Token
---@field command integer # a number representing the internal command number
---@field cmdname any # the type of the command (for instance the catcode in case of a character or the classifier that determines the internal treatment
---@field csname string # the associated control sequence (if applicable)
---@field id integer # the unique id of the token
---@field tok integer # the full token number as stored in TeX
---@field active boolean # a boolean indicating the active state of the token
---@field expandable boolean # a boolean indicating if the token (macro) is expandable
---@field public protected boolean # a boolean indicating if the token (macro) is protected
---@field mode integer|any # a number either representing a character or another entity
---@field index integer # a number running from 0x0000 upto 0xFFFF indicating a TeX register index

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_active() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_cmdname() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_command() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_csname() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_expandable() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_id() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_index() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_macro() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_meaning() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_mode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_protected() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.get_tok() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.commands() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.command_id() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.create() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.new() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.is_defined() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.biggest_char() end

_N._4_macros = 219

---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2368-L2382](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2368-L2382)
---
---@param csname string
---@param content? string
---@param global? 'global'
function token.set_macro(csname, content, global) end

---
---The `set_macro` function can get upto 4 arguments.
---You can pass a catcodetable identifier as first argument.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2368-L2382](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2368-L2382)
---
---@param catcodetable any
---@param csname string
---@param content? string
---@param global? 'global'
function token.set_macro(catcodetable, csname, content, global) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.set_char() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.set_lua() end

_N._5_pushing_back = 220

---
---There is a (for now) experimental putter.
---
---@param ... Token
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2422-L2433](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2422-L2433)
---
function token.put_next(...) end

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
function token.is_token() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.type() end
