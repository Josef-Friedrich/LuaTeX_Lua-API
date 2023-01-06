---@meta

---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

tex = {}

_N._5_registers = 194

---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---@type table
tex.attribute = {}

---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---@type table
tex.count = {}

---
---The dimension registers accept *Lua* numbers (in scaled points) or
---strings (with an included absolute dimension; `em` and `ex`
---and `px` are forbidden). The result is always a number in scaled
---points.
---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---@type table
tex.dimen = {}

---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---@type table
tex.glue = {}

---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---@type table
tex.muglue = {}

---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---@type table
tex.muskip = {}

---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---@type table
tex.skip = {}

---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---@type table
tex.toks = {}

_N._14_print = 201

_N._14_1_print = 201

---
---The `tex` table also contains the three print functions that are the major
---interface from *Lua* scripting to *TeX*. The arguments to these three functions
---are all stored in an in|-|memory virtual file that is fed to the *TeX* scanner as
---the result of the expansion of `directlua`.
---
---The total amount of returnable text from a `directlua` command is only
---limited by available system RAM. However, each separate printed string has to
---fit completely in *TeX*'s input buffer. The result of using these functions from
---inside callbacks is undefined at the moment.
---
---```
---tex.print(<string> s, ...)
---tex.print(<number> n, <string> s, ...)
---tex.print(<table> t)
---tex.print(<number> n, <table> t)
---```
---
---The very last string of the very last `tex.print` command in a `directlua` will not have the `endlinechar` appended, all others do.
---
---see `LuaTeX` manual: 10.3.14.1 `print`
---
------
---Source: [luatex-tex.tex#L1172-L1196](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1172-L1196)
---
---@param ... string # Each string argument is treated by *TeX* as a separate input line.
function tex.print(...) end

---
---The optional parameter can be used to print the strings using the catcode regime
---defined by `catcodetable` `n`.
---
---see `LuaTeX` manual: 10.3.14.1 `print`
---
------
---Source: [luatex-tex.tex#L1176-L1182](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1176-L1182)
---
---@param n integer If `n` is `-1`, the currently active catcode regime is used. If `n` is `-2`, the resulting catcodes are the result of `the` `toks`: all category codes are 12 (other) except for the space character, that has category code 10 (space). Otherwise, if `n` is not a valid catcode table, then it is ignored, and the currently active catcode regime is used instead.
---@param ... string
function tex.print(n, ...) end

---
---If there is a
---table argument instead of a list of strings, this has to be a consecutive array
---of strings to print (the first non-string value will stop the printing process).
---
---see `LuaTeX` manual: 10.3.14.1 `print`
---
------
---Source: [luatex-tex.tex#L1222-L1224](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1222-L1224)
---
---@param t table
function tex.print(t) end

---
---see `LuaTeX` manual: 10.3.14.1 `print`
---
---@param n integer # Print the strings using the catcode regime defined by `catcodetable` `n`.
---@param t table
function tex.print(n, t) end

_N._15_5_sp = 204

---
---Converts the number `o` that represents an explicit
---dimension into an integer number of scaled points.
---
---see `LuaTeX` manual: 10.3.15.5 `sp`
---
------
---Source: [luatex-tex.tex#L1395-L1396](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1395-L1396)
---
---@param o integer
---
---@return integer
function tex.sp(o) end

---
---Convert a string `s` that represents an explicit
---dimension into an integer number of scaled points.
---
---For parsing the string, the same scanning and conversion rules are used that
---*LuaTeX* would use if it was scanning a dimension specifier in its *TeX*-like
---input language (this includes generating errors for bad values), expect for the
---following:
---
---* only explicit values are allowed, control sequences are not handled
---* infinite dimension units (`fil...`) are forbidden
---* `mu` units do not generate an error (but may not be useful either)
---
---__Example__:
---
---```lua
---local scaled_points = tex.sp('1cm')
---print(scaled_points) -- 1864679
---```
---
---__Reference__:
---
---* `LuaTeX` manual: 10.3.15.5 `sp` page 204
---* Source code of the `LuaTeX` manual: [luatex-tex.tex#L1386-L1413](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1386-L1413)
---
---@param s string # A string to convert into scaled points.
---
---@return integer # The dimension in the scaled points format.
function tex.sp(s) end

_N._15_7_error_show_context = 204

---
---This creates an error somewhat like the combination of `\errhelp` and
---`\errmessage` would. During this error, deletions are disabled.
---
---In case of an error the `show_context` function will show the current
---context where we're at (in the expansion).
---
---see `LuaTeX` manual: 10.3.15.5 `sp`
------
---Source: [luatex-tex.tex#L1438-L1457](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1438-L1457)
---
---@param s string # An error message like `\errmessage`.
---@param help? table # The array part of the `help` table has to contain strings, one for each line of error help.
function tex.error(s, help) end

_N._15_8_run_finish = 205

---
---Start the interpretation.
---
---A run normally
---boils down to *TeX* entering the so called main loop. A token is fetched and
---depending on it current meaning some actions takes place. Sometimes that actions
---comes immediately, sometimes more scanning is needed. Quite often tokens get
---pushed back into the input. This all means that the *TeX* scanner is constantly
---pushing and popping input states, but in the end after all the action is done
---returns to the main loop.
------
---Source: [L1459-L1470](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1459-L1470)
function tex.run() end

---
---Force the end of a interpretation.
------
---Source: [luatex-tex.tex#L1464](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1464)
function tex.finish() end

_N._15_9_runtoks = 205

---
---Because of the fact that *TeX* is in a complex dance of expanding, dealing with
---fonts, typesetting paragraphs, messing around with boxes, building pages, and so
---on, you cannot easily run a nested *TeX* run (read nested main loop). However,
---there is an option to force a local run with `runtoks`. The content of the
---given token list register gets expanded locally after which we return to where we
---triggered this expansion, at the *Lua* end. Instead a function can get passed
---that does some work. You have to make sure that at the end *TeX* is in a sane
---state and this is not always trivial. A more complex mechanism would complicate
---*TeX* itself (and probably also harm performance) so this simple local expansion
---loop has to do.
---
---```
---tex.runtoks(<token register>)
---tex.runtoks(<lua function>)
---```
---
---When the `tracingnesting` parameter is set to a value larger than 2 some
---information is reported about the state of the local loop.
---
---This function has two optional arguments in case a token register is passed:
---
---```
---tex.runtoks(<token register>,force,grouped)
---```
---
---Inside for instance an `\edef` the `runtoks` function behaves (at
---least tries to) like it were an `\the`. This prevents unwanted side
---effects: normally in such an definition tokens remain tokens and (for instance)
---characters don't become nodes. With the second argument you can force the local
---main loop, no matter what. The third argument adds a level of grouping.
---
---You can quit the local loop with `\endlocalcontrol` or from the *Lua* end
---with `tex.quittoks`. In that case you end one level up! Of course in the
---end that can mean that you arrive at the main level in which case an extra end
---will trigger a redundancy warning (not an abort!).
------
---Source: [luatex-tex.tex#L1472-L1508](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1472-L1508)
function tex.runtoks() end

_N._15_10_forcehmode = 205

---
---An example of a (possible error triggering) complication is that *TeX* expects to
---be in some state, say horizontal mode, and you have to make sure it is when you
---start feeding back something from *Lua* into *TeX*. Normally a user will not run
---into issues but when you start writing tokens or nodes or have a nested run there
---can be situations that you need to run `forcehmode`. There is no recipe for
---this and intercepting possible cases would weaken *LuaTeX*'s flexibility.
function tex.forcehmode() end

_N._15_11_hashtokens = 205

---
---Returns a list of names. This can be useful for debugging, but note that this
---also reports control sequences that may be unreachable at this moment due to
---local redefinitions: it is strictly a dump of the hash table. You can use `token.create` to inspect properties, for instance when the `command` key
---in a created table equals `123`, you have the `cmdname` value `undefined_cs`.
---
---```lua
---for i,v in pairs(tex.hashtokens()) do ... end
---```
function tex.hashtokens() end

_N._15_12_definefont = 206

---
---Associates `csname` with the internal font number `fontid`. The
---definition is global if (and only if) `global` is specified and true (the
---setting of `globaldefs` is not taken into account).
---
---@param csname string
---@param fontid integer
function tex.definefont(csname, fontid) end

---
---Associates `csname` with the internal font number `fontid`. The
---definition is global if (and only if) `global` is specified and true (the
---setting of `globaldefs` is not taken into account).
---
---@param global boolean
---@param csname string
---@param fontid integer
function tex.definefont(global, csname, fontid) end

_N._16_primitives = 206

_N._16_1_enableprimitives = 206

---
---
---This function accepts a prefix string and an array of primitive names. For each
---combination of “prefix” and “name”, the `tex.enableprimitives` first verifies that “name” is an actual primitive
---(it must be returned by one of the `tex.extraprimitives` calls explained
---below, or part of *TeX*82, or `directlua`). If it is not, `tex.enableprimitives` does nothing and skips to the next pair.
---
---But if it is, then it will construct a csname variable by concatenating the
---“prefix” and “name”, unless the “prefix” is already the
---actual prefix of “name”. In the latter case, it will discard the “prefix”, and just use “name”.
---
---Then it will check for the existence of the constructed csname. If the csname is
---currently undefined (note: that is not the same as `relax`), it will
---globally define the csname to have the meaning: run code belonging to the
---primitive “name”. If for some reason the csname is already defined, it
---does nothing and tries the next pair.
---
---An example:
---
---```lua
---tex.enableprimitives('LuaTeX', {'formatname'})
---```
---
---will define `\LuaTeXformatname` with the same intrinsic meaning as the
---documented primitive `formatname`, provided that the control sequences `\LuaTeXformatname` is currently undefined.
---
---When *LuaTeX* is run with `--ini` only the *TeX*82 primitives and `directlua` are available, so no extra primitives {\bf at all}.
---
---If you want to have all the new functionality available using their default
---names, as it is now, you will have to add
---
---```tex
---\ifx\directlua\undefined \else
---    \directlua {tex.enableprimitives('',tex.extraprimitives ())}
---\fi
---```
---
---near the beginning of your format generation file. Or you can choose different
---prefixes for different subsets, as you see fit.
---
---Calling some form of `tex.enableprimitives` is highly important though,
---because if you do not, you will end up with a *TeX*82-lookalike that can run *Lua*
---code but not do much else. The defined csnames are (of course) saved in the
---format and will be available at runtime.
---
---@param prefix string
---@param primitive_names table
function tex.enableprimitives(prefix, primitive_names) end

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
function tex.badness() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.cprint() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.extraprimitives() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.finish() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.fontidentifier() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.fontname() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.force_synctex_line() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.force_synctex_tag() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.forcehmode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.get() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.get_synctex_line() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.get_synctex_mode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.get_synctex_tag() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getattribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getbox() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getboxresourcebox() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getboxresourcedimensions() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getcatcode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getcount() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getdelcode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getdelcodes() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getdimen() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getfontoffamily() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getlccode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getlist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getlocallevel() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getmark() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getmath() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getmathcode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getmathcodes() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getmodevalues() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getmuglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getmuskip() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getnest() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getpagestate() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getsfcode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getskip() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.gettoks() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.getuccode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.hashtokens() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.init_rand() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.isattribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.isbox() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.iscount() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.isdimen() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.isglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.ismuglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.ismuskip() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.isskip() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.istoks() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.linebreak() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.lua_math_random() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.lua_math_randomseed() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.normal_rand() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.number() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.primitives() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.quittoks() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.resetparagraph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.romannumeral() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.round() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.run() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.runtoks() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.saveboxresource() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.scale() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.scantoks() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.set() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.set_synctex_line() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.set_synctex_mode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.set_synctex_no_files() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.set_synctex_tag() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setattribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setbox() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setcatcode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setcount() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setdelcode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setdimen() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setlccode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setlist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setmath() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setmathcode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setmuglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setmuskip() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setnest() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setsfcode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setskip() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.settoks() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.setuccode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.shipout() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.show_context() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.splitbox() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.sprint() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.tprint() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.triggerbuildpage() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.uniform_rand() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.uniformdeviate() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.useboxresource() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function tex.write() end
