-- May be helpful https://github.com/LuaLS/lua-language-server/blob/master/script/cli/doc/init.lua

local inspect = require('inspect')
local parser = require('init')

local function pinspect(value)
  print(inspect(value))
end

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
function test1(arg1) end
]]

local global_table = [[
---Docs
my_table = {}
]]

local global_table_with_function = [[
---Docs for my_table
my_table = {}

---Docs for my_function
function my_table.my_function () end

---Docs for my_function_2
function my_table.my_function_2 () end
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

local state = parser.compile(global_table_with_function, 'Lua')
parser.luadoc.luadoc(state)

---pinspect(state.ast)
---
---@param object parser.object
local function descend(object)
  -- pinspect(object)

  if type(object) == 'table' and object[1] then
    --print(object.type, object[1])

    if object.value then
      for _, o in ipairs(object.value) do
        descend(o)
      end
    end

    -- pinspect(object.parent[1].parent.type)

    for _, o in ipairs(object) do
      descend(o)
    end
  else
    pinspect(object)
  end
end

-- for index, object in ipairs(state.ast) do descend(object) end

-- descend(state.ast)

parser.guide.eachSource(state.ast, function (object)
    print(object.type)
end)


---pinspect(state.ast)
-- parser.luadoc.buildAndBindDoc(state.ast, test_function, state.ast.vstart)
