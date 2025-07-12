---@meta

---
---The Lua source file is location in `texmf-dist/tex/latex/base/ltluatex.lua`

luatexbase = {}

---
---Registers the `function` into the `callback` with a textual
---`description` of the function. Functions are inserted into the callback
---in the order loaded.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L348-L353](https://github.com/latex3/latex2e/blob/3a5cd1d84fd4474d57a8cb22cb882173f9268ce4/base/ltluatex.dtx#L348-L353)
---
---@param callback CallbackName
---@param func function
---@param description string # A textual description of the function.
function luatexbase.add_to_callback(callback, func, description) end

---
---Removes the callback function with `description` from the `callback`.
---The removed function and its description
---are returned as the results of this function.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L356-L360](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L356-L360)
---
---@param callback CallbackName
---@param description string
---
---@return function func
---@return string description # A textual description of the function.
function luatexbase.remove_from_callback(callback, description) end

---
---Check if the `description` matches one of the functions added
---to the list for the `callback`, returning a boolean value.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L363-L366](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L363-L366)
---
---@param callback CallbackName
---@param description string # A textual description of the function.
---
---@return boolean
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.in_callback(callback, description) end

---
---Set the `callback` to `false` as described in the LuaTeX
---manual for the underlying `callback.register` built-in.
---
---Callbacks
---will only be set to false (and thus be skipped entirely) if there are
---no functions registered using the callback.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L369-L374](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L369-L374)
---
---@see callback.register
---
---@param callback CallbackName
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.disable_callback(callback) end

---
---Return list of the descriptions of functions registered to the specified
---callback.
---
---`{}` is returned if there are no functions registered.
---
---__Reference:__
---
---* Corresponding DTX source code: [](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L377-L379)
---
---@param callback CallbackName
---
---@return table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.callback_descriptions(callback) end

---
---@alias CallbackType "list"|"data"|"exclusive"|"simple"|"reverselist"

---
---Define a user defined callback. The last argument is a default
---function or false.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L382-L385](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L382-L385)
---
---@param name string
---@param type CallbackType
---@param default function|false
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.create_callback(name, type, default) end

---
---Call a user defined callback with the supplied arguments.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L388-L390](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L388-L390)
---
---@param name CallbackName|string
---@param ... any
---
---@return any ...
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.call_callback(name, ...) end

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias DeclareCallbackRuleRelation
---|"before" # The callback function with description `first` will be executed before the function with description `second`.
---|"after" # The callback function with description `first` will be executed after the function with description `second`.
---|"incompatible-warning" # When both a callback function with description `first` and with description `second` is registered, then a warning is printed when the callback is executed.
---|"incompatible-error" # When both a callback function with description `first` and with description `second` is registered, then an error is printed when the callback is executed.
---|"unrelated" # Any previously declared callback rule between `first` and `second` gets disabled.

---
---Add an ordering constraint between two callback functions for callback `name`.
---
---The kind of constraint added depends on `relation`:
---
---Every call to `declare_callback_rule` with a specific callback `name`
---and descriptions `first` and `second` overwrites all previous calls with
---same callback and descriptions.
---
---The callback functions do not have to be registered yet when the functions is called.
---Ony the constraints for which both callback descriptions refer to callbacks
---registered at the time the callback is called will have an effect.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L393-L418](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L393-L418)
---
---@param name CallbackName|string
---@param first string
---@param relation DeclareCallbackRuleRelation
---@param second string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.declare_callback_rule(name, first, relation, second) end

---
---The `info` should be
---a table containing information about the module. The required field
---`name` must contain the name of the module. It is recommended to provide a
---field `date` in the usual LaTeX format `yyyy/mm/dd`. Optional fields
---`version` (a string) and `description` may be used if present. This
---information will be recorded in the log. Other fields are ignored.
---
---@class LualatexModule
---@field name string
---@field description string
---@field version string
---@field date string

---
---Identify module.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L321-L326](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L321-L326)
---* Corresponding Lua source code: [ltluatex.dtx#L1008-L1026](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L1008-L1026)
---
---@param module LualatexModule
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.provides_module(module) end

---
---Raise a info message.
---
---These functions are similar to LaTeX's `\PackageError`, `\PackageWarning`
---and `\PackageInfo` in the way they format the output.  No automatic line
---breaking is done, you may still use `\n` as usual for that, and the name of
---the package will be prepended to each output line.
---
---Note that `luatexbase.module_error` raises an actual Lua error with `error()`,
---which currently means a call stack will be dumped. While this may not
---look pretty, at least it provides useful information for tracking the
---error down.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L335-L343](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L335-L343)
---* Corresponding DTX source code: [ltluatex.dtx#L1079-L1081](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L1079-L1081)
---
---@param module string
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.module_info(module, text) end

---
---Raise a warning message.
---
---These functions are similar to LaTeX's `\PackageError`, `\PackageWarning`
---and `\PackageInfo` in the way they format the output.  No automatic line
---breaking is done, you may still use `\n` as usual for that, and the name of
---the package will be prepended to each output line.
---
---Note that `luatexbase.module_error` raises an actual Lua error with `error()`,
---which currently means a call stack will be dumped. While this may not
---look pretty, at least it provides useful information for tracking the
---error down.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L335-L343](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L335-L343)
---* Corresponding DTX source code: [ltluatex.dtx#L1083-L1086](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L1083-L1086)
---
---@param module string
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.module_warning(module, text) end

---
---Raise an error.
---
---These functions are similar to LaTeX's `\PackageError`, `\PackageWarning`
---and `\PackageInfo` in the way they format the output.  No automatic line
---breaking is done, you may still use `\n` as usual for that, and the name of
---the package will be prepended to each output line.
---
---Note that `luatexbase.module_error` raises an actual Lua error with `error()`,
---which currently means a call stack will be dumped. While this may not
---look pretty, at least it provides useful information for tracking the
---error down.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L335-L343](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L335-L343)
---* Corresponding DTX source code: [ltluatex.dtx#L1087-L1090](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L1087-L1090)
---
---@param module string
---@param text string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.module_error(module, text) end

---
---Returns an allocation number for the `attribute`, indexed from 1.
---The attribute will be initialised with the marker value `-"7FFFFFFF`
---(`unset'). The attribute allocation sequence is shared with the TeX
---code but this function does `not` define a token using
---`\attributedef`.
---The attribute name is recorded in the `attributes` table. A
---metatable is provided so that the table syntax can be used
---consistently for attributes declared in \TeX\ or Lua.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L194-L201](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L194-L201)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.new_attribute() end

---
---Returns an allocation number for a bytecode register, indexed from 1.
---The optional `name` argument is just used for logging.
---
---@param name? string
---
---@return integer
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L210-L212](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L210-L212)
---* Corresponding DTX source code: [ltluatex.dtx#L1241-L1253](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L1241-L1253)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.new_bytecode(name) end

---
---Return an allocation number for a Lua chunk name for use with
---`\directlua` and `\latelua`, indexed from 1.
---
---The number is returned and also `name` argument is added to the
---`lua.name` array at that index.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L216-L220](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L216-L220)
---* Corresponding DTX source code: [ltluatex.dtx#L1264-L1279](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L1264-L1279)
---
---@param name string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.new_chunkname(name) end

---
---Return an allocation number for a lua function for use
---with `\luafunction`, `\lateluafunction`, and `\luadef`,
---indexed from 1.
---
---The optional `name` argument
---is just used for logging.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L226-L229](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L226-L229)
---* Corresponding DTX source code: [ltluatex.dtx#L1290-L1302](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L1290-L1302)
---
---@param name? string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.new_luafunction(name) end

---
---Return an allocation number for the custom `whatsit`, indexed from 1.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L203-L206](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L203-L206)
---* Corresponding DTX source code: [ltluatex.dtx#L1219-L1230](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L1219-L1230)
---
---@param name? string
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.new_whatsit(name) end

---
---Sometimes (notably in the case of Lua attributes) it is necessary to
---access a register `by number` that has been allocated by TeX.
---This package provides a function to look up the relevant number
---using LuaTeX's internal tables. After for example
---`\newattribute\myattrib`, `\myattrib` would be defined by (say)
---`\myattrib=\attribute15`.  `luatexbase.registernumer("myattrib")`
---would then return the register number, $15$ in this case. If the string passed
---as argument does not correspond to a token defined by `\attributedef`,
---`\countdef` or similar commands, the Lua value `false` is returned.
---
---__Reference:__
---
---* Corresponding DTX source code: [ltluatex.dtx#L248-L256](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L248-L256)
---* Corresponding Lua source code: [ltluatex.dtx#L1144-L1171](https://github.com/latex3/latex2e/blob/ae4e1f74f2be2f8a13c0616287a8ff9009b72ca8/base/ltluatex.dtx#L1144-L1171)
---
---@param name string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualatex/luatexbase.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function luatexbase.registernumber(name) end
