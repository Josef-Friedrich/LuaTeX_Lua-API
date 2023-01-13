---@meta

---
---This library provides two separate, but nearly identical interfaces to the
---`kpathsea` file search functionality: there is a “normal” procedural
---interface that shares its kpathsea instance with *LuaTeX* itself, and an object
---oriented interface that is completely on its own.
kpse = {}

---
---The way the library looks up variables is driven by the `texmf.cmf` file
---where the currently set program name acts as filter. You can check what file is
---used by with `default_texmfcnf`.
---
---Before the search library can be used at all, its database has to be initialized.
---There are three possibilities, two of which belong to the procedural interface.
---
---First, when *LuaTeX* is used to typeset documents, this initialization happens
---automatically and the `kpathsea` executable and program names are set to `luatex` (that is, unless explicitly prohibited by the user's startup script.
---
---Second, in *TeX*LUA\ mode, the initialization has to be done explicitly via the
---`kpse.set_program_name` function, which sets the `kpathsea` executable
---(and optionally program) name.
---
---
---The second argument controls the use of the “dotted” values in the `texmf.cnf` configuration file, and defaults to the first argument.
---
---Third, if you prefer the object oriented interface, you have to call a different
---function. It has the same arguments, but it returns a userdata variable.
---
---@param name string
---@param progname? string
function kpse.set_program_name(name, progname) end

---
---Third, if you prefer the object oriented interface, you have to call a different
---function. It has the same arguments, but it returns a userdata variable.
---
---@param name string
---@param progname? string
---
---@return userdata
function kpse.new(name, progname) end

---
---Register used files.
---
---Because callbacks can load
---files themselves you might need these helpers (if you use recording at all).
---
---@param name string
function kpse.record_input_file(name) end

---
---Register used files.
---
---Because callbacks can load
---files themselves you might need these helpers (if you use recording at all).
---
---@param name string
function kpse.record_output_file(name) end

---
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
---The most often used function in the library is `find_file`:
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and if it fails it will be searched in the standard tree.
---
---@param filename string # the name of the file you want to find, with or without extension.
---@return string
function kpse.find_file(filename) end

---
---The most often used function in the library is `find_file`:
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and if it fails it will be searched in the standard tree.
---
---@param filename string # the name of the file you want to find, with or without extension.
---@param ftype KpseFtype # maps to the `-format` argument of `kpsewhich`. The supported `ftype` values are the same as the ones supported by the standalone `kpsewhich` program. The default type is `tex`. Note: this is different from `kpsewhich`, which tries to deduce the file type itself from looking at the supplied extension.
---
---@return string
function kpse.find_file(filename, ftype) end

---
---The most often used function in the library is `find_file`:
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and if it fails it will be searched in the standard tree.
---
---@param filename string # the name of the file you want to find, with or without extension.
---@param ftype KpseFtype # maps to the `-format` argument of `kpsewhich`. The supported `ftype` values are the same as the ones supported by the standalone `kpsewhich` program. The default type is `tex`. Note: this is different from `kpsewhich`, which tries to deduce the file type itself from looking at the supplied extension.
---@param mustexist boolean # is similar to `kpsewhich`'s `-must-exist`, and the default is `false`. If you specify `true` (or a non-zero integer), then the kpse library will search the disk as well as the `ls-R` databases.
---
---@return string
function kpse.find_file(filename, ftype, mustexist) end

---
---The most often used function in the library is `find_file`:
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and if it fails it will be searched in the standard tree.
---
---@param filename string # the name of the file you want to find, with or without extension.
---@param ftype KpseFtype # maps to the `-format` argument of `kpsewhich`. The supported `ftype` values are the same as the ones supported by the standalone `kpsewhich` program. The default type is `tex`. Note: this is different from `kpsewhich`, which tries to deduce the file type itself from looking at the supplied extension.
---@param dpi number # This is used for the size argument of the formats `pk`, `gf`, and `bitmap font`.
---
---@return string
function kpse.find_file(filename, ftype, dpi) end

---
---The options correspond to the command line arguments of `kpsewhich`:
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

---
---A more powerful (but slower) generic method for finding files is also available.
---It returns a string for each found file.
---
---If `--output-directory` is specified and the value is a relative pathname,
---the file is searched first here and then in the standard tree.
---
---@param filename string # the name of the file you want to find, with or without extension.
---@param options KpseLookupOptions
---
---@return string
function kpse.lookup(filename, options) end

---
---Extra initialization for programs that need to generate bitmap fonts.
---
---@param prefix string
---@param base_dpi number
---@param mfmode string
---@param fallback string
function kpse.init_prog(prefix, base_dpi, mfmode, fallback) end

---
---Test if an (absolute) file name is a readable file.
---
---@param name string
---
---@return string|nil f The return value is the actual absolute filename you should use, because the disk name is not always the same as the requested name, due to aliases and system-specific handling under e.g. MS Dos Returns `nil` if the file does not exist or is not readable.
function kpse.readable_file(name) end

---
---Like `kpsewhich`’s `-expand-path`
---
---@param s string
---
---@return string r
function kpse.expand_path(s) end

---
---Like `kpsewhich`’s  `-expand-var`:
---
---@param s string
---
---@return string r
function kpse.expand_var(s) end

---
---Like `kpsewhich`’s `-expand-braces`
---
---@param s string
---
---@return string r
function kpse.expand_braces(s) end

---
---Like `kpsewhich`’s `-show-path`
---
---@param s string
---
---@return string r
function kpse.show_path(s) end

---
---Like `kpsewhich`’s `-var-value`
---
---@param s string
---
---@return string r
function kpse.var_value(s) end

---
---Returns the kpathsea version string.
---
---@return string r
function kpse.version() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.check_permission() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.default_texmfcnf() end
