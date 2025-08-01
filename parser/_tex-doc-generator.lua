-- Convert LuaCATS definitions files into TeX files
local inspect = require("inspect")
local parser = require("init")

local guide = parser.guide

--- m = module to export
local m = {}

---
---Parse the given Lua code and return the state object.
---
---@param lua_code string # A string containing some documented Lua code.
function m.parse_state(lua_code)
  local state = parser.compile(lua_code, "Lua")
  parser.luadoc.luadoc(state)
  return state
end

---
---Parse the given Lua code and return an Abstract Syntax Tree (AST).
---
---@param lua_code string # A string containing some documented Lua code.
---
---@return parser.Node
function m.parse(lua_code)
  return m.parse_state(lua_code).ast
end

---
---@param value unknown
function m.pinspect(value)
  print("\n\n\n")
  print(inspect(value))
end

---
---@param node parser.Node
function m.print_object(node)
  m.pinspect(node)

  print(node.type)
end

---
---Descend the Abstract Syntax Tree
---
---@param object parser.Node
function m.descend(object)
  if type(object) == "table" and object[1] then
    if object.value then
      for _, o in ipairs(object.value) do
        m.descend(o)
      end
    end

    for _, o in ipairs(object) do
      m.descend(o)
    end
  else
    m.pinspect(object)
  end
end

---
---@param node parser.Node
---
---@return string?
function m.get_name(node)
  return guide.getKeyName(node)
end

---
---@param node parser.Node
---
---@return parser.Node
function m.get_bind_doc(node)
  if node.bindDocs then
    return node.bindDocs[1]
  end
  error("No bindDocs")
end

---@param node parser.Node
---@param node_type parser.NodeType
---
---@return parser.Node[][]
function m.get_objects_by_type(node, node_type)
  local type_cache = m.get_bind_doc(node)._typeCache[node_type]
  if type_cache then
    return type_cache
  end
  error("No type cache")
end

---
---@param object parser.Node
---
---@return string[]
local function get_doc_type_names(object)
  local typeNames = m.get_objects_by_type(object, "doc.type.name")
  local result = {}
  for _, type_name in ipairs(typeNames) do
    table.insert(result, type_name[1])
  end
  return result
end

function m.document_functions(ast)
  guide.eachSourceType(ast, "function", function(object)
    local args = guide.getParams(object)
    for _, arg in ipairs(args) do
      local arg_name = arg[1]
      print(arg_name)

      local argTypes = get_doc_type_names(arg)
      m.pinspect(argTypes)
    end
  end)
end

---
---Get the main node
---
---@param ast parser.Node
---
---@return parser.Node
function m.get_main(ast)
    return guide.getRoot(ast)
end

---
---Get all functions
---
---@param ast parser.Node
---
---@return parser.Node[]
function m.get_functions(ast)
  ---@type parser.Node[]
  local functions = {}
  guide.eachSourceType(ast, "function", function(object)
    table.insert(functions, object)
  end)
  return functions
end

---
---Get the first function
---
---@param ast parser.Node
---
---@return parser.Node
function m.get_first_function(ast)
  local functions = m.get_functions(ast)
  if not #functions then
    error("No functions found")
  end
  return functions[1]
end

---
---Get the first function
---
---@param ast parser.Node
---
---@return parser.Node[]
function m.get_variables(ast)
    --m.pinspect(ast)

    return {}

end

return m
