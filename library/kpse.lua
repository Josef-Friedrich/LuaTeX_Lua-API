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
function kpse.check_permission() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.default_texmfcnf() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.expand_braces() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.expand_path() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.expand_var() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.find_file() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.init_prog() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.lookup() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.readable_file() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.show_path() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.var_value() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function kpse.version() end
