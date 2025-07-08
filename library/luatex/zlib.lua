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
---* Corresponding C source code: [lzlib.c#L331-L335](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L331-L335)
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
---This function is not related to compression but is exported anyway because it might be useful in applications using the compression library.
---
---__Example:__
---
---```lua
---local adler = zlib.adler32()
---assert(adler == 1.0)
---adler = zlib.adler32(adler, 'some text')
---assert(adler == 300417946.0)
---adler = zlib.adler32(adler, 'some text')
---assert(adler == 1144063795.0)
---adler = zlib.adler32(adler, 'some text')
---assert(adler == 2530937548.0)
---```
---
---* Corresponding C source code: [lzlib.c#L338-L355](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L338-L355)
---
---@param adler32? number
---@param buffer? string
---
---@return number adler32
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.adler32(adler32, buffer) end

---
---Return the initial `crc32` (Cyclic Redundancy Check) value.
---
---Call to update the `crc32` value, `crc32` is the current value, `buffer` is passed
---to `crc32` zlib function and the updated value is returned.
---
---This function is not related to compression but is exported anyway because it might be useful in applications using the compression library.
---
---__Example:__
---
---```lua
---local crc = zlib.crc32()
---assert(crc == 0.0)
---crc = zlib.crc32(crc, 'some text')
---assert(crc == 1337638330.0)
---crc = zlib.crc32(crc, 'some text')
---assert(crc == 2768805016.0)
---crc = zlib.crc32(crc, 'some text')
---assert(crc == 1021719064.0)
---```
---
---* Corresponding C source code: [lzlib.c#L358-L375](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L358-L375)
---
---@param crc32? number
---@param buffer? string
---
---@return number crc32
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.adler32(crc32, buffer) end

---
---Return a string containing the compressed buffer according to the given parameters.
---
---__Example:__
---
---```lua
---local orig = [[
---Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
---nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
---sed diam voluptua.
---]]
---assert(string.len(zlib.compress(orig)) < string.len(orig))
---```
---
---* Corresponding C source code: [lzlib.c#L380-L441](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L380-L441)
---
---@param buffer string
---@param level? integer # The compression level must be `-1` (default compression), or between `0` and `9`: `1` gives best speed, `9` gives best compression, `0` gives no compression at all (the input data is simply copied a block at a time).
---@param method? integer # The method parameter is the compression method. It must be `8` (`Z_DEFLATED`) in this version of the library.
---@param window_bits? integer # `The window_bits` parameter is the base two logarithm of the maximum window size (the size of the history buffer). It should be in the range `8..15` for this version of the library, default `15`.
---@param mem_level? integer - default `8`
---@param strategy? integer - default `Z_DEFAULT_STRATEGY`
---
---@return string buffer
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.compress(buffer, level, method, window_bits, mem_level, strategy) end

---
---Return the decompressed stream after processing the given buffer.
---
---__Example:__
---
---```lua
---local uncompressed = 'Lorem ipsum'
---local compressed = zlib.compress(uncompressed)
---local result = zlib.decompress(compressed)
---assert(result == uncompressed)
---```
---
---* Corresponding C source code: [lzlib.c#L445-L502](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L445-L502)
---
---@param buffer string
---@param window_bits? integer # `The window_bits` parameter is the base two logarithm of the maximum window size (the size of the history buffer). It should be in the range `8..15` for this version of the library, default `15`.
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.decompress(buffer, window_bits) end

---
---Return a deflate stream.
---
---In the upstream project this function is called `zlib.deflate()`.
---
---__Example:__
---
---```lua
---local z_stream = zlib.compressobj(1)
---local result = z_stream:compress('test')
---assert(type(result) == 'string')
---```
---
---* Corresponding C source code: [lzlib.c#L156-L173](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L156-L173)
---
---@param level? integer # The compression level must be `-1` (default compression), or between `0` and `9`: `1` gives best speed, `9` gives best compression, `0` gives no compression at all (the input data is simply copied a block at a time).
---@param method? integer # The method parameter is the compression method. It must be `8` (`Z_DEFLATED`) in this version of the library.
---@param window_bits? integer # `The window_bits` parameter is the base two logarithm of the maximum window size (the size of the history buffer). It should be in the range `8..15` for this version of the library, default `15`.
---@param mem_level? integer - default `8`
---@param strategy? integer - default `Z_DEFAULT_STRATEGY`
---
---@return ZStream
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.compressobj(level, method, window_bits, mem_level, strategy) end

---
---Return an inflate stream.
---
---In the upstream project this function is called `zlib.inflate()`.
---
---__Example:__
---
---```lua
---local z_stream_com = zlib.compressobj(1)
---local compressed = z_stream_com:compress('test')
---compressed = compressed .. z_stream_com:flush()
---
---local z_stream_decomp = zlib.decompressobj()
---local result = z_stream_decomp:decompress(compressed)
---assert(result == 'test')
---```
---
---* Corresponding C source code: [lzlib.c#L177-L191](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L177-L191)
---
---@param window_bits? integer # `The window_bits` parameter is the base two logarithm of the maximum window size (the size of the history buffer). It should be in the range `8..15` for this version of the library, default `15`.
---
---@return ZStream
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.decompressobj(window_bits) end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
---@class ZStream
local ZStream = {}

---
---* Corresponding C source code: [lzlib.c#L307-L322](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L307-L322)
---
function ZStream:adlerreset() end

---
---* Corresponding C source code: [lzlib.c#L231-L263](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L231-L263)
---
---@param buffer string
---
---@return string buffer
function ZStream:compress(buffer) end

---
---* Corresponding C source code: [lzlib.c#L195-L227](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L195-L227)
---
---@param buffer string
---
---@return string buffer
function ZStream:decompress(buffer) end

---
---Flush the output for deflate streams.
---
---* Corresponding C source code: [lzlib.c#L267-L303](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L267-L303)
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function ZStream:flush() end

---
---Close the stream.
---
---* Corresponding C source code: [lzlib.c#L138-L143](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L138-L143)
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function ZStream:close() end

---
---* Corresponding C source code: [lzlib.c#L147-L152](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lzlib.c#L147-L152)
---
---@return number adler
function ZStream.adler() end

return zlib
