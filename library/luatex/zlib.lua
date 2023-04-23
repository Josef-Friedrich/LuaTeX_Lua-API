_N._4_3_lua_modules = "page 67"

---
---Changes to upstream: global zlib table

---
---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/lzlib

---
---`lzlib`, by Tiago Dionizio.
---
---* Old location: http://luaforge.net/projects/lzlib/.
---* More recent git repo (archived): https://github.com/LuaDist/lzlib
---* On luarocks: https://luarocks.org/modules/hisham/lzlib
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
zlib = {}

---
---Return the zlib version.
---
---__Example:__
---
---```lua
---local version = zlib.version()
---assert(version == '1.2.13')
---```
---
---* Corresponding C source code: [lzlib.c#L331-L335](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L331-L335)
---
---
---@return string version # For example `1.2.13`
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.version() end

---
---Return the initial `adler32` value.
---
---Call to update the `adler32` value, `adler32` is the current value, `buffer` is passed
---to `adler32` zlib function and the updated value is returned.
---
---* Corresponding C source code: [lzlib.c#L338-L355](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L338-L355)
---
---
---@param adler32? integer
---@param buffer? string
---
---@return string buffer
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.adler32(adler32, buffer) end

---
---Return the initial `crc32` value.
---
---Call to update the `crc32` value, `crc32` is the current value, `buffer` is passed
---to `crc32` zlib function and the updated value is returned.
---
---* Corresponding C source code: [lzlib.c#L358-L375](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L358-L375)
---
---
---@param crc32? integer
---@param buffer? string
---
---@return string buffer
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.crc32(crc32, buffer) end

---
---Return a string containing the compressed buffer according to the given parameters.
---
---* Corresponding C source code: [lzlib.c#L380-L441](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L380-L441)
---
---
---@param buffer string
---@param level? integer
---@param method? integer
---@param windowBits? integer
---@param memLevel? integer
---@param strategy? integer
---
---@return string buffer
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.compress(buffer, level, method, windowBits, memLevel, strategy) end

---
---Return the decompressed stream after processing the given buffer.
---
---* Corresponding C source code: [lzlib.c#L445-L502](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L445-L502)
---
---
---@param buffer string
---@param windowBits? integer
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.decompress(buffer, windowBits) end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
---@class Sink
local Sink = {}

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Sink:write() end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Sink:close() end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Sink:flush() end

---
---Return a deflate stream.
---
---
---In the upstream project this function is called `zlib.deflate()`.
---
---* Corresponding C source code: [lzlib.c#L156-L173](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L156-L173)
---
---
---@param sink function | Sink
---@param level? integer - compression level, default `Z_DEFAILT_COMPRESSION`
---@param method? integer - default `Z_DEFLATED`
---@param windowBits? integer -  default `15`
---@param memLevel? integer - default `8`
---@param strategy? integer - default `Z_DEFAULT_STRATEGY`
---@param dictionary? string - default `""`
---
---@return ZStream
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.compressobj(sink, level, method, windowBits, memLevel, strategy, dictionary) end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
---@class InflateSink
local InflateSink = {}

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function InflateSink:read() end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function InflateSink:close() end

---
---Return an inflate stream.
---
---In the upstream project this function is called `zlib.inflate()`.
---
---* Corresponding C source code: [lzlib.c#L177-L191](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L177-L191)
---
---
---@param source string|function|InflateSink
---@param windowBits? integer -  default `15`
---@param dictionary? string - default `""`
---@return ZStream
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.decompressobj(source, windowBits, dictionary) end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
---@class ZStream
local ZStream = {}

---
---* Corresponding C source code: [lzlib.c#L307-L322](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L307-L322)
---
function ZStream:adlerreset() end

---
---* Corresponding C source code: [lzlib.c#L231-L263](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L231-L263)
---
function ZStream:compress(...) end

---
---* Corresponding C source code: [lzlib.c#L195-L227](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L195-L227)
---
function ZStream:decompress() end

---
---Flush the output for deflate streams.
---
---* Corresponding C source code: [lzlib.c#L267-L303](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L267-L303)
---
---
---@param opts? 'sync'|'full'|'finish'
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function ZStream:flush(opts) end

---
---Close the stream.
---
---* Corresponding C source code: [lzlib.c#L138-L143](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L138-L143)
---
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function ZStream:close() end

---
---* Corresponding C source code: [lzlib.c#L147-L152](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L147-L152)
---
function ZStream.adler() end

return zlib
