-- May be helpful https://github.com/LuaLS/lua-language-server/blob/master/script/cli/doc/init.lua

local inspect = require('inspect')
local parser = require('parser')

local function pinspect(value)
  print(inspect(value))
end

---https://github.com/LuaLS/LuaParser/blob/master/src/parser/guide.lua
---@class parser.object
---@field bindDocs              parser.object[]
---@field bindGroup             parser.object[]
---@field bindSource            parser.object
---@field value                 parser.object
---@field parent                parser.object
---@field type                  string
---@field special               string
---@field tag                   string
---@field args                  { [integer]: parser.object, start: integer, finish: integer, type: string }
---@field locals                parser.object[]
---@field returns?              parser.object[]
---@field breaks?               parser.object[]
---@field exps                  parser.object[]
---@field keys                  parser.object
---@field uri                   uri
---@field start                 integer
---@field finish                integer
---@field range                 integer
---@field effect                integer
---@field bstart                integer
---@field bfinish               integer
---@field attrs                 table
---@field specials              parser.object[]
---@field labels                parser.object[]
---@field node                  parser.object
---@field field                 parser.object
---@field method                parser.object
---@field index                 parser.object
---@field extends               parser.object[]|parser.object
---@field types                 parser.object[]
---@field fields                parser.object[]
---@field tkey                  parser.object
---@field tvalue                parser.object
---@field tindex                integer
---@field op                    parser.object
---@field next                  parser.object
---@field docParam              parser.object
---@field sindex                integer
---@field name                  parser.object
---@field call                  parser.object
---@field closure               parser.object
---@field proto                 parser.object
---@field exp                   parser.object
---@field alias                 parser.object
---@field class                 parser.object
---@field enum                  parser.object
---@field vararg                parser.object
---@field param                 parser.object
---@field overload              parser.object
---@field docParamMap           table<string, integer>
---@field upvalues              table<string, string[]>
---@field ref                   parser.object[]
---@field returnIndex           integer
---@field assignIndex           integer
---@field docIndex              integer
---@field docs                  parser.object
---@field state                 table
---@field comment               table
---@field optional              boolean
---@field max                   parser.object
---@field init                  parser.object
---@field step                  parser.object
---@field redundant             { max: integer, passed: integer }
---@field filter                parser.object
---@field loc                   parser.object
---@field keyword               integer[]
---@field casts                 parser.object[]
---@field mode?                 '+' | '-'
---@field hasGoTo?              true
---@field hasReturn?            true
---@field hasBreak?             true
---@field hasExit?              true
---@field [integer]             parser.object|any
---@field dot                   { type: string, start: integer, finish: integer }
---@field colon                 { type: string, start: integer, finish: integer }
---@field package _root         parser.object
---@field package _eachCache?   parser.object[]
---@field package _isGlobal?    boolean
---@field package _typeCache?   parser.object[][]

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

local state = parser.compile(multiple_variables, 'Lua')
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

descend(state.ast)

-- parser.luadoc.buildAndBindDoc(state.ast, test_function, state.ast.vstart)
