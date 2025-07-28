-- https://github.com/Josef-Friedrich/LuaTeX_Lua-API/issues/6

local function finder(name, mode, type) end
local function scriptrunner(name) end
local function maketext(name, what) end

local mp = mplib.new({
  mem_name = "plain",
  find_file = finder,
  ini_version = true,
  math_mode = "double",
  random_seed = math.random(100),
  run_script = scriptrunner,
  make_text = maketext,
  extensions = 1,
})
