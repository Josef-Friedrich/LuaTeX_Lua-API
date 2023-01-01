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
---@param ... string # Each string argument is treated by *TeX* as a separate input line.
function tex.print(...) end

---
---The optional parameter can be used to print the strings using the catcode regime
---defined by `catcodetable` `n`.
--
---@param n integer If `n` is `-1`, the currently active catcode regime is used. If `n` is `-2`, the resulting catcodes are the result of `the` `toks`: all category codes are 12 (other) except for the space character, that has category code 10 (space). Otherwise, if `n` is not a valid catcode table, then it is ignored, and the currently active catcode regime is used instead.
---@param ... string
function tex.print(n, ...) end

---
---If there is a
---table argument instead of a list of strings, this has to be a consecutive array
---of strings to print (the first non-string value will stop the printing process).
---
---@param t table
function tex.print(t) end

---
---@param n integer
---@param t table
function tex.print(n, t) end

-- https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1386

---
---Converts the number `o` that represents an explicit
---dimension into an integer number of scaled points.
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
---
---@param s string
---
---@return integer
function tex.sp(s) end

--https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1438

---
---This creates an error somewhat like the combination of `\errhelp` and
---`\errmessage` would. During this error, deletions are disabled.
---
---In case of an error the `show_context` function will show the current
---context where we're at (in the expansion).
---
---@param s string # An error message like `\errmessage`.
---@param help? table # The array part of the `help` table has to contain strings, one for each line of error help.
function tex.error(s, help) end
