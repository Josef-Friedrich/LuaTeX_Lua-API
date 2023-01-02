---@meta

---https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2091

---The token library provides means to intercept the input and deal with it at the
---Lua level. The library provides a basic scanner infrastructure that can be used
---to write macros that accept a wide range of arguments. This interface is on
---purpose kept general and as performance is quite ok. One can build additional
---parsers without too much overhead. It's up to macro package writers to see how
---they can benefit from this as the main principle behind LuaTeX is to provide a
---minimal set of tools and no solutions. The scanner functions are probably the
---most intriguing.
token = {}

---https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2285

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
---The scanners look for a sequence. When you want to pick up one token from the
---input you use `get_next`. This creates a token with the (low level)
---properties.
---
---@return Token
function token.get_next() end

---https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2422

---
---There is a (for now) experimental putter.
---
---@param ... Token
function token.put_next(...) end

---https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L2368

---
---@param csname string
---@param content? string
---@param global? 'global'
function token.set_macro(csname, content, global) end

---
---The `set_macro` function can get upto 4 arguments.
---You can pass a catcodetable identifier as first argument.
---
---@param catcodetable any
---@param csname string
---@param content? string
---@param global? 'global'
function token.set_macro(catcodetable, csname, content, global) end
