---@meta

---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

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
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_keyword() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_keyword_cs() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_int() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_real() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_float() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_dimen() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_glue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_toks() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_code() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_string() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_argument() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_word() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function token.scan_csname() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
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
function token.get_next() end

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
