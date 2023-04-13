---@meta
status = {}

---
---@class EngineState
---@field banner string # For example: `This is LuaMetaTeX, Version 2.10.06`
---@field copyright string # For example: `Taco Hoekwater, Hans Hagen & Wolfgang Schuster`
---@field development_id integer # For example: `20230126`
---@field filename string # For example: `t:/manuals/mkiv/external/luametatex/luametatex-tex.tex`
---@field format_id integer # For example: `684`
---@field logfilename string # For example: `luametatex.log`
---@field luatex_engine string # For example: `luametatex`
---@field luatex_revision integer # For example: `6`
---@field luatex_verbose integer # For example: `2.10.06`
---@field luatex_version string # For example: `210`
---@field permit_loadlib boolean # For example: `false`
---@field run_state integer # For example: `1`
---@field used_compiler string # For example: `gcc`

---
---@alias ToplevelStatistics EngineState

---
---@class BufferState
---@field all integer # For example: `1000000`
---@field ini integer # For example: `-1`
---@field max integer # For example: `100000000`
---@field mem integer # For example: `1000000`
---@field min integer # For example: `1000000`
---@field ptr integer # For example: `0`
---@field set integer # For example: `10000000`
---@field stp integer # For example: `1000000`
---@field top integer # For example: `936`

---
---@return BufferState
function status.getbufferstate() end

---
---@class CallbackState
---@field bytecode integer # For example: `613`
---@field count integer # For example: `300352`
---@field direct integer # For example: `2034`
---@field file integer # For example: `17973`
---@field function integer # For example: `64160`
---@field local integer # For example: `0`
---@field message integer # For example: `0`
---@field saved integer # For example: `211120`
---@field value integer # For example: `4452`

---
---@return CallbackState
function status.getcallbackstate() end

function status.getconstants() end
function status.geterrorlinestate() end
function status.geterrorstate() end
function status.getexpandstate() end
function status.getextrastate() end
function status.getfilestate() end
function status.getfontstate() end
function status.gethalferrorlinestate() end
function status.gethashstate() end
function status.getinputstate() end
function status.getinsertstate() end
function status.getlanguagestate() end
function status.getlookupstate() end
function status.getluastate() end
function status.getmarkstate() end
function status.getneststate() end
function status.getnodestate() end
function status.getparameterstate() end
function status.getpoolstate() end
function status.getreadstate() end
function status.getsavestate() end
function status.getsparsestate() end
function status.getstringstate() end
function status.gettexstate() end
function status.gettokenstate() end
function status.getwarningstate() end
function status.iocodes() end
function status.list() end
function status.resetmessages() end
