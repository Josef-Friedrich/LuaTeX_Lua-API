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

---
---Get the string contents of a node.
---
---@param node parser.Node
---
---@return string? primary_content
---@return string? secondary_content
function m.get_content(node)
  if node.type == "doc.comment" then
    -- A line of the comment body starting with `-`
    local text = node.comment.text
    if string.sub(text, 1, 1) == "-" then
      text = string.sub(text, 2)
    end
    return text
  elseif node.type == "doc.param.name" then
    return node[1]
  elseif node.type == "doc.tailcomment" then
    -- @param a string # Tail comment
    return node.text
  elseif node.type == "doc.type.code" then
    -- ---|`a` # This is a.
    return node[1], node.comment
  end
  return m.get_name(node)
end

---
---Stringify a node.
---
---@param node parser.Node
---@param colorize? boolean
---
---@return string
function m.stringify(node, colorize)
  ---@param text any
  ---@return string
  local function dummpy(text)
    return tostring(text)
  end
  local _red = dummpy
  local _yellow = dummpy
  if colorize then
    _red = red
    _yellow = yellow
  end
  local primary, secondary = m.get_content(node)
  local output = node.type
  if primary then
    output = output .. ": " .. _red(primary)
  end
  if secondary then
    output = output .. ", " .. _yellow(secondary)
  end
  return output
end

---@param ast parser.Node
---
---@return string?
function m.stringify_ast(ast)
  ---@param node parser.Node
  ---@return string?
  local function descend(node)
    local output = ""
    guide.eachChild(node, function(n)
      if n then
        if output == "" then
          output = m.stringify(n, false)
        else
          output = output .. "; " .. m.stringify(n, false)
        end
        local descend_output = descend(n)
        if descend_output then
          output = output .. " (" .. descend_output .. ")"
        end
      end
    end)
    if output ~= "" then
      return output
    end
  end
  return descend(ast)
end

---
---Debug the Abstract Syntax Tree by traversing it and printing some basic informations.
---
---@param node parser.Node
---@param traverse_source? boolean # Use `guide.eachSource` instead of `guide.eachChild` to traverse.
function m.debug(node, traverse_source)
  ---@param node parser.Node
  ---@param depth integer
  local function descend(node, depth)
    local indent = string.rep("\t", depth)
    local callback = function(n)
      if n then
        print(indent, m.stringify(n, true))
        if n.bindDocs then
          for _, value in ipairs(n.bindDocs) do
            print(indent, m.stringify_ast(value))
          end
        end
        descend(n, depth + 1)
      end
    end
    if not traverse_source then
      guide.eachChild(node, callback)
    else
      guide.eachSource(node, callback)
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
  local result = guide.getKeyName(node)
  if result ~= nil then
    return tostring(result)
  end
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
function m.get_nodes_by_type(node, node_type)
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
  local typeNames = m.get_nodes_by_type(object, "doc.type.name")
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
---@param ast parser.Node
---@param t? parser.NodeType
---
---@return parser.Node[]
function m.get_sources(ast, t)
  ---@type parser.Node[]
  local nodes = {}

  if t ~= nil then
    guide.eachSourceType(ast, t, function(node)
      table.insert(nodes, node)
    end)
  else
    guide.eachSource(ast, function(node)
      table.insert(nodes, node)
    end)
  end

  return nodes
end

---
---@param ast parser.Node
---
---@return parser.Node[]
function m.get_childs(ast)
  ---@type parser.Node[]
  local nodes = {}
  guide.eachChild(ast, function(node)
    table.insert(nodes, node)
  end)
  return nodes
end

---
---Get the first node of the specified node type for the sources `guide.eachSourceType`
---
---@param ast parser.Node
---@param t parser.NodeType
---
---@return parser.Node
function m.get_first(ast, t)
  local nodes = m.get_sources(ast, t)
  if not nodes[1] then
    error("Node with type " .. t .. " not found!")
  end
  return nodes[1]
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
