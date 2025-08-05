--- m = module
local m = require("doc-generator")

local code_snippets = {
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
---Test Function 1
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

  --https://luals.github.io/wiki/annotations/#see
  see = [[
---@see another_function # A comment
local function fun1() end
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
---c = code (code_snippets)
---
---Shortcut for `m.parse`
---
---@param code_snippet string
---@param print_snippet? boolean
---
---@return parser.Node
local function c(code_snippet, print_snippet)
  local code = code_snippets[code_snippet]
  if not code then
    error("Unknown code snippet!")
  end
  if print_snippet then
    print('\n\n\n' .. code)
  end
  return m.parse(code)
end

it("Function: parse()", function()
  assert.truthy(m.parse(code_snippets["global_function"]))
end)

it("Function: get_sources()", function()
  local nodes = m.get_sources(c("two_functions"), "function")
  assert.truthy(nodes[1])
  assert.truthy(nodes[2])
  assert.is_nil(nodes[3])
end)

it("Function: get_first()", function()
  assert.equal(m.get_first(c("two_functions"), "function").type, "function")
  assert.equal(
    m.get_first(c("two_functions"), "doc.comment").type,
    "doc.comment"
  )
end)

describe("Function: get_content()", function()
  ---@param code_snippet string
  ---@param node_type parser.NodeType
  ---
  ---@return string?
  ---@return string?
  local function get_content(code_snippet, node_type)
    return m.get_content(m.get_first(c(code_snippet), node_type))
  end

  it("doc.comment", function()
    assert.equal(get_content("two_functions", "doc.comment"), "Test Function 1")
  end)

  it("doc.param.name", function()
    assert.equal(get_content("two_functions", "doc.param.name"), "arg1")
  end)

  it("doc.tailcomment", function()
    assert.equal(
      get_content("global_function", "doc.tailcomment"),
      "This is arg1"
    )
  end)

  it("doc.type.code", function()
    local primary, secondary = get_content("alias", "doc.type.code")
    assert.equal(primary, "a")
    assert.equal(secondary, "This is a")
  end)
end)

it("Function: get_main()", function()
  assert.equal(m.get_main(c("two_functions")).type, "main")

  assert.equal(
    m.get_main(m.get_first(c("global_table_with_function"), "function")).type,
    "main"
  )
end)

describe("Function: debug", function()
  ---
  ---@param code_snippet string
  local function debug(code_snippet)
    m.debug(
      c(code_snippet, true),
      { additional = { "bindSource", "bindDocs", "bindGroup" } }
    )
  end

  it("one_function", function()
    debug("one_function")
  end)

  it("alias", function()
    debug("alias")
  end)

  it("global_function", function()
    debug("global_function")
  end)

  it("global_table", function()
    debug("global_table")
  end)

  it("global_table_with_function", function()
    debug("global_table_with_function")
  end)
end)

it("Function: get_path", function()
  m.get_path(m.get_first(c("nested_function"), "function"))
  assert.same(
    m.get_path(m.get_first(c("nested_function"), "function")),
    { "level1", "level2", "level3" }
  )
end)

it("Function: pinspect", function()
  m.pinspect({ a = "a", b = "b" })
end)
