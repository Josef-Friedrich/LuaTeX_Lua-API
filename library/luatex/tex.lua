---@meta

tex = {}

--https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1161

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
------
---Source: [luatex-tex.tex#L1172-L1196](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1172-L1196)
---
---@param ... string # Each string argument is treated by *TeX* as a separate input line.
function tex.print(...) end

---
---The optional parameter can be used to print the strings using the catcode regime
---defined by `catcodetable` `n`.
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
------
---Source: [luatex-tex.tex#L1222-L1224](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1222-L1224)
---
---@param t table
function tex.print(t) end

---
---@param n integer # Print the strings using the catcode regime defined by `catcodetable` `n`.
---@param t table
function tex.print(n, t) end

---
---Converts the number `o` that represents an explicit
---dimension into an integer number of scaled points.
------
---Source: [luatex-tex.tex#L1395-L1396](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1395-L1396)
---
---@param o integer
---
---@return integer
function tex.sp(o) end

---Converts a string `s` that represents an explicit
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
------
---Source: [luatex-tex.tex#L1386-L1413](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1386-L1413)
---
---@param s string
---
---@return integer
function tex.sp(s) end

---
---This creates an error somewhat like the combination of `\errhelp` and
---`\errmessage` would. During this error, deletions are disabled.
---
---In case of an error the `show_context` function will show the current
---context where we're at (in the expansion).
------
---Source: [luatex-tex.tex#L1438-L1457](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1438-L1457)
---
---@param s string # An error message like `\errmessage`.
---@param help? table # The array part of the `help` table has to contain strings, one for each line of error help.
function tex.error(s, help) end

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

---
---An example of a (possible error triggering) complication is that *TeX* expects to
---be in some state, say horizontal mode, and you have to make sure it is when you
---start feeding back something from *Lua* into *TeX*. Normally a user will not run
---into issues but when you start writing tokens or nodes or have a nested run there
---can be situations that you need to run `forcehmode`. There is no recipe for
---this and intercepting possible cases would weaken *LuaTeX*'s flexibility.
function tex.forcehmode() end

---
---Returns a list of names. This can be useful for debugging, but note that this
---also reports control sequences that may be unreachable at this moment due to
---local redefinitions: it is strictly a dump of the hash table. You can use `token.create` to inspect properties, for instance when the `command` key
---in a created table equals `123`, you have the `cmdname` value `undefined_cs`.
---
---```
---for i,v in pairs(tex.hashtokens()) do ... end
---```
function tex.hashtokens() end

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

function tex.badness() end
function tex.cprint() end
function tex.extraprimitives() end
function tex.finish() end
function tex.fontidentifier() end
function tex.fontname() end
function tex.force_synctex_line() end
function tex.force_synctex_tag() end
function tex.forcehmode() end
function tex.get() end
function tex.get_synctex_line() end
function tex.get_synctex_mode() end
function tex.get_synctex_tag() end
function tex.getattribute() end
function tex.getbox() end
function tex.getboxresourcebox() end
function tex.getboxresourcedimensions() end
function tex.getcatcode() end
function tex.getcount() end
function tex.getdelcode() end
function tex.getdelcodes() end
function tex.getdimen() end
function tex.getfontoffamily() end
function tex.getglue() end
function tex.getlccode() end
function tex.getlist() end
function tex.getlocallevel() end
function tex.getmark() end
function tex.getmath() end
function tex.getmathcode() end
function tex.getmathcodes() end
function tex.getmodevalues() end
function tex.getmuglue() end
function tex.getmuskip() end
function tex.getnest() end
function tex.getpagestate() end
function tex.getsfcode() end
function tex.getskip() end
function tex.gettoks() end
function tex.getuccode() end
function tex.hashtokens() end
function tex.init_rand() end
function tex.isattribute() end
function tex.isbox() end
function tex.iscount() end
function tex.isdimen() end
function tex.isglue() end
function tex.ismuglue() end
function tex.ismuskip() end
function tex.isskip() end
function tex.istoks() end
function tex.linebreak() end
function tex.lua_math_random() end
function tex.lua_math_randomseed() end
function tex.normal_rand() end
function tex.number() end
function tex.primitives() end
function tex.quittoks() end
function tex.resetparagraph() end
function tex.romannumeral() end
function tex.round() end
function tex.run() end
function tex.runtoks() end
function tex.saveboxresource() end
function tex.scale() end
function tex.scantoks() end
function tex.set() end
function tex.set_synctex_line() end
function tex.set_synctex_mode() end
function tex.set_synctex_no_files() end
function tex.set_synctex_tag() end
function tex.setattribute() end
function tex.setbox() end
function tex.setcatcode() end
function tex.setcount() end
function tex.setdelcode() end
function tex.setdimen() end
function tex.setglue() end
function tex.setlccode() end
function tex.setlist() end
function tex.setmath() end
function tex.setmathcode() end
function tex.setmuglue() end
function tex.setmuskip() end
function tex.setnest() end
function tex.setsfcode() end
function tex.setskip() end
function tex.settoks() end
function tex.setuccode() end
function tex.shipout() end
function tex.show_context() end
function tex.splitbox() end
function tex.sprint() end
function tex.tprint() end
function tex.triggerbuildpage() end
function tex.uniform_rand() end
function tex.uniformdeviate() end
function tex.useboxresource() end
function tex.write() end
