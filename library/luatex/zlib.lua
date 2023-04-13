_N._4_3_lua_modules = "page 67"
---Changes to upstream: global zlib table

---
---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/lzlib

---
---`lzlib`, by Tiago Dionizio, http://luaforge.net/projects/lzlib/.
---https://luarocks.org/modules/hisham/lzlib
---https://github.com/LuaDist/lzlib
zlib = {}

---
---returns zlib version
---
---@return string
function zlib.version() end

---
---Without any parameters, returns the initial adler32 value.
---
---Call to update the adler32 value, adler is the current value, buffer is passed
---to adler32 zlib function and the updated value is returned.
---
---@param adler32? integer
---@param buffer? string
---
---@return string buffer
function zlib.adler32(adler32, buffer) end

---
---Same as zlib.adler32.
---
---@param crc32? integer
---@param buffer? string
---
---@return string buffer
function zlib.crc32(crc32, buffer) end

---
---Return a string containing the compressed buffer according to the given parameters.
---
---@param buffer string
---@param level? integer
---@param method? integer
---@param windowBits? integer
---@param memLevel? integer
---@param strategy? integer
---
---@return string buffer
function zlib.compress(buffer, level, method, windowBits, memLevel, strategy) end

---
---Return the decompressed stream after processing the given buffer.
---
---@param buffer string
---@param windowBits? integer
---
---@return string
function zlib.decompress(buffer, windowBits) end

---
---@class Sink
local Sink = {}

function Sink:write() end
function Sink:close() end
function Sink:flush() end

---
---Return a deflate stream.
---
---@param sink function | Sink
---@param level? integer - compression level, default `Z_DEFAILT_COMPRESSION`
---@param method? integer - default `Z_DEFLATED`
---@param windowBits? integer -  default `15`
---@param memLevel? integer - default `8`
---@param strategy? integer - default `Z_DEFAULT_STRATEGY`
---@param dictionary? string - default `""`
---
---@return Stream
function zlib.deflate(sink, level, method, windowBits, memLevel, strategy, dictionary) end

---
---@class InflateSink
local InflateSink = {}
function InflateSink:read() end
function InflateSink:close() end

---
---Return an inflate stream.
---
---@param source string|function|InflateSink
---@param windowBits? integer -  default `15`
---@param dictionary? string - default `""`
---@return Stream
function zlib.inflate(source, windowBits, dictionary) end

---
---@class Stream
local Stream = {}

---
---Write each parameter into the stream.
---
---@param ... any
function Stream:write(...) end

---
---  Read from the stream, each parameter corresponds to
---   a return value.
---
---  With no arguments, it reads a line.
---  Parameters are interpreted as follows:
---    number - reads the specified number of bytes
---    'a' - reads the remaining bytes
---    'l' - reads a line
---@param ... integer|'a'|'l'
function Stream:read(...) end

---
---Returns an iterator that returns a new line each time
---it is called.
---@return function
function Stream:lines() end

---
---Flush output for deflate streams.
---@param opts 'sync'|'full'|'finish'
function Stream:flush(opts) end

---
---Close the stream.
function Stream:close() end

return zlib
