-- Convert LuaCATS definitions files into TeX files
local inspect = require("inspect")
local parser = require("init")

local guide = parser.guide

--- m = module to export
local m = {}

m.guide = guide

local function format_color_code(code)
  return string.char(27) .. "[" .. tostring(code) .. "m"
end

local ansi_colors = {
  red = format_color_code(31),
  green = format_color_code(32),
  yellow = format_color_code(32),
  blue = format_color_code(34),
  reset = format_color_code(0),
}

---
---@param color_code string
---@param text string
---
---@return string
local function colorize(color_code, text)
  return color_code .. tostring(text) .. ansi_colors.reset
end

---@param text string
---
---@return string
local function red(text)
  return colorize(ansi_colors.red, text)
end

---@param text string
---
---@return string
local function green(text)
  return colorize(ansi_colors.green, text)
end

---@param text string
---
---@return string
local function yellow(text)
  return colorize(ansi_colors.yellow, text)
end

---@param text string
---
---@return string
local function blue(text)
  return colorize(ansi_colors.blue, text)
end

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

---@param node parser.Node
function m.stringify(node)
  local secondary_value = nil
  local value = guide.getKeyName(node)
  if value == nil then
    value = ""
  end
  if node.type == "doc.comment" then
    value = node.comment.text
  elseif node.type == "doc.param.name" then
    value = node[1]
  elseif node.type == "doc.tailcomment" then
    value = node.text
  elseif node.type == "doc.type.code" then
    value = node[1]
    secondary_value = node.comment
  end
  local output = node.type .. " " .. red(value)
  if secondary_value then
    return output .. " " .. yellow(secondary_value)
  end
  return output
end

---
---Debug the Abstract Syntax Tree by traversing it and printing some basic informations.
---
---@param node parser.Node
---@param each_source? boolean # Use `guide.eachSource` instead of `guide.eachChild` to traverse.
function m.debug(node, each_source)
  ---@param node parser.Node
  ---@param depth integer
  local function descend(node, depth)
    local indent = string.rep("\t", depth)
    if not each_source then
      guide.eachChild(node, function(src)
        if src then
          print(indent, m.stringify(src))
          descend(src, depth + 1)
        end
      end)
    else
      guide.eachSource(node, function(src)
        if src ~= node then
          print(indent, m.stringify(src))
          descend(src, depth + 1)
        end
      end)
    end
  end
  print("\n")
  descend(node, 0)
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

local function reverse(tab)
  for i = 1, #tab // 2, 1 do
    tab[i], tab[#tab - i + 1] = tab[#tab - i + 1], tab[i]
  end
  return tab
end

---
---Get the path in a nested data structure
---
---For example a function in a nested table,
---
---@param node parser.Node
---
---@return string[]
function m.get_path(node)
  ---@type string[]
  local path = {}
  while node do
    local key = guide.getKeyName(node)
    if key then
      table.insert(path, key)
    end
    node = node.parent
  end
  return reverse(path)
end

return m
