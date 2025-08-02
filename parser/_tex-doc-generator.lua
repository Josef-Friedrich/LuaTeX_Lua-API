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

-- \e[0;30m 	Black
-- \e[0;31m 	Red
-- \e[0;32m 	Green
-- \e[0;33m 	Yellow
-- \e[0;34m 	Blue
-- \e[0;35m 	Purple
-- \e[0;36m 	Cyan
-- \e[0;37m 	White

local ansi_colors = {
  red = format_color_code(31),
  green = format_color_code(32),
  yellow = format_color_code(32),
  blue = format_color_code(34),
  reset = format_color_code(0),
}

---
---@param color_code string|integer
---@param text string
---
---@return string
local function colorize(color_code, text)
  if type(color_code) == "number" then
    color_code = format_color_code(color_code)
  end
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
  print(inspect(value, {
    process = function(item, path)
      -- Exclude some noisy fields
      if
        item == "bfinish"
        or item == "bstart"
        or item == "effect"
        or item == "finish"
        or item == "firstFinish"
        or item == "keyword"
        or item == "lines"
        or item == "range"
        or item == "start"
      then
        return
      end
      return item
    end,
  }))
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
  elseif node.type == "doc.see.name" then
    -- ---@see type # Tail comment.
    return node[1]
  elseif node.type == "doc.type.code" then
    -- ---|`a` # This is a.
    return node[1], node.comment
  end
  return m.get_name(node)
end

local node_index = 0

---@type table<string, integer>
local nodes = {}


local function reset_node_id_cache()
  node_index = 0
  nodes = {}
end

---
---@param node parser.Node
---
---@return integer
local function get_node_id(node)
  local node_hash = tostring(node)
  if nodes[node_hash] then
    return nodes[node_hash]
  end
  node_index = node_index + 1
  nodes[node_hash] = node_index
  return node_index
end

---
---@param node parser.Node
---
---@return string
local function get_colorized_node_id(node)
  local node_id = get_node_id(node)
  return colorize(node_id % 6 + 31, node_id)
end

---
---@param nodes parser.Node|parser.Node[]
---
---@return string
local function get_colorized_node_ids(nodes)
  if nodes.type then
    nodes = { nodes }
  end
  local output = {}
  for index, node in ipairs(nodes) do
    table.insert(output, get_colorized_node_id(node))
  end
  local node_id = get_node_id(node)
  return table.concat(output, ",")
end

---
---Stringify a node.
---
---@param node parser.Node
---@param colorize_output? boolean
---
---@return string
function m.stringify(node, colorize_output)
  ---@param text any
  ---@return string
  local function dummpy(text)
    return tostring(text)
  end

  local _red = dummpy
  local _yellow = dummpy
  if colorize_output then
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
  return get_colorized_node_id(node) .. ":" .. output
end

---@param ast parser.Node|parser.Node[]|unknown
---
---@return string?
function m.stringify_ast(ast)
  ---@param node parser.Node|unknown
  ---@return string?
  local function descend(node)
    if type(node) ~= "table" then
      return tostring(node)
    end
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
  if type(ast) == "table" and not ast.type then
    local output = {}
    for _, node in ipairs(ast) do
      local o = descend(node)
      if o then
        table.insert(output, o)
      end
    end
    return table.concat(output, ", ")
  end
  return descend(ast)
end

---@class DebugOptions
---@field traverse_source? boolean # Use `guide.eachSource` instead of `guide.eachChild` to traverse.
---@field additional? string|string[] # Show additional fields, for example `bindDocs`, `bindSource`, `bindGroup`
---@field inspect? parser.NodeType # print and inspect nodes of the specified type

---
---Debug the Abstract Syntax Tree by traversing it and printing some basic informations.
---
---@param node parser.Node
---@param opts? DebugOptions
function m.debug(node, opts)
  if type(opts) ~= "table" then
    opts = {}
  end
  ---@param node parser.Node
  ---@param depth integer
  local function descend(node, depth)
    local indent = string.rep("  ", depth)
    local callback = function(n)
      if n then
        ---@type string|nil
        local additional = ""

        if opts.additional then
          if type(opts.additional) == "string" then
            opts.additional = {
              opts.additional --[[@as string]],
            }
          end

          for _, field in ipairs(opts.additional) do
            if n[field] then
              additional = additional
                .. " "
                .. field .. ": "
                .. get_colorized_node_ids(n[field])
            end
          end
        end

        local output = indent .. m.stringify(n, true)
        if additional ~= "" then
          output = output .. additional
        end
        print(output)

        if opts.inspect and n.type == opts.inspect then
          m.pinspect(n)
        end

        descend(n, depth + 1)
      end
    end
    if not opts.traverse_source then
      guide.eachChild(node, callback)
    else
      guide.eachSource(node, callback)
    end
  end
  print("\n")
  reset_node_id_cache()
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
