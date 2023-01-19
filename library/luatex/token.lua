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
---Scan and gobble a given keyword.
---
---As with the regular *TeX* keyword scanner this is case insensitive (and ASCII based).
---
---__Example:__
---
---```latex
---\def\scanner{\directlua{
---  print(token.scan_keyword('keyword'))
---}}
---\scanner keyword % true
---\scanner KEYWORD % true
---\scanner not the keyword % false
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L304-L318](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L304-L318)
---
---@param keyword string # An ASCII based keyword to scan for.
---
---@return boolean # True if the keyword could be gobbled up otherwise false.
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
---* Corresponding C source code: [luatoken.c#L191-L349](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/luatoken.c#L191-L349)
---@alias TokenCommandName
---| 'relax'
---| 'left_brace'
---| 'right_brace'
---| 'math_shift'
---| 'tab_mark'
---| 'car_ret'
---| 'mac_param'
---| 'sup_mark'
---| 'sub_mark'
---| 'endv'
---| 'spacer'
---| 'letter'
---| 'other_char'
---| 'par_end'
---| 'stop'
---| 'delim_num'
---| 'char_num'
---| 'math_char_num'
---| 'mark'
---| 'node'
---| 'xray'
---| 'make_box'
---| 'hmove'
---| 'vmove'
---| 'un_hbox'
---| 'un_vbox'
---| 'remove_item'
---| 'hskip'
---| 'vskip'
---| 'mskip'
---| 'kern'
---| 'mkern'
---| 'leader_ship'
---| 'halign'
---| 'valign'
---| 'no_align'
---| 'vrule'
---| 'hrule'
---| 'novrule'
---| 'nohrule'
---| 'insert'
---| 'vadjust'
---| 'ignore_spaces'
---| 'after_assignment'
---| 'after_group'
---| 'partoken_name'
---| 'break_penalty'
---| 'start_par'
---| 'ital_corr'
---| 'accent'
---| 'math_accent'
---| 'discretionary'
---| 'eq_no'
---| 'left_right'
---| 'math_comp'
---| 'limit_switch'
---| 'above'
---| 'math_style'
---| 'math_choice'
---| 'non_script'
---| 'vcenter'
---| 'case_shift'
---| 'message'
---| 'normal'
---| 'extension'
---| 'option'
---| 'lua_function_call'
---| 'lua_bytecode_call'
---| 'lua_call'
---| 'in_stream'
---| 'begin_group'
---| 'end_group'
---| 'omit'
---| 'ex_space'
---| 'boundary'
---| 'radical'
---| 'super_sub_script'
---| 'no_super_sub_script'
---| 'math_shift_cs'
---| 'end_cs_name'
---| 'char_ghost'
---| 'assign_local_box'
---| 'char_given'
---| 'math_given'
---| 'xmath_given'
---| 'last_item'
---| 'toks_register'
---| 'assign_toks'
---| 'assign_int'
---| 'assign_attr'
---| 'assign_dimen'
---| 'assign_glue'
---| 'assign_mu_glue'
---| 'assign_font_dimen'
---| 'assign_font_int'
---| 'assign_hang_indent'
---| 'set_aux'
---| 'set_prev_graf'
---| 'set_page_dimen'
---| 'set_page_int'
---| 'set_box_dimen'
---| 'set_tex_shape'
---| 'set_etex_shape'
---| 'def_char_code'
---| 'def_del_code'
---| 'extdef_math_code'
---| 'extdef_del_code'
---| 'def_family'
---| 'set_math_param'
---| 'set_font'
---| 'def_font'
---| 'def_lua_call'
---| 'register'
---| 'assign_box_direction'
---| 'assign_box_dir'
---| 'assign_direction'
---| 'assign_dir'
---| 'combinetoks'
---| 'advance'
---| 'multiply'
---| 'divide'
---| 'prefix'
---| 'let'
---| 'shorthand_def'
---| 'read_to_cs'
---| 'def'
---| 'set_box'
---| 'hyph_data'
---| 'set_interaction'
---| 'letterspace_font'
---| 'expand_font'
---| 'copy_font'
---| 'set_font_id'
---| 'undefined_cs'
---| 'expand_after'
---| 'no_expand'
---| 'input'
---| 'lua_expandable_call'
---| 'lua_local_call'
---| 'if_test'
---| 'fi_or_else'
---| 'cs_name'
---| 'convert'
---| 'variable'
---| 'feedback'
---| 'the'
---| 'top_bot_mark'
---| 'call'
---| 'long_call'
---| 'outer_call'
---| 'long_outer_call'
---| 'end_template'
---| 'dont_expand'
---| 'glue_ref'
---| 'shape_ref'
---| 'box_ref'
---| 'data'

---
---A token object has the properties of the `relax`
---primitive.
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
---@field command integer # A number representing the internal command number, for example `147`.
---@field cmdname TokenCommandName # The type of the command (for instance the catcode in case of a character or the classifier that determines the internal treatment, for example `letter`.
---@field csname string|nil # The associated control sequence (if applicable), for example `bigskip`.
---@field id integer # The unique id of the token, for example `6876`.
---@field tok integer # The full token number as stored in TeX, for example `536883863`.
---@field active boolean # A boolean indicating the active state of the token, for example `true`.
---@field expandable boolean # A boolean indicating if the token (macro) is expandable, for example `true`.
---@field public protected boolean # A boolean indicating if the token (macro) is protected, for example `false`.
---@field mode integer # A number either representing a character or another entity, for example `1007`.
---@field index integer # A number running from 0x0000 upto 0xFFFF indicating a TeX register index, for example `1007`.

---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L835-L845](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L835-L845)
---
---@param t Token
---
---@return integer command # A number representing the internal command number, for example `147`.
function token.get_command(t) end

---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L901-L908](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L901-L908)
---
---@param t Token
---
---@return TokenCommandName cmdname # The type of the command (for instance the catcode in case of a character or the classifier that determines the internal treatment, for example `letter`.
function token.get_cmdname(t) end

---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L910-L924](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L910-L924)
---
---@param t Token
---
---@return string|nil csname # The associated control sequence (if applicable), for example `bigskip`.
function token.get_csname(t) end

---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L926-L931](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L926-L931)
---
---@param t Token
---
---@return integer id # The unique id of the token, for example `6876`.
function token.get_id(t) end

---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L933-L939](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L933-L939)
---
---@param t Token
---
---@return integer tok # The full token number as stored in TeX, for example `536883863`.
function token.get_tok(t) end

---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L941-L956](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L941-L956)
---
---@param t Token
---
---@return boolean active # A boolean indicating the active state of the token, for example `true`.
function token.get_active(t) end

---
---* Corresponding C source code: [lnewtokenlib.c#L958-L969](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L958-L969)
---
---@param t Token
---
---@return boolean expandable # A boolean indicating if the token (macro) is expandable, for example `true`.
function token.get_expandable(t) end

---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L971-L987](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L971-L987)
---
---@param t Token
---
---@return boolean protected # A boolean indicating if the token (macro) is protected, for example `false`.
function token.get_protected(t) end

---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L889-L899](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L889-L899)
---
---@param t Token
---
---@return integer mode # A number either representing a character or another entity, for example `1007`.
function token.get_mode(t) end

---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L847-L887](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L847-L887)
---
---@param t Token
---
---@return integer index # A number running from 0x0000 upto 0xFFFF indicating a TeX register index, for example `1007`.
function token.get_index(t) end

---
---The `get_macro` function can be used to get the content of a macro
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L1106-L1131](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1106-L1131)
---
---@param name string # The name of the macro without the leading backslash.
---
---@return string # for example `foo #1 bar`.
function token.get_macro(name) end

---
---The `get_meaning` function gives the meaning including the argument
---specification (as usual in *TeX* separated by `->`).
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L1086-L1104](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1086-L1104)
---
---@param name string # The name of the macro without the leading backslash.
---
---@return string # for example `->foo #1 bar`.
function token.get_meaning(name) end

---
---You can ask for a list of commands:
---
---@return table
function token.commands() end

---
---The id of a token class can be queried as follows:
---
---* Corresponding C source code: [lnewtokenlib.c#L926-L931](https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L926-L931)
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
