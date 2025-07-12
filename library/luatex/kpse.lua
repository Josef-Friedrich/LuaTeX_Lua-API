---@meta

---
---This library provides two separate, but nearly identical interfaces to the
---`kpathsea` file search functionality: there is a “normal” procedural
---interface that shares its kpathsea instance with *LuaTeX* itself, and an object
---oriented interface that is completely on its own.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
kpse = {}

_N._10_7_the_kpse_library = "page 221"
_N._10_7_1_set_program_name_and_new = "page 221"

---
---The way the library looks up variables is driven by the `texmf.cmf` file
---where the currently set program name acts as filter. You can check what file is
---used by with `default_texmfcnf`.
---
---__Reference:__
---
---* Corresponding C source code: [lkpselib.c#L317-321](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L317-321)
---
---@return string # returns the value of the C preprocessor macro DEFAULT_TEXMFCNF without initializing anything else from kpathsea, for example `{$SELFAUTOLOC,$SELFAUTOLOC/share/texmf-local/web2c,...}`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.default_texmfcnf() end

---
---Initialize the kpathsea library by setting the program name. The optional string allows explicit `progname` setting.
---
---Before the search library can be used at all, its database has to be initialized.
---There are three possibilities, two of which belong to the procedural interface.
---
---First, when *LuaTeX* is used to typeset documents, this initialization happens
---automatically and the `kpathsea` executable and program names are set to `luatex` (that is, unless explicitly prohibited by the user's startup script.)
---
---Second, in *TeX*LUA mode, the initialization has to be done explicitly via the
---`kpse.set_program_name` function, which sets the `kpathsea` executable
---(and optionally program) name.
---
---The second argument controls the use of the “dotted” values in the `texmf.cnf` configuration file, and defaults to the first argument.
---
---Third, if you prefer the object oriented interface, you have to call a different
---function. It has the same arguments, but it returns a userdata variable.
---
---* Corresponding C source code: [lkpselib.c#L832-852](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L832-852)
---
---@param name string
---@param progname? string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.set_program_name(name, progname) end

---
---Create a new kpathsea library instance.
---
---The optional string allows explicit `progname` setting.
---
---__Reference:__
---
---* Corresponding C source code: [lkpselib.c#L908-L921](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L908-L921)
---
---@param name string
---@param progname? string
---
---@return userdata
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.new(name, progname) end

_N._10_7_2_record_input_file_and_record_output_file = "page 222"

---
---Register used files.
---
---Because callbacks can load
---files themselves you might need these helpers (if you use recording at all).
---
---__Reference:__
---
---* Corresponding C source code: [lkpselib.c#L923-L930](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L923-L930)
---
---@param name string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.record_input_file(name) end

---
---Register used files.
---
---Because callbacks can load
---files themselves you might need these helpers (if you use recording at all).
---
---__Reference:__
---
---* Corresponding C source code: [lkpselib.c#L932-L939](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L932-L939)
---
---@param name string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.record_output_file(name) end

_N._10_7_3_find_file = "page 222"

---
---__Reference:__
---
---* Corresponding C source code: [lkpselib.c#L104-163](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L104-163)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias KpseFtype
---| 'afm'
---| 'base'
---| 'bib'
---| 'bitmap font'
---| 'bst'
---| 'cid maps'
---| 'clua'
---| 'cmap files'
---| 'cnf'
---| 'cweb'
---| 'dvips config'
---| 'enc files'
---| 'fmt'
---| 'font feature files'
---| 'gf'
---| 'graphic/figure'
---| 'ist'
---| 'lig files'
---| 'ls-R'
---| 'lua'
---| 'map'
---| 'mem'
---| 'MetaPost support'
---| 'mf'
---| 'mfpool'
---| 'mft'
---| 'misc fonts'
---| 'mlbib'
---| 'mlbst'
---| 'mp'
---| 'mppool'
---| 'ocp'
---| 'ofm'
---| 'opentype fonts'
---| 'opl'
---| 'other binary files'
---| 'other text files'
---| 'otp'
---| 'ovf'
---| 'ovp'
---| 'pdftex config'
---| 'pk'
---| 'PostScript header'
---| 'subfont definition files'
---| 'tex'
---| 'TeX system documentation'
---| 'TeX system sources'
---| 'texmfscripts'
---| 'texpool'
---| 'tfm'
---| 'Troff fonts'
---| 'truetype fonts'
---| 'type1 fonts'
---| 'type42 fonts'
---| 'vf'
---| 'web'
---| 'web2c files'

---
---Find a file.
---
---The optional string is the file type as supported by the standalone `kpsewhich` program (default is ``tex`, no autodiscovery takes place). The optional boolean indicates wether the file must exist. The optional number is the dpi value for PK files.
---
---The most often used function in the library is `find_file`:
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and if it fails it will be searched in the standard tree.
---
---__References:__
---
---* Corresponding C source code: [lkpselib.c#L254-315](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01yd53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L254-315)
---
---@param filename string # the name of the file you want to find, with or without extension.
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.find_file(filename) end

---
---Find a file.
---
---The optional string is the file type as supported by the standalone `kpsewhich` program (default is ``tex`, no autodiscovery takes place). The optional boolean indicates wether the file must exist. The optional number is the dpi value for PK files.
---
---The most often used function in the library is `find_file`:
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and if it fails it will be searched in the standard tree.
---
---__References:__
---
---* Corresponding C source code: [lkpselib.c#L254-315](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01yd53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L254-315)
---
---@param filename string # the name of the file you want to find, with or without extension.
---@param ftype KpseFtype # maps to the `-format` argument of `kpsewhich`. The supported `ftype` values are the same as the ones supported by the standalone `kpsewhich` program. The default type is `tex`. Note: this is different from `kpsewhich`, which tries to deduce the file type itself from looking at the supplied extension.
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.find_file(filename, ftype) end

---
---Find a file.
---
---The optional string is the file type as supported by the standalone `kpsewhich` program (default is ``tex`, no autodiscovery takes place). The optional boolean indicates wether the file must exist. The optional number is the dpi value for PK files.
---
---The most often used function in the library is `find_file`:
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and if it fails it will be searched in the standard tree.
---
---__References:__
---
---* Corresponding C source code: [lkpselib.c#L254-315](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01yd53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L254-315)
---
---@param filename string # the name of the file you want to find, with or without extension.
---@param ftype KpseFtype # maps to the `-format` argument of `kpsewhich`. The supported `ftype` values are the same as the ones supported by the standalone `kpsewhich` program. The default type is `tex`. Note: this is different from `kpsewhich`, which tries to deduce the file type itself from looking at the supplied extension.
---@param mustexist boolean # is similar to `kpsewhich`'s `-must-exist`, and the default is `false`. If you specify `true` (or a non-zero integer), then the kpse library will search the disk as well as the `ls-R` databases.
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.find_file(filename, ftype, mustexist) end

---
---Find a file.
---
---The optional string is the file type as supported by the standalone `kpsewhich` program (default is ``tex`, no autodiscovery takes place). The optional boolean indicates wether the file must exist. The optional number is the dpi value for PK files.
---
---The most often used function in the library is `find_file`:
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and if it fails it will be searched in the standard tree.
---
---__References:__
---
---* Corresponding C source code: [lkpselib.c#L254-315](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01yd53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L254-315)
---
---@param filename string # the name of the file you want to find, with or without extension.
---@param ftype KpseFtype # maps to the `-format` argument of `kpsewhich`. The supported `ftype` values are the same as the ones supported by the standalone `kpsewhich` program. The default type is `tex`. Note: this is different from `kpsewhich`, which tries to deduce the file type itself from looking at the supplied extension.
---@param dpi number # This is used for the size argument of the formats `pk`, `gf`, and `bitmap font`.
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.find_file(filename, ftype, dpi) end

---
---The options correspond to the command line arguments of `kpsewhich`:
---
---__References:__
---
---* Corresponding C source code: [lkpselib.c#L565-810](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L565-810)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class KpseLookupOptions
---@field debug number # set debugging flags for this lookup     \NR
---@field format string # use specific file type (see list above)
---@field dpi number # use this resolution for this lookup; default 600
---@field path string # search in the given path
---@field all boolean # output all matches, not just the first
---@field mustexist boolean # search the disk as well as ls-R if necessary
---@field mktexpk boolean # disable/enable mktexpk generation for this lookup
---@field mktextex boolean # disable/enable mktextex generation for this lookup
---@field mktexmf boolean # disable/enable mktexmf generation for this lookup
---@field mktextfm boolean # disable/enable mktextfm generation for this lookup
---@field subdir string|table # only output matches whose directory part ends with the given string(s)

_N._10_7_4_lookup = "page 223"

---
---Find a file (extended interface).
---
---A more powerful (but slower) generic method for finding files is also available.
---It returns a string for each found file.
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and then in the standard tree.
---
---__References:__
---
---* Corresponding C source code: [lkpselib.c#L813-818](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L813-818)
---
---@param filename string # the name of the file you want to find, with or without extension.
---@param options KpseLookupOptions
---
---@return string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.lookup(filename, options) end

_N._10_7_5_init_prog = "page 223"

---
---Initialize a PK generation program. The optional string is the metafont mode fallback name.
---
---Extra initialization for programs that need to generate bitmap fonts.
---
---__References:__
---
---* Corresponding C source code: [lkpselib.c#L865-874](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L865-874)
---
---@param prefix string
---@param base_dpi number
---@param mfmode string
---@param fallback string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.init_prog(prefix, base_dpi, mfmode, fallback) end

_N._10_7_6_readable_file = "page 223"

---
---Returns true if a file exists and is readable.
---
---Test if an (absolute) file name is a readable file.
---
---__References:__
---
---* Corresponding C source code: [lkpselib.c#L891-898](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L891-898)
---
---@param name string
---
---@return string|nil f The return value is the actual absolute filename you should use, because the disk name is not always the same as the requested name, due to aliases and system-specific handling under e.g. MS Dos Returns `nil` if the file does not exist or is not readable.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.readable_file(name) end

_N._10_7_7_expand_path = "page 224"

---
---Expand a path.
---
---Output the complete expansion of string, with each element separated by the usual path separator on the current system (`;` on Windows, `:` otherwise). This may be useful to construct a custom search path for a format not otherwise supported.
---Like `kpsewhich`’s `-expand-path`.
---
---__References:__
---
---* [kpathsea manual](https://www.tug.org/texinfohtml/kpathsea.html#index-_002d_002dexpand_002dpath_003dstring)
---* Corresponding C source code: [lkpselib.c#L353-359](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L353-359)
---
---@param s string
---
---@return string r
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.expand_path(s) end

_N._10_7_8_expand_var = "page 224"

---
---Expand a variable.
---
---Output the variable and tilde expansion of string. For example, with the usual texmf.cnf, `kpse.expand_var('$TEXMF')` returns the TeX system hierarchy root(s). The specified string can contain anything, though, not just variable references. This calls kpse_var_expand (see Programming with config files).
---Like `kpsewhich`’s  `-expand-var`:
---
---__References:__
---
---* [kpathsea manual](https://www.tug.org/texinfohtml/kpathsea.html#index-_002d_002dexpand_002dvar_003dstring)
---* Corresponding C source code: [lkpselib.c#L386-392](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L386-392)
---
---@param s string
---
---@return string r
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.expand_var(s) end

_N._10_7_9_expand_braces = "page 224"

---
---Expand the braces in a variable.
---
---Output variable, tilde, and brace expansion of string, which is assumed to be a single path element. Like `kpsewhich`’s `-expand-braces`
---
---__References:__
---
---* [kpathsea manual](https://www.tug.org/texinfohtml/kpathsea.html#index-_002d_002dexpand_002dbraces_003dstring)
---* Corresponding C source code: [lkpselib.c#L369-375](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L369-375)
---
---@param s string
---
---@return string r
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.expand_braces(s) end

_N._10_7_10_show_path = "page 224"

---
---List the search path for a specific file type.
---
---Show the path that would be used for file lookups of file type name. Either a filename extension (`pk`, `.vf`, etc.) or an integer can be used, just as with `--format`, described in the previous section.
---
---Like `kpsewhich`’s `-show-path`
---
---__References:__
---
---* [kpathsea manual](https://www.tug.org/texinfohtml/kpathsea.html#index-_002d_002dshow_002dpath_003dname)
---* Corresponding C source code: [lkpselib.c#L334-343](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L334-343)
---
---@param file_type string
---
---@return string search_path
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.show_path(file_type) end

_N._10_7_11_var_value = "page 224"

---
---Return the value of a variable.
---
---Outputs the value of variable (a simple identifier like `TEXMFDIST`, with no `$` or other constructs), expanding `$` (see Variable expansion) and `~` (see Tilde expansion) constructs in the value. ‘~` expansion happens at the beginning of the overall value and at the beginning of a variable expansion, but not arbitrarily within the string. Braces are not expanded.
---
---Like `kpsewhich’`s `-var-value`
---
---__References:__
---
---* [kpathsea manual](https://www.tug.org/texinfohtml/kpathsea.html#index-_002d_002dvar_002dvalue_003dvariable)
---* Corresponding C source code: [lkpselib.c#L395-L401](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L395-L401)
---
---@param variable string
---
---@return string value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.var_value(variable) end

_N._10_7_12_version = "page 224"

---
---Return the kpathsea version string.
---
---__Reference:__
---
---* Corresponding C source code: [lkpselib.c#L876-L880](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L876-L880)
---
---@return string version # For example `kpathsea version 6.3.4`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.version() end

---
---```lua
---local okay, found = kpse.check_permission(name)
---if okay and found then
---  return io.popen(found,...)
---end
---```
---
---__Reference:__
---
---* Corresponding C source code: [lkpselib.c#L943-L980](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lkpselib.c#L943-L980)
---
---@param name string
---
---@return boolean okay
---@return string found
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/kpse.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function kpse.check_permission(name) end

return kpse
