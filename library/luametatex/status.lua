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

---
---@class ExtraState
---@field all integer # For example: `48`
---@field ini integer # For example: `-1`
---@field max integer # For example: `-1`
---@field mem integer # For example: `48`
---@field min integer # For example: `-1`
---@field ptr integer # For example: `48`
---@field set integer # For example: `-1`
---@field stp integer # For example: `-1`
---@field top integer # For example: `48`

---
---@return ExtraState
function status.getextrastate() end

---
---@class FileState
---@field all integer # For example: `16000`
---@field ini integer # For example: `-1`
---@field max integer # For example: `2000`
---@field mem integer # For example: `500`
---@field min integer # For example: `500`
---@field ptr integer # For example: `6`
---@field set integer # For example: `2000`
---@field stp integer # For example: `250`
---@field top integer # For example: `11`

---
---@return FileState
function status.getfilestate() end

---
---@class FontState
---@field all integer # For example: `12959096`
---@field ini integer # For example: `-1`
---@field max integer # For example: `100000`
---@field mem integer # For example: `12959096`
---@field min integer # For example: `250`
---@field ptr integer # For example: `29`
---@field set integer # For example: `250`
---@field stp integer # For example: `250`
---@field top integer # For example: `250`

---
---@return FontState
function status.getfontstate() end
function status.gethalferrorlinestate() end

---
---@class HashState
---@field all integer # For example: `2400000`
---@field ini integer # For example: `0`
---@field max integer # For example: `2097152`
---@field mem integer # For example: `150000`
---@field min integer # For example: `150000`
---@field ptr integer # For example: `12279`
---@field set integer # For example: `250000`
---@field stp integer # For example: `100000`
---@field top integer # For example: `740853`

---
---@return HashState
function status.gethashstate() end

---
---@class InputState
---@field all integer # For example: `320000`
---@field ini integer # For example: `-1`
---@field max integer # For example: `100000`
---@field mem integer # For example: `10000`
---@field min integer # For example: `10000`
---@field ptr integer # For example: `7`
---@field set integer # For example: `100000`
---@field stp integer # For example: `10000`
---@field top integer # For example: `47`

---
---@return InputState
function status.getinputstate() end

---
---@class InsertState
---@field all integer # For example: `10240`
---@field ini integer # For example: `-1`
---@field max integer # For example: `500`
---@field mem integer # For example: `320`
---@field min integer # For example: `10`
---@field ptr integer # For example: `7`
---@field set integer # For example: `10`
---@field stp integer # For example: `10`
---@field top integer # For example: `10`

---
---@return InsertState
function status.getinsertstate() end

---
---@class LanguageState
---@field all integer # For example: `96`
---@field ini integer # For example: `0`
---@field max integer # For example: `10000`
---@field mem integer # For example: `96`
---@field min integer # For example: `250`
---@field ptr integer # For example: `0`
---@field set integer # For example: `250`
---@field stp integer # For example: `250`
---@field top integer # For example: `250`

---
---@return LanguageState
function status.getlanguagestate() end

---
---@class LookupState
---@field all integer # For example: `-1`
---@field ini integer # For example: `47714`
---@field max integer # For example: `2097152`
---@field mem integer # For example: `-1`
---@field min integer # For example: `150000`
---@field ptr integer # For example: `56970`
---@field set integer # For example: `250000`
---@field stp integer # For example: `100000`
---@field top integer # For example: `131074`

---
---@return LookupState
function status.getlookupstate() end
function status.getluastate() end

---
---@class MarkState
---@field all integer # For example: `28800`
---@field ini integer # For example: `-1`
---@field max integer # For example: `10000`
---@field mem integer # For example: `1200`
---@field min integer # For example: `50`
---@field ptr integer # For example: `28`
---@field set integer # For example: `50`
---@field stp integer # For example: `50`
---@field top integer # For example: `50`

---
---@return MarkState
function status.getmarkstate() end

---
---@class NestState
---@field all integer # For example: `72000`
---@field ini integer # For example: `-1`
---@field max integer # For example: `10000`
---@field mem integer # For example: `1000`
---@field min integer # For example: `1000`
---@field ptr integer # For example: `0`
---@field set integer # For example: `10000`
---@field stp integer # For example: `1000`
---@field top integer # For example: `19`

---
---@return NestState
function status.getneststate() end

---
---@class NodeState
---@field all integer # For example: `18000000`
---@field ini integer # For example: `0`
---@field max integer # For example: `100000000`
---@field mem integer # For example: `2000000`
---@field min integer # For example: `2000000`
---@field ptr integer # For example: `-215955`
---@field set integer # For example: `100000000`
---@field stp integer # For example: `500000`
---@field top integer # For example: `250737`

---
---@return NodeState
function status.getnodestate() end

---
---@class ParameterState
---@field all integer # For example: `80000`
---@field ini integer # For example: `-1`
---@field max integer # For example: `100000`
---@field mem integer # For example: `20000`
---@field min integer # For example: `20000`
---@field ptr integer # For example: `1`
---@field set integer # For example: `100000`
---@field stp integer # For example: `10000`
---@field top integer # For example: `52`

---
---@return ParameterState
function status.getparameterstate() end

---
---@class PoolState
---@field all integer # For example: `1108523`
---@field ini integer # For example: `902887`
---@field max integer # For example: `100000000`
---@field mem integer # For example: `1108523`
---@field min integer # For example: `10000000`
---@field ptr integer # For example: `-1`
---@field set integer # For example: `20000000`
---@field stp integer # For example: `1000000`
---@field top integer # For example: `-1`

---
---@return PoolState
function status.getpoolstate() end
function status.getreadstate() end

---
---@class SaveState
---@field all integer # For example: `160000`
---@field ini integer # For example: `-1`
---@field max integer # For example: `500000`
---@field mem integer # For example: `10000`
---@field min integer # For example: `100000`
---@field ptr integer # For example: `194`
---@field set integer # For example: `500000`
---@field stp integer # For example: `10000`
---@field top integer # For example: `948`

---
---@return SaveState
function status.getsavestate() end

---
---@class SparseState
---@field all integer # For example: `3744016`
---@field ini integer # For example: `-1`
---@field max integer # For example: `-1`
---@field mem integer # For example: `3744016`
---@field min integer # For example: `-1`
---@field ptr integer # For example: `-1`
---@field set integer # For example: `-1`
---@field stp integer # For example: `-1`
---@field top integer # For example: `-1`

---
---@return SparseState
function status.getsparsestate() end

---
---@class SpringState
---@field all integer # For example: `2400000`
---@field ini integer # For example: `2144882`
---@field max integer # For example: `2097152`
---@field mem integer # For example: `150000`
---@field min integer # For example: `150000`
---@field ptr integer # For example: `56986`
---@field set integer # For example: `500000`
---@field stp integer # For example: `100000`
---@field top integer # For example: `56986`

---
---@return SpringState
function status.getstringstate() end

---
---@class TexState
---@field approximate integer # For example: `51298819`

---
---@return TexState
function status.gettexstate() end

---
---@class TokenState
---@field all integer # For example: `8000000`
---@field ini integer # For example: `522721`
---@field max integer # For example: `10000000`
---@field mem integer # For example: `1000000`
---@field min integer # For example: `1000000`
---@field ptr integer # For example: `1608434`
---@field set integer # For example: `10000000`
---@field stp integer # For example: `250000`
---@field top integer # For example: `804007`

---
---@return TokenState
function status.gettokenstate() end

function status.getwarningstate() end
function status.iocodes() end
function status.list() end
function status.resetmessages() end
