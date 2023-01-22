local inspect = require('inspect')
require('lualibs')

---Print and inspect
---@param args any
local function printi(args) print(inspect(args)) end

---https://stackoverflow.com/a/29246308
---
---@param fun function
---@return string
local function get_function_args(fun)
    local args = {}
    local hook = debug.gethook()

    local arg_hook = function(...)
        local info = debug.getinfo(3)
        if 'pcall' ~= info.name then return end

        for i = 1, math.huge do
            local name, value = debug.getlocal(2, i)
            if '(*temporary)' == name then
                debug.sethook(hook)
                error('')
                return
            end
            table.insert(args, name)
        end
    end

    debug.sethook(arg_hook, "c")
    pcall(fun)

    return table.concat(args, ', ')
end

---
---@param s string
---@param ... any
local function printf(s, ...) print(string.format(s, ...)) end

---
---@param t table
---@return table
local function sort_keys(t)
    local keys = {}
    for k in pairs(t) do table.insert(keys, k) end
    table.sort(keys)
    return keys
end

---
---@param lib_name string
---@param lib table
---@param as_lua? boolean # Print as Lua code, not as Markdown
local function print_lib_members(lib_name, lib, as_lua)
    if as_lua == nil then as_lua = false end
    local member_names = sort_keys(lib)
    for _, member in ipairs(member_names) do
        local member_type = type(lib[member])
        if not as_lua then
            if member_type == 'table' then
                printf('- *`%s.%s` (%s)*', lib_name, member, member_type)
                printi(lib[member])
            elseif member_type == 'function' then
                printf('- __`%s.%s` (%s)__', lib_name, member, member_type)
            else
                printf('- `%s.%s` (%s)', lib_name, member, member_type)
            end
        else
            if member_type == 'function' then
                local args = get_function_args(lib[member])
                printf('function %s.%s(%s) end', lib_name, member, args)
            end
        end

    end
end

local lua_std = {
    _G = true,
    boolean = true,
    coroutine = true,
    debug = true,
    io = true,
    math = true,
    number = true,
    os = true,
    package = true,
    string = true,
    table = true,
    utf8 = true
}

local function print_global_namespace()
    local env = _ENV
    local lib_names = sort_keys(env)
    for _, lib_name in ipairs(lib_names) do
        if not lua_std[lib_name] then

            local lib = env[lib_name]
            if type(lib) == 'table' then
                printf('\n### %s\n', lib_name)
                print_lib_members(lib_name, env[lib_name])
            end
        end
    end
end

return function()
    print_global_namespace()
    print_lib_members('trackers', _ENV.trackers, true)
end
