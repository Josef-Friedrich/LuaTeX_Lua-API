---MIT License
---
---Copyright (c) 2018 最萌小汐 (The cutest Xiaoxi)
---
---Permission is hereby granted, free of charge, to any person obtaining a copy
---of this software and associated documentation files (the "Software"), to deal
---in the Software without restriction, including without limitation the rights
---to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
---copies of the Software, and to permit persons to whom the Software is
---furnished to do so, subject to the following conditions:
---
---The above copyright notice and this permission notice shall be included in all
---copies or substantial portions of the Software.
---
---THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
---IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
---FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
---AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
---LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
---OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
---SOFTWARE.

---Upstream repository: https://github.com/LuaLS/LuaParser
---
---Changes:
---
---* Merge into one file
---* Remove _ENV = nil
---* Translate some Chinese comments into English
---* Rename the class parser.object into parser.Node
---* Remove all code from lines.lua
---* Removed unused code in utilites
---* Remove unused function in luacode

local inspect = require("inspect")
local lpeglabel = require("lpeglabel")

---From https://github.com/LuaLS/LuaParser/blob/master/src/meta.lua
---@alias uri string
---@class noders

---https://github.com/LuaLS/LuaParser/blob/master/src/utility.lua
local utility = (function()
  local tostring = tostring
  local setmetatable = debug.setmetatable
  local error = error

  local m = {}

  ---裁剪字符串
  ---@param str string
  ---@param mode? '"left"'|'"right"'
  ---@return string
  function m.trim(str, mode)
    if mode == "left" then
      return (str:gsub("^%s+", ""))
    end
    if mode == "right" then
      return (str:gsub("%s+$", ""))
    end
    return (str:match("^%s*(.-)%s*$"))
  end

  ---@class switch
  ---@field cachedCases string[]
  ---@field map table<string, function>
  ---@field _default fun(...):...
  local switchMT = {}
  switchMT.__index = switchMT

  ---@param name string
  ---@return switch
  function switchMT:case(name)
    self.cachedCases[#self.cachedCases + 1] = name
    return self
  end

  ---@param callback async fun(...):...
  ---@return switch
  function switchMT:call(callback)
    for i = 1, #self.cachedCases do
      local name = self.cachedCases[i]
      self.cachedCases[i] = nil
      if self.map[name] then
        error("Repeated fields:" .. tostring(name))
      end
      self.map[name] = callback
    end
    return self
  end

  ---@param callback fun(...):...
  ---@return switch
  function switchMT:default(callback)
    self._default = callback
    return self
  end

  function switchMT:getMap()
    return self.map
  end

  ---@param name string
  ---@return boolean
  function switchMT:has(name)
    return self.map[name] ~= nil
  end

  ---@param name string
  ---@return ...
  function switchMT:__call(name, ...)
    local callback = self.map[name] or self._default
    if not callback then
      return
    end
    return callback(...)
  end

  ---@return switch
  function m.switch()
    local obj = setmetatable({
      map = {},
      cachedCases = {},
    }, switchMT)
    return obj
  end

  return m
end)()

---https://github.com/LuaLS/LuaParser/blob/master/src/parser/guide.lua
local guide = (function()
  local error = error
  local type = type

  ---@alias parser.NodeType
  ---|`main`#  {'#', 'docs'},
  ---|`repeat` # {'#', 'filter'},
  ---|`while` # {'filter', '#'},
  ---|`in` # {'keys', 'exps', '#'},
  ---|`loop` # {'loc', 'init', 'max', 'step', '#'},
  ---|`do` # {'#'},
  ---|`if` # {'#'},
  ---|`ifblock` # {'filter', '#'},
  ---|`elseifblock` # {'filter', '#'},
  ---|`elseblock` # {'#'},
  ---|`setfield` # {'node', 'field', 'value'},
  ---|`getfield` # {'node', 'field'},
  ---|`setmethod` # {'node', 'method', 'value'},
  ---|`getmethod` # {'node', 'method'},
  ---|`setindex` # {'node', 'index', 'value'},
  ---|`getindex` # {'node', 'index'},
  ---|`tableindex` # {'index', 'value'},
  ---|`tablefield` # {'field', 'value'},
  ---|`tableexp` # {'value'},
  ---|`setglobal` # {'value'},
  ---|`local` # {'attrs', 'value'},
  ---|`setlocal` # {'value'},
  ---|`return` # {'#'},
  ---|`select` # {'vararg'},
  ---|`table` # {'#'},
  ---|`function` # {'args', '#'},
  ---|`funcargs` # {'#'},
  ---|`paren` # {'exp'},
  ---|`call` # {'node', 'args'},
  ---|`callargs` # {'#'},
  ---|`list` # {'#'},
  ---|`binary` # {1, 2},
  ---|`unary` # {1},
  ---|`doc` # {'#'},
  ---|`doc.class` # {'class', '#extends', '#signs', 'docAttr', 'comment'},
  ---|`doc.type` # {'#types', 'name', 'comment'},
  ---|`doc.alias` # {'alias', 'docAttr', 'extends', 'comment'},
  ---|`doc.enum` # {'enum', 'extends', 'comment', 'docAttr'},
  ---|`doc.param` # {'param', 'extends', 'comment'},
  ---|`doc.return` # {'#returns', 'comment'},
  ---|`doc.field` # {'field', 'extends', 'comment'},
  ---|`doc.generic` # {'#generics', 'comment'},
  ---|`doc.generic.object` = {'generic', 'extends', 'comment'},
  ---|`doc.vararg` # {'vararg', 'comment'},
  ---|`doc.type.array` # {'node'},
  ---|`doc.type.function` # {'#args', '#returns', 'comment'},
  ---|`doc.type.table` # {'#fields', 'comment'},
  ---|`doc.type.literal` # {'node'},
  ---|`doc.type.arg` # {'name', 'extends'},
  ---|`doc.type.field` # {'name', 'extends'},
  ---|`doc.type.sign` # {'node', '#signs'},
  ---|`doc.overload` # {'overload', 'comment'},
  ---|`doc.see` # {'name', 'comment'},
  ---|`doc.version` # {'#versions'},
  ---|`doc.diagnostic` # {'#names'},
  ---|`doc.as` # {'as'},
  ---|`doc.cast` # {'name', '#casts'},
  ---|`doc.cast.block` # {'extends'},
  ---|`doc.operator` # {'op', 'exp', 'extends'},
  ---|`doc.meta` # {'name'},
  ---|`doc.attr` # {'#names'},
  ---|`doc.comment`
  ---|`doc.param.name`
  ---|`doc.tailcomment`
  ---|`doc.see.name`

  ---@class parser.Node
  ---@field bindDocs              parser.Node[]
  ---@field bindGroup             parser.Node[]
  ---@field bindSource            parser.Node
  ---@field value                 parser.Node
  ---@field parent                parser.Node
  ---@field type                  parser.NodeType
  ---@field special               string
  ---@field tag                   string
  ---@field args                  { [integer]: parser.Node, start: integer, finish: integer, type: string }
  ---@field locals                parser.Node[]
  ---@field returns?              parser.Node[]
  ---@field breaks?               parser.Node[]
  ---@field exps                  parser.Node[]
  ---@field keys                  parser.Node
  ---@field uri                   uri
  ---@field start                 integer
  ---@field finish                integer
  ---@field range                 integer
  ---@field effect                integer
  ---@field bstart                integer
  ---@field bfinish               integer
  ---@field attrs                 table
  ---@field specials              parser.Node[]
  ---@field labels                parser.Node[]
  ---@field node                  parser.Node
  ---@field field                 parser.Node
  ---@field method                parser.Node
  ---@field index                 parser.Node
  ---@field extends               parser.Node[]|parser.Node
  ---@field types                 parser.Node[]
  ---@field fields                parser.Node[]
  ---@field tkey                  parser.Node
  ---@field tvalue                parser.Node
  ---@field tindex                integer
  ---@field op                    parser.Node
  ---@field next                  parser.Node
  ---@field docParam              parser.Node
  ---@field sindex                integer
  ---@field name                  parser.Node
  ---@field call                  parser.Node
  ---@field closure               parser.Node
  ---@field proto                 parser.Node
  ---@field exp                   parser.Node
  ---@field alias                 parser.Node
  ---@field class                 parser.Node
  ---@field enum                  parser.Node
  ---@field vararg                parser.Node
  ---@field param                 parser.Node
  ---@field overload              parser.Node
  ---@field docParamMap           table<string, integer>
  ---@field upvalues              table<string, string[]>
  ---@field ref                   parser.Node[]
  ---@field returnIndex           integer
  ---@field assignIndex           integer
  ---@field docIndex              integer
  ---@field docs                  parser.Node
  ---@field state                 table
  ---@field comment               table
  ---@field optional              boolean
  ---@field max                   parser.Node
  ---@field init                  parser.Node
  ---@field step                  parser.Node
  ---@field redundant             { max: integer, passed: integer }
  ---@field filter                parser.Node
  ---@field loc                   parser.Node
  ---@field keyword               integer[]
  ---@field casts                 parser.Node[]
  ---@field mode?                 '+' | '-'
  ---@field hasGoTo?              true
  ---@field hasReturn?            true
  ---@field hasBreak?             true
  ---@field hasExit?              true
  ---@field [integer]             parser.Node|any
  ---@field dot                   { type: string, start: integer, finish: integer }
  ---@field colon                 { type: string, start: integer, finish: integer }
  ---@field _root         parser.Node
  ---@field _eachCache?   parser.Node[]
  ---@field _isGlobal?    boolean
  ---@field _typeCache?   parser.Node[][]
  ---@field text? string # doc.tailcomment

  ---@class guide
  ---@field debugMode boolean
  local m = {}

  m.ANY = { "<ANY>" }

  m.notNamePattern = "[^%w_\x80-\xff]"
  m.namePattern = "[%a_\x80-\xff][%w_\x80-\xff]*"
  m.namePatternFull = "^" .. m.namePattern .. "$"

  local blockTypes = {
    ["while"] = true,
    ["in"] = true,
    ["loop"] = true,
    ["repeat"] = true,
    ["do"] = true,
    ["function"] = true,
    ["if"] = true,
    ["ifblock"] = true,
    ["elseblock"] = true,
    ["elseifblock"] = true,
    ["main"] = true,
  }

  m.blockTypes = blockTypes

  local topBlockTypes = {
    ["while"] = true,
    ["function"] = true,
    ["if"] = true,
    ["ifblock"] = true,
    ["elseblock"] = true,
    ["elseifblock"] = true,
    ["main"] = true,
  }

  local breakBlockTypes = {
    ["while"] = true,
    ["in"] = true,
    ["loop"] = true,
    ["repeat"] = true,
    ["for"] = true,
  }

  local childMap = {
    ["main"] = { "#", "docs" },
    ["repeat"] = { "#", "filter" },
    ["while"] = { "filter", "#" },
    ["in"] = { "keys", "exps", "#" },
    ["loop"] = { "loc", "init", "max", "step", "#" },
    ["do"] = { "#" },
    ["if"] = { "#" },
    ["ifblock"] = { "filter", "#" },
    ["elseifblock"] = { "filter", "#" },
    ["elseblock"] = { "#" },
    ["setfield"] = { "node", "field", "value" },
    ["getfield"] = { "node", "field" },
    ["setmethod"] = { "node", "method", "value" },
    ["getmethod"] = { "node", "method" },
    ["setindex"] = { "node", "index", "value" },
    ["getindex"] = { "node", "index" },
    ["tableindex"] = { "index", "value" },
    ["tablefield"] = { "field", "value" },
    ["tableexp"] = { "value" },
    ["setglobal"] = { "value" },
    ["local"] = { "attrs", "value" },
    ["setlocal"] = { "value" },
    ["return"] = { "#" },
    ["select"] = { "vararg" },
    ["table"] = { "#" },
    ["function"] = { "args", "#" },
    ["funcargs"] = { "#" },
    ["paren"] = { "exp" },
    ["call"] = { "node", "args" },
    ["callargs"] = { "#" },
    ["list"] = { "#" },
    ["binary"] = { 1, 2 },
    ["unary"] = { 1 },

    ["doc"] = { "#" },
    ["doc.class"] = { "class", "#extends", "#signs", "docAttr", "comment" },
    ["doc.type"] = { "#types", "name", "comment" },
    ["doc.alias"] = { "alias", "docAttr", "extends", "comment" },
    ["doc.enum"] = { "enum", "extends", "comment", "docAttr" },
    ["doc.param"] = { "param", "extends", "comment" },
    ["doc.return"] = { "#returns", "comment" },
    ["doc.field"] = { "field", "extends", "comment" },
    ["doc.generic"] = { "#generics", "comment" },
    ["doc.generic.object"] = { "generic", "extends", "comment" },
    ["doc.vararg"] = { "vararg", "comment" },
    ["doc.type.array"] = { "node" },
    ["doc.type.function"] = { "#args", "#returns", "comment" },
    ["doc.type.table"] = { "#fields", "comment" },
    ["doc.type.literal"] = { "node" },
    ["doc.type.arg"] = { "name", "extends" },
    ["doc.type.field"] = { "name", "extends" },
    ["doc.type.sign"] = { "node", "#signs" },
    ["doc.overload"] = { "overload", "comment" },
    ["doc.see"] = { "name", "comment" },
    ["doc.version"] = { "#versions" },
    ["doc.diagnostic"] = { "#names" },
    ["doc.as"] = { "as" },
    ["doc.cast"] = { "name", "#casts" },
    ["doc.cast.block"] = { "extends" },
    ["doc.operator"] = { "op", "exp", "extends" },
    ["doc.meta"] = { "name" },
    ["doc.attr"] = { "#names" },
  }

  ---@type table<string, fun(obj: parser.Node, list: parser.Node[])>
  local compiledChildMap = setmetatable({}, {
    __index = function(self, name)
      local defs = childMap[name]
      if not defs then
        self[name] = false
        return false
      end
      local text = {}
      text[#text + 1] = "local obj, list = ..."
      for _, def in ipairs(defs) do
        if def == "#" then
          text[#text + 1] = [[
    for i = 1, #obj do
        list[#list+1] = obj[i]
    end
    ]]
        elseif type(def) == "string" and def:sub(1, 1) == "#" then
          local key = def:sub(2)
          text[#text + 1] = ([[
    local childs = obj.%s
    if childs then
        for i = 1, #childs do
            list[#list+1] = childs[i]
        end
    end
    ]]):format(key)
        elseif type(def) == "string" then
          text[#text + 1] = ("list[#list+1] = obj.%s"):format(def)
        else
          text[#text + 1] = ("list[#list+1] = obj[%q]"):format(def)
        end
      end
      local buf = table.concat(text, "\n")
      local f = load(buf, buf, "t")
      self[name] = f
      return f
    end,
  })

  local eachChildMap = setmetatable({}, {
    __index = function(self, name)
      local defs = childMap[name]
      if not defs then
        self[name] = false
        return false
      end
      local text = {}
      text[#text + 1] = "local obj, callback = ..."
      for _, def in ipairs(defs) do
        if def == "#" then
          text[#text + 1] = [[
    for i = 1, #obj do
        callback(obj[i])
    end
    ]]
        elseif type(def) == "string" and def:sub(1, 1) == "#" then
          local key = def:sub(2)
          text[#text + 1] = ([[
    local childs = obj.%s
    if childs then
        for i = 1, #childs do
            callback(childs[i])
        end
    end
    ]]):format(key)
        elseif type(def) == "string" then
          text[#text + 1] = ("callback(obj.%s)"):format(def)
        else
          text[#text + 1] = ("callback(obj[%q])"):format(def)
        end
      end
      local buf = table.concat(text, "\n")
      local f = load(buf, buf, "t")
      self[name] = f
      return f
    end,
  })

  m.actionMap = {
    ["main"] = { "#" },
    ["repeat"] = { "#" },
    ["while"] = { "#" },
    ["in"] = { "#" },
    ["loop"] = { "#" },
    ["if"] = { "#" },
    ["ifblock"] = { "#" },
    ["elseifblock"] = { "#" },
    ["elseblock"] = { "#" },
    ["do"] = { "#" },
    ["function"] = { "#" },
    ["funcargs"] = { "#" },
  }

  --- 是否是字面量
  ---@param obj table
  ---@return boolean
  function m.isLiteral(obj)
    local tp = obj.type
    return tp == "nil"
      or tp == "boolean"
      or tp == "string"
      or tp == "number"
      or tp == "integer"
      or tp == "table"
      or tp == "function"
      or tp == "doc.type.function"
      or tp == "doc.type.table"
      or tp == "doc.type.string"
      or tp == "doc.type.integer"
      or tp == "doc.type.boolean"
      or tp == "doc.type.code"
      or tp == "doc.type.array"
  end

  --- 获取字面量
  ---@param obj table
  ---@return any
  function m.getLiteral(obj)
    if m.isLiteral(obj) then
      return obj[1]
    end
    return nil
  end

  --- 寻找父函数
  ---@param obj parser.Node
  ---@return parser.Node?
  function m.getParentFunction(obj)
    for _ = 1, 10000 do
      obj = obj.parent
      if not obj then
        break
      end
      local tp = obj.type
      if tp == "function" or tp == "main" then
        return obj
      end
    end
    return nil
  end

  --- 寻找所在区块
  ---@param obj parser.Node
  ---@return parser.Node?
  function m.getBlock(obj)
    for _ = 1, 10000 do
      if not obj then
        return nil
      end
      local tp = obj.type
      if blockTypes[tp] then
        return obj
      end
      if obj == obj.parent then
        error("obj == obj.parent?" .. obj.type)
      end
      obj = obj.parent
    end
    -- make stack
    local stack = {}
    for _ = 1, 10 do
      stack[#stack + 1] = ("%s:%s"):format(obj.type, obj.finish)
      obj = obj.parent
      if not obj then
        break
      end
    end
    error("guide.getBlock overstack:" .. table.concat(stack, " -> "))
  end

  --- 寻找所在父区块
  ---@param obj parser.Node
  ---@return parser.Node?
  function m.getParentBlock(obj)
    for _ = 1, 10000 do
      obj = obj.parent
      if not obj then
        return nil
      end
      local tp = obj.type
      if blockTypes[tp] then
        return obj
      end
    end
    error("guide.getParentBlock overstack")
  end

  --- 寻找所在可break的父区块
  ---@param obj parser.Node
  ---@return parser.Node?
  function m.getBreakBlock(obj)
    for _ = 1, 10000 do
      obj = obj.parent
      if not obj then
        return nil
      end
      local tp = obj.type
      if breakBlockTypes[tp] then
        return obj
      end
      if tp == "function" then
        return nil
      end
    end
    error("guide.getBreakBlock overstack")
  end

  ---Find the body of the doc (寻找doc的主体)
  ---@param obj parser.Node
  ---@return parser.Node
  function m.getDocState(obj)
    for _ = 1, 10000 do
      local parent = obj.parent
      if not parent then
        return obj
      end
      if parent.type == "doc" then
        return obj
      end
      obj = parent
    end
    error("guide.getDocState overstack")
  end

  ---Find the parent type 寻找所在父类型
  ---@param obj parser.Node
  ---@param want parser.NodeType
  ---@return parser.Node?
  function m.getParentType(obj, want)
    for _ = 1, 10000 do
      obj = obj.parent
      if not obj then
        return nil
      end
      if want == obj.type then
        return obj
      end
    end
    error("guide.getParentType overstack")
  end

  ---Find the parent type (寻找所在父类型)
  ---
  ---@param obj parser.Node
  ---@param wants table<parser.NodeType, any>
  ---
  ---@return parser.Node?
  function m.getParentTypes(obj, wants)
    for _ = 1, 10000 do
      obj = obj.parent
      if not obj then
        return nil
      end
      if wants[obj.type] then
        return obj
      end
    end
    error("guide.getParentTypes overstack")
  end

  ---Find the root node (寻找根区块)
  ---
  ---@param obj parser.Node
  ---@return parser.Node
  function m.getRoot(obj)
    local source = obj
    if source._root then
      return source._root
    end
    for _ = 1, 10000 do
      if obj.type == "main" then
        source._root = obj
        return obj
      end
      if obj._root then
        source._root = obj._root
        return source._root
      end
      local parent = obj.parent
      if not parent then
        error("Can not find out root:" .. tostring(obj.type))
      end
      obj = parent
    end
    error("guide.getRoot overstack")
  end

  ---@param obj parser.Node | { uri: uri }
  ---@return uri
  function m.getUri(obj)
    if obj.uri then
      return obj.uri
    end
    local root = m.getRoot(obj)
    if root then
      return root.uri or ""
    end
    return ""
  end

  ---@return parser.Node?
  function m.getENV(source, start)
    if not start then
      start = 1
    end
    return m.getLocal(source, "_ENV", start)
      or m.getLocal(source, "@fenv", start)
  end

  --- 获取指定区块中可见的局部变量
  ---@param source parser.Node
  ---@param name string # 变量名
  ---@param pos integer # 可见位置
  ---@return parser.Node?
  function m.getLocal(source, name, pos)
    local block = source
    -- find nearest source
    for _ = 1, 10000 do
      if not block then
        return nil
      end
      if block.type == "main" then
        break
      end
      if
        block.start <= pos
        and block.finish >= pos
        and blockTypes[block.type]
      then
        break
      end
      block = block.parent
    end

    m.eachSourceContain(block, pos, function(src)
      if
        blockTypes[src.type]
        and (src.finish - src.start) < (block.finish - src.start)
      then
        block = src
      end
    end)

    for _ = 1, 10000 do
      if not block then
        break
      end
      local res
      if block.locals then
        for _, loc in ipairs(block.locals) do
          if loc[1] == name and loc.effect <= pos then
            if not res or res.effect < loc.effect then
              res = loc
            end
          end
        end
      end
      if res then
        return res
      end
      block = block.parent
    end
    return nil
  end

  --- 获取指定区块中所有的可见局部变量名称
  function m.getVisibleLocals(block, pos)
    local result = {}
    m.eachSourceContain(m.getRoot(block), pos, function(source)
      local locals = source.locals
      if locals then
        for i = 1, #locals do
          local loc = locals[i]
          local name = loc[1]
          if loc.effect <= pos then
            result[name] = loc
          end
        end
      end
    end)
    return result
  end

  --- 获取指定区块中可见的标签
  ---@param block parser.Node
  ---@param name string
  function m.getLabel(block, name)
    local current = m.getBlock(block)
    for _ = 1, 10000 do
      if not current then
        return nil
      end
      local labels = current.labels
      if labels then
        local label = labels[name]
        if label then
          return label
        end
      end
      if current.type == "function" then
        return nil
      end
      current = m.getParentBlock(current)
    end
    error("guide.getLocal overstack")
  end

  function m.getStartFinish(source)
    local start = source.start
    local finish = source.finish
    if source.bfinish and source.bfinish > finish then
      finish = source.bfinish
    end
    if not start then
      local first = source[1]
      if not first then
        return nil, nil
      end
      local last = source[#source]
      start = first.start
      finish = last.finish
    end
    return start, finish
  end

  function m.getRange(source)
    local start = source.vstart or source.start
    local finish = source.range or source.finish
    if source.bfinish and source.bfinish > finish then
      finish = source.bfinish
    end
    if not start then
      local first = source[1]
      if not first then
        return nil, nil
      end
      local last = source[#source]
      start = first.vstart or first.start
      finish = last.range or last.finish
    end
    return start, finish
  end

  --- 判断source是否包含position
  function m.isContain(source, position)
    local start, finish = m.getStartFinish(source)
    if not start then
      return false
    end
    return start <= position and finish >= position
  end

  --- 判断position在source的影响范围内
  ---
  --- 主要针对赋值等语句时，key包含value
  function m.isInRange(source, position)
    local start, finish = m.getRange(source)
    if not start then
      return false
    end
    return start <= position and finish >= position
  end

  function m.isBetween(source, tStart, tFinish)
    local start, finish = m.getStartFinish(source)
    if not start then
      return false
    end
    return start <= tFinish and finish >= tStart
  end

  function m.isBetweenRange(source, tStart, tFinish)
    local start, finish = m.getRange(source)
    if not start then
      return false
    end
    return start <= tFinish and finish >= tStart
  end

  --- 添加child
  local function addChilds(list, obj)
    local tp = obj.type
    if not tp then
      return
    end
    local f = compiledChildMap[tp]
    if not f then
      return
    end
    f(obj, list)
  end

  --- 遍历所有包含position的source
  ---@param ast parser.Node
  ---@param position integer
  ---@param callback fun(src: parser.Node): any
  function m.eachSourceContain(ast, position, callback)
    local list = { ast }
    local mark = {}
    while true do
      local len = #list
      if len == 0 then
        return
      end
      local obj = list[len]
      list[len] = nil
      if not mark[obj] then
        mark[obj] = true
        if m.isInRange(obj, position) then
          if m.isContain(obj, position) then
            local res = callback(obj)
            if res ~= nil then
              return res
            end
          end
          addChilds(list, obj)
        end
      end
    end
  end

  --- 遍历所有在某个范围内的source
  function m.eachSourceBetween(ast, start, finish, callback)
    local list = { ast }
    local mark = {}
    while true do
      local len = #list
      if len == 0 then
        return
      end
      local obj = list[len]
      list[len] = nil
      if not mark[obj] then
        mark[obj] = true
        if m.isBetweenRange(obj, start, finish) then
          if m.isBetween(obj, start, finish) then
            local res = callback(obj)
            if res ~= nil then
              return res
            end
          end
          addChilds(list, obj)
        end
      end
    end
  end

  ---
  ---@param ast parser.Node
  ---
  ---@return table<parser.NodeType, parser.Node[]>
  function m.getSourceTypeCache(ast)
    local cache = ast._typeCache
    if not cache then
      cache = {}
      ast._typeCache = cache
      m.eachSource(ast, function(source)
        local tp = source.type
        if not tp then
          return
        end
        local myCache = cache[tp]
        if not myCache then
          myCache = {}
          cache[tp] = myCache
        end
        myCache[#myCache + 1] = source
      end)
    end
    return cache
  end

  ---Traverse all sources of the specified type (遍历所有指定类型的source)
  ---
  ---@param ast parser.Node
  ---@param ty parser.NodeType
  ---@param callback fun(src: parser.Node): any
  ---
  ---@return any
  function m.eachSourceType(ast, ty, callback)
    local cache = m.getSourceTypeCache(ast)
    local myCache = cache[ty]
    if not myCache then
      return
    end
    for i = 1, #myCache do
      local res = callback(myCache[i])
      if res ~= nil then
        return res
      end
    end
  end

  ---@param ast parser.Node
  ---@param tps parser.NodeType[]
  ---@param callback fun(src: parser.Node)
  function m.eachSourceTypes(ast, tps, callback)
    local cache = m.getSourceTypeCache(ast)
    for x = 1, #tps do
      local tpCache = cache[tps[x]]
      if tpCache then
        for i = 1, #tpCache do
          callback(tpCache[i])
        end
      end
    end
  end

  ---
  ---Iterate over all sources (遍历所有的source)
  ---
  ---@param ast parser.Node
  ---@param callback fun(src: parser.Node): boolean?
  function m.eachSource(ast, callback)
    local cache = ast._eachCache
    if not cache then
      cache = { ast }
      ast._eachCache = cache
      local mark = {}
      local index = 1
      while true do
        local obj = cache[index]
        if not obj then
          break
        end
        index = index + 1
        if not mark[obj] then
          mark[obj] = true
          addChilds(cache, obj)
        end
      end
    end
    for i = 1, #cache do
      local res = callback(cache[i])
      if res == false then
        return
      end
    end
  end

  ---@param source   parser.Node
  ---@param callback fun(src: parser.Node)
  function m.eachChild(source, callback)
    local f = eachChildMap[source.type]
    if not f then
      return
    end
    f(source, callback)
  end

  ---
  ---Get the specified special (获取指定的 special)
  ---
  ---@param ast parser.Node
  ---@param name string
  ---@param callback fun(src: parser.Node)
  function m.eachSpecialOf(ast, name, callback)
    local root = m.getRoot(ast)
    local state = root.state
    if not state.specials then
      return
    end
    local specials = state.specials[name]
    if not specials then
      return
    end
    for i = 1, #specials do
      callback(specials[i])
    end
  end

  --- 将 position 拆分成行号与列号
  ---
  --- 第一行是0
  ---@param position integer
  ---@return integer row
  ---@return integer col
  function m.rowColOf(position)
    return position // 10000, position % 10000
  end

  --- 将行列合并为 position
  ---
  --- 第一行是0
  ---@param row integer
  ---@param col integer
  ---@return integer
  function m.positionOf(row, col)
    return row * 10000 + math.min(col, 10000 - 1)
  end

  function m.positionToOffsetByLines(lines, position)
    local row, col = m.rowColOf(position)
    if row < 0 then
      return 0
    end
    if row > #lines then
      return lines.size
    end
    local offset = lines[row] + col - 1
    if lines[row + 1] and offset >= lines[row + 1] then
      return lines[row + 1] - 1
    elseif offset > lines.size then
      return lines.size
    end
    return offset
  end

  --- 返回全文光标位置
  ---@param state any
  ---@param position integer
  function m.positionToOffset(state, position)
    return m.positionToOffsetByLines(state.lines, position)
  end

  ---@param lines integer[]
  ---@param offset integer
  function m.offsetToPositionByLines(lines, offset)
    local left = 0
    local right = #lines
    local row = 0
    while true do
      row = (left + right) // 2
      if row == left then
        if right ~= left then
          if lines[right] - 1 <= offset then
            row = right
          end
        end
        break
      end
      local start = lines[row] - 1
      if start > offset then
        right = row
      else
        left = row
      end
    end
    local col = offset - lines[row] + 1
    return m.positionOf(row, col)
  end

  function m.offsetToPosition(state, offset)
    return m.offsetToPositionByLines(state.lines, offset)
  end

  function m.getLineRange(state, row)
    if not state.lines[row] then
      return 0
    end
    local nextLineStart = state.lines[row + 1] or #state.lua
    for i = nextLineStart - 1, state.lines[row], -1 do
      local w = state.lua:sub(i, i)
      if w ~= "\r" and w ~= "\n" then
        return i - state.lines[row] + 1
      end
    end
    return 0
  end

  local assignTypeMap = {
    ["setglobal"] = true,
    ["local"] = true,
    ["self"] = true,
    ["setlocal"] = true,
    ["setfield"] = true,
    ["setmethod"] = true,
    ["setindex"] = true,
    ["tablefield"] = true,
    ["tableindex"] = true,
    ["tableexp"] = true,
    ["label"] = true,
    ["doc.class"] = true,
    ["doc.alias"] = true,
    ["doc.enum"] = true,
    ["doc.field"] = true,
    ["doc.class.name"] = true,
    ["doc.alias.name"] = true,
    ["doc.enum.name"] = true,
    ["doc.field.name"] = true,
    ["doc.type.field"] = true,
    ["doc.type.array"] = true,
  }
  function m.isAssign(source)
    local tp = source.type
    if assignTypeMap[tp] then
      return true
    end
    if tp == "call" then
      local special = m.getSpecial(source.node)
      if special == "rawset" then
        return true
      end
    end
    return false
  end

  local getTypeMap = {
    ["getglobal"] = true,
    ["getlocal"] = true,
    ["getfield"] = true,
    ["getmethod"] = true,
    ["getindex"] = true,
  }
  function m.isGet(source)
    local tp = source.type
    if getTypeMap[tp] then
      return true
    end
    if tp == "call" then
      local special = m.getSpecial(source.node)
      if special == "rawget" then
        return true
      end
    end
    return false
  end

  function m.getSpecial(source)
    if not source then
      return nil
    end
    return source.special
  end

  function m.getKeyNameOfLiteral(obj)
    if not obj then
      return nil
    end
    local tp = obj.type
    if tp == "field" or tp == "method" then
      return obj[1]
    elseif
      tp == "string"
      or tp == "number"
      or tp == "integer"
      or tp == "boolean"
      or tp == "doc.type.integer"
      or tp == "doc.type.string"
      or tp == "doc.type.boolean"
    then
      return obj[1]
    end
  end

  ---
  ---Get the name of a node (mostly from `node[1]`)
  ---
  ---@param obj parser.Node
  ---
  ---@return (string|number)?
  function m.getKeyName(obj)
    if not obj then
      return nil
    end
    local tp = obj.type
    if tp == "getglobal" or tp == "setglobal" then
      return obj[1]
    elseif
      tp == "local"
      or tp == "self"
      or tp == "getlocal"
      or tp == "setlocal"
    then
      return obj[1]
    elseif tp == "getfield" or tp == "setfield" or tp == "tablefield" then
      if obj.field then
        return obj.field[1]
      end
    elseif tp == "getmethod" or tp == "setmethod" then
      if obj.method then
        return obj.method[1]
      end
    elseif tp == "getindex" or tp == "setindex" or tp == "tableindex" then
      return m.getKeyNameOfLiteral(obj.index)
    elseif tp == "tableexp" then
      return obj.tindex
    elseif tp == "field" or tp == "method" then
      return obj[1]
    elseif tp == "doc.class" then
      return obj.class[1]
    elseif tp == "doc.alias" then
      return obj.alias[1]
    elseif tp == "doc.enum" then
      return obj.enum[1]
    elseif tp == "doc.field" then
      return obj.field[1]
    elseif
      tp == "doc.field.name"
      or tp == "doc.type.name"
      or tp == "doc.class.name"
      or tp == "doc.alias.name"
      or tp == "doc.enum.name"
      or tp == "doc.extends.name"
    then
      return obj[1]
    elseif tp == "doc.type.field" then
      return m.getKeyName(obj.name)
    end
    return m.getKeyNameOfLiteral(obj)
  end

  ---@param obj parser.Node
  ---
  ---@return (`string`|`number`|`integer`|`boolean`)?
  function m.getKeyTypeOfLiteral(obj)
    if not obj then
      return nil
    end
    local tp = obj.type
    if tp == "field" or tp == "method" then
      return "string"
    elseif tp == "string" then
      return "string"
    elseif tp == "number" then
      return "number"
    elseif tp == "integer" then
      return "integer"
    elseif tp == "boolean" then
      return "boolean"
    end
  end

  ---@param obj parser.Node
  ---
  ---@return (`local`|`nil`|`number`|`string`|`boolean`|`table`|`function`|`thread`|`userdata`)?
  function m.getKeyType(obj)
    if not obj then
      return nil
    end
    local tp = obj.type
    if tp == "getglobal" or tp == "setglobal" then
      return "string"
    elseif
      tp == "local"
      or tp == "self"
      or tp == "getlocal"
      or tp == "setlocal"
    then
      return "local"
    elseif tp == "getfield" or tp == "setfield" or tp == "tablefield" then
      return "string"
    elseif tp == "getmethod" or tp == "setmethod" then
      return "string"
    elseif tp == "getindex" or tp == "setindex" or tp == "tableindex" then
      return m.getKeyTypeOfLiteral(obj.index)
    elseif tp == "tableexp" then
      return "integer"
    elseif tp == "field" or tp == "method" then
      return "string"
    elseif tp == "doc.class" then
      return "string"
    elseif tp == "doc.alias" then
      return "string"
    elseif tp == "doc.enum" then
      return "string"
    elseif tp == "doc.field" then
      return type(obj.field[1])
    elseif tp == "doc.type.field" then
      return type(obj.name[1])
    end
    if tp == "doc.field.name" then
      return type(obj[1])
    end
    return m.getKeyTypeOfLiteral(obj)
  end

  ---是否是全局变量（包括 _G.XXX 形式）
  ---@param source parser.Node
  ---@return boolean
  function m.isGlobal(source)
    if source._isGlobal ~= nil then
      return source._isGlobal
    end
    if source.tag == "_ENV" then
      source._isGlobal = true
      return false
    end
    if source.special == "_G" then
      source._isGlobal = true
      return true
    end
    if source.type == "setglobal" or source.type == "getglobal" then
      if source.node and source.node.tag == "_ENV" then
        source._isGlobal = true
        return true
      end
    end
    if
      source.type == "setfield"
      or source.type == "getfield"
      or source.type == "setindex"
      or source.type == "getindex"
    then
      local current = source
      while current do
        local node = current.node
        if not node then
          break
        end
        if node.special == "_G" then
          source._isGlobal = true
          return true
        end
        if m.getKeyName(node) ~= "_G" then
          break
        end
        current = node
      end
    end
    if source.type == "call" then
      local node = source.node
      if node.special == "rawget" or node.special == "rawset" then
        if source.args and source.args[1] then
          local isGlobal = source.args[1].special == "_G"
          source._isGlobal = isGlobal
          return isGlobal
        end
      end
    end
    source._isGlobal = false
    return false
  end

  function m.isInString(ast, position)
    return m.eachSourceContain(ast, position, function(source)
      if source.type == "string" and source.start < position then
        return true
      end
    end)
  end

  function m.isInComment(ast, offset)
    for _, com in ipairs(ast.state.comms) do
      if offset >= com.start and offset <= com.finish then
        return true
      end
    end
    return false
  end

  function m.isOOP(source)
    if source.type == "setmethod" or source.type == "getmethod" then
      return true
    end
    if
      source.type == "method"
      or source.type == "field"
      or source.type == "function"
    then
      return m.isOOP(source.parent)
    end
    return false
  end

  local basicTypeMap = {
    ["unknown"] = true,
    ["any"] = true,
    ["true"] = true,
    ["false"] = true,
    ["nil"] = true,
    ["boolean"] = true,
    ["integer"] = true,
    ["number"] = true,
    ["string"] = true,
    ["table"] = true,
    ["function"] = true,
    ["thread"] = true,
    ["userdata"] = true,
  }

  ---@param str string
  ---@return boolean
  function m.isBasicType(str)
    return basicTypeMap[str] == true
  end

  ---@param source parser.Node
  ---@return boolean
  function m.isBlockType(source)
    return blockTypes[source.type] == true
  end

  ---@param source parser.Node
  ---@return parser.Node?
  function m.getSelfNode(source)
    if source.type == "getlocal" or source.type == "setlocal" then
      source = source.node
    end
    if source.type ~= "self" then
      return nil
    end
    local args = source.parent
    if args.type == "callargs" then
      local call = args.parent
      if call.type ~= "call" then
        return nil
      end
      local getmethod = call.node
      if getmethod.type ~= "getmethod" then
        return nil
      end
      return getmethod.node
    end
    if args.type == "funcargs" then
      return m.getFunctionSelfNode(args.parent)
    end
    return nil
  end

  ---@param func parser.Node
  ---@return parser.Node?
  function m.getFunctionSelfNode(func)
    if func.type ~= "function" then
      return nil
    end
    local parent = func.parent
    if parent.type == "setmethod" or parent.type == "setfield" then
      return parent.node
    end
    return nil
  end

  ---@param source parser.Node
  ---@return parser.Node?
  function m.getTopBlock(source)
    for _ = 1, 1000 do
      local block = source.parent
      if not block then
        return nil
      end
      if topBlockTypes[block.type] then
        return block
      end
      source = block
    end
    return nil
  end

  ---@param source parser.Node
  ---@return boolean
  function m.isParam(source)
    if source.type ~= "local" and source.type ~= "self" then
      return false
    end
    if source.parent.type ~= "funcargs" then
      return false
    end
    return true
  end

  ---
  ---Get the arguments/parameters (args) from the object types `call`, `callargs`, `function` or `funcargs`.
  ---
  ---@param source parser.Node
  ---@return parser.Node[]?
  function m.getParams(source)
    if source.type == "call" then
      local args = source.args
      if not args then
        return
      end
      assert(args.type == "callargs", "call.args type is't callargs")
      return args
    elseif source.type == "callargs" then
      return source
    elseif source.type == "function" then
      local args = source.args
      if not args then
        return
      end
      assert(args.type == "funcargs", "function.args type is't callargs")
      return args
    end
    return nil
  end

  ---@param source parser.Node
  ---@param index integer
  ---@return parser.Node?
  function m.getParam(source, index)
    local args = m.getParams(source)
    return args and args[index] or nil
  end

  function m.hasAttribute(source, name)
    if not source then
      return false
    end
    local attrs = source.attrs
    if not attrs or attrs.type ~= "localattrs" then
      return false
    end
    for _, attr in ipairs(attrs) do
      if attr[1] == name then
        return true
      end
    end
    return false
  end

  return m
end)()

---https://github.com/LuaLS/LuaParser/blob/master/src/parser/tokens.lua
local tokens = (function()
  local m = lpeglabel

  local Sp = m.S(" \t\v\f")
  local Nl = m.P("\r\n") + m.S("\r\n")
  local Number = m.R("09") ^ 1
  local Word = m.R("AZ", "az", "__", "\x80\xff")
    * m.R("AZ", "az", "09", "__", "\x80\xff") ^ 0
  local Symbol = m.P("==")
    + m.P("~=")
    + m.P("--")
    -- non-standard:
    + m.P("<<=")
    + m.P(">>=")
    + m.P("//=")
    -- end non-standard
    + m.P("<<")
    + m.P(">>")
    + m.P("<=")
    + m.P(">=")
    + m.P("//")
    + m.P("...")
    + m.P("..")
    + m.P("::")
    -- non-standard:
    + m.P("!=")
    + m.P("&&")
    + m.P("||")
    + m.P("/*")
    + m.P("*/")
    + m.P("+=")
    + m.P("-=")
    + m.P("*=")
    + m.P("%=")
    + m.P("&=")
    + m.P("|=")
    + m.P("^=")
    + m.P("/=")
    -- end non-standard
    -- singles
    + m.S("+-*/!#%^&()={}[]|\\'\":;<>,.?~`")
  local Unknown = (1 - Number - Word - Symbol - Sp - Nl) ^ 1
  local Token = m.Cp() * m.C(Nl + Number + Word + Symbol + Unknown)

  local Parser = m.Ct((Sp ^ 1 + Token) ^ 0)

  return function(lua)
    local results = Parser:match(lua)
    return results
  end
end)()

---https://github.com/LuaLS/LuaParser/blob/master/src/parser/relabel.lua
local relabel = (function()
  -- $Id: re.lua,v 1.44 2013/03/26 20:11:40 roberto Exp $

  -- imported functions and modules
  local tonumber, type, print, error = tonumber, type, print, error
  local pcall = pcall
  local setmetatable = setmetatable
  local tinsert, concat = table.insert, table.concat
  local rep = string.rep
  local m = lpeglabel

  -- 'm' will be used to parse expressions, and 'mm' will be used to
  -- create expressions; that is, 're' runs on 'm', creating patterns
  -- on 'mm'
  local mm = m

  -- pattern's metatable
  local mt = getmetatable(mm.P(0))

  local any = m.P(1)
  local dummy = mm.P(false)

  local errinfo = {
    NoPatt = "no pattern found",
    ExtraChars = "unexpected characters after the pattern",

    ExpPatt1 = "expected a pattern after '/'",

    ExpPatt2 = "expected a pattern after '&'",
    ExpPatt3 = "expected a pattern after '!'",

    ExpPatt4 = "expected a pattern after '('",
    ExpPatt5 = "expected a pattern after ':'",
    ExpPatt6 = "expected a pattern after '{~'",
    ExpPatt7 = "expected a pattern after '{|'",

    ExpPatt8 = "expected a pattern after '<-'",

    ExpPattOrClose = "expected a pattern or closing '}' after '{'",

    ExpNumName = "expected a number, '+', '-' or a name (no space) after '^'",
    ExpCap = "expected a string, number, '{}' or name after '->'",

    ExpName1 = "expected the name of a rule after '=>'",
    ExpName2 = "expected the name of a rule after '=' (no space)",
    ExpName3 = "expected the name of a rule after '<' (no space)",

    ExpLab1 = "expected a label after '{'",

    ExpNameOrLab = "expected a name or label after '%' (no space)",

    ExpItem = "expected at least one item after '[' or '^'",

    MisClose1 = "missing closing ')'",
    MisClose2 = "missing closing ':}'",
    MisClose3 = "missing closing '~}'",
    MisClose4 = "missing closing '|}'",
    MisClose5 = "missing closing '}'", -- for the captures

    MisClose6 = "missing closing '>'",
    MisClose7 = "missing closing '}'", -- for the labels

    MisClose8 = "missing closing ']'",

    MisTerm1 = "missing terminating single quote",
    MisTerm2 = "missing terminating double quote",
  }

  local function expect(pattern, label)
    return pattern + m.T(label)
  end

  -- Pre-defined names
  local Predef = { nl = m.P("\n") }

  local mem
  local fmem
  local gmem

  local function updatelocale()
    mm.locale(Predef)
    Predef.a = Predef.alpha
    Predef.c = Predef.cntrl
    Predef.d = Predef.digit
    Predef.g = Predef.graph
    Predef.l = Predef.lower
    Predef.p = Predef.punct
    Predef.s = Predef.space
    Predef.u = Predef.upper
    Predef.w = Predef.alnum
    Predef.x = Predef.xdigit
    Predef.A = any - Predef.a
    Predef.C = any - Predef.c
    Predef.D = any - Predef.d
    Predef.G = any - Predef.g
    Predef.L = any - Predef.l
    Predef.P = any - Predef.p
    Predef.S = any - Predef.s
    Predef.U = any - Predef.u
    Predef.W = any - Predef.w
    Predef.X = any - Predef.x
    mem = {} -- restart memoization
    fmem = {}
    gmem = {}
    local mt = { __mode = "v" }
    setmetatable(mem, mt)
    setmetatable(fmem, mt)
    setmetatable(gmem, mt)
  end

  updatelocale()

  local I = m.P(function(s, i)
    print(i, s:sub(1, i - 1))
    return i
  end)

  local function getdef(id, defs)
    local c = defs and defs[id]
    if not c then
      error("undefined name: " .. id)
    end
    return c
  end

  local function mult(p, n)
    local np = mm.P(true)
    while n >= 1 do
      if n % 2 >= 1 then
        np = np * p
      end
      p = p * p
      n = n / 2
    end
    return np
  end

  local function equalcap(s, i, c)
    if type(c) ~= "string" then
      return nil
    end
    local e = #c + i
    if s:sub(i, e - 1) == c then
      return e
    else
      return nil
    end
  end

  local S = (Predef.space + "--" * (any - Predef.nl) ^ 0) ^ 0

  local name = m.C(m.R("AZ", "az", "__") * m.R("AZ", "az", "__", "09") ^ 0)

  local arrow = S * "<-"

  -- a defined name only have meaning in a given environment
  local Def = name * m.Carg(1)

  local num = m.C(m.R("09") ^ 1) * S / tonumber

  local String = "'"
      * m.C((any - "'" - m.P("\n")) ^ 0)
      * expect("'", "MisTerm1")
    + '"' * m.C((any - '"' - m.P("\n")) ^ 0) * expect('"', "MisTerm2")

  local defined = "%"
    * Def
    / function(c, Defs)
      local cat = Defs and Defs[c] or Predef[c]
      if not cat then
        error("name '" .. c .. "' undefined")
      end
      return cat
    end

  local Range = m.Cs(any * (m.P("-") / "") * (any - "]")) / mm.R

  local item = defined + Range + m.C(any - m.P("\n"))

  local Class = "["
    * (m.C(m.P("^") ^ -1)) -- optional complement symbol
    * m.Cf(expect(item, "ExpItem") * (item - "]") ^ 0, mt.__add)
    / function(c, p)
      return c == "^" and any - p or p
    end
    * expect("]", "MisClose8")

  local function adddef(t, k, exp)
    if t[k] then
    -- TODO 改了一下这里的代码，重复定义不会抛错
    --error("'"..k.."' already defined as a rule")
    else
      t[k] = exp
    end
    return t
  end

  local function firstdef(n, r)
    return adddef({ n }, n, r)
  end

  local function NT(n, b)
    if not b then
      error("rule '" .. n .. "' used outside a grammar")
    else
      return mm.V(n)
    end
  end

  local exp = m.P({
    "Exp",
    Exp = S * (m.V("Grammar") + m.Cf(
      m.V("Seq") * (S * "/" * expect(S * m.V("Seq"), "ExpPatt1")) ^ 0,
      mt.__add
    )),
    Seq = m.Cf(
      m.Cc(m.P("")) * m.V("Prefix") * (S * m.V("Prefix")) ^ 0,
      mt.__mul
    ),
    Prefix = "&" * expect(S * m.V("Prefix"), "ExpPatt2") / mt.__len
      + "!" * expect(S * m.V("Prefix"), "ExpPatt3") / mt.__unm
      + m.V("Suffix"),
    Suffix = m.Cf(
      m.V("Primary")
        * (S * (m.P("+") * m.Cc(1, mt.__pow) + m.P("*") * m.Cc(0, mt.__pow) + m.P(
            "?"
          ) * m.Cc(-1, mt.__pow) + "^" * expect(
            m.Cg(num * m.Cc(mult))
              + m.Cg(
                m.C(m.S("+-") * m.R("09") ^ 1) * m.Cc(mt.__pow)
                  + name * m.Cc("lab")
              ),
            "ExpNumName"
          ) + "->" * expect(
            S
              * (
                m.Cg((String + num) * m.Cc(mt.__div))
                + m.P("{}") * m.Cc(nil, m.Ct)
                + m.Cg(Def / getdef * m.Cc(mt.__div))
              ),
            "ExpCap"
          ) + "=>" * expect(
            S * m.Cg(Def / getdef * m.Cc(m.Cmt)),
            "ExpName1"
          )))
          ^ 0,
      function(a, b, f)
        if f == "lab" then
          return a + mm.T(b)
        else
          return f(a, b)
        end
      end
    ),
    Primary = "("
        * expect(m.V("Exp"), "ExpPatt4")
        * expect(S * ")", "MisClose1")
      + String / mm.P
      + Class
      + defined
      + "%" * expect(m.P("{"), "ExpNameOrLab") * expect(
        S * m.V("Label"),
        "ExpLab1"
      ) * expect(S * "}", "MisClose7") / mm.T
      + "{:" * (name * ":" + m.Cc(nil)) * expect(m.V("Exp"), "ExpPatt5") * expect(
        S * ":}",
        "MisClose2"
      ) / function(n, p)
        return mm.Cg(p, n)
      end
      + "=" * expect(name, "ExpName2") / function(n)
        return mm.Cmt(mm.Cb(n), equalcap)
      end
      + m.P("{}") / mm.Cp
      + "{~" * expect(m.V("Exp"), "ExpPatt6") * expect(S * "~}", "MisClose3") / mm.Cs
      + "{|" * expect(m.V("Exp"), "ExpPatt7") * expect(S * "|}", "MisClose4") / mm.Ct
      + "{" * expect(m.V("Exp"), "ExpPattOrClose") * expect(
        S * "}",
        "MisClose5"
      ) / mm.C
      + m.P(".") * m.Cc(any)
      + (
          name * -arrow
          + "<" * expect(name, "ExpName3") * expect(">", "MisClose6")
        )
        * m.Cb("G")
        / NT,
    Label = num + name,
    Definition = name * arrow * expect(m.V("Exp"), "ExpPatt8"),
    Grammar = m.Cg(m.Cc(true), "G") * m.Cf(
      m.V("Definition") / firstdef * (S * m.Cg(m.V("Definition"))) ^ 0,
      adddef
    ) / mm.P,
  })

  local pattern = S
    * m.Cg(m.Cc(false), "G")
    * expect(exp, "NoPatt")
    / mm.P
    * S
    * expect(-any, "ExtraChars")

  local function lineno(s, i)
    if i == 1 then
      return 1, 1
    end
    local adjustment = 0
    -- report the current line if at end of line, not the next
    if s:sub(i, i) == "\n" then
      i = i - 1
      adjustment = 1
    end
    local rest, num = s:sub(1, i):gsub("[^\n]*\n", "")
    local r = #rest
    return 1 + num, (r ~= 0 and r or 1) + adjustment
  end

  local function calcline(s, i)
    if i == 1 then
      return 1, 1
    end
    local rest, line = s:sub(1, i):gsub("[^\n]*\n", "")
    local col = #rest
    return 1 + line, col ~= 0 and col or 1
  end

  local function splitlines(str)
    local t = {}
    local function helper(line)
      tinsert(t, line)
      return ""
    end
    helper((str:gsub("(.-)\r?\n", helper)))
    return t
  end

  local function compile(p, defs)
    if mm.type(p) == "pattern" then
      return p
    end -- already compiled
    p = p .. " " -- for better reporting of column numbers in errors when at EOF
    local ok, cp, label, poserr = pcall(function()
      return pattern:match(p, 1, defs)
    end)
    if not ok and cp then
      if type(cp) == "string" then
        cp = cp:gsub("^[^:]+:[^:]+: ", "")
      end
      error(cp, 3)
    end
    if not cp then
      local lines = splitlines(p)
      local line, col = lineno(p, poserr)
      local err = {}
      tinsert(err, "L" .. line .. ":C" .. col .. ": " .. errinfo[label])
      tinsert(err, lines[line])
      tinsert(err, rep(" ", col - 1) .. "^")
      error("syntax error(s) in pattern\n" .. concat(err, "\n"), 3)
    end
    return cp
  end

  local function match(s, p, i)
    local cp = mem[p]
    if not cp then
      cp = compile(p)
      mem[p] = cp
    end
    return cp:match(s, i or 1)
  end

  local function find(s, p, i)
    local cp = fmem[p]
    if not cp then
      cp = compile(p) / 0
      cp = mm.P({ mm.Cp() * cp * mm.Cp() + 1 * mm.V(1) })
      fmem[p] = cp
    end
    local i, e = cp:match(s, i or 1)
    if i then
      return i, e - 1
    else
      return i
    end
  end

  local function gsub(s, p, rep)
    local g = gmem[p] or {} -- ensure gmem[p] is not collected while here
    gmem[p] = g
    local cp = g[rep]
    if not cp then
      cp = compile(p)
      cp = mm.Cs((cp / rep + 1) ^ 0)
      g[rep] = cp
    end
    return cp:match(s)
  end

  -- exported names
  local re = {
    compile = compile,
    match = match,
    find = find,
    gsub = gsub,
    updatelocale = updatelocale,
    calcline = calcline,
  }

  return re
end)()

---https://github.com/LuaLS/LuaParser/blob/master/src/parser/compile.lua
local compile = (function()
  local sbyte = string.byte
  local sfind = string.find
  local smatch = string.match
  local sgsub = string.gsub
  local ssub = string.sub
  local schar = string.char
  local supper = string.upper
  local uchar = utf8.char
  local tconcat = table.concat
  local tinsert = table.insert
  local tointeger = math.tointeger
  local tonumber = tonumber
  local maxinteger = math.maxinteger
  local assert = assert

  ---@alias parser.position integer

  ---@param str string
  ---@return table<integer, boolean>
  local function stringToCharMap(str)
    local map = {}
    local pos = 1
    while pos <= #str do
      local byte = sbyte(str, pos, pos)
      map[schar(byte)] = true
      pos = pos + 1
      if ssub(str, pos, pos) == "-" and pos < #str then
        pos = pos + 1
        local byte2 = sbyte(str, pos, pos)
        assert(byte < byte2)
        for b = byte + 1, byte2 do
          map[schar(b)] = true
        end
        pos = pos + 1
      end
    end
    return map
  end

  local CharMapNumber = stringToCharMap("0-9")
  local CharMapN16 = stringToCharMap("xX")
  local CharMapN2 = stringToCharMap("bB")
  local CharMapE10 = stringToCharMap("eE")
  local CharMapE16 = stringToCharMap("pP")
  local CharMapSign = stringToCharMap("+-")
  local CharMapSB = stringToCharMap("ao|~&=<>.*/%^+-")
  local CharMapSU = stringToCharMap("n#~!-")
  local CharMapSimple = stringToCharMap(".:(['\"{")
  local CharMapStrSH = stringToCharMap("'\"`")
  local CharMapStrLH = stringToCharMap("[")
  local CharMapTSep = stringToCharMap(",;")
  local CharMapWord = stringToCharMap("_a-zA-Z\x80-\xff")

  local EscMap = {
    ["a"] = "\a",
    ["b"] = "\b",
    ["f"] = "\f",
    ["n"] = "\n",
    ["r"] = "\r",
    ["t"] = "\t",
    ["v"] = "\v",
    ["\\"] = "\\",
    ["'"] = "'",
    ['"'] = '"',
  }

  local NLMap = {
    ["\n"] = true,
    ["\r"] = true,
    ["\r\n"] = true,
  }

  local LineMulti = 10000

  -- goto 单独处理
  local KeyWord = {
    ["and"] = true,
    ["break"] = true,
    ["do"] = true,
    ["else"] = true,
    ["elseif"] = true,
    ["end"] = true,
    ["false"] = true,
    ["for"] = true,
    ["function"] = true,
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

  local Specials = {
    ["_G"] = true,
    ["rawset"] = true,
    ["rawget"] = true,
    ["setmetatable"] = true,
    ["require"] = true,
    ["dofile"] = true,
    ["loadfile"] = true,
    ["pcall"] = true,
    ["xpcall"] = true,
    ["pairs"] = true,
    ["ipairs"] = true,
    ["assert"] = true,
    ["error"] = true,
    ["type"] = true,
    ["os.exit"] = true,
  }

  local UnarySymbol = {
    ["not"] = 11,
    ["#"] = 11,
    ["~"] = 11,
    ["-"] = 11,
  }

  local BinarySymbol = {
    ["or"] = 1,
    ["and"] = 2,
    ["<="] = 3,
    [">="] = 3,
    ["<"] = 3,
    [">"] = 3,
    ["~="] = 3,
    ["=="] = 3,
    ["|"] = 4,
    ["~"] = 5,
    ["&"] = 6,
    ["<<"] = 7,
    [">>"] = 7,
    [".."] = 8,
    ["+"] = 9,
    ["-"] = 9,
    ["*"] = 10,
    ["//"] = 10,
    ["/"] = 10,
    ["%"] = 10,
    ["^"] = 12,
  }

  local BinaryAlias = {
    ["&&"] = "and",
    ["||"] = "or",
    ["!="] = "~=",
  }

  local BinaryActionAlias = {
    ["="] = "==",
  }

  local UnaryAlias = {
    ["!"] = "not",
  }

  local SymbolForward = {
    [01] = true,
    [02] = true,
    [03] = true,
    [04] = true,
    [05] = true,
    [06] = true,
    [07] = true,
    [08] = false,
    [09] = true,
    [10] = true,
    [11] = true,
    [12] = false,
  }

  local GetToSetMap = {
    ["getglobal"] = "setglobal",
    ["getlocal"] = "setlocal",
    ["getfield"] = "setfield",
    ["getindex"] = "setindex",
    ["getmethod"] = "setmethod",
  }

  local ChunkFinishMap = {
    ["end"] = true,
    ["else"] = true,
    ["elseif"] = true,
    ["in"] = true,
    ["then"] = true,
    ["until"] = true,
    [";"] = true,
    ["]"] = true,
    [")"] = true,
    ["}"] = true,
  }

  local ChunkStartMap = {
    ["do"] = true,
    ["else"] = true,
    ["elseif"] = true,
    ["for"] = true,
    ["function"] = true,
    ["if"] = true,
    ["local"] = true,
    ["repeat"] = true,
    ["return"] = true,
    ["then"] = true,
    ["until"] = true,
    ["while"] = true,
  }

  local ListFinishMap = {
    ["end"] = true,
    ["else"] = true,
    ["elseif"] = true,
    ["in"] = true,
    ["then"] = true,
    ["do"] = true,
    ["until"] = true,
    ["for"] = true,
    ["if"] = true,
    ["local"] = true,
    ["repeat"] = true,
    ["return"] = true,
    ["while"] = true,
  }

  local State, Lua, Line, LineOffset, Chunk, Tokens, Index, LastTokenFinish, Mode, LocalCount, LocalLimited

  local LocalLimit = 200

  local parseExp, parseAction

  ---@class parser.state.err
  ---@field type string
  ---@field start? parser.position
  ---@field finish? parser.position
  ---@field info? table
  ---@field fix? table
  ---@field version? string[]|string
  ---@field level? string | 'Error' | 'Warning'

  ---@type fun(err:parser.state.err):parser.state.err|nil
  local pushError

  local function addSpecial(name, obj)
    if not State.specials then
      State.specials = {}
    end
    if not State.specials[name] then
      State.specials[name] = {}
    end
    State.specials[name][#State.specials[name] + 1] = obj
    obj.special = name
  end

  ---@param offset integer
  ---@param leftOrRight '"left"'|'"right"'
  local function getPosition(offset, leftOrRight)
    if not offset or offset > #Lua then
      return LineMulti * Line + #Lua - LineOffset + 1
    end
    if leftOrRight == "left" then
      return LineMulti * Line + offset - LineOffset
    else
      return LineMulti * Line + offset - LineOffset + 1
    end
  end

  ---@return string?          word
  ---@return parser.position? startPosition
  ---@return parser.position? finishPosition
  local function peekWord()
    local word = Tokens[Index + 1]
    if not word then
      return nil
    end
    if not CharMapWord[ssub(word, 1, 1)] then
      return nil
    end
    local startPos = getPosition(Tokens[Index], "left")
    local finishPos = getPosition(Tokens[Index] + #word - 1, "right")
    return word, startPos, finishPos
  end

  local function lastRightPosition()
    if Index < 2 then
      return 0
    end
    local token = Tokens[Index - 1]
    if NLMap[token] then
      return LastTokenFinish
    elseif token then
      return getPosition(Tokens[Index - 2] + #token - 1, "right")
    else
      return getPosition(#Lua, "right")
    end
  end

  local function missSymbol(symbol, start, finish)
    pushError({
      type = "MISS_SYMBOL",
      start = start or lastRightPosition(),
      finish = finish or start or lastRightPosition(),
      info = {
        symbol = symbol,
      },
    })
  end

  local function missExp()
    pushError({
      type = "MISS_EXP",
      start = lastRightPosition(),
      finish = lastRightPosition(),
    })
  end

  local function missName(pos)
    pushError({
      type = "MISS_NAME",
      start = pos or lastRightPosition(),
      finish = pos or lastRightPosition(),
    })
  end

  local function missEnd(relatedStart, relatedFinish)
    pushError({
      type = "MISS_SYMBOL",
      start = lastRightPosition(),
      finish = lastRightPosition(),
      info = {
        symbol = "end",
        related = {
          {
            start = relatedStart,
            finish = relatedFinish,
          },
        },
      },
    })
    pushError({
      type = "MISS_END",
      start = relatedStart,
      finish = relatedFinish,
    })
  end

  local function unknownSymbol(start, finish, word)
    local token = word or Tokens[Index + 1]
    if not token then
      return false
    end
    pushError({
      type = "UNKNOWN_SYMBOL",
      start = start or getPosition(Tokens[Index], "left"),
      finish = finish or getPosition(Tokens[Index] + #token - 1, "right"),
      info = {
        symbol = token,
      },
    })
    return true
  end

  local function skipUnknownSymbol()
    if unknownSymbol() then
      Index = Index + 2
      return true
    end
    return false
  end

  local function skipNL()
    local token = Tokens[Index + 1]
    if NLMap[token] then
      if Index >= 2 and not NLMap[Tokens[Index - 1]] then
        LastTokenFinish =
          getPosition(Tokens[Index - 2] + #Tokens[Index - 1] - 1, "right")
      end
      Line = Line + 1
      LineOffset = Tokens[Index] + #token
      Index = Index + 2
      State.lines[Line] = LineOffset
      return true
    end
    return false
  end

  local function getSavePoint()
    local index = Index
    local line = Line
    local lineOffset = LineOffset
    local errs = State.errs
    local errCount = #errs
    return function()
      Index = index
      Line = line
      LineOffset = lineOffset
      for i = errCount + 1, #errs do
        errs[i] = nil
      end
    end
  end

  local function fastForwardToken(offset)
    while true do
      local myOffset = Tokens[Index]
      if not myOffset or myOffset >= offset then
        break
      end
      local token = Tokens[Index + 1]
      if NLMap[token] then
        Line = Line + 1
        LineOffset = Tokens[Index] + #token
        State.lines[Line] = LineOffset
      end
      Index = Index + 2
    end
  end

  local function resolveLongString(finishMark)
    skipNL()
    local miss
    local start = Tokens[Index]
    local finishOffset = sfind(Lua, finishMark, start, true)
    if not finishOffset then
      finishOffset = #Lua + 1
      miss = true
    end
    local stringResult = start and ssub(Lua, start, finishOffset - 1) or ""
    local lastLN = stringResult:find("[\r\n][^\r\n]*$")
    if lastLN then
      local result = stringResult:gsub("\r\n?", "\n")
      stringResult = result
    end
    if finishMark == "]]" and State.version == "Lua 5.1" then
      local nestOffset = sfind(Lua, "[[", start, true)
      if nestOffset and nestOffset < finishOffset then
        fastForwardToken(nestOffset)
        local nestStartPos = getPosition(nestOffset, "left")
        local nestFinishPos = getPosition(nestOffset + 1, "right")
        pushError({
          type = "NESTING_LONG_MARK",
          start = nestStartPos,
          finish = nestFinishPos,
        })
      end
    end
    fastForwardToken(finishOffset + #finishMark)
    if miss then
      local pos = getPosition(finishOffset - 1, "right")
      pushError({
        type = "MISS_SYMBOL",
        start = pos,
        finish = pos,
        info = {
          symbol = finishMark,
        },
        fix = {
          title = "ADD_LSTRING_END",
          {
            start = pos,
            finish = pos,
            text = finishMark,
          },
        },
      })
    end
    return stringResult, getPosition(finishOffset + #finishMark - 1, "right")
  end

  local function parseLongString()
    local start, finish, mark = sfind(Lua, "^(%[%=*%[)", Tokens[Index])
    if not start then
      return nil
    end
    fastForwardToken(finish + 1)
    local startPos = getPosition(start, "left")
    local finishMark = sgsub(mark, "%[", "]")
    local stringResult, finishPos = resolveLongString(finishMark)
    return {
      type = "string",
      start = startPos,
      finish = finishPos,
      [1] = stringResult,
      [2] = mark,
    }
  end

  local function pushCommentHeadError(left)
    if State.options.nonstandardSymbol["//"] then
      return
    end
    pushError({
      type = "ERR_COMMENT_PREFIX",
      start = left,
      finish = left + 2,
      fix = {
        title = "FIX_COMMENT_PREFIX",
        {
          start = left,
          finish = left + 2,
          text = "--",
        },
      },
    })
  end

  local function pushLongCommentError(left, right)
    if State.options.nonstandardSymbol["/**/"] then
      return
    end
    pushError({
      type = "ERR_C_LONG_COMMENT",
      start = left,
      finish = right,
      fix = {
        title = "FIX_C_LONG_COMMENT",
        {
          start = left,
          finish = left + 2,
          text = "--[[",
        },
        {
          start = right - 2,
          finish = right,
          text = "--]]",
        },
      },
    })
  end

  local function skipComment(isAction)
    local token = Tokens[Index + 1]
    if
      token == "--"
      or (token == "//" and (isAction or State.options.nonstandardSymbol["//"]))
    then
      local start = Tokens[Index]
      local left = getPosition(start, "left")
      local chead = false
      if token == "//" then
        chead = true
        pushCommentHeadError(left)
      end
      Index = Index + 2
      local longComment = start + 2 == Tokens[Index] and parseLongString()
      if longComment then
        longComment.type = "comment.long"
        longComment.text = longComment[1]
        longComment.mark = longComment[2]
        longComment[1] = nil
        longComment[2] = nil
        State.comms[#State.comms + 1] = longComment
        return true
      end
      while true do
        local nl = Tokens[Index + 1]
        if not nl or NLMap[nl] then
          break
        end
        Index = Index + 2
      end
      local right = Tokens[Index] and (Tokens[Index] - 1) or #Lua
      State.comms[#State.comms + 1] = {
        type = chead and "comment.cshort" or "comment.short",
        start = left,
        finish = getPosition(right, "right"),
        text = ssub(Lua, start + 2, right),
      }
      return true
    end
    if token == "/*" then
      local start = Tokens[Index]
      local left = getPosition(start, "left")
      Index = Index + 2
      local result, right = resolveLongString("*/")
      pushLongCommentError(left, right)
      State.comms[#State.comms + 1] = {
        type = "comment.clong",
        start = left,
        finish = right,
        text = result,
      }
      return true
    end
    return false
  end

  local function skipSpace(isAction)
    repeat
    until not skipNL() and not skipComment(isAction)
  end

  local function expectAssign(isAction)
    local token = Tokens[Index + 1]
    if token == "=" then
      Index = Index + 2
      return true
    end
    if token == "==" then
      local left = getPosition(Tokens[Index], "left")
      local right = getPosition(Tokens[Index] + #token - 1, "right")
      pushError({
        type = "ERR_ASSIGN_AS_EQ",
        start = left,
        finish = right,
        fix = {
          title = "FIX_ASSIGN_AS_EQ",
          {
            start = left,
            finish = right,
            text = "=",
          },
        },
      })
      Index = Index + 2
      return true
    end
    if isAction then
      if
        token == "+="
        or token == "-="
        or token == "*="
        or token == "/="
        or token == "%="
        or token == "^="
        or token == "//="
        or token == "|="
        or token == "&="
        or token == ">>="
        or token == "<<="
      then
        if not State.options.nonstandardSymbol[token] then
          unknownSymbol()
        end
        Index = Index + 2
        return true
      end
    end
    return false
  end

  local function parseLocalAttrs()
    local attrs
    while true do
      skipSpace()
      local token = Tokens[Index + 1]
      if token ~= "<" then
        break
      end
      if not attrs then
        attrs = {
          type = "localattrs",
        }
      end
      local attr = {
        type = "localattr",
        parent = attrs,
        start = getPosition(Tokens[Index], "left"),
        finish = getPosition(Tokens[Index], "right"),
      }
      attrs[#attrs + 1] = attr
      Index = Index + 2
      skipSpace()
      local word, wstart, wfinish = peekWord()
      if word then
        attr[1] = word
        attr.finish = wfinish
        Index = Index + 2
        if word ~= "const" and word ~= "close" then
          pushError({
            type = "UNKNOWN_ATTRIBUTE",
            start = wstart,
            finish = wfinish,
          })
        end
      else
        missName()
      end
      attr.finish = lastRightPosition()
      skipSpace()
      if Tokens[Index + 1] == ">" then
        attr.finish = getPosition(Tokens[Index], "right")
        Index = Index + 2
      elseif Tokens[Index + 1] == ">=" then
        attr.finish = getPosition(Tokens[Index], "right")
        pushError({
          type = "MISS_SPACE_BETWEEN",
          start = getPosition(Tokens[Index], "left"),
          finish = getPosition(Tokens[Index] + 1, "right"),
        })
        Index = Index + 2
      else
        missSymbol(">")
      end
      if State.version ~= "Lua 5.4" and State.version ~= "Lua 5.5" then
        pushError({
          type = "UNSUPPORT_SYMBOL",
          start = attr.start,
          finish = attr.finish,
          version = { "Lua 5.4", "Lua 5.5" },
          info = {
            version = State.version,
          },
        })
      end
    end
    return attrs
  end

  ---@param obj table
  local function createLocal(obj, attrs)
    obj.type = "local"
    obj.effect = obj.finish

    if attrs then
      obj.attrs = attrs
      attrs.parent = obj
    end

    local chunk = Chunk[#Chunk]
    if chunk then
      local locals = chunk.locals
      if not locals then
        locals = {}
        chunk.locals = locals
      end
      locals[#locals + 1] = obj
      LocalCount = LocalCount + 1
      if not LocalLimited and LocalCount > LocalLimit then
        LocalLimited = true
        pushError({
          type = "LOCAL_LIMIT",
          start = obj.start,
          finish = obj.finish,
        })
      end
    end
    return obj
  end

  local function pushChunk(chunk)
    Chunk[#Chunk + 1] = chunk
  end

  local function resolveLable(label, obj)
    if not label.ref then
      label.ref = {}
    end
    label.ref[#label.ref + 1] = obj
    obj.node = label

    -- 如果有局部变量在 goto 与 label 之间声明，
    -- 并在 label 之后使用，则算作语法错误

    -- 如果 label 在 goto 之前声明，那么不会有中间声明的局部变量
    if obj.start > label.start then
      return
    end

    local block = guide.getBlock(obj)
    local locals = block and block.locals
    if not locals then
      return
    end

    for i = 1, #locals do
      local loc = locals[i]
      -- 检查局部变量声明位置为 goto 与 label 之间
      if loc.start < obj.start or loc.finish > label.finish then
        goto CONTINUE
      end
      -- 检查局部变量的使用位置在 label 之后
      local refs = loc.ref
      if not refs then
        goto CONTINUE
      end
      for j = 1, #refs do
        local ref = refs[j]
        if ref.finish > label.finish then
          pushError({
            type = "JUMP_LOCAL_SCOPE",
            start = obj.start,
            finish = obj.finish,
            info = {
              loc = loc[1],
            },
            relative = {
              {
                start = label.start,
                finish = label.finish,
              },
              {
                start = loc.start,
                finish = loc.finish,
              },
            },
          })
          return
        end
      end
      ::CONTINUE::
    end
  end

  local function resolveGoTo(gotos)
    for i = 1, #gotos do
      local action = gotos[i]
      local label = guide.getLabel(action, action[1])
      if label then
        resolveLable(label, action)
      else
        pushError({
          type = "NO_VISIBLE_LABEL",
          start = action.start,
          finish = action.finish,
          info = {
            label = action[1],
          },
        })
      end
    end
  end

  local function popChunk()
    local chunk = Chunk[#Chunk]
    if chunk.gotos then
      resolveGoTo(chunk.gotos)
      chunk.gotos = nil
    end
    local lastAction = chunk[#chunk]
    if lastAction then
      chunk.finish = lastAction.finish
    end
    Chunk[#Chunk] = nil
  end

  local function parseNil()
    if Tokens[Index + 1] ~= "nil" then
      return nil
    end
    local offset = Tokens[Index]
    Index = Index + 2
    return {
      type = "nil",
      start = getPosition(offset, "left"),
      finish = getPosition(offset + 2, "right"),
    }
  end

  local function parseBoolean()
    local word = Tokens[Index + 1]
    if word ~= "true" and word ~= "false" then
      return nil
    end
    local start = getPosition(Tokens[Index], "left")
    local finish = getPosition(Tokens[Index] + #word - 1, "right")
    Index = Index + 2
    return {
      type = "boolean",
      start = start,
      finish = finish,
      [1] = word == "true" and true or false,
    }
  end

  local function parseStringUnicode()
    local offset = Tokens[Index] + 1
    if ssub(Lua, offset, offset) ~= "{" then
      local pos = getPosition(offset, "left")
      missSymbol("{", pos)
      return nil, offset
    end
    local leftPos = getPosition(offset, "left")
    local x16 = smatch(Lua, "^%w*", offset + 1)
    local rightPos = getPosition(offset + #x16, "right")
    offset = offset + #x16 + 1
    if ssub(Lua, offset, offset) == "}" then
      offset = offset + 1
      rightPos = rightPos + 1
    else
      missSymbol("}", rightPos)
    end
    offset = offset + 1
    if #x16 == 0 then
      pushError({
        type = "UTF8_SMALL",
        start = leftPos,
        finish = rightPos,
      })
      return "", offset
    end
    if
      State.version ~= "Lua 5.3"
      and State.version ~= "Lua 5.4"
      and State.version ~= "Lua 5.5"
      and State.version ~= "LuaJIT"
    then
      pushError({
        type = "ERR_ESC",
        start = leftPos - 2,
        finish = rightPos,
        version = { "Lua 5.3", "Lua 5.4", "Lua 5.5", "LuaJIT" },
        info = {
          version = State.version,
        },
      })
      return nil, offset
    end
    local byte = tonumber(x16, 16)
    if not byte then
      for i = 1, #x16 do
        if not tonumber(ssub(x16, i, i), 16) then
          pushError({
            type = "MUST_X16",
            start = leftPos + i,
            finish = leftPos + i + 1,
          })
        end
      end
      return nil, offset
    end
    if State.version == "Lua 5.4" or State.version == "Lua 5.5" then
      if byte < 0 or byte > 0x7FFFFFFF then
        pushError({
          type = "UTF8_MAX",
          start = leftPos,
          finish = rightPos,
          info = {
            min = "00000000",
            max = "7FFFFFFF",
          },
        })
        return nil, offset
      end
    else
      if byte < 0 or byte > 0x10FFFF then
        pushError({
          type = "UTF8_MAX",
          start = leftPos,
          finish = rightPos,
          version = byte <= 0x7FFFFFFF and { "Lua 5.4", "Lua 5.5" } or nil,
          info = {
            min = "000000",
            max = "10FFFF",
          },
        })
      end
    end
    if byte >= 0 and byte <= 0x10FFFF then
      return uchar(byte), offset
    end
    return "", offset
  end

  local stringPool = {}
  local function parseShortString()
    local mark = Tokens[Index + 1]
    local startOffset = Tokens[Index]
    local startPos = getPosition(startOffset, "left")
    Index = Index + 2
    local stringIndex = 0
    local currentOffset = startOffset + 1
    local escs = {}
    while true do
      local token = Tokens[Index + 1]
      if token == mark then
        stringIndex = stringIndex + 1
        stringPool[stringIndex] = ssub(Lua, currentOffset, Tokens[Index] - 1)
        Index = Index + 2
        break
      end
      if NLMap[token] then
        stringIndex = stringIndex + 1
        stringPool[stringIndex] = ssub(Lua, currentOffset, Tokens[Index] - 1)
        missSymbol(mark)
        break
      end
      if not token then
        stringIndex = stringIndex + 1
        stringPool[stringIndex] = ssub(Lua, currentOffset or -1)
        missSymbol(mark)
        break
      end
      if token == "\\" then
        stringIndex = stringIndex + 1
        stringPool[stringIndex] = ssub(Lua, currentOffset, Tokens[Index] - 1)
        currentOffset = Tokens[Index]
        Index = Index + 2
        if not Tokens[Index] then
          goto CONTINUE
        end
        local escLeft = getPosition(currentOffset, "left")
        -- has space?
        if Tokens[Index] - currentOffset > 1 then
          local right = getPosition(currentOffset + 1, "right")
          pushError({
            type = "ERR_ESC",
            start = escLeft,
            finish = right,
          })
          escs[#escs + 1] = escLeft
          escs[#escs + 1] = right
          escs[#escs + 1] = "err"
          goto CONTINUE
        end
        local nextToken = ssub(Tokens[Index + 1], 1, 1)
        if EscMap[nextToken] then
          stringIndex = stringIndex + 1
          stringPool[stringIndex] = EscMap[nextToken]
          currentOffset = Tokens[Index] + #nextToken
          Index = Index + 2
          escs[#escs + 1] = escLeft
          escs[#escs + 1] = escLeft + 2
          escs[#escs + 1] = "normal"
          goto CONTINUE
        end
        if nextToken == mark then
          stringIndex = stringIndex + 1
          stringPool[stringIndex] = mark
          currentOffset = Tokens[Index] + #nextToken
          Index = Index + 2
          escs[#escs + 1] = escLeft
          escs[#escs + 1] = escLeft + 2
          escs[#escs + 1] = "normal"
          goto CONTINUE
        end
        if nextToken == "z" then
          Index = Index + 2
          repeat
          until not skipNL()
          currentOffset = Tokens[Index]
          escs[#escs + 1] = escLeft
          escs[#escs + 1] = escLeft + 2
          escs[#escs + 1] = "normal"
          goto CONTINUE
        end
        if CharMapNumber[nextToken] then
          local numbers = smatch(Tokens[Index + 1], "^%d+")
          if #numbers > 3 then
            numbers = ssub(numbers, 1, 3)
          end
          currentOffset = Tokens[Index] + #numbers
          fastForwardToken(currentOffset)
          local right = getPosition(currentOffset - 1, "right")
          local byte = tointeger(numbers)
          if byte and byte <= 255 then
            stringIndex = stringIndex + 1
            stringPool[stringIndex] = schar(byte)
          else
            pushError({
              type = "ERR_ESC",
              start = escLeft,
              finish = right,
            })
          end
          escs[#escs + 1] = escLeft
          escs[#escs + 1] = right
          escs[#escs + 1] = "byte"
          goto CONTINUE
        end
        if nextToken == "x" then
          local left = getPosition(Tokens[Index] - 1, "left")
          local x16 = ssub(Tokens[Index + 1], 2, 3)
          local byte = tonumber(x16, 16)
          if byte then
            currentOffset = Tokens[Index] + 3
            stringIndex = stringIndex + 1
            stringPool[stringIndex] = schar(byte)
          else
            currentOffset = Tokens[Index] + 1
            pushError({
              type = "MISS_ESC_X",
              start = getPosition(currentOffset, "left"),
              finish = getPosition(currentOffset + 1, "right"),
            })
          end
          local right = getPosition(currentOffset + 1, "right")
          escs[#escs + 1] = escLeft
          escs[#escs + 1] = right
          escs[#escs + 1] = "byte"
          if State.version == "Lua 5.1" then
            pushError({
              type = "ERR_ESC",
              start = left,
              finish = left + 4,
              version = { "Lua 5.2", "Lua 5.3", "Lua 5.4", "Lua 5.5", "LuaJIT" },
              info = {
                version = State.version,
              },
            })
          end
          Index = Index + 2
          goto CONTINUE
        end
        if nextToken == "u" then
          local str, newOffset = parseStringUnicode()
          if str then
            stringIndex = stringIndex + 1
            stringPool[stringIndex] = str
          end
          currentOffset = newOffset
          fastForwardToken(currentOffset - 1)
          local right = getPosition(currentOffset + 1, "right")
          escs[#escs + 1] = escLeft
          escs[#escs + 1] = right
          escs[#escs + 1] = "unicode"
          goto CONTINUE
        end
        if NLMap[nextToken] then
          stringIndex = stringIndex + 1
          stringPool[stringIndex] = "\n"
          currentOffset = Tokens[Index] + #nextToken
          skipNL()
          escs[#escs + 1] = escLeft
          escs[#escs + 1] = escLeft + 1
          escs[#escs + 1] = "normal"
          goto CONTINUE
        end
        local right = getPosition(currentOffset + 1, "right")
        pushError({
          type = "ERR_ESC",
          start = escLeft,
          finish = right,
        })
        escs[#escs + 1] = escLeft
        escs[#escs + 1] = right
        escs[#escs + 1] = "err"
      end
      Index = Index + 2
      ::CONTINUE::
    end
    local stringResult = tconcat(stringPool, "", 1, stringIndex)
    local str = {
      type = "string",
      start = startPos,
      finish = lastRightPosition(),
      escs = #escs > 0 and escs or nil,
      [1] = stringResult,
      [2] = mark,
    }
    if mark == "`" then
      if not State.options.nonstandardSymbol[mark] then
        pushError({
          type = "ERR_NONSTANDARD_SYMBOL",
          start = startPos,
          finish = str.finish,
          info = {
            symbol = '"',
          },
          fix = {
            title = "FIX_NONSTANDARD_SYMBOL",
            symbol = '"',
            {
              start = startPos,
              finish = startPos + 1,
              text = '"',
            },
            {
              start = str.finish - 1,
              finish = str.finish,
              text = '"',
            },
          },
        })
      end
    end
    return str
  end

  local function parseString()
    local c = Tokens[Index + 1]
    if CharMapStrSH[c] then
      return parseShortString()
    end
    if CharMapStrLH[c] then
      return parseLongString()
    end
    return nil
  end

  local function parseNumber10(start)
    local integer = true
    local integerPart = smatch(Lua, "^%d*", start)
    local offset = start + #integerPart
    -- float part
    if ssub(Lua, offset, offset) == "." then
      local floatPart = smatch(Lua, "^%d*", offset + 1)
      integer = false
      offset = offset + #floatPart + 1
    end
    -- exp part
    local echar = ssub(Lua, offset, offset)
    if CharMapE10[echar] then
      integer = false
      offset = offset + 1
      local nextChar = ssub(Lua, offset, offset)
      if CharMapSign[nextChar] then
        offset = offset + 1
      end
      local exp = smatch(Lua, "^%d*", offset)
      offset = offset + #exp
      if #exp == 0 then
        pushError({
          type = "MISS_EXPONENT",
          start = getPosition(offset - 1, "right"),
          finish = getPosition(offset - 1, "right"),
        })
      end
    end
    return tonumber(ssub(Lua, start, offset - 1)), offset, integer
  end

  local function parseNumber16(start)
    local integerPart = smatch(Lua, "^[%da-fA-F]*", start)
    local offset = start + #integerPart
    local integer = true
    -- float part
    if ssub(Lua, offset, offset) == "." then
      local floatPart = smatch(Lua, "^[%da-fA-F]*", offset + 1)
      integer = false
      offset = offset + #floatPart + 1
      if #integerPart == 0 and #floatPart == 0 then
        pushError({
          type = "MUST_X16",
          start = getPosition(offset - 1, "right"),
          finish = getPosition(offset - 1, "right"),
        })
      end
    else
      if #integerPart == 0 then
        pushError({
          type = "MUST_X16",
          start = getPosition(offset - 1, "right"),
          finish = getPosition(offset - 1, "right"),
        })
        return 0, offset
      end
    end
    -- exp part
    local echar = ssub(Lua, offset, offset)
    if CharMapE16[echar] then
      integer = false
      offset = offset + 1
      local nextChar = ssub(Lua, offset, offset)
      if CharMapSign[nextChar] then
        offset = offset + 1
      end
      local exp = smatch(Lua, "^%d*", offset)
      offset = offset + #exp
    end
    local n = tonumber(ssub(Lua, start - 2, offset - 1))
    return n, offset, integer
  end

  local function parseNumber2(start)
    local bins = smatch(Lua, "^[01]*", start)
    local offset = start + #bins
    if State.version ~= "LuaJIT" then
      pushError({
        type = "UNSUPPORT_SYMBOL",
        start = getPosition(start - 2, "left"),
        finish = getPosition(offset - 1, "right"),
        version = "LuaJIT",
        info = {
          version = State.version,
        },
      })
    end
    return tonumber(bins, 2), offset
  end

  local function dropNumberTail(offset, integer)
    local _, finish, word = sfind(Lua, "^([%.%w_\x80-\xff]+)", offset)
    if not finish then
      return offset
    end
    if integer then
      if supper(ssub(word, 1, 2)) == "LL" then
        if State.version ~= "LuaJIT" then
          pushError({
            type = "UNSUPPORT_SYMBOL",
            start = getPosition(offset, "left"),
            finish = getPosition(offset + 1, "right"),
            version = "LuaJIT",
            info = {
              version = State.version,
            },
          })
        end
        offset = offset + 2
        word = ssub(word, offset)
      elseif supper(ssub(word, 1, 3)) == "ULL" then
        if State.version ~= "LuaJIT" then
          pushError({
            type = "UNSUPPORT_SYMBOL",
            start = getPosition(offset, "left"),
            finish = getPosition(offset + 2, "right"),
            version = "LuaJIT",
            info = {
              version = State.version,
            },
          })
        end
        offset = offset + 3
        word = ssub(word, offset)
      end
    end
    if supper(ssub(word, 1, 1)) == "I" then
      if State.version ~= "LuaJIT" then
        pushError({
          type = "UNSUPPORT_SYMBOL",
          start = getPosition(offset, "left"),
          finish = getPosition(offset, "right"),
          version = "LuaJIT",
          info = {
            version = State.version,
          },
        })
      end
      offset = offset + 1
      word = ssub(word, offset)
    end
    if #word > 0 then
      pushError({
        type = "MALFORMED_NUMBER",
        start = getPosition(offset, "left"),
        finish = getPosition(finish, "right"),
      })
    end
    return finish + 1
  end

  local function parseNumber()
    local offset = Tokens[Index]
    if not offset then
      return nil
    end
    local startPos = getPosition(offset, "left")
    local neg
    if ssub(Lua, offset, offset) == "-" then
      neg = true
      offset = offset + 1
    end
    local number, integer
    local firstChar = ssub(Lua, offset, offset)
    if firstChar == "." then
      number, offset = parseNumber10(offset)
      integer = false
    elseif firstChar == "0" then
      local nextChar = ssub(Lua, offset + 1, offset + 1)
      if CharMapN16[nextChar] then
        number, offset, integer = parseNumber16(offset + 2)
      elseif CharMapN2[nextChar] then
        number, offset = parseNumber2(offset + 2)
        integer = true
      else
        number, offset, integer = parseNumber10(offset)
      end
    elseif CharMapNumber[firstChar] then
      number, offset, integer = parseNumber10(offset)
    else
      return nil
    end
    if not number then
      number = 0
    end
    if neg then
      number = -number
    end
    local result = {
      type = integer and "integer" or "number",
      start = startPos,
      finish = getPosition(offset - 1, "right"),
      [1] = number,
    }
    offset = dropNumberTail(offset, integer)
    fastForwardToken(offset)
    return result
  end

  local function isKeyWord(word, nextToken)
    if KeyWord[word] then
      return true
    end
    if word == "goto" then
      if State.version == "Lua 5.1" then
        return false
      end
      if State.version == "LuaJIT" then
        if not nextToken then
          return false
        end
        if CharMapWord[ssub(nextToken, 1, 1)] then
          return true
        end
        return false
      end
      return true
    end
    return false
  end

  local function parseName(asAction)
    local word = peekWord()
    if not word then
      return nil
    end
    if ChunkFinishMap[word] then
      return nil
    end
    if asAction and ChunkStartMap[word] then
      return nil
    end
    local startPos = getPosition(Tokens[Index], "left")
    local finishPos = getPosition(Tokens[Index] + #word - 1, "right")
    Index = Index + 2
    if not State.options.unicodeName and word:find("[\x80-\xff]") then
      pushError({
        type = "UNICODE_NAME",
        start = startPos,
        finish = finishPos,
      })
    end
    if isKeyWord(word, Tokens[Index + 1]) then
      pushError({
        type = "KEYWORD",
        start = startPos,
        finish = finishPos,
      })
    end
    return {
      type = "name",
      start = startPos,
      finish = finishPos,
      [1] = word,
    }
  end

  local function parseNameOrList(parent)
    local first = parseName()
    if not first then
      return nil
    end
    skipSpace()
    local list
    while true do
      if Tokens[Index + 1] ~= "," then
        break
      end
      Index = Index + 2
      skipSpace()
      local name = parseName(true)
      if not name then
        missName()
        break
      end
      if not list then
        list = {
          type = "list",
          start = first.start,
          finish = first.finish,
          parent = parent,
          [1] = first,
        }
      end
      list[#list + 1] = name
      list.finish = name.finish
    end
    return list or first
  end

  local function parseExpList(mini)
    local list
    local wantSep = false
    while true do
      skipSpace()
      local token = Tokens[Index + 1]
      if not token then
        break
      end
      if ListFinishMap[token] then
        break
      end
      if token == "," then
        local sepPos = getPosition(Tokens[Index], "right")
        if not wantSep then
          pushError({
            type = "UNEXPECT_SYMBOL",
            start = getPosition(Tokens[Index], "left"),
            finish = sepPos,
            info = {
              symbol = ",",
            },
          })
        end
        wantSep = false
        Index = Index + 2
        goto CONTINUE
      else
        if mini then
          if wantSep then
            break
          end
          local nextToken = peekWord()
          if
            isKeyWord(nextToken, Tokens[Index + 2])
            and nextToken ~= "function"
            and nextToken ~= "true"
            and nextToken ~= "false"
            and nextToken ~= "nil"
            and nextToken ~= "not"
          then
            break
          end
        end
        local exp = parseExp()
        if not exp then
          break
        end
        if wantSep then
          missSymbol(",", list[#list].finish, exp.start)
        end
        wantSep = true
        if not list then
          list = {
            type = "list",
            start = exp.start,
          }
        end
        list[#list + 1] = exp
        list.finish = exp.finish
        exp.parent = list
      end
      ::CONTINUE::
    end
    if not list then
      return nil
    end
    if not wantSep then
      missExp()
    end
    return list
  end

  local function parseIndex()
    local start = getPosition(Tokens[Index], "left")
    Index = Index + 2
    skipSpace()
    local exp = parseExp()
    local index = {
      type = "index",
      start = start,
      finish = exp and exp.finish or (start + 1),
      index = exp,
    }
    if exp then
      exp.parent = index
    else
      missExp()
    end
    skipSpace()
    if Tokens[Index + 1] == "]" then
      index.finish = getPosition(Tokens[Index], "right")
      Index = Index + 2
    else
      missSymbol("]")
    end
    return index
  end

  local function parseTable()
    local tbl = {
      type = "table",
      start = getPosition(Tokens[Index], "left"),
      finish = getPosition(Tokens[Index], "right"),
    }
    tbl.bstart = tbl.finish
    Index = Index + 2
    local index = 0
    local tindex = 0
    local wantSep = false
    while true do
      skipSpace(true)
      local token = Tokens[Index + 1]
      if token == "}" then
        tbl.bfinish = getPosition(Tokens[Index], "left")
        Index = Index + 2
        break
      end
      if CharMapTSep[token] then
        if not wantSep then
          missExp()
        end
        wantSep = false
        Index = Index + 2
        goto CONTINUE
      end
      local lastRight = lastRightPosition()

      if peekWord() then
        local savePoint = getSavePoint()
        local name = parseName()
        if name then
          skipSpace()
          if Tokens[Index + 1] == "=" then
            Index = Index + 2
            if wantSep then
              pushError({
                type = "MISS_SEP_IN_TABLE",
                start = lastRight,
                finish = getPosition(Tokens[Index], "left"),
              })
            end
            wantSep = true
            skipSpace()
            local fvalue = parseExp()
            local tfield = {
              type = "tablefield",
              start = name.start,
              finish = name.finish,
              range = fvalue and fvalue.finish,
              node = tbl,
              parent = tbl,
              field = name,
              value = fvalue,
            }
            name.type = "field"
            name.parent = tfield
            if fvalue then
              fvalue.parent = tfield
            else
              missExp()
            end
            index = index + 1
            tbl[index] = tfield
            goto CONTINUE
          end
        end
        savePoint()
      end

      local exp = parseExp(true)
      if exp then
        if wantSep then
          pushError({
            type = "MISS_SEP_IN_TABLE",
            start = lastRight,
            finish = exp.start,
          })
        end
        wantSep = true
        if exp.type == "varargs" then
          index = index + 1
          tbl[index] = exp
          exp.parent = tbl
          goto CONTINUE
        end
        index = index + 1
        tindex = tindex + 1
        local texp = {
          type = "tableexp",
          start = exp.start,
          finish = exp.finish,
          tindex = tindex,
          parent = tbl,
          value = exp,
        }
        exp.parent = texp
        tbl[index] = texp
        goto CONTINUE
      end

      if token == "[" then
        if wantSep then
          pushError({
            type = "MISS_SEP_IN_TABLE",
            start = lastRight,
            finish = getPosition(Tokens[Index], "left"),
          })
        end
        wantSep = true
        local tindex = parseIndex()
        skipSpace()
        tindex.type = "tableindex"
        tindex.node = tbl
        tindex.parent = tbl
        index = index + 1
        tbl[index] = tindex
        if expectAssign() then
          skipSpace()
          local ivalue = parseExp()
          if ivalue then
            ivalue.parent = tindex
            tindex.range = ivalue.finish
            tindex.value = ivalue
          else
            missExp()
          end
        else
          missSymbol("=")
        end
        goto CONTINUE
      end

      missSymbol("}")
      skipSpace()
      tbl.bfinish = getPosition(Tokens[Index], "left")
      -- error: could not format from stdin: failed to format from stdin: error parsing:
      -- - unexpected token `::` (1717:5 to 1717:10), expected `end` to close while loop block
      -- - unexpected token `end` (1722:1 to 1722:4), unexpected token, this needs to be a statement
      -- - unexpected token `local` (1724:1 to 1724:6), unexpected statement after last statement
      -- break
      ::CONTINUE::
    end
    tbl.finish = lastRightPosition()
    return tbl
  end

  local function addDummySelf(node, call)
    if not node then
      return
    end
    if node.type ~= "getmethod" then
      return
    end
    -- dummy param `self`
    if not call.args then
      call.args = {
        type = "callargs",
        start = call.start,
        finish = call.finish,
        parent = call,
      }
    end
    local self = {
      type = "self",
      start = node.colon.start,
      finish = node.colon.finish,
      parent = call.args,
      [1] = "self",
    }
    tinsert(call.args, 1, self)
  end

  local function checkAmbiguityCall(call, parenPos)
    if State.version ~= "Lua 5.1" then
      return
    end
    local node = call.node
    if not node then
      return
    end
    local nodeRow = guide.rowColOf(node.finish)
    local callRow = guide.rowColOf(parenPos)
    if nodeRow == callRow then
      return
    end
    pushError({
      type = "AMBIGUOUS_SYNTAX",
      start = parenPos,
      finish = call.finish,
    })
  end

  local function bindSpecial(source, name)
    if Specials[name] then
      addSpecial(name, source)
    else
      local ospeicals = State.options.special
      if ospeicals and ospeicals[name] then
        addSpecial(ospeicals[name], source)
      end
    end
  end

  local function parseSimple(node, funcName)
    local currentName
    if node.type == "getglobal" or node.type == "getlocal" then
      currentName = node[1]
    end
    local lastMethod
    while true do
      if lastMethod and node.node == lastMethod then
        if node.type ~= "call" then
          missSymbol("(", node.node.finish, node.node.finish)
        end
        lastMethod = nil
      end
      skipSpace()
      local token = Tokens[Index + 1]
      if token == "." then
        local dot = {
          type = token,
          start = getPosition(Tokens[Index], "left"),
          finish = getPosition(Tokens[Index], "right"),
        }
        Index = Index + 2
        skipSpace()
        local field = parseName(true)
        local getfield = {
          type = "getfield",
          start = node.start,
          finish = lastRightPosition(),
          node = node,
          dot = dot,
          field = field,
        }
        if field then
          field.parent = getfield
          field.type = "field"
          if currentName then
            if
              node.type == "getlocal"
              or node.type == "getglobal"
              or node.type == "getfield"
            then
              currentName = currentName .. "." .. field[1]
              bindSpecial(getfield, currentName)
            else
              currentName = nil
            end
          end
        else
          pushError({
            type = "MISS_FIELD",
            start = lastRightPosition(),
            finish = lastRightPosition(),
          })
        end
        node.parent = getfield
        node.next = getfield
        node = getfield
      elseif token == ":" then
        local colon = {
          type = token,
          start = getPosition(Tokens[Index], "left"),
          finish = getPosition(Tokens[Index], "right"),
        }
        Index = Index + 2
        skipSpace()
        local method = parseName(true)
        local getmethod = {
          type = "getmethod",
          start = node.start,
          finish = lastRightPosition(),
          node = node,
          colon = colon,
          method = method,
        }
        if method then
          method.parent = getmethod
          method.type = "method"
        else
          pushError({
            type = "MISS_METHOD",
            start = lastRightPosition(),
            finish = lastRightPosition(),
          })
        end
        node.parent = getmethod
        node.next = getmethod
        node = getmethod
        if lastMethod then
          missSymbol("(", node.node.finish, node.node.finish)
        end
        lastMethod = getmethod
      elseif token == "(" then
        if funcName then
          break
        end
        local startPos = getPosition(Tokens[Index], "left")
        local call = {
          type = "call",
          start = node.start,
          node = node,
        }
        Index = Index + 2
        local args = parseExpList()
        if Tokens[Index + 1] == ")" then
          call.finish = getPosition(Tokens[Index], "right")
          Index = Index + 2
        else
          call.finish = lastRightPosition()
          missSymbol(")")
        end
        if args then
          args.type = "callargs"
          args.start = startPos
          args.finish = call.finish
          args.parent = call
          call.args = args
        end
        addDummySelf(node, call)
        checkAmbiguityCall(call, startPos)
        node.parent = call
        node = call
      elseif token == "{" then
        if funcName then
          break
        end
        local tbl = parseTable()
        local call = {
          type = "call",
          start = node.start,
          finish = tbl.finish,
          node = node,
        }
        local args = {
          type = "callargs",
          start = tbl.start,
          finish = tbl.finish,
          parent = call,
          [1] = tbl,
        }
        call.args = args
        addDummySelf(node, call)
        tbl.parent = args
        node.parent = call
        node = call
      elseif CharMapStrSH[token] then
        if funcName then
          break
        end
        local str = parseShortString()
        local call = {
          type = "call",
          start = node.start,
          finish = str.finish,
          node = node,
        }
        local args = {
          type = "callargs",
          start = str.start,
          finish = str.finish,
          parent = call,
          [1] = str,
        }
        call.args = args
        addDummySelf(node, call)
        str.parent = args
        node.parent = call
        node = call
      elseif CharMapStrLH[token] then
        local str = parseLongString()
        if str then
          if funcName then
            break
          end
          local call = {
            type = "call",
            start = node.start,
            finish = str.finish,
            node = node,
          }
          local args = {
            type = "callargs",
            start = str.start,
            finish = str.finish,
            parent = call,
            [1] = str,
          }
          call.args = args
          addDummySelf(node, call)
          str.parent = args
          node.parent = call
          node = call
        else
          local index = parseIndex()
          local bstart = index.start
          index.type = "getindex"
          index.start = node.start
          index.node = node
          node.next = index
          node.parent = index
          node = index
          if funcName then
            pushError({
              type = "INDEX_IN_FUNC_NAME",
              start = bstart,
              finish = index.finish,
            })
          end
        end
      else
        break
      end
    end
    if node.type == "call" and node.node == lastMethod then
      lastMethod = nil
    end
    if node.type == "call" then
      if node.node.special == "error" or node.node.special == "os.exit" then
        node.hasExit = true
      end
    end
    if node == lastMethod then
      if funcName then
        lastMethod = nil
      end
    end
    if lastMethod then
      missSymbol("(", lastMethod.finish)
    end
    return node
  end

  local function parseVarargs()
    local varargs = {
      type = "varargs",
      start = getPosition(Tokens[Index], "left"),
      finish = getPosition(Tokens[Index] + 2, "right"),
    }
    Index = Index + 2
    for i = #Chunk, 1, -1 do
      local chunk = Chunk[i]
      if chunk.vararg then
        if not chunk.vararg.ref then
          chunk.vararg.ref = {}
        end
        chunk.vararg.ref[#chunk.vararg.ref + 1] = varargs
        varargs.node = chunk.vararg
        break
      end
      if chunk.type == "main" then
        break
      end
      if chunk.type == "function" then
        pushError({
          type = "UNEXPECT_DOTS",
          start = varargs.start,
          finish = varargs.finish,
        })
        break
      end
    end
    return varargs
  end

  local function parseParen()
    local pl = Tokens[Index]
    local paren = {
      type = "paren",
      start = getPosition(pl, "left"),
      finish = getPosition(pl, "right"),
    }
    Index = Index + 2
    skipSpace()
    local exp = parseExp()
    if exp then
      paren.exp = exp
      paren.finish = exp.finish
      exp.parent = paren
    else
      missExp()
    end
    skipSpace()
    if Tokens[Index + 1] == ")" then
      paren.finish = getPosition(Tokens[Index], "right")
      Index = Index + 2
    else
      missSymbol(")")
    end
    return paren
  end

  local function getLocal(name, pos)
    for i = #Chunk, 1, -1 do
      local chunk = Chunk[i]
      local locals = chunk.locals
      if locals then
        local res
        for n = 1, #locals do
          local loc = locals[n]
          if loc.effect > pos then
            break
          end
          if loc[1] == name then
            if not res or res.effect < loc.effect then
              res = loc
            end
          end
        end
        if res then
          return res
        end
      end
    end
  end

  local function resolveName(node)
    if not node then
      return nil
    end
    local loc = getLocal(node[1], node.start)
    if loc then
      node.type = "getlocal"
      node.node = loc
      if not loc.ref then
        loc.ref = {}
      end
      loc.ref[#loc.ref + 1] = node
      if loc.special then
        addSpecial(loc.special, node)
      end
    else
      node.type = "getglobal"
      local env = getLocal(State.ENVMode, node.start)
      if env then
        node.node = env
        if not env.ref then
          env.ref = {}
        end
        env.ref[#env.ref + 1] = node
      end
    end
    local name = node[1]
    bindSpecial(node, name)
    return node
  end

  local function isChunkFinishToken(token)
    local currentChunk = Chunk[#Chunk]
    if not currentChunk then
      return false
    end
    local tp = currentChunk.type
    if tp == "main" then
      return false
    end
    if tp == "for" or tp == "in" or tp == "loop" or tp == "function" then
      return token == "end"
    end
    if
      tp == "if"
      or tp == "ifblock"
      or tp == "elseifblock"
      or tp == "elseblock"
    then
      return token == "then"
        or token == "end"
        or token == "else"
        or token == "elseif"
    end
    if tp == "repeat" then
      return token == "until"
    end
    return true
  end

  local function parseActions()
    local rtn, last
    while true do
      skipSpace(true)
      local token = Tokens[Index + 1]
      if token == ";" then
        Index = Index + 2
        goto CONTINUE
      end
      if ChunkFinishMap[token] and isChunkFinishToken(token) then
        break
      end
      local action, failed = parseAction()
      if failed then
        if not skipUnknownSymbol() then
          break
        end
      end
      if action then
        if not rtn and action.type == "return" then
          rtn = action
        end
        last = action
      end
      ::CONTINUE::
    end
    if rtn and rtn ~= last then
      pushError({
        type = "ACTION_AFTER_RETURN",
        start = rtn.start,
        finish = rtn.finish,
      })
    end
  end

  local function parseParams(params, isLambda)
    local lastSep
    local hasDots
    local endToken = isLambda and "|" or ")"
    while true do
      skipSpace()
      local token = Tokens[Index + 1]
      if not token or token == endToken then
        if lastSep then
          missName()
        end
        break
      end
      if token == "," then
        if lastSep or lastSep == nil then
          missName()
        else
          lastSep = true
        end
        Index = Index + 2
        goto CONTINUE
      end
      if token == "..." then
        if lastSep == false then
          missSymbol(",")
        end
        lastSep = false
        if not params then
          params = {}
        end
        local vararg = {
          type = "...",
          start = getPosition(Tokens[Index], "left"),
          finish = getPosition(Tokens[Index] + 2, "right"),
          parent = params,
          [1] = "...",
        }
        local chunk = Chunk[#Chunk]
        chunk.vararg = vararg
        params[#params + 1] = vararg
        if hasDots then
          pushError({
            type = "ARGS_AFTER_DOTS",
            start = getPosition(Tokens[Index], "left"),
            finish = getPosition(Tokens[Index] + 2, "right"),
          })
        end
        hasDots = true
        Index = Index + 2
        goto CONTINUE
      end
      if CharMapWord[ssub(token, 1, 1)] then
        if lastSep == false then
          missSymbol(",")
        end
        lastSep = false
        if not params then
          params = {}
        end
        params[#params + 1] = createLocal({
          start = getPosition(Tokens[Index], "left"),
          finish = getPosition(Tokens[Index] + #token - 1, "right"),
          parent = params,
          [1] = token,
        })
        if hasDots then
          pushError({
            type = "ARGS_AFTER_DOTS",
            start = getPosition(Tokens[Index], "left"),
            finish = getPosition(Tokens[Index] + #token - 1, "right"),
          })
        end
        if isKeyWord(token, Tokens[Index + 3]) then
          pushError({
            type = "KEYWORD",
            start = getPosition(Tokens[Index], "left"),
            finish = getPosition(Tokens[Index] + #token - 1, "right"),
          })
        end
        Index = Index + 2
        goto CONTINUE
      end
      skipUnknownSymbol()
      ::CONTINUE::
    end
    return params
  end

  local function parseFunction(isLocal, isAction)
    local funcLeft = getPosition(Tokens[Index], "left")
    local funcRight = getPosition(Tokens[Index] + 7, "right")
    local func = {
      type = "function",
      start = funcLeft,
      finish = funcRight,
      bstart = funcRight,
      keyword = {
        [1] = funcLeft,
        [2] = funcRight,
      },
    }
    Index = Index + 2
    skipSpace(true)
    local hasLeftParen = Tokens[Index + 1] == "("
    if not hasLeftParen then
      local name = parseName()
      if name then
        local simple = parseSimple(name, true)
        if isLocal then
          if simple == name then
            createLocal(name)
          else
            resolveName(name)
            pushError({
              type = "UNEXPECT_LFUNC_NAME",
              start = simple.start,
              finish = simple.finish,
            })
          end
        else
          resolveName(name)
        end
        func.name = simple
        func.finish = simple.finish
        func.bstart = simple.finish
        if not isAction then
          simple.parent = func
          pushError({
            type = "UNEXPECT_EFUNC_NAME",
            start = simple.start,
            finish = simple.finish,
          })
        end
        skipSpace(true)
        hasLeftParen = Tokens[Index + 1] == "("
      end
    end
    local LastLocalCount = LocalCount
    LocalCount = 0
    pushChunk(func)
    local params
    if func.name and func.name.type == "getmethod" then
      if func.name.type == "getmethod" then
        params = {
          type = "funcargs",
          start = funcRight,
          finish = funcRight,
          parent = func,
        }
        params[1] = createLocal({
          start = funcRight,
          finish = funcRight,
          parent = params,
          [1] = "self",
        })
        params[1].type = "self"
      end
    end
    if hasLeftParen then
      params = params or {}
      local parenLeft = getPosition(Tokens[Index], "left")
      Index = Index + 2
      params = parseParams(params)
      params.type = "funcargs"
      params.start = parenLeft
      params.finish = lastRightPosition()
      params.parent = func
      func.args = params
      skipSpace(true)
      if Tokens[Index + 1] == ")" then
        local parenRight = getPosition(Tokens[Index], "right")
        func.finish = parenRight
        func.bstart = parenRight
        if params then
          params.finish = parenRight
        end
        Index = Index + 2
        skipSpace(true)
      else
        func.finish = lastRightPosition()
        func.bstart = func.finish
        if params then
          params.finish = func.finish
        end
        missSymbol(")")
      end
    else
      missSymbol("(")
    end
    parseActions()
    popChunk()
    func.bfinish = getPosition(Tokens[Index], "left")
    if Tokens[Index + 1] == "end" then
      local endLeft = getPosition(Tokens[Index], "left")
      local endRight = getPosition(Tokens[Index] + 2, "right")
      func.keyword[3] = endLeft
      func.keyword[4] = endRight
      func.finish = endRight
      Index = Index + 2
    else
      func.finish = lastRightPosition()
      missEnd(funcLeft, funcRight)
    end
    LocalCount = LastLocalCount
    return func
  end

  local function parseLambda(isDoublePipe)
    local lambdaLeft = getPosition(Tokens[Index], "left")
    local lambdaRight = getPosition(Tokens[Index], "right")
    local lambda = {
      type = "function",
      start = lambdaLeft,
      finish = lambdaRight,
      bstart = lambdaRight,
      keyword = {
        [1] = lambdaLeft,
        [2] = lambdaRight,
      },
      hasReturn = true,
    }
    Index = Index + 2
    local pipeLeft = getPosition(Tokens[Index], "left")
    local pipeRight = getPosition(Tokens[Index], "right")
    skipSpace(true)
    local params
    local LastLocalCount = LocalCount
    -- if nonstandardSymbol for '||' is true it is possible for token to be || when there are no params
    if isDoublePipe then
      params = {
        start = pipeLeft,
        finish = pipeRight,
        parent = lambda,
        type = "funcargs",
      }
    else
      -- fake chunk to store locals
      pushChunk(lambda)
      LocalCount = 0
      params = parseParams({}, true)
      params.type = "funcargs"
      params.start = pipeLeft
      params.finish = lastRightPosition()
      params.parent = lambda
      lambda.args = params
      skipSpace()
      if Tokens[Index + 1] == "|" then
        pipeRight = getPosition(Tokens[Index], "right")
        lambda.finish = pipeRight
        lambda.bstart = pipeRight
        if params then
          params.finish = pipeRight
        end
        Index = Index + 2
        skipSpace()
      else
        lambda.finish = lastRightPosition()
        lambda.bstart = lambda.finish
        if params then
          params.finish = lambda.finish
        end
        missSymbol("|")
      end
    end
    local child = parseExp()

    -- don't want popChunk logic here as this is not a real chunk
    Chunk[#Chunk] = nil

    if child then
      -- create dummy return
      local rtn = {
        type = "return",
        start = child.start,
        finish = child.finish,
        parent = lambda,
        [1] = child,
      }
      child.parent = rtn
      lambda[1] = rtn
      lambda.returns = { rtn }
      lambda.finish = child.finish
      lambda.keyword[3] = child.finish
      lambda.keyword[4] = child.finish
    else
      lambda.finish = lastRightPosition()
      missExp()
    end
    lambda.bfinish = getPosition(Tokens[Index], "left")
    LocalCount = LastLocalCount
    return lambda
  end

  local function checkNeedParen(source)
    local token = Tokens[Index + 1]
    if token ~= "." and token ~= ":" then
      return source
    end
    local exp = parseSimple(source, false)
    if exp == source then
      return exp
    end
    pushError({
      type = "NEED_PAREN",
      start = source.start,
      finish = source.finish,
      fix = {
        title = "FIX_ADD_PAREN",
        {
          start = source.start,
          finish = source.start,
          text = "(",
        },
        {
          start = source.finish,
          finish = source.finish,
          text = ")",
        },
      },
    })
    return exp
  end

  local function parseExpUnit()
    local token = Tokens[Index + 1]
    if token == "(" then
      local paren = parseParen()
      return parseSimple(paren, false)
    end

    if token == "..." then
      local varargs = parseVarargs()
      return varargs
    end

    if token == "{" then
      local table = parseTable()
      if not table then
        return nil
      end
      local exp = checkNeedParen(table)
      return exp
    end

    if CharMapStrSH[token] then
      local string = parseShortString()
      if not string then
        return nil
      end
      local exp = checkNeedParen(string)
      return exp
    end

    if CharMapStrLH[token] then
      local string = parseLongString()
      if not string then
        return nil
      end
      local exp = checkNeedParen(string)
      return exp
    end

    local number = parseNumber()
    if number then
      return number
    end

    if ChunkFinishMap[token] then
      return nil
    end

    if token == "nil" then
      return parseNil()
    end

    if token == "true" or token == "false" then
      return parseBoolean()
    end

    if token == "function" then
      return parseFunction()
    end

    -- FIXME: Use something other than nonstandardSymbol to check for lambda support
    if
      State.options.nonstandardSymbol["|lambda|"]
      and (token == "|" or token == "||")
    then
      return parseLambda(token == "||")
    end

    local node = parseName()
    if node then
      local nameNode = resolveName(node)
      if nameNode then
        return parseSimple(nameNode, false)
      end
    end

    return nil
  end

  local function parseUnaryOP()
    local token = Tokens[Index + 1]
    local symbol = UnarySymbol[token] and token or UnaryAlias[token]
    if not symbol then
      return nil
    end
    local myLevel = UnarySymbol[symbol]
    local op = {
      type = symbol,
      start = getPosition(Tokens[Index], "left"),
      finish = getPosition(Tokens[Index] + #symbol - 1, "right"),
    }
    Index = Index + 2
    return op, myLevel
  end

  ---@param level integer # op level must greater than this level
  local function parseBinaryOP(asAction, level)
    local token = Tokens[Index + 1]
    local symbol = (BinarySymbol[token] and token)
      or BinaryAlias[token]
      or (not asAction and BinaryActionAlias[token])
    if not symbol then
      return nil
    end
    if symbol == "//" and State.options.nonstandardSymbol["//"] then
      return nil
    end
    local myLevel = BinarySymbol[symbol]
    if level and myLevel < level then
      return nil
    end
    local op = {
      type = symbol,
      start = getPosition(Tokens[Index], "left"),
      finish = getPosition(Tokens[Index] + #token - 1, "right"),
    }
    if not asAction then
      if token == "=" then
        pushError({
          type = "ERR_EQ_AS_ASSIGN",
          start = op.start,
          finish = op.finish,
          fix = {
            title = "FIX_EQ_AS_ASSIGN",
            {
              start = op.start,
              finish = op.finish,
              text = "==",
            },
          },
        })
      end
    end
    if BinaryAlias[token] then
      if not State.options.nonstandardSymbol[token] then
        pushError({
          type = "ERR_NONSTANDARD_SYMBOL",
          start = op.start,
          finish = op.finish,
          info = {
            symbol = symbol,
          },
          fix = {
            title = "FIX_NONSTANDARD_SYMBOL",
            symbol = symbol,
            {
              start = op.start,
              finish = op.finish,
              text = symbol,
            },
          },
        })
      end
    end
    if token == "//" or token == "<<" or token == ">>" then
      if
        State.version ~= "Lua 5.3"
        and State.version ~= "Lua 5.4"
        and State.version ~= "Lua 5.5"
      then
        pushError({
          type = "UNSUPPORT_SYMBOL",
          version = { "Lua 5.3", "Lua 5.4", "Lua 5.5" },
          start = op.start,
          finish = op.finish,
          info = {
            version = State.version,
          },
        })
      end
    end
    Index = Index + 2
    return op, myLevel
  end

  function parseExp(asAction, level)
    local exp
    local uop, uopLevel = parseUnaryOP()
    if uop then
      skipSpace()
      local child = parseExp(asAction, uopLevel)
      -- 预计算负数
      if
        uop.type == "-"
        and child
        and (child.type == "number" or child.type == "integer")
      then
        child.start = uop.start
        child[1] = -child[1]
        exp = child
      else
        exp = {
          type = "unary",
          op = uop,
          start = uop.start,
          finish = child and child.finish or uop.finish,
          [1] = child,
        }
        if child then
          child.parent = exp
        else
          missExp()
        end
      end
    else
      exp = parseExpUnit()
      if not exp then
        return nil
      end
    end

    while true do
      skipSpace()
      local bop, bopLevel = parseBinaryOP(asAction, level)
      if not bop then
        break
      end

      ::AGAIN::
      skipSpace()
      local isForward = SymbolForward[bopLevel]
      local child =
        parseExp(asAction, isForward and (bopLevel + 0.5) or bopLevel)
      if not child then
        if skipUnknownSymbol() then
          goto AGAIN
        else
          missExp()
        end
      end
      local bin = {
        type = "binary",
        start = exp.start,
        finish = child and child.finish or bop.finish,
        op = bop,
        [1] = exp,
        [2] = child,
      }
      exp.parent = bin
      if child then
        child.parent = bin
      end
      exp = bin
    end

    return exp
  end

  local function skipSeps()
    while true do
      skipSpace()
      if Tokens[Index + 1] == "," then
        missExp()
        Index = Index + 2
      else
        break
      end
    end
  end

  ---@return parser.Node?   first
  ---@return parser.Node?   second
  ---@return parser.Node[]? rest
  local function parseSetValues()
    skipSpace()
    local first = parseExp()
    if not first then
      return nil
    end
    skipSpace()
    if Tokens[Index + 1] ~= "," then
      return first
    end
    Index = Index + 2
    skipSeps()
    local second = parseExp()
    if not second then
      missExp()
      return first
    end
    skipSpace()
    if Tokens[Index + 1] ~= "," then
      return first, second
    end
    Index = Index + 2
    skipSeps()
    local third = parseExp()
    if not third then
      missExp()
      return first, second
    end

    local rest = { third }
    while true do
      skipSpace()
      if Tokens[Index + 1] ~= "," then
        return first, second, rest
      end
      Index = Index + 2
      skipSeps()
      local exp = parseExp()
      if not exp then
        missExp()
        return first, second, rest
      end
      rest[#rest + 1] = exp
    end
  end

  local function pushActionIntoCurrentChunk(action)
    local chunk = Chunk[#Chunk]
    if chunk then
      chunk[#chunk + 1] = action
      action.parent = chunk
    end
  end

  ---@return parser.Node?   second
  ---@return parser.Node[]? rest
  local function parseVarTails(parser, isLocal)
    if Tokens[Index + 1] ~= "," then
      return nil
    end
    Index = Index + 2
    skipSpace()
    local second = parser(true)
    if not second then
      missName()
      return nil
    end
    if isLocal then
      createLocal(second, parseLocalAttrs())
    end
    skipSpace()
    if Tokens[Index + 1] ~= "," then
      return second
    end
    Index = Index + 2
    skipSeps()
    local third = parser(true)
    if not third then
      missName()
      return second
    end
    if isLocal then
      createLocal(third, parseLocalAttrs())
    end
    local rest = { third }
    while true do
      skipSpace()
      if Tokens[Index + 1] ~= "," then
        return second, rest
      end
      Index = Index + 2
      skipSeps()
      local name = parser(true)
      if not name then
        missName()
        return second, rest
      end
      if isLocal then
        createLocal(name, parseLocalAttrs())
      end
      rest[#rest + 1] = name
    end
  end

  local function bindValue(n, v, index, lastValue, isLocal, isSet)
    if isLocal then
      if v and v.special then
        addSpecial(v.special, n)
      end
    elseif isSet then
      n.type = GetToSetMap[n.type] or n.type
      if n.type == "setlocal" then
        local loc = n.node
        if loc.attrs then
          pushError({
            type = "SET_CONST",
            start = n.start,
            finish = n.finish,
          })
        end
      end
    end
    if not v and lastValue then
      if lastValue.type == "call" or lastValue.type == "varargs" then
        v = lastValue
        if not v.extParent then
          v.extParent = {}
        end
      end
    end
    if v then
      if v.type == "call" or v.type == "varargs" then
        local select = {
          type = "select",
          sindex = index,
          start = v.start,
          finish = v.finish,
          vararg = v,
        }
        if v.parent then
          v.extParent[#v.extParent + 1] = select
        else
          v.parent = select
        end
        v = select
      end
      n.value = v
      n.range = v.finish
      v.parent = n
    end
  end

  local function parseMultiVars(n1, parser, isLocal)
    local hasClose = guide.hasAttribute(n1, "close")
    local n2, nrest = parseVarTails(parser, isLocal)
    skipSpace()
    local v1, v2, vrest
    local isSet
    local max = 1
    if expectAssign(not isLocal) then
      v1, v2, vrest = parseSetValues()
      isSet = true
      if not v1 then
        missExp()
      end
    end
    local index = 1
    bindValue(n1, v1, index, nil, isLocal, isSet)
    local lastValue = v1
    local lastVar = n1
    if n2 then
      max = 2
      if not v2 then
        index = 2
      end
      bindValue(n2, v2, index, lastValue, isLocal, isSet)
      lastValue = v2 or lastValue
      lastVar = n2
      pushActionIntoCurrentChunk(n2)
      if guide.hasAttribute(n2, "close") then
        if hasClose then
          pushError({
            type = "MULTI_CLOSE",
            start = n2.attrs[1].start,
            finish = n2.attrs[1].finish,
          })
        end
        hasClose = true
      end
    end
    if nrest then
      for i = 1, #nrest do
        local n = nrest[i]
        local v = vrest and vrest[i]
        max = i + 2
        if not v then
          index = index + 1
        end
        bindValue(n, v, index, lastValue, isLocal, isSet)
        lastValue = v or lastValue
        lastVar = n
        pushActionIntoCurrentChunk(n)
        if guide.hasAttribute(n, "close") then
          if hasClose then
            pushError({
              type = "MULTI_CLOSE",
              start = n.attrs[1].start,
              finish = n.attrs[1].finish,
            })
          end
          hasClose = true
        end
      end
    end

    if isLocal then
      local effect = lastValue and lastValue.finish or lastVar.finish
      n1.effect = effect
      if n2 then
        n2.effect = effect
      end
      if nrest then
        for i = 1, #nrest do
          nrest[i].effect = effect
        end
      end
    end

    if v2 and not n2 then
      v2.redundant = {
        max = max,
        passed = 2,
      }
      pushActionIntoCurrentChunk(v2)
    end
    if vrest then
      for i = 1, #vrest do
        local v = vrest[i]
        if not nrest or not nrest[i] then
          v.redundant = {
            max = max,
            passed = i + 2,
          }
          pushActionIntoCurrentChunk(v)
        end
      end
    end

    return n1, isSet
  end

  local function compileExpAsAction(exp)
    pushActionIntoCurrentChunk(exp)
    if GetToSetMap[exp.type] then
      skipSpace()
      local isLocal
      if exp.type == "getlocal" and exp[1] == State.ENVMode then
        exp.special = nil
        -- TODO: need + 1 at the end
        LocalCount = LocalCount - 1
        local loc = createLocal(exp, parseLocalAttrs())
        loc.locPos = exp.start
        loc.effect = maxinteger
        isLocal = true
        skipSpace()
      end
      local action, isSet = parseMultiVars(exp, parseExp, isLocal)
      if isSet or action.type == "getmethod" then
        return action
      end
    end

    if exp.type == "call" then
      if exp.hasExit then
        for i = #Chunk, 1, -1 do
          local block = Chunk[i]
          if
            block.type == "ifblock"
            or block.type == "elseifblock"
            or block.type == "elseblock"
            or block.type == "function"
          then
            block.hasExit = true
            break
          end
        end
      end
      return exp
    end

    if exp.type == "binary" then
      if GetToSetMap[exp[1].type] then
        local op = exp.op
        if op.type == "==" then
          pushError({
            type = "ERR_ASSIGN_AS_EQ",
            start = op.start,
            finish = op.finish,
            fix = {
              title = "FIX_ASSIGN_AS_EQ",
              {
                start = op.start,
                finish = op.finish,
                text = "=",
              },
            },
          })
          return
        end
      end
    end

    pushError({
      type = "EXP_IN_ACTION",
      start = exp.start,
      finish = exp.finish,
    })

    return exp
  end

  local function parseLocal()
    local locPos = getPosition(Tokens[Index], "left")
    Index = Index + 2
    skipSpace()
    local word = peekWord()
    if not word then
      missName()
      return nil
    end

    if word == "function" then
      local func = parseFunction(true, true)
      local name = func.name
      if name then
        func.name = nil
        name.value = func
        name.vstart = func.start
        name.range = func.finish
        name.locPos = locPos
        func.parent = name
        pushActionIntoCurrentChunk(name)
        return name
      else
        missName(func.keyword[2])
        pushActionIntoCurrentChunk(func)
        return func
      end
    end

    local name = parseName(true)
    if not name then
      missName()
      return nil
    end
    local loc = createLocal(name, parseLocalAttrs())
    loc.locPos = locPos
    loc.effect = maxinteger
    pushActionIntoCurrentChunk(loc)
    skipSpace()
    parseMultiVars(loc, parseName, true)

    return loc
  end

  local function parseDo()
    local doLeft = getPosition(Tokens[Index], "left")
    local doRight = getPosition(Tokens[Index] + 1, "right")
    local obj = {
      type = "do",
      start = doLeft,
      finish = doRight,
      bstart = doRight,
      keyword = {
        [1] = doLeft,
        [2] = doRight,
      },
    }
    Index = Index + 2
    pushActionIntoCurrentChunk(obj)
    pushChunk(obj)
    parseActions()
    popChunk()
    obj.bfinish = getPosition(Tokens[Index], "left")
    if Tokens[Index + 1] == "end" then
      obj.finish = getPosition(Tokens[Index] + 2, "right")
      obj.keyword[3] = getPosition(Tokens[Index], "left")
      obj.keyword[4] = getPosition(Tokens[Index] + 2, "right")
      Index = Index + 2
    else
      missEnd(doLeft, doRight)
    end
    if obj.locals then
      LocalCount = LocalCount - #obj.locals
    end

    return obj
  end

  local function parseReturn()
    local returnLeft = getPosition(Tokens[Index], "left")
    local returnRight = getPosition(Tokens[Index] + 5, "right")
    Index = Index + 2
    skipSpace()
    local rtn = parseExpList(true)
    if rtn then
      rtn.type = "return"
      rtn.start = returnLeft
    else
      rtn = {
        type = "return",
        start = returnLeft,
        finish = returnRight,
      }
    end
    pushActionIntoCurrentChunk(rtn)
    for i = #Chunk, 1, -1 do
      local block = Chunk[i]
      if block.type == "function" or block.type == "main" then
        if not block.returns then
          block.returns = {}
        end
        block.returns[#block.returns + 1] = rtn
        break
      end
    end
    for i = #Chunk, 1, -1 do
      local block = Chunk[i]
      if
        block.type == "ifblock"
        or block.type == "elseifblock"
        or block.type == "elseblock"
        or block.type == "function"
      then
        block.hasReturn = true
        break
      end
    end

    return rtn
  end

  local function parseLabel()
    local left = getPosition(Tokens[Index], "left")
    Index = Index + 2
    skipSpace()
    local label = parseName()
    skipSpace()

    if not label then
      missName()
    end

    if Tokens[Index + 1] == "::" then
      Index = Index + 2
    else
      if label then
        missSymbol("::")
      end
    end

    if not label then
      return nil
    end

    label.type = "label"
    pushActionIntoCurrentChunk(label)

    local block = guide.getBlock(label)
    if block then
      if not block.labels then
        block.labels = {}
      end
      local name = label[1]
      local olabel = guide.getLabel(block, name)
      if olabel then
        if
          State.version == "Lua 5.4"
          or State.version == "Lua 5.5"
          or block == guide.getBlock(olabel)
        then
          pushError({
            type = "REDEFINED_LABEL",
            start = label.start,
            finish = label.finish,
            relative = {
              {
                olabel.start,
                olabel.finish,
              },
            },
          })
        end
      end
      block.labels[name] = label
    end

    if State.version == "Lua 5.1" then
      pushError({
        type = "UNSUPPORT_SYMBOL",
        start = left,
        finish = lastRightPosition(),
        version = { "Lua 5.2", "Lua 5.3", "Lua 5.4", "Lua 5.5", "LuaJIT" },
        info = {
          version = State.version,
        },
      })
      return
    end
    return label
  end

  local function parseGoTo()
    local start = getPosition(Tokens[Index], "left")
    Index = Index + 2
    skipSpace()

    local action = parseName()
    if not action then
      missName()
      return nil
    end

    action.type = "goto"
    action.keyStart = start

    for i = #Chunk, 1, -1 do
      local chunk = Chunk[i]
      if chunk.type == "function" or chunk.type == "main" then
        if not chunk.gotos then
          chunk.gotos = {}
        end
        chunk.gotos[#chunk.gotos + 1] = action
        break
      end
    end
    for i = #Chunk, 1, -1 do
      local chunk = Chunk[i]
      if
        chunk.type == "ifblock"
        or chunk.type == "elseifblock"
        or chunk.type == "elseblock"
      then
        chunk.hasGoTo = true
        break
      end
    end

    pushActionIntoCurrentChunk(action)
    return action
  end

  local function parseIfBlock(parent)
    local ifLeft = getPosition(Tokens[Index], "left")
    local ifRight = getPosition(Tokens[Index] + 1, "right")
    Index = Index + 2
    local ifblock = {
      type = "ifblock",
      parent = parent,
      start = ifLeft,
      finish = ifRight,
      bstart = ifRight,
      keyword = {
        [1] = ifLeft,
        [2] = ifRight,
      },
    }
    skipSpace()
    local filter = parseExp()
    if filter then
      ifblock.filter = filter
      ifblock.finish = filter.finish
      ifblock.bstart = ifblock.finish
      filter.parent = ifblock
    else
      missExp()
    end
    skipSpace()
    local thenToken = Tokens[Index + 1]
    if thenToken == "then" or thenToken == "do" then
      ifblock.finish = getPosition(Tokens[Index] + #thenToken - 1, "right")
      ifblock.bstart = ifblock.finish
      ifblock.keyword[3] = getPosition(Tokens[Index], "left")
      ifblock.keyword[4] = ifblock.finish
      if thenToken == "do" then
        pushError({
          type = "ERR_THEN_AS_DO",
          start = ifblock.keyword[3],
          finish = ifblock.keyword[4],
          fix = {
            title = "FIX_THEN_AS_DO",
            {
              start = ifblock.keyword[3],
              finish = ifblock.keyword[4],
              text = "then",
            },
          },
        })
      end
      Index = Index + 2
    else
      missSymbol("then")
    end
    pushChunk(ifblock)
    parseActions()
    popChunk()
    ifblock.finish = getPosition(Tokens[Index], "left")
    ifblock.bfinish = ifblock.finish
    if ifblock.locals then
      LocalCount = LocalCount - #ifblock.locals
    end
    return ifblock
  end

  local function parseElseIfBlock(parent)
    local ifLeft = getPosition(Tokens[Index], "left")
    local ifRight = getPosition(Tokens[Index] + 5, "right")
    local elseifblock = {
      type = "elseifblock",
      parent = parent,
      start = ifLeft,
      finish = ifRight,
      bstart = ifRight,
      keyword = {
        [1] = ifLeft,
        [2] = ifRight,
      },
    }
    Index = Index + 2
    skipSpace()
    local filter = parseExp()
    if filter then
      elseifblock.filter = filter
      elseifblock.finish = filter.finish
      elseifblock.bstart = elseifblock.finish
      filter.parent = elseifblock
    else
      missExp()
    end
    skipSpace()
    local thenToken = Tokens[Index + 1]
    if thenToken == "then" or thenToken == "do" then
      elseifblock.finish = getPosition(Tokens[Index] + #thenToken - 1, "right")
      elseifblock.bstart = elseifblock.finish
      elseifblock.keyword[3] = getPosition(Tokens[Index], "left")
      elseifblock.keyword[4] = elseifblock.finish
      if thenToken == "do" then
        pushError({
          type = "ERR_THEN_AS_DO",
          start = elseifblock.keyword[3],
          finish = elseifblock.keyword[4],
          fix = {
            title = "FIX_THEN_AS_DO",
            {
              start = elseifblock.keyword[3],
              finish = elseifblock.keyword[4],
              text = "then",
            },
          },
        })
      end
      Index = Index + 2
    else
      missSymbol("then")
    end
    pushChunk(elseifblock)
    parseActions()
    popChunk()
    elseifblock.finish = getPosition(Tokens[Index], "left")
    elseifblock.bfinish = elseifblock.finish
    if elseifblock.locals then
      LocalCount = LocalCount - #elseifblock.locals
    end
    return elseifblock
  end

  local function parseElseBlock(parent)
    local ifLeft = getPosition(Tokens[Index], "left")
    local ifRight = getPosition(Tokens[Index] + 3, "right")
    local elseblock = {
      type = "elseblock",
      parent = parent,
      start = ifLeft,
      finish = ifRight,
      bstart = ifRight,
      keyword = {
        [1] = ifLeft,
        [2] = ifRight,
      },
    }
    Index = Index + 2
    skipSpace()
    pushChunk(elseblock)
    parseActions()
    popChunk()
    elseblock.finish = getPosition(Tokens[Index], "left")
    elseblock.bfinish = elseblock.finish
    if elseblock.locals then
      LocalCount = LocalCount - #elseblock.locals
    end
    return elseblock
  end

  local function parseIf()
    local token = Tokens[Index + 1]
    local left = getPosition(Tokens[Index], "left")
    local action = {
      type = "if",
      start = left,
      finish = getPosition(Tokens[Index] + #token - 1, "right"),
    }
    pushActionIntoCurrentChunk(action)
    if token ~= "if" then
      missSymbol("if", left, left)
    end
    local hasElse
    while true do
      local word = Tokens[Index + 1]
      local child
      if word == "if" then
        child = parseIfBlock(action)
      elseif word == "elseif" then
        child = parseElseIfBlock(action)
      elseif word == "else" then
        child = parseElseBlock(action)
      end
      if not child then
        break
      end
      if hasElse then
        pushError({
          type = "BLOCK_AFTER_ELSE",
          start = child.start,
          finish = child.finish,
        })
      end
      if word == "else" then
        hasElse = true
      end
      action[#action + 1] = child
      action.finish = child.finish
      skipSpace()
    end

    if Tokens[Index + 1] == "end" then
      action.finish = getPosition(Tokens[Index] + 2, "right")
      Index = Index + 2
    else
      missEnd(action[1].keyword[1], action[1].keyword[2])
    end

    return action
  end

  local function parseFor()
    local action = {
      type = "for",
      start = getPosition(Tokens[Index], "left"),
      finish = getPosition(Tokens[Index] + 2, "right"),
      keyword = {},
    }
    action.bstart = action.finish
    action.keyword[1] = action.start
    action.keyword[2] = action.finish
    Index = Index + 2
    pushActionIntoCurrentChunk(action)
    pushChunk(action)
    skipSpace()
    local nameOrList = parseNameOrList(action)
    if not nameOrList then
      missName()
    end
    skipSpace()
    local forStateVars
    -- for i =
    if expectAssign() then
      action.type = "loop"

      skipSpace()
      local expList = parseExpList()
      local name
      if nameOrList then
        if nameOrList.type == "name" then
          name = nameOrList
        else
          name = nameOrList[1]
        end
      end
      -- for x in ... uses 4 variables
      forStateVars = 3
      LocalCount = LocalCount + forStateVars
      if name then
        ---@cast name parser.Node
        -- In Lua 5.5, for loop variables are treated as constants
        local attrs
        if State.version == "Lua 5.5" then
          attrs = {
            type = "localattrs",
            [1] = {
              type = "localattr",
              start = name.start,
              finish = name.finish,
              parent = nil, -- will be set by createLocal
              [1] = "const",
            },
          }
          attrs[1].parent = attrs
        end
        local loc = createLocal(name, attrs)
        loc.parent = action
        action.finish = name.finish
        action.bstart = action.finish
        action.loc = loc
      end
      if expList then
        expList.parent = action
        local value = expList[1]
        if value then
          value.parent = expList
          action.init = value
          action.finish = expList[#expList].finish
          action.bstart = action.finish
        end
        local max = expList[2]
        if max then
          max.parent = expList
          action.max = max
          action.finish = max.finish
          action.bstart = action.finish
        else
          pushError({
            type = "MISS_LOOP_MAX",
            start = lastRightPosition(),
            finish = lastRightPosition(),
          })
        end
        local step = expList[3]
        if step then
          step.parent = expList
          action.step = step
          action.finish = step.finish
          action.bstart = action.finish
        end
      else
        pushError({
          type = "MISS_LOOP_MIN",
          start = lastRightPosition(),
          finish = lastRightPosition(),
        })
      end

      if action.loc then
        action.loc.effect = action.finish
      end
    elseif Tokens[Index + 1] == "in" then
      action.type = "in"
      local inLeft = getPosition(Tokens[Index], "left")
      local inRight = getPosition(Tokens[Index] + 1, "right")
      Index = Index + 2
      skipSpace()

      local exps = parseExpList()

      action.finish = inRight
      action.bstart = action.finish
      action.keyword[3] = inLeft
      action.keyword[4] = inRight

      local list
      if nameOrList and nameOrList.type == "name" then
        list = {
          type = "list",
          start = nameOrList.start,
          finish = nameOrList.finish,
          parent = action,
          [1] = nameOrList,
        }
      else
        list = nameOrList
      end

      if exps then
        local lastExp = exps[#exps]
        if lastExp then
          action.finish = lastExp.finish
          action.bstart = action.finish
        end

        action.exps = exps
        exps.parent = action
        for i = 1, #exps do
          local exp = exps[i]
          exp.parent = exps
        end
      else
        missExp()
      end

      if State.version == "Lua 5.4" or State.version == "Lua 5.5" then
        forStateVars = 4
      else
        forStateVars = 3
      end
      LocalCount = LocalCount + forStateVars

      if list then
        local lastName = list[#list]
        list.range = lastName and lastName.range or inRight
        action.keys = list
        for i = 1, #list do
          local obj = list[i]
          ---@cast obj parser.Node
          -- In Lua 5.5, for loop variables are treated as constants
          local attrs
          if State.version == "Lua 5.5" then
            attrs = {
              type = "localattrs",
              [1] = {
                type = "localattr",
                start = obj.start,
                finish = obj.finish,
                parent = nil, -- will be set by createLocal
                [1] = "const",
              },
            }
            attrs[1].parent = attrs
          end
          local loc = createLocal(obj, attrs)
          loc.parent = action
          loc.effect = action.finish
        end
      end
    else
      missSymbol("in")
    end

    skipSpace()
    local doToken = Tokens[Index + 1]
    if doToken == "do" or doToken == "then" then
      local left = getPosition(Tokens[Index], "left")
      local right = getPosition(Tokens[Index] + #doToken - 1, "right")
      action.finish = right
      action.bstart = action.finish
      action.keyword[#action.keyword + 1] = left
      action.keyword[#action.keyword + 1] = right
      if doToken == "then" then
        pushError({
          type = "ERR_DO_AS_THEN",
          start = left,
          finish = right,
          fix = {
            title = "FIX_DO_AS_THEN",
            {
              start = left,
              finish = right,
              text = "do",
            },
          },
        })
      end
      Index = Index + 2
    else
      missSymbol("do")
    end

    skipSpace()
    parseActions()
    popChunk()
    skipSpace()
    action.bfinish = getPosition(Tokens[Index], "left")
    if Tokens[Index + 1] == "end" then
      action.finish = getPosition(Tokens[Index] + 2, "right")
      action.keyword[#action.keyword + 1] = getPosition(Tokens[Index], "left")
      action.keyword[#action.keyword + 1] = action.finish
      Index = Index + 2
    else
      missEnd(action.keyword[1], action.keyword[2])
    end

    if action.locals then
      LocalCount = LocalCount - #action.locals
    end
    if forStateVars then
      LocalCount = LocalCount - forStateVars
    end

    return action
  end

  local function parseWhile()
    local action = {
      type = "while",
      start = getPosition(Tokens[Index], "left"),
      finish = getPosition(Tokens[Index] + 4, "right"),
      keyword = {},
    }
    action.bstart = action.finish
    action.keyword[1] = action.start
    action.keyword[2] = action.finish
    Index = Index + 2

    skipSpace()
    local nextToken = Tokens[Index + 1]
    local filter = nextToken ~= "do" and nextToken ~= "then" and parseExp()
    if filter then
      action.filter = filter
      action.finish = filter.finish
      filter.parent = action
    else
      missExp()
    end

    skipSpace()
    local doToken = Tokens[Index + 1]
    if doToken == "do" or doToken == "then" then
      local left = getPosition(Tokens[Index], "left")
      local right = getPosition(Tokens[Index] + #doToken - 1, "right")
      action.finish = left
      action.bstart = right
      action.keyword[#action.keyword + 1] = left
      action.keyword[#action.keyword + 1] = right
      if doToken == "then" then
        pushError({
          type = "ERR_DO_AS_THEN",
          start = left,
          finish = right,
          fix = {
            title = "FIX_DO_AS_THEN",
            {
              start = left,
              finish = right,
              text = "do",
            },
          },
        })
      end
      Index = Index + 2
    else
      missSymbol("do")
    end

    pushActionIntoCurrentChunk(action)
    pushChunk(action)
    skipSpace()
    parseActions()
    popChunk()

    skipSpace()
    action.bfinish = getPosition(Tokens[Index], "left")
    if Tokens[Index + 1] == "end" then
      action.finish = getPosition(Tokens[Index] + 2, "right")
      action.keyword[#action.keyword + 1] = getPosition(Tokens[Index], "left")
      action.keyword[#action.keyword + 1] = action.finish
      Index = Index + 2
    else
      missEnd(action.keyword[1], action.keyword[2])
    end

    if action.locals then
      LocalCount = LocalCount - #action.locals
    end

    return action
  end

  local function parseRepeat()
    local action = {
      type = "repeat",
      start = getPosition(Tokens[Index], "left"),
      finish = getPosition(Tokens[Index] + 5, "right"),
      keyword = {},
    }
    action.bstart = action.finish
    action.keyword[1] = action.start
    action.keyword[2] = action.finish
    Index = Index + 2

    pushActionIntoCurrentChunk(action)
    pushChunk(action)
    skipSpace()
    parseActions()

    skipSpace()
    action.bfinish = getPosition(Tokens[Index], "left")
    if Tokens[Index + 1] == "until" then
      action.finish = getPosition(Tokens[Index] + 4, "right")
      action.keyword[#action.keyword + 1] = getPosition(Tokens[Index], "left")
      action.keyword[#action.keyword + 1] = action.finish
      Index = Index + 2

      skipSpace()
      local filter = parseExp()
      if filter then
        action.filter = filter
        filter.parent = action
      else
        missExp()
      end
    else
      missSymbol("until")
    end

    popChunk()
    if action.filter then
      action.finish = action.filter.finish
    end

    if action.locals then
      LocalCount = LocalCount - #action.locals
    end

    return action
  end

  local function parseBreak()
    local returnLeft = getPosition(Tokens[Index], "left")
    local returnRight =
      getPosition(Tokens[Index] + #Tokens[Index + 1] - 1, "right")
    Index = Index + 2
    skipSpace()
    local action = {
      type = "break",
      start = returnLeft,
      finish = returnRight,
    }

    local ok
    for i = #Chunk, 1, -1 do
      local chunk = Chunk[i]
      if chunk.type == "function" then
        break
      end
      if
        chunk.type == "while"
        or chunk.type == "in"
        or chunk.type == "loop"
        or chunk.type == "repeat"
        or chunk.type == "for"
      then
        if not chunk.breaks then
          chunk.breaks = {}
        end
        chunk.breaks[#chunk.breaks + 1] = action
        ok = true
        break
      end
    end
    for i = #Chunk, 1, -1 do
      local chunk = Chunk[i]
      if
        chunk.type == "ifblock"
        or chunk.type == "elseifblock"
        or chunk.type == "elseblock"
      then
        chunk.hasBreak = true
        break
      end
    end
    if not ok and Mode == "Lua" then
      pushError({
        type = "BREAK_OUTSIDE",
        start = action.start,
        finish = action.finish,
      })
    end

    pushActionIntoCurrentChunk(action)
    return action
  end

  function parseAction()
    local token = Tokens[Index + 1]

    if token == "::" then
      return parseLabel()
    end

    if token == "local" then
      return parseLocal()
    end

    if token == "if" or token == "elseif" or token == "else" then
      return parseIf()
    end

    if token == "for" then
      return parseFor()
    end

    if token == "do" then
      return parseDo()
    end

    if token == "return" then
      return parseReturn()
    end

    if token == "break" then
      return parseBreak()
    end

    if token == "continue" and State.options.nonstandardSymbol["continue"] then
      return parseBreak()
    end

    if token == "while" then
      return parseWhile()
    end

    if token == "repeat" then
      return parseRepeat()
    end

    if token == "goto" and isKeyWord("goto", Tokens[Index + 3]) then
      return parseGoTo()
    end

    if token == "function" then
      local exp = parseFunction(false, true)
      local name = exp.name
      if name then
        exp.name = nil
        name.type = GetToSetMap[name.type]
        name.value = exp
        name.vstart = exp.start
        name.range = exp.finish
        exp.parent = name
        if name.type == "setlocal" then
          local loc = name.node
          if loc.attrs then
            pushError({
              type = "SET_CONST",
              start = name.start,
              finish = name.finish,
            })
          end
        end
        pushActionIntoCurrentChunk(name)
        return name
      else
        pushActionIntoCurrentChunk(exp)
        missName(exp.keyword[2])
        return exp
      end
    end

    local exp = parseExp(true)
    if exp then
      local action = compileExpAsAction(exp)
      if action then
        return action
      end
    end
    return nil, true
  end

  local function skipFirstComment()
    if Tokens[Index + 1] ~= "#" then
      return
    end
    while true do
      Index = Index + 2
      local token = Tokens[Index + 1]
      if not token then
        break
      end
      if NLMap[token] then
        skipNL()
        break
      end
    end
  end

  local function parseLua()
    local main = {
      type = "main",
      start = 0,
      finish = 0,
      bstart = 0,
    }
    pushChunk(main)
    createLocal({
      type = "local",
      start = -1,
      finish = -1,
      effect = -1,
      parent = main,
      tag = "_ENV",
      special = "_G",
      [1] = State.ENVMode,
    })
    LocalCount = 0
    skipFirstComment()
    while true do
      parseActions()
      if Index <= #Tokens then
        unknownSymbol()
        Index = Index + 2
      else
        break
      end
    end
    popChunk()
    main.finish = getPosition(#Lua, "right")
    main.bfinish = main.finish

    return main
  end

  local function initState(lua, version, options)
    Lua = lua
    Line = 0
    LineOffset = 1
    LastTokenFinish = 0
    LocalCount = 0
    LocalLimited = false
    Chunk = {}
    Tokens = tokens(lua)
    Index = 1
    ---@class parser.state
    ---@field uri uri
    ---@field lines integer[]
    local state = {
      version = version,
      lua = lua,
      ast = {},
      errs = {},
      comms = {},
      lines = {
        [0] = 1,
        size = #lua,
      },
      options = options or {},
    }
    if not state.options.nonstandardSymbol then
      state.options.nonstandardSymbol = {}
    end
    State = state
    if version == "Lua 5.1" or version == "LuaJIT" then
      state.ENVMode = "@fenv"
    else
      state.ENVMode = "_ENV"
    end

    pushError = function(err)
      local errs = state.errs
      if err.finish < err.start then
        err.finish = err.start
      end
      local last = errs[#errs]
      if last then
        if last.start <= err.start and last.finish >= err.finish then
          return
        end
      end
      err.level = err.level or "Error"
      errs[#errs + 1] = err
      return err
    end
  end

  return function(lua, mode, version, options)
    Mode = mode
    initState(lua, version, options)
    skipSpace()
    if mode == "Lua" then
      State.ast = parseLua()
    elseif mode == "Nil" then
      State.ast = parseNil()
    elseif mode == "Boolean" then
      State.ast = parseBoolean()
    elseif mode == "String" then
      State.ast = parseString()
    elseif mode == "Number" then
      State.ast = parseNumber()
    elseif mode == "Name" then
      State.ast = parseName()
    elseif mode == "Exp" then
      State.ast = parseExp()
    elseif mode == "Action" then
      State.ast = parseAction()
    end

    if State.ast then
      State.ast.state = State
    end

    while true do
      if Index <= #Tokens then
        unknownSymbol()
        Index = Index + 2
      else
        break
      end
    end

    return State
  end
end)()

---https://github.com/LuaLS/LuaParser/blob/master/src/parser/luadoc.lua
local luadoc = (function()
  local m = lpeglabel
  local re = relabel
  local util = utility

  local TokenTypes, TokenStarts, TokenFinishs, TokenContents, TokenMarks
  ---@type integer
  local Ci
  ---@type integer
  local Offset
  local pushWarning, NextComment, Lines
  local parseType, parseTypeUnit
  ---@type any
  local Parser = re.compile(
    [[
Main                <-  (Token / Sp)*
Sp                  <-  %s+
X16                 <-  [a-fA-F0-9]
Token               <-  Integer / Name / String / Code / Symbol
Name                <-  ({} {%name} {})
                    ->  Name
Integer             <-  ({} {'-'? [0-9]+} !'.' {})
                    ->  Integer
Code                <-  ({} '`' { (!'`' .)*} '`' {})
                    ->  Code
String              <-  ({} StringDef {})
                    ->  String
StringDef           <-  {'"'}
                        {~(Esc / !'"' .)*~} -> 1
                        ('"'?)
                    /   {"'"}
                        {~(Esc / !"'" .)*~} -> 1
                        ("'"?)
                    /   '[' {:eq: '='* :} '['
                        =eq -> LongStringMark
                        {(!StringClose .)*} -> 1
                        StringClose?
StringClose         <-  ']' =eq ']'
Esc                 <-  '\' -> ''
                        EChar
EChar               <-  'a' -> ea
                    /   'b' -> eb
                    /   'f' -> ef
                    /   'n' -> en
                    /   'r' -> er
                    /   't' -> et
                    /   'v' -> ev
                    /   '\'
                    /   '"'
                    /   "'"
                    /   %nl
                    /   ('z' (%nl / %s)*)     -> ''
                    /   ('x' {X16 X16})       -> Char16
                    /   ([0-9] [0-9]? [0-9]?) -> Char10
                    /   ('u{' {X16*} '}')    -> CharUtf8
Symbol              <-  ({} {
                            [:|,;<>()?+#{}*]
                        /   '[]'
                        /   '...'
                        /   '['
                        /   ']'
                        /   '-' !'-'
                        /   '.' !'..'
                        } {})
                    ->  Symbol
]],
    {
      s = m.S(" \t\v\f"),
      ea = "\a",
      eb = "\b",
      ef = "\f",
      en = "\n",
      er = "\r",
      et = "\t",
      ev = "\v",
      name = (m.R("az", "AZ", "09", "\x80\xff") + m.S("_"))
        * (m.R("az", "AZ", "09", "\x80\xff") + m.S("_.*-")) ^ 0,
      Char10 = function(char)
        ---@type integer?
        char = tonumber(char)
        if not char or char < 0 or char > 255 then
          return ""
        end
        return string.char(char)
      end,
      Char16 = function(char)
        return string.char(tonumber(char, 16))
      end,
      CharUtf8 = function(char)
        if #char == 0 then
          return ""
        end
        local v = tonumber(char, 16)
        if not v then
          return ""
        end
        if v >= 0 and v <= 0x10FFFF then
          return utf8.char(v)
        end
        return ""
      end,
      LongStringMark = function(back)
        return "[" .. back .. "["
      end,
      Name = function(start, content, finish)
        Ci = Ci + 1
        TokenTypes[Ci] = "name"
        TokenStarts[Ci] = start
        TokenFinishs[Ci] = finish - 1
        TokenContents[Ci] = content
      end,
      String = function(start, mark, content, finish)
        Ci = Ci + 1
        TokenTypes[Ci] = "string"
        TokenStarts[Ci] = start
        TokenFinishs[Ci] = finish - 1
        TokenContents[Ci] = content
        TokenMarks[Ci] = mark
      end,
      Integer = function(start, content, finish)
        Ci = Ci + 1
        TokenTypes[Ci] = "integer"
        TokenStarts[Ci] = start
        TokenFinishs[Ci] = finish - 1
        TokenContents[Ci] = math.tointeger(content)
      end,
      Code = function(start, content, finish)
        Ci = Ci + 1
        TokenTypes[Ci] = "code"
        TokenStarts[Ci] = start
        TokenFinishs[Ci] = finish - 1
        TokenContents[Ci] = content
      end,
      Symbol = function(start, content, finish)
        Ci = Ci + 1
        TokenTypes[Ci] = "symbol"
        TokenStarts[Ci] = start
        TokenFinishs[Ci] = finish - 1
        TokenContents[Ci] = content
      end,
    }
  )

  ---@alias parser.visibleType 'public' | 'protected' | 'private' | 'package'

  ---@class parser.Node
  ---@field literal           boolean
  ---@field signs             parser.Node[]
  ---@field originalComment   parser.Node
  ---@field as?               parser.Node
  ---@field touch?            integer
  ---@field module?           string
  ---@field async?            boolean
  ---@field versions?         table[]
  ---@field names?            parser.Node[]
  ---@field path?             string
  ---@field bindComments?     parser.Node[]
  ---@field visible?          parser.visibleType
  ---@field operators?        parser.Node[]
  ---@field calls?            parser.Node[]
  ---@field generics?         parser.Node[]
  ---@field generic?          parser.Node
  ---@field docAttr?          parser.Node
  ---@field pattern?          string

  local function parseTokens(text, offset)
    Ci = 0
    Offset = offset
    TokenTypes = {}
    TokenStarts = {}
    TokenFinishs = {}
    TokenContents = {}
    TokenMarks = {}
    Parser:match(text)
    Ci = 0
  end

  local function peekToken(offset)
    offset = offset or 1
    return TokenTypes[Ci + offset], TokenContents[Ci + offset]
  end

  ---@return string? tokenType
  ---@return string? tokenContent
  local function nextToken()
    Ci = Ci + 1
    if not TokenTypes[Ci] then
      Ci = Ci - 1
      return nil, nil
    end
    return TokenTypes[Ci], TokenContents[Ci]
  end

  local function checkToken(tp, content, offset)
    offset = offset or 0
    return TokenTypes[Ci + offset] == tp
      and TokenContents[Ci + offset] == content
  end

  local function getStart()
    if Ci == 0 then
      return Offset
    end
    return TokenStarts[Ci] + Offset
  end

  ---@return integer
  local function getFinish()
    if Ci == 0 then
      return Offset
    end
    return TokenFinishs[Ci] + Offset + 1
  end

  local function getMark()
    return TokenMarks[Ci]
  end

  local function try(callback)
    local savePoint = Ci
    -- rollback
    local suc = callback()
    if not suc then
      Ci = savePoint
    end
    return suc
  end

  local function parseName(tp, parent)
    local nameTp, nameText = peekToken()
    if nameTp ~= "name" then
      return nil
    end
    nextToken()
    local name = {
      type = tp,
      start = getStart(),
      finish = getFinish(),
      parent = parent,
      [1] = nameText,
    }
    return name
  end

  local function nextSymbolOrError(symbol)
    if checkToken("symbol", symbol, 1) then
      nextToken()
      return true
    end
    pushWarning({
      type = "LUADOC_MISS_SYMBOL",
      start = getFinish(),
      finish = getFinish(),
      info = {
        symbol = symbol,
      },
    })
    return false
  end

  local function parseDocAttr(parent)
    if not checkToken("symbol", "(", 1) then
      return nil
    end
    nextToken()

    local attrs = {
      type = "doc.attr",
      parent = parent,
      start = getStart(),
      finish = getStart(),
      names = {},
    }

    while true do
      if checkToken("symbol", ",", 1) then
        nextToken()
        goto continue
      end
      local name = parseName("doc.attr.name", attrs)
      if not name then
        break
      end
      attrs.names[#attrs.names + 1] = name
      attrs.finish = name.finish
      ::continue::
    end

    nextSymbolOrError(")")
    attrs.finish = getFinish()

    return attrs
  end

  local function parseIndexField(parent)
    if not checkToken("symbol", "[", 1) then
      return nil
    end
    nextToken()
    local field = parseType(parent)
    nextSymbolOrError("]")
    return field
  end

  local function slideToNextLine()
    if peekToken() then
      return
    end
    local nextComment = NextComment(0, true)
    if not nextComment then
      return
    end
    local currentComment = NextComment(-1, true)
    local currentLine = guide.rowColOf(currentComment.start)
    local nextLine = guide.rowColOf(nextComment.start)
    if currentLine + 1 ~= nextLine then
      return
    end
    if nextComment.text:sub(1, 1) ~= "-" then
      return
    end
    if nextComment.text:match("^%-%s*%@") then
      return
    end
    NextComment()
    parseTokens(nextComment.text:sub(2), nextComment.start + 2)
  end

  local function parseTable(parent)
    if not checkToken("symbol", "{", 1) then
      return nil
    end
    nextToken()
    local typeUnit = {
      type = "doc.type.table",
      start = getStart(),
      parent = parent,
      fields = {},
    }

    while true do
      slideToNextLine()
      if checkToken("symbol", "}", 1) then
        nextToken()
        break
      end
      local field = {
        type = "doc.type.field",
        parent = typeUnit,
      }

      do
        local needCloseParen
        if checkToken("symbol", "(", 1) then
          nextToken()
          needCloseParen = true
        end
        field.name = parseName("doc.field.name", field)
          or parseIndexField(field)
        if not field.name then
          pushWarning({
            type = "LUADOC_MISS_FIELD_NAME",
            start = getFinish(),
            finish = getFinish(),
          })
          break
        end
        if not field.start then
          field.start = field.name.start
        end
        if checkToken("symbol", "?", 1) then
          nextToken()
          field.optional = true
        end
        field.finish = getFinish()
        if not nextSymbolOrError(":") then
          break
        end
        field.extends = parseType(field)
        if not field.extends then
          break
        end
        field.finish = getFinish()
        if needCloseParen then
          nextSymbolOrError(")")
        end
      end

      typeUnit.fields[#typeUnit.fields + 1] = field
      if checkToken("symbol", ",", 1) or checkToken("symbol", ";", 1) then
        nextToken()
      else
        nextSymbolOrError("}")
        break
      end
    end
    typeUnit.finish = getFinish()
    return typeUnit
  end

  local function parseTuple(parent)
    if not checkToken("symbol", "[", 1) then
      return nil
    end
    nextToken()
    local typeUnit = {
      type = "doc.type.table",
      start = getStart(),
      parent = parent,
      fields = {},
      isTuple = true,
    }

    local index = 1
    while true do
      slideToNextLine()
      if checkToken("symbol", "]", 1) then
        nextToken()
        break
      end
      local field = {
        type = "doc.type.field",
        parent = typeUnit,
      }

      do
        local needCloseParen
        if checkToken("symbol", "(", 1) then
          nextToken()
          needCloseParen = true
        end
        field.name = {
          type = "doc.type",
          start = getFinish(),
          firstFinish = getFinish(),
          finish = getFinish(),
          parent = field,
        }
        field.name.types = {
          [1] = {
            type = "doc.type.integer",
            start = getFinish(),
            finish = getFinish(),
            parent = field.name,
            [1] = index,
          },
        }
        index = index + 1
        field.extends = parseType(field)
        if not field.extends then
          break
        end
        field.optional = field.extends.optional
        field.start = field.extends.start
        field.finish = field.extends.finish
        if needCloseParen then
          nextSymbolOrError(")")
        end
      end

      typeUnit.fields[#typeUnit.fields + 1] = field
      if checkToken("symbol", ",", 1) or checkToken("symbol", ";", 1) then
        nextToken()
      else
        nextSymbolOrError("]")
        break
      end
    end
    typeUnit.finish = getFinish()
    return typeUnit
  end

  local function parseSigns(parent)
    if not checkToken("symbol", "<", 1) then
      return nil
    end
    nextToken()
    local signs = {}
    while true do
      local sign = parseName("doc.generic.name", parent)
      if not sign then
        pushWarning({
          type = "LUADOC_MISS_SIGN_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
        break
      end
      signs[#signs + 1] = sign
      if checkToken("symbol", ",", 1) then
        nextToken()
      else
        break
      end
    end
    nextSymbolOrError(">")
    return signs
  end

  local function parseDots(tp, parent)
    if not checkToken("symbol", "...", 1) then
      return
    end
    nextToken()
    local dots = {
      type = tp,
      start = getStart(),
      finish = getFinish(),
      parent = parent,
      [1] = "...",
    }
    return dots
  end

  local function parseTypeUnitFunction(parent)
    if not checkToken("name", "fun", 1) then
      return nil
    end
    nextToken()
    local typeUnit = {
      type = "doc.type.function",
      parent = parent,
      start = getStart(),
      args = {},
      returns = {},
    }
    if not nextSymbolOrError("(") then
      return nil
    end
    while true do
      slideToNextLine()
      if checkToken("symbol", ")", 1) then
        nextToken()
        break
      end
      local arg = {
        type = "doc.type.arg",
        parent = typeUnit,
      }
      arg.name = parseName("doc.type.arg.name", arg)
        or parseDots("doc.type.arg.name", arg)
      if not arg.name then
        pushWarning({
          type = "LUADOC_MISS_ARG_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
        break
      end
      if not arg.start then
        arg.start = arg.name.start
      end
      if checkToken("symbol", "?", 1) then
        nextToken()
        arg.optional = true
      end
      arg.finish = getFinish()
      if checkToken("symbol", ":", 1) then
        nextToken()
        arg.extends = parseType(arg)
      end
      arg.finish = getFinish()
      typeUnit.args[#typeUnit.args + 1] = arg
      if checkToken("symbol", ",", 1) then
        nextToken()
      else
        nextSymbolOrError(")")
        break
      end
    end
    slideToNextLine()
    if checkToken("symbol", ":", 1) then
      nextToken()
      slideToNextLine()
      local needCloseParen
      if checkToken("symbol", "(", 1) then
        nextToken()
        needCloseParen = true
      end
      while true do
        slideToNextLine()
        local name
        try(function()
          local returnName = parseName("doc.return.name", typeUnit)
            or parseDots("doc.return.name", typeUnit)
          if not returnName then
            return false
          end
          if checkToken("symbol", ":", 1) then
            nextToken()
            name = returnName
            return true
          end
          if returnName[1] == "..." then
            name = returnName
            return false
          end
          return false
        end)
        local rtn = parseType(typeUnit)
        if not rtn then
          break
        end
        rtn.name = name
        if checkToken("symbol", "?", 1) then
          nextToken()
          rtn.optional = true
        end
        typeUnit.returns[#typeUnit.returns + 1] = rtn
        if checkToken("symbol", ",", 1) then
          nextToken()
        else
          break
        end
      end
      if needCloseParen then
        nextSymbolOrError(")")
      end
    end
    typeUnit.finish = getFinish()
    return typeUnit
  end

  local function parseFunction(parent)
    local _, content = peekToken()
    if content == "async" then
      nextToken()
      local pos = getStart()
      local tp, cont = peekToken()
      if tp == "name" then
        if cont == "fun" then
          local func = parseTypeUnit(parent)
          if func then
            func.async = true
            func.asyncPos = pos
            return func
          end
        end
      end
    end
    if content == "fun" then
      return parseTypeUnitFunction(parent)
    end
  end

  local function parseTypeUnitArray(parent, node)
    if not checkToken("symbol", "[]", 1) then
      return nil
    end
    nextToken()
    local result = {
      type = "doc.type.array",
      start = node.start,
      finish = getFinish(),
      node = node,
      parent = parent,
    }
    node.parent = result
    return result
  end

  local function parseTypeUnitSign(parent, node)
    if not checkToken("symbol", "<", 1) then
      return nil
    end
    nextToken()
    local result = {
      type = "doc.type.sign",
      start = node.start,
      finish = getFinish(),
      node = node,
      parent = parent,
      signs = {},
    }
    node.parent = result
    while true do
      local sign = parseType(result)
      if not sign then
        pushWarning({
          type = "LUA_DOC_MISS_SIGN",
          start = getFinish(),
          finish = getFinish(),
        })
        break
      end
      result.signs[#result.signs + 1] = sign
      if checkToken("symbol", ",", 1) then
        nextToken()
      else
        break
      end
    end
    nextSymbolOrError(">")
    result.finish = getFinish()
    return result
  end

  local function parseString(parent)
    local tp, content = peekToken()
    if not tp or tp ~= "string" then
      return nil
    end

    nextToken()
    local mark = getMark()
    -- compatibility
    if content:sub(1, 1) == '"' or content:sub(1, 1) == "'" then
      if #content > 1 and content:sub(1, 1) == content:sub(-1, -1) then
        mark = content:sub(1, 1)
        content = content:sub(2, -2)
      end
    end
    local str = {
      type = "doc.type.string",
      start = getStart(),
      finish = getFinish(),
      parent = parent,
      [1] = content,
      [2] = mark,
    }
    return str
  end

  local function parseCodePattern(parent)
    local tp, pattern = peekToken()
    if not tp or (tp ~= "name" and tp ~= "code") then
      return nil
    end
    local codeOffset
    local content
    local i = 1
    if tp == "code" then
      codeOffset = i
      content = pattern
      pattern = "%s"
    end
    while true do
      i = i + 1
      local nextTp, nextContent = peekToken(i)
      if not nextTp or TokenFinishs[Ci + i - 1] + 1 ~= TokenStarts[Ci + i] then
        ---不连续的name，无效的
        break
      end
      if nextTp == "name" then
        pattern = pattern .. nextContent
      elseif nextTp == "code" then
        if codeOffset then
          -- 暂时不支持多generic
          break
        end
        codeOffset = i
        pattern = pattern .. "%s"
        content = nextContent
      elseif codeOffset then
        -- should be match with Parser "name" mask
        if nextTp == "integer" then
          pattern = pattern .. nextContent
        elseif
          nextTp == "symbol"
          and (nextContent == "." or nextContent == "*" or nextContent == "-")
        then
          pattern = pattern .. nextContent
        else
          break
        end
      else
        break
      end
    end
    if not codeOffset then
      return nil
    end
    nextToken()
    local start = getStart()
    local finishOffset = i - 1
    if finishOffset == 1 then
      -- code only, no pattern
      pattern = nil
    else
      for _ = 2, finishOffset do
        nextToken()
      end
    end
    local code = {
      type = "doc.type.code",
      start = start,
      finish = getFinish(),
      parent = parent,
      pattern = pattern,
      [1] = content,
    }
    return code
  end

  local function parseInteger(parent)
    local tp, content = peekToken()
    if not tp or tp ~= "integer" then
      return nil
    end

    nextToken()
    local integer = {
      type = "doc.type.integer",
      start = getStart(),
      finish = getFinish(),
      parent = parent,
      [1] = content,
    }
    return integer
  end

  local function parseBoolean(parent)
    local tp, content = peekToken()
    if not tp or tp ~= "name" or (content ~= "true" and content ~= "false") then
      return nil
    end

    nextToken()
    local boolean = {
      type = "doc.type.boolean",
      start = getStart(),
      finish = getFinish(),
      parent = parent,
      [1] = content == "true" and true or false,
    }
    return boolean
  end

  local function parseParen(parent)
    if not checkToken("symbol", "(", 1) then
      return
    end
    nextToken()
    local tp = parseType(parent)
    nextSymbolOrError(")")
    return tp
  end

  function parseTypeUnit(parent)
    local result = parseFunction(parent)
      or parseTable(parent)
      or parseTuple(parent)
      or parseString(parent)
      or parseInteger(parent)
      or parseBoolean(parent)
      or parseParen(parent)
      or parseCodePattern(parent)
    if not result then
      result = parseName("doc.type.name", parent)
        or parseDots("doc.type.name", parent)
      if not result then
        return nil
      end
      if result[1] == "..." then
        result[1] = "unknown"
      end
    end
    while true do
      local newResult = parseTypeUnitSign(parent, result)
      if not newResult then
        break
      end
      result = newResult
    end
    while true do
      local newResult = parseTypeUnitArray(parent, result)
      if not newResult then
        break
      end
      result = newResult
    end
    return result
  end

  local function parseResume(parent)
    local default, additional
    if checkToken("symbol", ">", 1) then
      nextToken()
      default = true
    end

    if checkToken("symbol", "+", 1) then
      nextToken()
      additional = true
    end

    local result = parseTypeUnit(parent)
    if result then
      result.default = default
      result.additional = additional
    end

    return result
  end

  local lockResume = false

  function parseType(parent)
    local result = {
      type = "doc.type",
      parent = parent,
      types = {},
    }
    while true do
      local typeUnit = parseTypeUnit(result)
      if not typeUnit then
        break
      end

      result.types[#result.types + 1] = typeUnit
      if not result.start then
        result.start = typeUnit.start
      end

      if not checkToken("symbol", "|", 1) then
        break
      end
      nextToken()
    end
    if not result.start then
      result.start = getFinish()
    end
    if checkToken("symbol", "?", 1) then
      nextToken()
      result.optional = true
    end
    result.finish = getFinish()
    result.firstFinish = result.finish

    local row = guide.rowColOf(result.finish)

    local function pushResume()
      local comments
      for i = 0, 100 do
        local nextComm = NextComment(i, true)
        if not nextComm then
          return false
        end
        local nextCommRow = guide.rowColOf(nextComm.start)
        local currentRow = row + i + 1
        if currentRow < nextCommRow then
          return false
        end
        if nextComm.text:match("^%-%s*%@") then
          return false
        else
          local resumeHead = nextComm.text:match("^%-%s*%|")
          if resumeHead then
            NextComment(i)
            row = row + i + 1
            local finishPos = nextComm.text:find("#", #resumeHead + 1)
              or #nextComm.text
            parseTokens(
              nextComm.text:sub(#resumeHead + 1, finishPos),
              nextComm.start + #resumeHead + 1
            )
            local resume = parseResume(result)
            if resume then
              if comments then
                resume.comment = table.concat(comments, "\n")
              else
                resume.comment = nextComm.text:match(
                  "%s*#?%s*(.+)",
                  resume.finish - nextComm.start
                )
              end
              result.types[#result.types + 1] = resume
              result.finish = resume.finish
            end
            comments = nil
            return true
          else
            if not comments then
              comments = {}
            end
            comments[#comments + 1] = nextComm.text:sub(2)
          end
        end
      end
      return false
    end

    if not lockResume then
      lockResume = true
      while pushResume() do
      end
      lockResume = false
    end

    if #result.types == 0 then
      pushWarning({
        type = "LUADOC_MISS_TYPE_NAME",
        start = getFinish(),
        finish = getFinish(),
      })
      return nil
    end
    return result
  end

  local docSwitch = util
    .switch()
    :case("class")
    :call(function()
      local result = {
        type = "doc.class",
        fields = {},
        operators = {},
        calls = {},
      }
      result.docAttr = parseDocAttr(result)
      result.class = parseName("doc.class.name", result)
      if not result.class then
        pushWarning({
          type = "LUADOC_MISS_CLASS_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      result.start = getStart()
      result.finish = getFinish()
      result.signs = parseSigns(result)
      if not checkToken("symbol", ":", 1) then
        return result
      end
      nextToken()

      result.extends = {}

      while true do
        local extend = parseName("doc.extends.name", result)
          or parseTable(result)
          or parseTuple(result)
        if not extend then
          pushWarning({
            type = "LUADOC_MISS_CLASS_EXTENDS_NAME",
            start = getFinish(),
            finish = getFinish(),
          })
          return result
        end
        result.extends[#result.extends + 1] = extend
        result.finish = getFinish()
        if not checkToken("symbol", ",", 1) then
          break
        end
        nextToken()
      end
      return result
    end)
    :case("type")
    :call(function()
      local first = parseType()
      if not first then
        return nil
      end
      local rests
      while checkToken("symbol", ",", 1) do
        nextToken()
        local rest = parseType()
        if not rests then
          rests = {}
        end
        rests[#rests + 1] = rest
      end
      return first, rests
    end)
    :case("alias")
    :call(function()
      local result = {
        type = "doc.alias",
      }
      result.docAttr = parseDocAttr(result)
      result.alias = parseName("doc.alias.name", result)
      if not result.alias then
        pushWarning({
          type = "LUADOC_MISS_ALIAS_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      result.start = getStart()
      result.signs = parseSigns(result)
      result.extends = parseType(result)
      if not result.extends then
        pushWarning({
          type = "LUADOC_MISS_ALIAS_EXTENDS",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      result.finish = getFinish()
      return result
    end)
    :case("param")
    :call(function()
      local result = {
        type = "doc.param",
      }
      result.param = parseName("doc.param.name", result)
        or parseDots("doc.param.name", result)
      if not result.param then
        pushWarning({
          type = "LUADOC_MISS_PARAM_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      if checkToken("symbol", "?", 1) then
        nextToken()
        result.optional = true
      end
      result.start = result.param.start
      result.finish = getFinish()
      result.extends = parseType(result)
      if not result.extends then
        pushWarning({
          type = "LUADOC_MISS_PARAM_EXTENDS",
          start = getFinish(),
          finish = getFinish(),
        })
        return result
      end
      result.finish = getFinish()
      result.firstFinish = result.extends.firstFinish
      return result
    end)
    :case("return")
    :call(function()
      local result = {
        type = "doc.return",
        returns = {},
      }
      while true do
        local dots = parseDots("doc.return.name")
        if dots then
          Ci = Ci - 1
        end
        local docType = parseType(result)
        if not docType then
          break
        end
        if not result.start then
          result.start = docType.start
        end
        if checkToken("symbol", "?", 1) then
          nextToken()
          docType.optional = true
        end
        if dots then
          docType.name = dots
          dots.parent = docType
        else
          docType.name = parseName("doc.return.name", docType)
            or parseDots("doc.return.name", docType)
        end
        result.returns[#result.returns + 1] = docType
        if not checkToken("symbol", ",", 1) then
          break
        end
        nextToken()
      end
      if #result.returns == 0 then
        return nil
      end
      result.finish = getFinish()
      return result
    end)
    :case("field")
    :call(function()
      local result = {
        type = "doc.field",
      }
      try(function()
        local tp, value = nextToken()
        if tp == "name" then
          if
            value == "public"
            or value == "protected"
            or value == "private"
            or value == "package"
          then
            local tp2 = peekToken(1)
            local tp3 = peekToken(2)
            if tp2 == "name" and not tp3 then
              return false
            end
            result.visible = value
            result.start = getStart()
            return true
          end
        end
        return false
      end)
      result.field = parseName("doc.field.name", result)
        or parseIndexField(result)
      if not result.field then
        pushWarning({
          type = "LUADOC_MISS_FIELD_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      if not result.start then
        result.start = result.field.start
      end
      if checkToken("symbol", "?", 1) then
        nextToken()
        result.optional = true
      end
      result.extends = parseType(result)
      if not result.extends then
        pushWarning({
          type = "LUADOC_MISS_FIELD_EXTENDS",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      result.finish = getFinish()
      return result
    end)
    :case("generic")
    :call(function()
      local result = {
        type = "doc.generic",
        generics = {},
      }
      while true do
        local object = {
          type = "doc.generic.object",
          parent = result,
        }
        object.generic = parseName("doc.generic.name", object)
        if not object.generic then
          pushWarning({
            type = "LUADOC_MISS_GENERIC_NAME",
            start = getFinish(),
            finish = getFinish(),
          })
          return nil
        end
        object.start = object.generic.start
        if not result.start then
          result.start = object.start
        end
        if checkToken("symbol", ":", 1) then
          nextToken()
          object.extends = parseType(object)
        end
        object.finish = getFinish()
        result.generics[#result.generics + 1] = object
        if not checkToken("symbol", ",", 1) then
          break
        end
        nextToken()
      end
      result.finish = getFinish()
      return result
    end)
    :case("vararg")
    :call(function()
      local result = {
        type = "doc.vararg",
      }
      result.vararg = parseType(result)
      if not result.vararg then
        pushWarning({
          type = "LUADOC_MISS_VARARG_TYPE",
          start = getFinish(),
          finish = getFinish(),
        })
        return
      end
      result.start = result.vararg.start
      result.finish = result.vararg.finish
      return result
    end)
    :case("overload")
    :call(function()
      local tp, name = peekToken()
      if tp ~= "name" or (name ~= "fun" and name ~= "async") then
        pushWarning({
          type = "LUADOC_MISS_FUN_AFTER_OVERLOAD",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      local result = {
        type = "doc.overload",
      }
      result.overload = parseFunction(result)
      if not result.overload then
        return nil
      end
      result.overload.parent = result
      result.start = result.overload.start
      result.finish = result.overload.finish
      return result
    end)
    :case("deprecated")
    :call(function()
      return {
        type = "doc.deprecated",
        start = getFinish(),
        finish = getFinish(),
      }
    end)
    :case("meta")
    :call(function()
      local meta = {
        type = "doc.meta",
        start = getFinish(),
        finish = getFinish(),
      }
      meta.name = parseName("doc.meta.name", meta)
      return meta
    end)
    :case("version")
    :call(function()
      local result = {
        type = "doc.version",
        versions = {},
      }
      while true do
        local tp, text = nextToken()
        if not tp then
          pushWarning({
            type = "LUADOC_MISS_VERSION",
            start = getFinish(),
            finish = getFinish(),
          })
          break
        end
        if not result.start then
          result.start = getStart()
        end
        local version = {
          type = "doc.version.unit",
          parent = result,
          start = getStart(),
        }
        if tp == "symbol" then
          if text == ">" then
            version.ge = true
          elseif text == "<" then
            version.le = true
          end
          tp, text = nextToken()
        end
        if tp ~= "name" then
          pushWarning({
            type = "LUADOC_MISS_VERSION",
            start = getStart(),
            finish = getFinish(),
          })
          break
        end
        version.version = tonumber(text) or text
        version.finish = getFinish()
        result.versions[#result.versions + 1] = version
        if not checkToken("symbol", ",", 1) then
          break
        end
        nextToken()
      end
      if #result.versions == 0 then
        return nil
      end
      result.finish = getFinish()
      return result
    end)
    :case("see")
    :call(function()
      local result = {
        type = "doc.see",
      }
      result.name = parseName("doc.see.name", result)
      if not result.name then
        pushWarning({
          type = "LUADOC_MISS_SEE_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      result.start = result.name.start
      result.finish = result.name.finish
      return result
    end)
    :case("diagnostic")
    :call(function()
      local result = {
        type = "doc.diagnostic",
      }
      local nextTP, mode = nextToken()
      if nextTP ~= "name" then
        pushWarning({
          type = "LUADOC_MISS_DIAG_MODE",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      result.mode = mode
      result.start = getStart()
      result.finish = getFinish()
      if
        mode ~= "disable-next-line"
        and mode ~= "disable-line"
        and mode ~= "disable"
        and mode ~= "enable"
      then
        pushWarning({
          type = "LUADOC_ERROR_DIAG_MODE",
          start = result.start,
          finish = result.finish,
        })
      end

      if checkToken("symbol", ":", 1) then
        nextToken()
        result.names = {}
        while true do
          local name = parseName("doc.diagnostic.name", result)
          if not name then
            pushWarning({
              type = "LUADOC_MISS_DIAG_NAME",
              start = getFinish(),
              finish = getFinish(),
            })
            return result
          end
          result.names[#result.names + 1] = name
          if not checkToken("symbol", ",", 1) then
            break
          end
          nextToken()
        end
      end

      result.finish = getFinish()

      return result
    end)
    :case("module")
    :call(function()
      local result = {
        type = "doc.module",
        start = getFinish(),
        finish = getFinish(),
      }
      local tp, content = peekToken()
      if tp == "string" then
        result.module = content
        nextToken()
        result.start = getStart()
        result.finish = getFinish()
        result.smark = getMark()
      else
        pushWarning({
          type = "LUADOC_MISS_MODULE_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
      end
      return result
    end)
    :case("async")
    :call(function()
      return {
        type = "doc.async",
        start = getFinish(),
        finish = getFinish(),
      }
    end)
    :case("nodiscard")
    :call(function()
      return {
        type = "doc.nodiscard",
        start = getFinish(),
        finish = getFinish(),
      }
    end)
    :case("as")
    :call(function()
      local result = {
        type = "doc.as",
        start = getFinish(),
        finish = getFinish(),
      }
      result.as = parseType(result)
      result.finish = getFinish()
      return result
    end)
    :case("cast")
    :call(function()
      local result = {
        type = "doc.cast",
        start = getFinish(),
        finish = getFinish(),
        casts = {},
      }

      local loc = parseName("doc.cast.name", result)
      if not loc then
        pushWarning({
          type = "LUADOC_MISS_LOCAL_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
        return result
      end

      result.name = loc
      result.finish = loc.finish

      while true do
        local block = {
          type = "doc.cast.block",
          parent = result,
          start = getFinish(),
          finish = getFinish(),
        }
        if checkToken("symbol", "+", 1) then
          block.mode = "+"
          nextToken()
          block.start = getStart()
          block.finish = getFinish()
        elseif checkToken("symbol", "-", 1) then
          block.mode = "-"
          nextToken()
          block.start = getStart()
          block.finish = getFinish()
        end

        if checkToken("symbol", "?", 1) then
          block.optional = true
          nextToken()
          block.finish = getFinish()
        else
          block.extends = parseType(block)
          if block.extends then
            block.start = block.start or block.extends.start
            block.finish = block.extends.finish
          end
        end

        if block.optional or block.extends then
          result.casts[#result.casts + 1] = block
        end
        result.finish = block.finish

        if checkToken("symbol", ",", 1) then
          nextToken()
        else
          break
        end
      end

      return result
    end)
    :case("operator")
    :call(function()
      local result = {
        type = "doc.operator",
        start = getFinish(),
        finish = getFinish(),
      }

      local op = parseName("doc.operator.name", result)
      if not op then
        pushWarning({
          type = "LUADOC_MISS_OPERATOR_NAME",
          start = getFinish(),
          finish = getFinish(),
        })
        return nil
      end
      result.op = op
      result.finish = op.finish

      if checkToken("symbol", "(", 1) then
        nextToken()
        if checkToken("symbol", ")", 1) then
          nextToken()
        else
          local exp = parseType(result)
          if exp then
            result.exp = exp
            result.finish = exp.finish
          end
          nextSymbolOrError(")")
        end
      end

      nextSymbolOrError(":")

      local ret = parseType(result)
      if ret then
        result.extends = ret
        result.finish = ret.finish
      end

      return result
    end)
    :case("source")
    :call(function(doc)
      local fullSource = doc:sub(#"source" + 1)
      if not fullSource or fullSource == "" then
        return
      end
      fullSource = util.trim(fullSource)
      if fullSource == "" then
        return
      end
      local source, line, char = fullSource:match("^(.-):?(%d*):?(%d*)$")
      source = source or fullSource
      line = tonumber(line) or 1
      char = tonumber(char) or 0
      local result = {
        type = "doc.source",
        start = getStart(),
        finish = getFinish(),
        path = source,
        line = line,
        char = char,
      }
      return result
    end)
    :case("enum")
    :call(function()
      local attr = parseDocAttr()
      local name = parseName("doc.enum.name")
      if not name then
        return nil
      end
      local result = {
        type = "doc.enum",
        start = name.start,
        finish = name.finish,
        enum = name,
        docAttr = attr,
      }
      name.parent = result
      if attr then
        attr.parent = result
      end
      return result
    end)
    :case("private")
    :call(function()
      return {
        type = "doc.private",
        start = getFinish(),
        finish = getFinish(),
      }
    end)
    :case("protected")
    :call(function()
      return {
        type = "doc.protected",
        start = getFinish(),
        finish = getFinish(),
      }
    end)
    :case("public")
    :call(function()
      return {
        type = "doc.public",
        start = getFinish(),
        finish = getFinish(),
      }
    end)
    :case("package")
    :call(function()
      return {
        type = "doc.package",
        start = getFinish(),
        finish = getFinish(),
      }
    end)

  local function convertTokens(doc)
    local tp, text = nextToken()
    if not tp then
      return
    end
    if tp ~= "name" then
      pushWarning({
        type = "LUADOC_MISS_CATE_NAME",
        start = getStart(),
        finish = getFinish(),
      })
      return nil
    end
    return docSwitch(text, doc)
  end

  local function trimTailComment(text)
    local comment = text
    if text:sub(1, 1) == "@" then
      comment = util.trim(text:sub(2))
    end
    if text:sub(1, 1) == "#" then
      comment = util.trim(text:sub(2))
    end
    if text:sub(1, 2) == "--" then
      comment = util.trim(text:sub(3))
    end
    if comment:find("^%s*['\"[]") and comment:find("['\"%]]%s*$") then
      local state = compile(comment:gsub("^%s+", ""), "String")
      if state and state.ast then
        comment = state.ast[1] --[[@as string]]
      end
    end
    return util.trim(comment)
  end

  ---
  ---@param comment parser.Node
  ---
  ---@return parser.Node|nil
  ---@return unknown?
  local function buildLuaDoc(comment)
    local headPos = (
      comment.type == "comment.short" and comment.text:match("^%-%s*@()")
    )
      or (comment.type == "comment.long" and comment.text:match("^%s*@()"))
    if not headPos then
      return {
        type = "doc.comment",
        start = comment.start,
        finish = comment.finish,
        range = comment.finish,
        comment = comment,
      }
    end
    -- absolute position of `@` symbol
    local startOffset = comment.start + headPos
    if comment.type == "comment.long" then
      startOffset = comment.start + headPos + #comment.mark - 2
    end

    local doc = comment.text:sub(headPos)

    parseTokens(doc, startOffset)
    local result, rests = convertTokens(doc)
    if result then
      result.range = math.max(comment.finish, result.finish)
      local finish = result.firstFinish or result.finish
      if rests then
        for _, rest in ipairs(rests) do
          rest.range = math.max(comment.finish, rest.finish)
          finish = rest.firstFinish or rest.finish
        end
      end

      -- `result` can be a multiline annotation or an alias, while `doc` is the first line, so we can't parse comment
      if finish >= comment.finish then
        return result, rests
      end

      local cstart = doc:find("%S", finish - startOffset)
      if cstart then
        result.comment = {
          type = "doc.tailcomment",
          start = startOffset + cstart,
          finish = comment.finish,
          parent = result,
          text = trimTailComment(doc:sub(cstart)),
        }
        if rests then
          for _, rest in ipairs(rests) do
            rest.comment = result.comment
          end
        end
      end

      return result, rests
    end

    return {
      type = "doc.comment",
      start = comment.start,
      finish = comment.finish,
      range = comment.finish,
      comment = comment,
    }
  end

  local function isTailComment(text, doc)
    if not doc then
      return false
    end
    local left = doc.originalComment.start
    local row, col = guide.rowColOf(left)
    local lineStart = Lines[row] or 0
    local hasCodeBefore = text:sub(lineStart, lineStart + col):find("[%w_]")
    return hasCodeBefore
  end

  local function isContinuedDoc(lastDoc, nextDoc)
    if not nextDoc then
      return false
    end
    if nextDoc.type == "doc.diagnostic" then
      return true
    end
    if
      lastDoc.type == "doc.type"
      or lastDoc.type == "doc.module"
      or lastDoc.type == "doc.enum"
    then
      if nextDoc.type ~= "doc.comment" then
        return false
      end
    end
    if
      lastDoc.type == "doc.class"
      or lastDoc.type == "doc.field"
      or lastDoc.type == "doc.operator"
    then
      if
        nextDoc.type ~= "doc.field"
        and nextDoc.type ~= "doc.operator"
        and nextDoc.type ~= "doc.comment"
        and nextDoc.type ~= "doc.overload"
        and nextDoc.type ~= "doc.source"
      then
        return false
      end
    end
    if nextDoc.type == "doc.cast" then
      return false
    end
    return true
  end

  local function isNextLine(lastDoc, nextDoc)
    if not nextDoc then
      return false
    end
    local lastRow = guide.rowColOf(lastDoc.finish)
    local newRow = guide.rowColOf(nextDoc.start)
    return newRow - lastRow == 1
  end

  ---@param binded parser.Node[]
  local function bindGeneric(binded)
    local generics = {}
    for _, doc in ipairs(binded) do
      if doc.type == "doc.generic" then
        for _, obj in ipairs(doc.generics) do
          local name = obj.generic[1]
          generics[name] = obj
        end
      end
      if doc.type == "doc.class" or doc.type == "doc.alias" then
        if doc.signs then
          for _, sign in ipairs(doc.signs) do
            local name = sign[1]
            generics[name] = sign
          end
        end
      end
      if
        doc.type == "doc.param"
        or doc.type == "doc.vararg"
        or doc.type == "doc.return"
        or doc.type == "doc.type"
        or doc.type == "doc.class"
        or doc.type == "doc.alias"
      then
        guide.eachSourceType(doc, "doc.type.name", function(src)
          local name = src[1]
          if generics[name] then
            src.type = "doc.generic.name"
            src.generic = generics[name]
          end
        end)
        guide.eachSourceType(doc, "doc.type.code", function(src)
          local name = src[1]
          if generics[name] then
            src.type = "doc.generic.name"
            src.literal = true
          end
        end)
      end
    end
  end

  ---
  ---@param doc parser.Node
  ---@param source parser.Node
  local function bindDocWithSource(doc, source)
    if not source.bindDocs then
      source.bindDocs = {}
    end
    if source.bindDocs[#source.bindDocs] ~= doc then
      source.bindDocs[#source.bindDocs + 1] = doc
    end
    doc.bindSource = source
  end

  ---
  ---@param source parser.Node
  ---@param binded parser.Node[]
  ---
  ---@return boolean
  local function bindDoc(source, binded)
    local isParam = source.type == "self"
      or source.type == "local"
        and (source.parent.type == "funcargs" or (source.parent.type == "in" and source.finish <= source.parent.keys.finish))
    local ok = false
    for _, doc in ipairs(binded) do
      if doc.bindSource then
        goto CONTINUE
      end
      if
        doc.type == "doc.class"
        or doc.type == "doc.deprecated"
        or doc.type == "doc.version"
        or doc.type == "doc.module"
        or doc.type == "doc.source"
        or doc.type == "doc.private"
        or doc.type == "doc.protected"
        or doc.type == "doc.public"
        or doc.type == "doc.package"
        or doc.type == "doc.see"
      then
        if source.type == "function" or isParam then
          goto CONTINUE
        end
        bindDocWithSource(doc, source)
        ok = true
      elseif doc.type == "doc.type" then
        if source.type == "function" or isParam or source._bindedDocType then
          goto CONTINUE
        end
        source._bindedDocType = true
        bindDocWithSource(doc, source)
        ok = true
      elseif doc.type == "doc.overload" then
        if not source.bindDocs then
          source.bindDocs = {}
        end
        source.bindDocs[#source.bindDocs + 1] = doc
        if source.type == "function" then
          bindDocWithSource(doc, source)
        end
        ok = true
      elseif doc.type == "doc.param" then
        if isParam and doc.param[1] == source[1] then
          bindDocWithSource(doc, source)
          ok = true
        elseif source.type == "..." and doc.param[1] == "..." then
          bindDocWithSource(doc, source)
          ok = true
        elseif source.type == "self" and doc.param[1] == "self" then
          bindDocWithSource(doc, source)
          ok = true
        elseif source.type == "function" then
          if not source.bindDocs then
            source.bindDocs = {}
          end
          source.bindDocs[#source.bindDocs + 1] = doc
          if source.args then
            for _, arg in ipairs(source.args) do
              if arg[1] == doc.param[1] then
                bindDocWithSource(doc, arg)
                break
              end
            end
          end
        end
      elseif doc.type == "doc.vararg" then
        if source.type == "..." then
          bindDocWithSource(doc, source)
          ok = true
        end
      elseif
        doc.type == "doc.return"
        or doc.type == "doc.generic"
        or doc.type == "doc.async"
        or doc.type == "doc.nodiscard"
      then
        if source.type == "function" then
          bindDocWithSource(doc, source)
          ok = true
        end
      elseif doc.type == "doc.enum" then
        if source.type == "table" then
          bindDocWithSource(doc, source)
          ok = true
        end
        if source.value and source.value.type == "table" then
          bindDocWithSource(doc, source.value)
          goto CONTINUE
        end
      elseif doc.type == "doc.comment" then
        bindDocWithSource(doc, source)
        ok = true
      end
      ::CONTINUE::
    end
    return ok
  end

  ---
  ---@param sources parser.Node[]
  ---@param binded parser.Node[]
  ---@param start integer
  ---@param finish integer
  ---@return boolean
  local function bindDocsBetween(sources, binded, start, finish)
    -- Use bisection to find the first (用二分法找到第一个)
    local max = #sources
    local index
    local left = 1
    local right = max
    for _ = 1, 1000 do
      index = left + (right - left) // 2
      if index <= left then
        index = left
        break
      elseif index >= right then
        index = right
        break
      end
      local src = sources[index]
      if src.start < start then
        left = index + 1
      else
        right = index
      end
    end

    local ok = false
    -- Binding from front to back (从前往后进行绑定)
    for i = index, max do
      local src = sources[i]
      if src and src.start >= start then
        if src.start >= finish then
          break
        end
        if src.start >= start then
          if
            src.type == "local"
            or src.type == "self"
            or src.type == "setlocal"
            or src.type == "setglobal"
            or src.type == "tablefield"
            or src.type == "tableindex"
            or src.type == "setfield"
            or src.type == "setindex"
            or src.type == "setmethod"
            or src.type == "function"
            or src.type == "return"
            or src.type == "..."
            or src.type == "call" -- for `rawset`
          then
            if bindDoc(src, binded) then
              ok = true
            end
          end
        end
      end
    end

    return ok
  end

  ---@param binded parser.Node[]
  local function bindReturnIndex(binded)
    local returnIndex = 0
    for _, doc in ipairs(binded) do
      if doc.type == "doc.return" then
        for _, rtn in ipairs(doc.returns) do
          returnIndex = returnIndex + 1
          rtn.returnIndex = returnIndex
        end
      end
    end
  end

  ---
  ---@param doc parser.Node
  ---@param comments parser.Node[]
  local function bindCommentsToDoc(doc, comments)
    doc.bindComments = comments
    for _, comment in ipairs(comments) do
      comment.bindSource = doc
    end
  end

  ---@param binded parser.Node[]
  local function bindCommentsAndFields(binded)
    local class
    local comments = {}
    local source
    for _, doc in ipairs(binded) do
      if doc.type == "doc.class" then
        -- When multiple classes are written together, only the last class can be bound to the source
        -- (多个class连续写在一起，只有最后一个class可以绑定source)
        if class then
          class.bindSource = nil
        end
        if source then
          doc.source = source
          source.bindSource = doc
        end
        class = doc
        bindCommentsToDoc(doc, comments)
        comments = {}
      elseif doc.type == "doc.field" then
        if class then
          class.fields[#class.fields + 1] = doc
          doc.class = class
        end
        if source then
          doc.source = source
          source.bindSource = doc
        end
        bindCommentsToDoc(doc, comments)
        comments = {}
      elseif doc.type == "doc.operator" then
        if class then
          class.operators[#class.operators + 1] = doc
          doc.class = class
        end
        bindCommentsToDoc(doc, comments)
        comments = {}
      elseif doc.type == "doc.overload" then
        if class then
          class.calls[#class.calls + 1] = doc
          doc.class = class
        end
      elseif doc.type == "doc.alias" or doc.type == "doc.enum" then
        bindCommentsToDoc(doc, comments)
        comments = {}
      elseif doc.type == "doc.comment" then
        comments[#comments + 1] = doc
      elseif doc.type == "doc.source" then
        source = doc
        goto CONTINUE
      end
      source = nil
      ::CONTINUE::
    end
  end

  local function bindDocWithSources(sources, binded)
    if not binded then
      return
    end
    local lastDoc = binded[#binded]
    if not lastDoc then
      return
    end
    for _, doc in ipairs(binded) do
      doc.bindGroup = binded
    end
    bindGeneric(binded)
    bindCommentsAndFields(binded)
    bindReturnIndex(binded)

    -- doc is special node
    if lastDoc.special then
      if bindDoc(lastDoc.special, binded) then
        return
      end
    end

    local row = guide.rowColOf(lastDoc.finish)
    local suc =
      bindDocsBetween(sources, binded, guide.positionOf(row, 0), lastDoc.start)
    if not suc then
      bindDocsBetween(
        sources,
        binded,
        guide.positionOf(row + 1, 0),
        guide.positionOf(row + 2, 0)
      )
    end
  end

  local bindDocAccept = {
    "local",
    "setlocal",
    "setglobal",
    "setfield",
    "setmethod",
    "setindex",
    "tablefield",
    "tableindex",
    "self",
    "function",
    "return",
    "...",
    "call",
  }

  local function bindDocs(state)
    local text = state.lua
    local sources = {}
    guide.eachSourceTypes(state.ast, bindDocAccept, function(src)
      -- allow binding docs with rawset(_G, "key", value)
      if src.type == "call" then
        if src.node.special ~= "rawset" or not src.args then
          return
        end
        local g, key = src.args[1], src.args[2]
        if not g or not key or g.special ~= "_G" then
          return
        end
      end
      sources[#sources + 1] = src
    end)
    table.sort(sources, function(a, b)
      return a.start < b.start
    end)
    local binded
    for i, doc in ipairs(state.ast.docs) do
      if not binded then
        binded = {}
        state.ast.docs.groups[#state.ast.docs.groups + 1] = binded
      end
      binded[#binded + 1] = doc
      if doc.specialBindGroup then
        bindDocWithSources(sources, doc.specialBindGroup)
        binded = nil
      elseif isTailComment(text, doc) and doc.type ~= "doc.field" then
        bindDocWithSources(sources, binded)
        binded = nil
      else
        local nextDoc = state.ast.docs[i + 1]
        if nextDoc and nextDoc.special or not isNextLine(doc, nextDoc) then
          bindDocWithSources(sources, binded)
          binded = nil
        end
        if
          not isContinuedDoc(doc, nextDoc)
          and not isTailComment(text, nextDoc)
        then
          bindDocWithSources(sources, binded)
          binded = nil
        end
      end
    end
  end

  local function findTouch(state, doc)
    local text = state.lua
    local pos = guide.positionToOffset(state, doc.originalComment.start)
    for i = pos - 2, 1, -1 do
      local c = text:sub(i, i)
      if c == "\r" or c == "\n" then
        break
      elseif c ~= " " and c ~= "\t" then
        doc.touch = guide.offsetToPosition(state, i)
        break
      end
    end
  end

  local function luadoc(state)
    local ast = state.ast
    local comments = state.comms
    table.sort(comments, function(a, b)
      return a.start < b.start
    end)
    ast.docs = {
      type = "doc",
      parent = ast,
      groups = {},
    }

    pushWarning = function(err)
      local errs = state.errs
      if err.finish < err.start then
        err.finish = err.start
      end
      local last = errs[#errs]
      if last then
        if last.start <= err.start and last.finish >= err.finish then
          return
        end
      end
      err.level = err.level or "Warning"
      errs[#errs + 1] = err
      return err
    end
    Lines = state.lines

    local ci = 1
    NextComment = function(offset, peek)
      local comment = comments[ci + (offset or 0)]
      if not peek then
        ci = ci + 1 + (offset or 0)
      end
      return comment
    end

    local function insertDoc(doc, comment)
      ast.docs[#ast.docs + 1] = doc
      doc.parent = ast.docs
      if ast.start > doc.start then
        ast.start = doc.start
      end
      if ast.finish < doc.finish then
        ast.finish = doc.finish
      end
      doc.originalComment = comment
      if comment.type == "comment.long" then
        findTouch(state, doc)
      end
    end

    while true do
      local comment = NextComment()
      if not comment then
        break
      end
      lockResume = false
      local doc, rests = buildLuaDoc(comment)
      if doc then
        insertDoc(doc, comment)
        if rests then
          for _, rest in ipairs(rests) do
            insertDoc(rest, comment)
          end
        end
      end
    end

    if ast.state.pluginDocs then
      for _, doc in ipairs(ast.state.pluginDocs) do
        insertDoc(doc, doc.originalComment)
      end
      ---@param a unknown
      ---@param b unknown
      table.sort(ast.docs, function(a, b)
        return a.start < b.start
      end)
      ast.state.pluginDocs = nil
    end

    ast.docs.start = ast.start
    ast.docs.finish = ast.finish

    if #ast.docs == 0 then
      return
    end

    bindDocs(state)
  end

  return {
    luadoc = luadoc,
  }
end)()

---Self written
local tex_doc_generator = (function()
  -- Convert LuaCATS definitions files into TeX files

  --- m = module to export
  local m = {}

  m.guide = guide

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
  local function get_ansi_color(color_code)
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
    return get_ansi_color(color_code) .. tostring(text) .. get_ansi_color(0)
  end

  ---
  ---Parse the given Lua code and return the state object.
  ---
  ---@param lua_code string # A string containing some documented Lua code.
  function m.parse_state(lua_code)
    local state = compile(lua_code, "Lua")
    luadoc.luadoc(state)
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
  local node_hash_cache = {}

  local function reset_node_id_cache()
    node_index = 0
    node_hash_cache = {}
  end

  ---
  ---@param node parser.Node
  ---
  ---@return integer
  local function get_node_id(node)
    local node_hash = tostring(node)
    if node_hash_cache[node_hash] then
      return node_hash_cache[node_hash]
    end
    node_index = node_index + 1
    node_hash_cache[node_hash] = node_index
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
    for _, node in ipairs(nodes) do
      table.insert(output, get_colorized_node_id(node))
    end
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
    local skip_colorize = not colorize_output

    local primary, secondary = m.get_content(node)
    local output = node.type
    if primary then
      output = output .. ": " .. colorize(31, primary, skip_colorize)
    end
    if secondary then
      output = output .. ", " .. colorize(33, secondary, skip_colorize)
    end
    return get_colorized_node_id(node) .. ":" .. output
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
                  .. field
                  .. ": "
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
end)()

return tex_doc_generator
