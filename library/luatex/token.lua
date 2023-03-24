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
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2091-L2098](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L2091-L2098)
---
token = {}

---
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
---* Corresponding C source code: [lnewtokenlib.c#L304-L318](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L304-L318)
---
---@param keyword string # An ASCII based keyword to scan for.
---
---@return boolean # True if the keyword could be gobbled up otherwise false.
function token.scan_keyword(keyword) end

---
--- Scan and gobble a given case sensitive and *UTF-8* based keyword.
---
---__Example:__
---
---```tex
---\def\scanner{\directlua{
---  print(token.scan_keyword_cs('Keyword'))
---}}
---\scanner Keyword % true
---\scanner keyword % false
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L320-L334](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L320-L334)
---
---@param keyword string # A case sensitive and *UTF-8* based keyword
---
---@return boolean # True if the case sensitive and *UTF-8* based keyword could be gobbled up otherwise false.
function token.scan_keyword_cs(keyword) end

---
---Scan and gobble a given integer.
---
---__Example:__
---
---```latex
---\def\scanner{\directlua{
---  print(token.scan_int())
---}}
---\scanner 1 % 1
---\scanner 1.1 % 1 (Scans only 1 not 1.1)
---\scanner -1 % -1
---\scanner 1234567890 % 1234567890
---\scanner string % Missing number, treated as zero
---\scanner 12345678901 % Number to big
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L356-L366](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L356-L366)
---
---@return integer
function token.scan_int() end

---
---Scan and gobble a floating point number that cannot have an exponent (`1E10` is scanned as `1.0`).
---
---__Example:__
---
---```tex
---\def\scan{\directlua{
---  print(token.scan_real())
---}}
---\scan 1E10 % 1.0 Does not scan “E10“
---\scan 1 % 1.0
---\scan 1.1 % 1.1
---\scan .1 % 0.1
---\scan - .1 % -0.1
---\scan -1 % -1.0
---\scan - 1 % -1.0
---\scan 1234567890 % 1234567890.0
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L495-L498](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L495-L498)
---
---@return number
function token.scan_real() end

---
---Scan and gobble a floating point number that can be provided with an exponent (e. g. `1E10`).
---
---__Example:__
---
---```tex
---\def\scan{\directlua{
---  print(token.scan_float())
---}}
---\scan 1E10 % 10000000000.0
---\scan .1e-10 % 1e-11
---\scan 1 % 1.0
---\scan 1.1 % 1.1
---\scan .1 % 0.1
---\scan - .1 % -0.1
---\scan -1 % -1.0
---\scan - 1 % -1.0
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L490-L493](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L490-L493)
---
---@return number
function token.scan_float() end

---
---Returns a number representing a dimension and or two numbers being the filler and order
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
---* Corresponding C source code: [lnewtokenlib.c#L500-L522](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L500-L522)
---
---@param inf? boolean # inf values allowed
---@param mu? boolean # mu (math units) units required
---
---@return integer
function token.scan_dimen(inf, mu) end

---
---returns a glue spec node
---
---__Example:__
---
---```tex
---\def\scan{\directlua{
---  local node = token.scan_glue()
---  print(node.width, node.stretch, node.stretch_order, node.shrink, node.shrink_order)
---}}
---\def\scanMu{\directlua{
---  local node = token.scan_glue(true)
---  print(node.width, node.stretch, node.stretch_order, node.shrink, node.shrink_order)
---}}
---\scan 1pt % 65536 0 0 0 0
---\scan 1pt plus 2pt % 65536 131072 0 0 0
---\scan 1pt minus 3pt % 65536 0 0 196608 0
---\scan 1pt plus 2pt minus 3pt % 65536 131072 0 196608 0
---\scan 1pt plus 2fi minus 3fi % 65536 131072 1 196608 1
---\scan 1pt plus 2fil minus 3fil % 65536 131072 2 196608 2
---\scan 1pt plus 2fill minus 3fill % 65536 131072 3 196608 3
---\scan 1pt plus 2filll minus 3filll % 65536 131072 4 196608 4
---\scan string % Missing number, treated as zero.
---\scanMu 3mu % 196608 0 0 0 0
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L524-L538](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L524-L538)
---
---@param mu_units boolean
---
---@return GlueSpecNode
function token.scan_glue(mu_units) end

---
---returns a table of tokens tokens
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L540-L567](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L540-L567)
---
function token.scan_toks(definer, expand) end

---
---returns a character if its category is in the given bitset (representing catcodes)
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L695-L721](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L695-L721)
---
function token.scan_code(bitset) end

---
---Scan and gobble a string.
---
---The string scanner scans for something between curly braces and expands on the
---way, or when it sees a control sequence it will return its meaning. Otherwise it
---will scan characters with catcode `letter` or `other`.
---
---__Example:__
---
---```tex
---\def\scan{\directlua{
---  print(token.scan_string())
---}}
---\def\bar{bar}
---\def\foo{\bar}
---\scan \foo % bar
---\scan {\foo} % bar
---\scan {A string} % A string
---\scan A string % A
---\scan Word1 Word2 % Word1
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L569-L606](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L569-L606)
---
---@return string # A string given between `{` `}`, as `\macro` or as sequence of characters with catcode 11 or 12
function token.scan_string() end

---
---Scan and gobble an argument.
---
---This function is simular to `token.scan_string` but also accepts a `\cs`.
---It expands the given argument. When a braced
---argument is scanned, expansion can be prohibited by passing `false`
---(default is `true`). In case of a control sequence passing `false`
---will result in a one-level expansion (the meaning of the macro).
---
---__Example:__
---
---```latex
---\def\scan{\directlua{
---  print(token.scan_argument(true))
---}}
---\def\scanNoExpand{\directlua{
---  print(token.scan_argument(false))
---}}
---\def\foo{bar}
---\scan \foo % bar
---\scan { {\bf text} } % {\fam \bffam \tenbf text}
---\scanNoExpand { {\bf text} } % {\bf text}
---\scan c % c
---\scan \bf % \fam \bffam \tenbf
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L608-L667](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L608-L667)
---
---@param expand? boolean # When a braced argument is scanned, expansion can be prohibited by passing `false` (default is `true`)
---
---@return string
function token.scan_argument(expand) end

---
---Return a sequence of characters with catcode 11 or 12 as string.
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L669-L693](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L669-L693)
---
function token.scan_word() end

---
---Return `foo` after scanning `\foo`.
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L336-L354](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L336-L354)
---
function token.scan_csname() end

---
---Pick up a box specification and return a `[h|v]list` node.
function token.scan_list() end

_N._1_picking_one_token = 218

---
---Scan and gobble the next token.
---
---The different scanner functions of the `token` library look for a
---sequence of tokens. This function scans just the next token.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2237-L2239](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L2237-L2239)
---* Corresponding C source code: [lnewtokenlib.c#L196-L204](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L196-L204)
---
---@return Token
function token.get_next() end

---
---Use `scan_token`
---if you want to
---enforce expansion first you can.
---
---* Corresponding C source code: [lnewtokenlib.c#L1055-L1063](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1055-L1063)
---
---@return Token
function token.scan_token() end

---
---Trigger expansion of the next token in the
---input.
---
---This can be quite unpredictable but when you call it you probably know
---enough about *TeX* not to be too worried about that. It basically is a call to
---the internal expand related function.
---
---* Corresponding C source code: [lnewtokenlib.c#L729-L734](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L729-L734)
function token.expand() end

_N._3_creating = 218

---
---* Corresponding C source code: [luatoken.c#L191-L349](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luatoken.c#L191-L349)
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
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2285-L2310](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L2285-L2310)
---
---@class Token
---@field command integer # A number representing the internal command number (catcode in case of a character), for example: `1` (`left_brace`), `2` (`right_brace`), `3` (`math_shift`), `4` (`tab_mark`), `6` (`mac_param`), `7` (`sup_mark`), `8` (`sub_mark`), `10 ` (`spacer`), `11 ` (`letter`), `12 ` (`other`), `147` (`call`).
---@field cmdname TokenCommandName # The type of the command, for example `letter`.
---@field csname string|nil # The associated control sequence (if applicable), for example `bigskip`.
---@field id integer # The unique id of the token, for example `6876`.
---@field tok integer # The full token number as stored in TeX, for example `536883863`.
---@field active boolean # A boolean indicating the active state of the token, for example `true`.
---@field expandable boolean # A boolean indicating if the token (macro) is expandable, for example `true`.
---@field public protected boolean # A boolean indicating if the token (macro) is protected, for example `false`.
---@field mode integer # A number either representing a character or another entity, for example `1007`.
---@field index integer|nil # A number running from 0x0000 upto 0xFFFF indicating a `TeX` register index. In case of letters the unicode code point, for example `398` = `Ǝ`.

---
---Return a command number representing the internal command number.
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L835-L845](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L835-L845)
---
---@param t Token
---
---@return integer command # A number representing the internal command number, for example `147`.
function token.get_command(t) end

---
---Return the type of the command (for instance the catcode in case of a character or the classifier that determines the internal treatment, for example `letter`.
---
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L901-L908](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L901-L908)
---
---@param t Token
---
---@return TokenCommandName cmdname # The type of the command (for instance the catcode in case of a character or the classifier that determines the internal treatment, for example `letter`.
function token.get_cmdname(t) end

---
---
---Return the associated control sequence (if applicable), for example `bigskip`.
---
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L910-L924](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L910-L924)
---
---@param t Token
---
---@return string|nil csname # The associated control sequence (if applicable), for example `bigskip`.
function token.get_csname(t) end

---
---Return the unique id of the token.
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L926-L931](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L926-L931)
---
---@param t Token
---
---@return integer id # The unique id of the token, for example `6876`.
function token.get_id(t) end

---
---Return the full token number as stored in TeX.
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L933-L939](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L933-L939)
---
---@param t Token
---
---@return integer tok # The full token number as stored in TeX, for example `536883863`.
function token.get_tok(t) end

---
---Return a boolean indicating the active state of the token, for example `true`.
---
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L941-L956](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L941-L956)
---
---@param t Token
---
---@return boolean active # A boolean indicating the active state of the token, for example `true`.
function token.get_active(t) end

---
---Return a boolean indicating if the token (macro) is expandable.
---
---
---* Corresponding C source code: [lnewtokenlib.c#L958-L969](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L958-L969)
---
---@param t Token
---
---@return boolean expandable # A boolean indicating if the token (macro) is expandable, for example `true`.
function token.get_expandable(t) end

---Return a boolean indicating if the token (macro) is protected.
---
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L971-L987](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L971-L987)
---
---@param t Token
---
---@return boolean protected # A boolean indicating if the token (macro) is protected, for example `false`.
function token.get_protected(t) end

---
---Return a number either representing a character or another entity.
---
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L889-L899](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L889-L899)
---
---@param t Token
---
---@return integer mode # A number either representing a character or another entity, for example `1007`.
function token.get_mode(t) end

---Return a number running from 0x0000 upto 0xFFFF indicating a TeX register index.
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L847-L887](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L847-L887)
---
---@param t Token
---
---@return integer index # A number running from 0x0000 upto 0xFFFF indicating a TeX register index, for example `1007`.
function token.get_index(t) end

---
---Get the content of a macro.
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L1106-L1131](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1106-L1131)
---
---@param name string # The name of the macro without the leading backslash.
---
---@return string # for example `foo #1 bar`.
function token.get_macro(name) end

---
---Get the meaning of a macro including the argument
---specification (as usual in *TeX* separated by `->`).
---
---__Reference:__
---
---* Corresponding C source code: [lnewtokenlib.c#L1086-L1104](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1086-L1104)
---
---@param name string # The name of the macro without the leading backslash.
---
---@return string # for example `->foo #1 bar`.
function token.get_meaning(name) end

---
---Ask for a list of commands.
---
---* Corresponding C source code: [lnewtokenlib.c#L1338-L1347](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1338-L1347)
---
---@return table
function token.commands() end

---
---Return the id of a token class.
---
---* Corresponding C source code: [lnewtokenlib.c#L926-L931](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L926-L931)
function token.command_id() end

---
---* Corresponding C source code: [lnewtokenlib.c#L791-L810](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L791-L810)
---
---@param chr integer
---@param cmd integer
---
---@return Token
function token.create(chr, cmd) end

---
--- A variant that ignores the current catcode table is:
---* Corresponding C source code: [lnewtokenlib.c#L812-L819](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L812-L819)
---
---@param chr integer
---@param cmd integer
---
---@return Token
function token.new(chr, cmd) end

---
---__Example:__
---
---```lua
---\def\foo{bar}
---\directlua{
---  print(token.is_defined('foo')) % true
---  print(token.is_defined('nofoo')) % false
---  print(token.is_defined('bf')) % true
---}
---```
---
---* Corresponding C source code: [lnewtokenlib.c#L772-L789](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L772-L789)
---
---@param cs string
---
---@return boolean
function token.is_defined(cs) end

---
---__Example:__
---
---```lua
---print(token.biggest_char()) % 1114111
---```
---
---* Corresponding C source code: [lnewtokenlib.c#L150-L154](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L150-L154)
---
---@return integer
function token.biggest_char() end

_N._4_macros = 219

---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2368-L2382](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L2368-L2382)
---* Corresponding C source code: [lnewtokenlib.c#L1183-L1307](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1183-L1307)
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
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2368-L2382](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L2368-L2382)
---* Corresponding C source code: [lnewtokenlib.c#L1183-L1307](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1183-L1307)
---
---@param catcodetable any
---@param csname string
---@param content? string
---@param global? 'global'
function token.set_macro(catcodetable, csname, content, global) end

---
---Do a `chardef` at the
---*Lua* end, where invalid assignments are silently ignored.
---
---* Corresponding C source code: [lnewtokenlib.c#L1309-L1336](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1309-L1336)
---
---@param csname string
---@param number integer
---@param global? 'global'
function token.set_char(csname, number, global) end

---
---This creates a token that refers to a *Lua* function with an entry in the table
---that you can access with `lua.get_functions_table`. It is the companion
---to `luadef`.
---
---* Corresponding C source code: [lnewtokenlib.c#L1133-L1181](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1133-L1181)
---
---@param name string
---@param id integer
---@param ... 'global'|'protected'
function token.set_lua(name, id, ...) end

_N._5_pushing_back = 220

---
---There is a (for now) experimental putter.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L2422-L2433](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L2422-L2433)
---* Corresponding C source code: [lnewtokenlib.c#L227-L302](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L227-L302)
---
---@param ... Token
function token.put_next(...) end

---
---__Example:__
---
---```tex
---\directlua{
---  local t = token.get_next()
---  print(token.is_token(t)) % true
---  print(token.is_token('text')) % false
---  print(token.is_token(true)) % false
---}Token
---```
---
---* Corresponding C source code: [lnewtokenlib.c#L723-L727](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L723-L727)
---
---@param t any
---
---@return boolean
function token.is_token(t) end

---
---__Example:__
---
---```tex
---\directlua{
---  local t = token.get_next()
---  print(token.type(t)) % 'token'
---  print(token.type('text')) % nil
---  print(token.type(true)) % nil
---}Token
---```
---
---* Corresponding C source code: [lnewtokenlib.c#L1045-L1053](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnewtokenlib.c#L1045-L1053)
---
---@param t any
---
---@return 'token'|nil
function token.type(t) end
