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
