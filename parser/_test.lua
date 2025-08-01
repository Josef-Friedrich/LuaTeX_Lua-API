--- m = module
local m = require("_tex-doc-generator")

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
var1 = true
local var2 = 1.23
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
---Shortcut for `m.parse`
---
---@param lua_code string
---
---@return parser.Node
local function p(lua_code)
  return m.parse(lua_code)
end

it("Function: parse()", function()
  assert.truthy(m.parse(global_function))
end)

it("Function: get_functions()", function()
  local objects = m.get_functions(p(two_functions))
  assert.truthy(objects[1])
  assert.truthy(objects[2])
  assert.is_nil(objects[3])
end)

it("Function: get_variables()", function()
  local objects = m.get_variables(p(multiple_variables))
end)

it("Function: get_first_function()", function()
  assert.equal(m.get_first_function(p(two_functions)).type, "function")
end)

it("Function: get_main()", function()
  assert.equal(m.get_main(p(two_functions)).type, "main")

  assert.equal(
    m.get_main(m.get_first_function(p(global_table_with_function))).type,
    "main"
  )
end)
