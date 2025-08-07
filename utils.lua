---This file is intended as a library for the various example files.
local inspect = (function()
  --- https://raw.githubusercontent.com/kikito/inspect.lua/refs/heads/master/inspect.lua
  local _tl_compat
  if (tonumber((_VERSION or ""):match("[%d.]*$")) or 0) < 5.3 then
    local p, m = pcall(require, "compat53.module")
    if p then
      _tl_compat = m
    end
  end
  local math = _tl_compat and _tl_compat.math or math
  local string = _tl_compat and _tl_compat.string or string
  local table = _tl_compat and _tl_compat.table or table
  local inspect = { Options = {} }

  inspect._VERSION = "inspect.lua 3.1.0"
  inspect._URL = "http://github.com/kikito/inspect.lua"
  inspect._DESCRIPTION = "human-readable representations of tables"
  inspect._LICENSE = [[
  MIT LICENSE

  Copyright (c) 2022 Enrique García Cota

  Permission is hereby granted, free of charge, to any person obtaining a
  copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be included
  in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]
  inspect.KEY = setmetatable({}, {
    __tostring = function()
      return "inspect.KEY"
    end,
  })
  inspect.METATABLE = setmetatable({}, {
    __tostring = function()
      return "inspect.METATABLE"
    end,
  })

  local tostring = tostring
  local rep = string.rep
  local match = string.match
  local char = string.char
  local gsub = string.gsub
  local fmt = string.format

  local _rawget
  if rawget then
    _rawget = rawget
  else
    _rawget = function(t, k)
      return t[k]
    end
  end

  local function rawpairs(t)
    return next, t, nil
  end

  local function smartQuote(str)
    if match(str, '"') and not match(str, "'") then
      return "'" .. str .. "'"
    end
    return '"' .. gsub(str, '"', '\\"') .. '"'
  end

  local shortControlCharEscapes = {
    ["\a"] = "\\a",
    ["\b"] = "\\b",
    ["\f"] = "\\f",
    ["\n"] = "\\n",
    ["\r"] = "\\r",
    ["\t"] = "\\t",
    ["\v"] = "\\v",
    ["\127"] = "\\127",
  }
  local longControlCharEscapes = { ["\127"] = "\127" }
  for i = 0, 31 do
    local ch = char(i)
    if not shortControlCharEscapes[ch] then
      shortControlCharEscapes[ch] = "\\" .. i
      longControlCharEscapes[ch] = fmt("\\%03d", i)
    end
  end

  local function escape(str)
    return (
      gsub(
        gsub(gsub(str, "\\", "\\\\"), "(%c)%f[0-9]", longControlCharEscapes),
        "%c",
        shortControlCharEscapes
      )
    )
  end

  local luaKeywords = {
    ["and"] = true,
    ["break"] = true,
    ["do"] = true,
    ["else"] = true,
    ["elseif"] = true,
    ["end"] = true,
    ["false"] = true,
    ["for"] = true,
    ["function"] = true,
    ["goto"] = true,
    ["if"] = true,
    ["in"] = true,
    ["local"] = true,
    ["nil"] = true,
    ["not"] = true,
    ["or"] = true,
    ["repeat"] = true,
    ["return"] = true,
    ["then"] = true,
    ["true"] = true,
    ["until"] = true,
    ["while"] = true,
  }

  local function isIdentifier(str)
    return type(str) == "string"
      and not not str:match("^[_%a][_%a%d]*$")
      and not luaKeywords[str]
  end

  local flr = math.floor
  local function isSequenceKey(k, sequenceLength)
    return type(k) == "number"
      and flr(k) == k
      and 1 <= k
      and k <= sequenceLength
  end

  local defaultTypeOrders = {
    ["number"] = 1,
    ["boolean"] = 2,
    ["string"] = 3,
    ["table"] = 4,
    ["function"] = 5,
    ["userdata"] = 6,
    ["thread"] = 7,
  }

  local function sortKeys(a, b)
    local ta, tb = type(a), type(b)

    if ta == tb and (ta == "string" or ta == "number") then
      return a < b
    end

    local dta = defaultTypeOrders[ta] or 100
    local dtb = defaultTypeOrders[tb] or 100

    return dta == dtb and ta < tb or dta < dtb
  end

  local function getKeys(t)
    local seqLen = 1
    while _rawget(t, seqLen) ~= nil do
      seqLen = seqLen + 1
    end
    seqLen = seqLen - 1

    local keys, keysLen = {}, 0
    for k in rawpairs(t) do
      if not isSequenceKey(k, seqLen) then
        keysLen = keysLen + 1
        keys[keysLen] = k
      end
    end
    table.sort(keys, sortKeys)
    return keys, keysLen, seqLen
  end

  local function countCycles(x, cycles)
    if type(x) == "table" then
      if cycles[x] then
        cycles[x] = cycles[x] + 1
      else
        cycles[x] = 1
        for k, v in rawpairs(x) do
          countCycles(k, cycles)
          countCycles(v, cycles)
        end
        countCycles(getmetatable(x), cycles)
      end
    end
  end

  local function makePath(path, a, b)
    local newPath = {}
    local len = #path
    for i = 1, len do
      newPath[i] = path[i]
    end

    newPath[len + 1] = a
    newPath[len + 2] = b

    return newPath
  end

  local function processRecursive(process, item, path, visited)
    if item == nil then
      return nil
    end
    if visited[item] then
      return visited[item]
    end

    local processed = process(item, path)
    if type(processed) == "table" then
      local processedCopy = {}
      visited[item] = processedCopy
      local processedKey

      for k, v in rawpairs(processed) do
        processedKey =
          processRecursive(process, k, makePath(path, k, inspect.KEY), visited)
        if processedKey ~= nil then
          processedCopy[processedKey] =
            processRecursive(process, v, makePath(path, processedKey), visited)
        end
      end

      local mt = processRecursive(
        process,
        getmetatable(processed),
        makePath(path, inspect.METATABLE),
        visited
      )
      if type(mt) ~= "table" then
        mt = nil
      end
      setmetatable(processedCopy, mt)
      processed = processedCopy
    end
    return processed
  end

  local function puts(buf, str)
    buf.n = buf.n + 1
    buf[buf.n] = str
  end

  local Inspector = {}

  local Inspector_mt = { __index = Inspector }

  local function tabify(inspector)
    puts(
      inspector.buf,
      inspector.newline .. rep(inspector.indent, inspector.level)
    )
  end

  function Inspector:getId(v)
    local id = self.ids[v]
    local ids = self.ids
    if not id then
      local tv = type(v)
      id = (ids[tv] or 0) + 1
      ids[v], ids[tv] = id, id
    end
    return tostring(id)
  end

  function Inspector:putValue(v)
    local buf = self.buf
    local tv = type(v)
    if tv == "string" then
      puts(buf, smartQuote(escape(v)))
    elseif
      tv == "number"
      or tv == "boolean"
      or tv == "nil"
      or tv == "cdata"
      or tv == "ctype"
    then
      puts(buf, tostring(v))
    elseif tv == "table" and not self.ids[v] then
      local t = v

      if t == inspect.KEY or t == inspect.METATABLE then
        puts(buf, tostring(t))
      elseif self.level >= self.depth then
        puts(buf, "{...}")
      else
        if self.cycles[t] > 1 then
          puts(buf, fmt("<%d>", self:getId(t)))
        end

        local keys, keysLen, seqLen = getKeys(t)

        puts(buf, "{")
        self.level = self.level + 1

        for i = 1, seqLen + keysLen do
          if i > 1 then
            puts(buf, ",")
          end
          if i <= seqLen then
            puts(buf, " ")
            self:putValue(t[i])
          else
            local k = keys[i - seqLen]
            tabify(self)
            if isIdentifier(k) then
              puts(buf, k)
            else
              puts(buf, "[")
              self:putValue(k)
              puts(buf, "]")
            end
            puts(buf, " = ")
            self:putValue(t[k])
          end
        end

        local mt = getmetatable(t)
        if type(mt) == "table" then
          if seqLen + keysLen > 0 then
            puts(buf, ",")
          end
          tabify(self)
          puts(buf, "<metatable> = ")
          self:putValue(mt)
        end

        self.level = self.level - 1

        if keysLen > 0 or type(mt) == "table" then
          tabify(self)
        elseif seqLen > 0 then
          puts(buf, " ")
        end

        puts(buf, "}")
      end
    else
      puts(buf, fmt("<%s %d>", tv, self:getId(v)))
    end
  end

  function inspect.inspect(root, options)
    options = options or {}

    local depth = options.depth or math.huge
    local newline = options.newline or "\n"
    local indent = options.indent or "  "
    local process = options.process

    if process then
      root = processRecursive(process, root, {}, {})
    end

    local cycles = {}
    countCycles(root, cycles)

    local inspector = setmetatable({
      buf = { n = 0 },
      ids = {},
      cycles = cycles,
      depth = depth,
      level = 0,
      newline = newline,
      indent = indent,
    }, Inspector_mt)

    inspector:putValue(root)

    return table.concat(inspector.buf)
  end

  setmetatable(inspect, {
    __call = function(_, root, options)
      return inspect.inspect(root, options)
    end,
  })

  return inspect
end)()

---
---__ANSI color codes:__
---
---* `0`: Reset
---* `30`: Black
---* `31`: Red
---* `32`: Green
---* `33`: Yellow
---* `34`: Blue
---* `35`: Purple
---* `36`: Cyan
---* `37`: White
---@param color_code integer
local function format_ansi_color_code(color_code)
  return string.char(27) .. "[" .. tostring(color_code) .. "m"
end

---
---__ANSI color codes:__
---
---* `0`: Reset
---* `30`: Black
---* `31`: Red
---* `32`: Green
---* `33`: Yellow
---* `34`: Blue
---* `35`: Purple
---* `36`: Cyan
---* `37`: White
---
---@param color_code integer
---@param text unknown
---@param skip_colorize? boolean
---
---@return string
local function colorize(color_code, text, skip_colorize)
  if skip_colorize then
    return text
  end
  return format_ansi_color_code(color_code)
    .. tostring(text)
    .. format_ansi_color_code(0)
end

---Print the inspected version of the value
local function pinspect(value)
  print(inspect(value))
end

---
---@param names string[]
local function convert_string_array_to_alias_union(names)
  for index, name in ipairs(names) do
    print("---|`" .. name .. "`")
  end
end

---
---Returns the file extension from a given file path.
---
---@param path string: The file path to extract the extension from.
---
---@return string|nil: The file extension (including the dot), or nil if no extension is found.
local function get_file_extension(path)
  return path:match("^.+(%..+)$")
end

---
---https://stackoverflow.com/a/49405922
---
---@param path string The path of a directory
---
---@return fun(...): string, LuaFileSystem.Attributes
local function list_files_recursively(path)
  assert(path and path ~= "", "Please pass directory parameter")
  if string.sub(path, -1) == "/" then
    path = string.sub(path, 1, -2)
  end

  ---
  ---@param dir string
  local function yieldtree(dir)
    for entry in lfs.dir(dir) do
      if entry ~= "." and entry ~= ".." then
        local new_entry = dir .. "/" .. entry
        local attr = lfs.attributes(new_entry)
        coroutine.yield(new_entry, attr)
        if attr.mode == "directory" then
          yieldtree(new_entry)
        end
      end
    end
  end

  return coroutine.wrap(function()
    yieldtree(path)
  end)
end

local namespace = (function()
  ---https://stackoverflow.com/a/29246308
  ---
  ---@param fun function
  ---@return string
  local function get_function_args(fun)
    local args = {}
    local hook = debug.gethook()

    local arg_hook = function(...)
      local info = debug.getinfo(3)
      if "pcall" ~= info.name then
        return
      end

      for i = 1, math.huge do
        local name, value = debug.getlocal(2, i)
        if "(*temporary)" == name then
          debug.sethook(hook)
          error("")
          return
        end
        table.insert(args, name)
      end
    end

    debug.sethook(arg_hook, "c")
    pcall(fun)

    return table.concat(args, ", ")
  end

  ---
  ---@param s string
  ---@param ... any
  local function printf(s, ...)
    print(string.format(s, ...))
  end

  ---
  ---@param t table
  ---@return table
  local function sort_keys(t)
    local keys = {}
    for k in pairs(t) do
      table.insert(keys, k)
    end
    table.sort(keys)
    return keys
  end

  ---
  ---@param lib_name string
  ---@param lib table
  ---@param as_lua? boolean # Print as Lua code, not as Markdown
  local function print_lib_members(lib_name, lib, as_lua)
    if as_lua == nil then
      as_lua = false
    end
    local member_names = sort_keys(lib)
    for _, member in ipairs(member_names) do
      local member_type = type(lib[member])
      if not as_lua then
        if
          member_type == "table"
          and member ~= "__index"
          and member ~= "_M"
        then
          printf("- *`%s.%s` (%s)*", lib_name, member, member_type)
          print_lib_members(lib_name .. "." .. member, lib[member], as_lua)
        elseif member_type == "function" then
          printf("- __`%s.%s` (%s)__", lib_name, member, member_type)
        else
          printf("- `%s.%s` (%s)", lib_name, member, member_type)
        end
      else
        if member_type == "function" then
          local args = get_function_args(lib[member])
          printf("function %s.%s(%s) end", lib_name, member, args)
        end
      end
    end
  end

  local lua_std = {
    _G = true,
    arg = true,
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
    utf8 = true,
  }

  local function print_global_namespace()
    local env = _ENV
    local lib_names = sort_keys(env)
    for _, lib_name in ipairs(lib_names) do
      if not lua_std[lib_name] then
        local lib = env[lib_name]
        if type(lib) == "table" then
          printf("\n### %s\n", lib_name)
          print_lib_members(lib_name, env[lib_name])
        end
      end
    end
  end

  return print_global_namespace
end)()

---@class NodeTypeInfo
---@field id NodeTypeName
---@field subtype? WhatsitTypeName
---@field subtypes? table<integer, string>
---@field fields? table<integer, string>

---
---@param id NodeTypeName
---@param subtype? WhatsitTypeName
---@return NodeTypeInfo
local function get_node_info(id, subtype)
  ---
  ---Some luatex lua functions return an array table with a 0 index for the first element.
  ---
  ---inspect prints out:
  ---
  ---```lua
  ---{ "line", "box",
  ---  [0] = "unknown"
  ---}
  ---```
  ---
  ---@param tbl? table<integer, any>
  local function reindex_array(tbl)
    if not tbl then
      return
    end
    local new = {}
    for i = -3, 100 do
      if tbl[i] then
        table.insert(new, tbl[i] .. " (" .. i .. ")")
      end
    end
    return new
  end

  local function render_numberic(number)
    return " (" .. tostring(number) .. ")"
  end

  ---@type NodeTypeInfo
  local info = {
    id = id .. render_numberic(node.id(id)),
  }
  if subtype ~= nil then
    info.subtype = subtype .. render_numberic(node.subtype(subtype))
    info.fields = reindex_array(node.fields(node.id(id), node.subtype(subtype)))
  else
    info.subtypes = reindex_array(node.subtypes(id))
    info.fields = reindex_array(node.fields(node.id(id)))
  end
  return info
end

local assertions = (function()
  ---
  ---@param actual unknown
  ---@param expected unknown
  ---@param compare fun(actual: unknown, expected: unknown): boolean
  local function report_diff(compare, actual, expected)
    if not compare(actual, expected) then
      print("actual:", inspect(actual))
      print("expected:", inspect(expected))
      assert(false)
    else
      print(colorize(31, inspect(actual)))
    end
  end

  ---@param actual unknown
  ---@param expected unknown
  ---
  ---@return boolean
  local function compare_equality(actual, expected)
    return actual == expected
  end

  local function compare_numbers(a, b, epsilon)
    epsilon = epsilon or 1e-6
    return a == b or math.abs(a - b) < epsilon
  end

  ---
  ---Deeply compare two objects.
  ---
  ---Source: [gist.github.com/sapphyrus/fd9aeb871e3ce966cc4b0b969f62f539](https://gist.github.com/sapphyrus/fd9aeb871e3ce966cc4b0b969f62f539?permalink_comment_id=4563041#gistcomment-4563041)
  ---
  ---@param o1 unknown # An object of any type.
  ---@param o2 unknown # An object of any type.
  ---@param ignore_mt? boolean # Ignore the metatable.
  ---
  ---@return boolean # `true`, if the two specified objects are deeply equal.
  local function compare_tables(o1, o2, ignore_mt)
    -- same object
    if o1 == o2 then
      return true
    end

    local o1Type = type(o1)
    local o2Type = type(o2)
    --- different type
    if o1Type ~= o2Type then
      return false
    end
    --- same type but not table, already compared above
    if o1Type ~= "table" then
      return false
    end

    -- use metatable method
    if not ignore_mt then
      local mt1 = getmetatable(o1)
      if mt1 and mt1.__eq then
        -- compare using built in method
        return o1 == o2
      end
    end

    -- iterate over o1
    for key1, value1 in pairs(o1) do
      local value2 = o2[key1]
      if
        value2 == nil or compare_tables(value1, value2, ignore_mt) == false
      then
        return false
      end
    end

    --- check keys in o2 but missing from o1
    for key2, _ in pairs(o2) do
      if o1[key2] == nil then
        return false
      end
    end
    return true
  end

  return {
    ---@param actual unknown
    ---@param expected unknown
    equals = function(actual, expected)
      report_diff(compare_equality, actual, expected)
    end,

    ---@param actual unknown
    is_nil = function(actual)
      report_diff(compare_equality, actual, nil)
    end,

    ---@param actual unknown
    is_true = function(actual)
      report_diff(compare_equality, actual, true)
    end,

    is_false = function(actual)
      report_diff(compare_equality, actual, false)
    end,

    ---@param actual unknown
    ---@param expected unknown
    is_type = function(actual, expected)
      report_diff(compare_equality, type(actual), expected)
    end,

    ---@param actual unknown
    ---@param expected unknown
    numbers = function(actual, expected)
      report_diff(compare_numbers, actual, expected)
    end,

    ---@param actual unknown
    ---@param expected unknown
    same = function(actual, expected)
      report_diff(compare_tables, actual, expected)
    end,

    ---@param id NodeTypeName
    ---@param subtype? WhatsitTypeName
    ---@param expected unknown
    node_type = function(id, subtype, expected)
      local info = get_node_info(id, subtype)
      report_diff(compare_tables, info, expected)
    end,
  }
end)()

return {
  pinspect = pinspect,
  assert = assertions,
  print_global_namespace = namespace,
  convert_string_array_to_alias_union = convert_string_array_to_alias_union,
  list_files_recursively = list_files_recursively,
  get_file_extension = get_file_extension,
}
