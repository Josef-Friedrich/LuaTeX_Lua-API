---@meta

---The Lua source file is location in `texmf-dist/tex/latex/base/ltluatex.lua`

luatexbase = { }

---
---Registers the `function` into the `callback` with a textual
---`description` of the function. Functions are inserted into the callback
---in the order loaded.
------
---Source: [ltluatex.dtx#L348-L353](https://github.com/latex3/latex2e/blob/3a5cd1d84fd4474d57a8cb22cb882173f9268ce4/base/ltluatex.dtx#L348-L353)
---
---@param callback CallbackName
---@param func function
---@param description string
function luatexbase.add_to_callback(callback, func, description) end

---
---Removes the callback function with `description` from the `callback`.
---The removed function and its description
---are returned as the results of this function.
------
---Source: [ltluatex.dtx#L356-L360](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L356-L360)
---
---@param callback CallbackName
---@param description string
---
---@return function func
---@return string description
function luatexbase.remove_from_callback(callback, description) end

---
---Checks if the `description` matches one of the functions added
---to the list for the `callback`, returning a boolean value.
------
---Source: [ltluatex.dtx#L363-L366](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L363-L366)
---
---@param callback CallbackName
---@param description string
---
---@return boolean
function luatexbase.in_callback(callback, description) end

---
---Sets the `callback` to \texttt{false} as described in the Lua\TeX{}
---manual for the underlying \texttt{callback.register} built-in. Callbacks
---will only be set to false (and thus be skipped entirely) if there are
---no functions registered using the callback.
------
---Source: [ltluatex.dtx#L369-L374](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L369-L374)
---
---@param callback CallbackName
function luatexbase.disable_callback(callback) end

---
---A list of the descriptions of functions registered to the specified
---callback is returned. `{}` is returned if there are no functions registered.
------
---Source: [](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L377-L379)
---
---@param callback CallbackName
---
---@return table
function luatexbase.callback_descriptions(callback) end

---@alias CallbackType "list"|"data"|"exclusive"|"simple"|"reverselist"

---
---Defines a user defined callback. The last argument is a default
---function or false.
------
---Source: [ltluatex.dtx#L382-L385](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L382-L385)
---
---@param name string
---@param type CallbackType
---@param default function|false
function luatexbase.create_callback(name, type, default) end

---
---Calls a user defined callback with the supplied arguments.
------
---Source: [ltluatex.dtx#L388-L390](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L388-L390)
---
---
---@param name CallbackName|string
---@param ... any
---
---@return any ...
function luatexbase.call_callback(name, ...) end

---@alias DeclareCallbackRuleRelation
---|"before" # The callback function with description `first` will be executed before the function with description `second`.
---|"after" # The callback function with description `first` will be executed after the function with description `second`.
---|"incompatible-warning" # When both a callback function with description `first` and with description `second` is registered, then a warning is printed when the callback is executed.
---|"incompatible-error" # When both a callback function with description `first` and with description `second` is registered, then an error is printed when the callback is executed.
---|"unrelated" # Any previously declared callback rule between `first` and `second` gets disabled.

---
---Adds an ordering constraint between two callback functions for callback `name`.
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
------
---Source: [ltluatex.dtx#L393-L418](https://github.com/latex3/latex2e/blob/d7b2594ae58e125dc87b80e7f7e957855c69847b/base/ltluatex.dtx#L393-L418)
---
---@param name CallbackName|string
---@param first string
---@param relation DeclareCallbackRuleRelation
---@param second string
function luatexbase.declare_callback_rule(name, first, relation, second) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.module_error() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.module_info() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.module_warning() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.new_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.new_bytecode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.new_chunkname() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.new_luafunction() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.new_whatsit() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.provides_module() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.registernumber() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function luatexbase.uninstall() end
