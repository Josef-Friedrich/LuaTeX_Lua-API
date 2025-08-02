--- m = module
local m = require("_tex-doc-generator")

local lua_codes = {
  one_function = [[
---Docs
---
---```lua
---print('lol')
---```
local function test1(arg1) end
]],

  alias = [[
---@alias MyAlias
---|`a` # This is a
---|`b` # This is b
---|`c` # This is c
]],

  global_function = [[
---Docs
---
---```lua
---print('lol')
---```
---@param arg1 string # This is arg1
---@param arg2 string|number|boolean # This is arg2
function test1(arg1, arg2) end
]],

  global_table = [[
---Docs
my_table = {}
]],

  global_table_with_function = [[
---Docs for my_table
my_table = {}

---Docs for my_function
---
---@param arg1 string # Docs for arg1
function my_table.my_function (arg1) end

---Docs for my_function_2
function my_table.my_function_2 (arg2) end
]],

  multiple_variables = [[
---Docs
var1 = true
local var2 = 1.23
local var3 = "A string"
]],

  two_functions = [[
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
]],

  nested_function = [[
---Doc for level 1
level1 = {
  ---Doc for level 2
  level2 = {
    ---Function on level 3
    ---@param arg1 string # This is arg 1
    level3 = function(arg1) end,
  },
}
]],

  nested_function_undocumented = [[
level1 = {
  level2 = {
    level3 = function(arg1) end,
  },
}
]],
}

---
---Shortcut for `m.parse`
---
---@param lua_code string
---
---@return parser.Node
local function p(lua_code)
  return m.parse(lua_code)
end

---
---c = code (lua_codes)
---
---Shortcut for `m.parse`
---
---@param key_name string
---
---@return parser.Node
local function c(key_name)
  if not lua_codes[key_name] then
    error("Unknown lua code example")
  end
  return m.parse(lua_codes[key_name])
end

it("Function: parse()", function()
  assert.truthy(m.parse(lua_codes["global_function"]))
end)

it("Function: get_functions()", function()
  local objects = m.get_functions(c("two_functions"))
  assert.truthy(objects[1])
  assert.truthy(objects[2])
  assert.is_nil(objects[3])
end)

it("Function: get_first_function()", function()
  assert.equal(m.get_first_function(c("two_functions")).type, "function")
end)

it("Function: get_main()", function()
  assert.equal(m.get_main(c("two_functions")).type, "main")

  assert.equal(
    m.get_main(m.get_first_function(c("global_table_with_function"))).type,
    "main"
  )
end)

it("Function: debug", function()
  m.debug(c("nested_function"), false)
end)

it("Function: get_path", function()
  m.get_path(m.get_first_function(c("nested_function")))
  assert.same(
    m.get_path(m.get_first_function(c("nested_function"))),
    { "level1", "level2", "level3" }
  )
end)
