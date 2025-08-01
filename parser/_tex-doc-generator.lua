-- Convert LuaCATS definitions files into TeX files
local inspect = require('inspect')
local parser = require('init')

local guide = parser.guide

local one_function = [[
---Docs
---
---```lua
---print('lol')
---```
local function test1(arg1) end
]]

local global_function = [[
---Docs
---
---```lua
---print('lol')
---```
---@param arg1 string # This is arg1
---@param arg2 string|number|boolean # This is arg2
function test1(arg1, arg2) end
]]

local global_table = [[
---Docs
my_table = {}
]]

local global_table_with_function = [[
---Docs for my_table
my_table = {}

---Docs for my_function
---
---@param arg1 string # Docs for arg1
function my_table.my_function (arg1) end

---Docs for my_function_2
function my_table.my_function_2 (arg2) end
]]

local multiple_variables = [[
---Docs
local var1 = true
local var2 = false
local var3 = "A string"
]]

local two_functions = [[
---Test Function
---@param arg1 string
---
---@return string
local function test1(arg1) end

---Test Function
---@param arg1 string
---
---@return string
local function test2(arg1) end
]]

---
---@param lua_code string
local function parse(lua_code)
    local state = parser.compile(lua_code, 'Lua')
    parser.luadoc.luadoc(state)
    return state
end

---
---@param value unknown
local function pinspect(value)
    print('\n\n\n\n\n\n')
    print(inspect(value))
end

---
---@param object parser.object
local function print_object(object)
    pinspect(object)

    print(object.type)

end

local state = parse(global_function)

---
---@param object parser.object
local function descend(object)
    -- pinspect(object)

    if type(object) == 'table' and object[1] then
        -- print(object.type, object[1])

        if object.value then
            for _, o in ipairs(object.value) do descend(o) end
        end

        -- pinspect(object.parent[1].parent.type)

        for _, o in ipairs(object) do descend(o) end
    else
        pinspect(object)
    end
end

-- for index, object in ipairs(state.ast) do descend(object) end

-- descend(state.ast)

-- parser.guide.eachSource(state.ast, function(object) print(object.type) end)

---
---@param object parser.object
---
---@return parser.object
local function getBindDoc(object)
    if object.bindDocs then return object.bindDocs[1] end
    error('No bindDocs')
end

---@param object parser.object
---@param type_name parser.ObjectType
---
---@return parser.object[][]
local function getObjectsByType(object, type_name)
    local type_cache = getBindDoc(object)._typeCache[type_name]
    if type_cache then return type_cache end
    error('No type cache')
end

-- ["doc.param"]
-- ["doc.param.name"] = { <table 3> },
-- ["doc.tailcomment"] = { <table 6> },
-- ["doc.type"] = { <table 4> },
-- ["doc.type.name"] = { <table 5> }

---
---@param object parser.object
---
---@return string[]
local function getDocTypeNames(object)
    local typeNames = getObjectsByType(object, "doc.type.name")
    local result = {}
    for _, type_name in ipairs(typeNames) do
        table.insert(result, type_name[1])
    end
    return result
end

local function document_functions()
    guide.eachSourceType(state.ast, 'function', function(object)
        -- print_object(object)

        local args = guide.getParams(object)
        for _, arg in ipairs(args) do
            -- pinspect(args)
            -- pinspect(arg)
            local arg_name = arg[1]
            print(arg_name)

            local argTypes = getDocTypeNames(arg)
            pinspect(argTypes)

            -- pinspect(arg.bindDocs[1]._typeCache)

        end
    end)

end

---pinspect(state.ast)
-- parser.luadoc.buildAndBindDoc(state.ast, test_function, state.ast.vstart)

document_functions()
