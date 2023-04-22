_N._4_3_lua_modules = "page 67"

---
---https://github.com/TeX-Live/luatex/tree/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazip
---Changes to upstream: global zip table

---
---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/luazip

---
---`LuaZip` is a lightweight Lua extension library that can be used to read files stored inside zip files. It uses `zziplib` to do all the hard work.
---
---The API exposed to Lua is very simple and very similiar to the usual file handling functions provided by the I/O Lua standard library. In fact, the API is so similar that parts of this manual are extracted from the Lua manual, copyrighted by Tecgraf, PUC-Rio.
---
---History:
---
---* keplerproject.org (link not accessible): http://www.keplerproject.org/luazip
---* luaforge.net (link not accessible): http://luaforge.net/projects/luazip
---* Forked from the CVS repository on luaforge.net on Jan. 20, 2010: https://github.com/luaforge/luazip
---* Most active fork: https://github.com/mpeterv/luazip
---
---Project on luarocks: https://luarocks.org/modules/mpeterv/luazip
---HTML documentation: http://mpeterv.github.io/luazip
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
zip = {}

---
---Check if a zip file is open or closed.
---
---* Corresponding C source code: (luazip.c#L217-L225)[https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L217-L225]
---
---__Example:__
---```lua
---local f = zip.open('test.zip')
---print(zip.type(f)) - zip file
---f:close()
---print(zip.type(f)) - closed zip file
---```
---
---@param zfile Zfile
---
---@return "closed zip file"|"zip file"|nil
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function zip.type(zfile) end

---
---Open a zip file and return a new zip file handle.
---
---In case of
---error it returns nil and an error message. Unlike `io.open`, there is no
---`mode` parameter, as the only supported mode is "read".
---
---* Corresponding C source code: [luazip.c#L106-L119](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L106-L119)
---
---@param filename string
---
---@return Zfile|nil
---@return nil|string err
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function zip.open(filename) end

---
---Open a file and return a file handle.
---
---In case of
---error it returns nil and an error message. Unlike `io.open`, there is no
---`mode` parameter, as the only supported mode is `read`.
---
---This function implements a virtual file system based on optionally compressed files.
---Instead of simply looking for a file at a given path, this function goes recursively up
---through all path separators ("/") looking for zip files there. If it finds a zip file,
---this function use the remaining path to open the requested file.
---The optional parameter extensionsallows the use of file extensions other than .zip
---during the lookup. It can be a string corresponding to the extension or an indexed table
---with the lookup extensions sequence.
---
---* Corresponding C source code: [luazip.c#L151-L215](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L151-L215)
---
---@param filename string
---
---@return ZInteralFile|nil
---@return nil|string err
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function zip.openfile(filename) end

---
---@class ZInteralFile
local ZInteralFile = {}

---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
---@class Zfile
local ZFile = {}

---
---@param zfile Zfile
---
---* Corresponding C source code: [luazip.c#L121-L131](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L121-L131)
---
---@return boolean
function zip.close(zfile) end

---
---Close a zfile opened by `zip.open`.
---
---* Corresponding C source code: [luazip.c#L121-L131](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L121-L131)
---
---@return boolean
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function ZFile:close() end

---
---@class ZInternalFileInfo
---@field filename string # The full path of a file, for example `folder/Test.txt`.
---@field compression_method integer # for example `8`.
---@field compressed_size integer # The compressed size of the file in bytes, for example `28673`.
---@field uncompressed_size integer # The uncompressed size of the file in bytes, for example `434654`.

---
---Return an iterator function that returns a new table containing the
---informations about the current file.
---
---__Example:__
---
---```lua
---local zfile = zip.open('../test.zip')
---assert(zfile)
---
---for internal in zfile:files() do
---  assert(internal.filename)
---  assert(internal.compression_method)
---  assert(internal.compressed_size)
---  assert(internal.uncompressed_size)
---end
---```
---
---* Corresponding C source code: [luazip.c#L278-L285](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L278-L285)
---
---@return fun(): ZInternalFileInfo
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function ZFile:files() end

---
---Open a file that is stored inside the zip file opened by `zip.open`.
---
---The filename may contain the full path of the file contained inside the zip. The
---directory separator must be '/'.
---Unlike `f:open`, there is no `mode` parameter, as the only
---supported mode is "read".
---
---__Example:__
---
---```lua
---local f = zip.open('test.zip')
---assert(f)
---local _, err = f:open('xxx.xxx')
---assert(err == 'could not open file `xxx.xxx\'')
---
---local ff, err = f:open('Hello-world.txt')
---assert(ff)
---assert(err == nil)
---```
---
---* Corresponding C source code: [luazip.c#L133-L146](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L133-L146)
---
---@param filename string
---
---@return ZInteralFile|nil
---@return nil|string err
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function ZFile:open(filename) end

---
---Read a `file` according to the given formats, which specify what to read.
---
---For each format, the function returns a string with the characters read, or nil if it cannot read
---data with the specified format. When called without formats, it uses a default format that reads
---the entire next line (see below).
---The available formats are:
---
---* `"*a"`: reads the whole file, starting at the current position. On end of file, it
---returns the empty string.
---* `"*l"`: reads the next line (skipping the end of line), returns nil on end of file.
---This is the default format.
---* `number`: reads a string with up to that number of characters, returning nil
---on end of file.
---
---* Corresponding C source code: [luazip.c#L407-L409](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L407-L409)
---
---@param ... '*a'|'*l'|integer
---
---@return string|nil
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function ZInteralFile:read(...) end

---
---Sets and gets the file position.
---
---Unlike the standard I/O read, the format `"*n"` is not supported.
---
---Sets and gets the file position, measured from the beginning of the file, to the position given
---by `offset` plus a base specified by the string `whence`, as follows:
---
---* `set`: base is position 0 (beginning of the file);
---* `cur`: base is current position;
---* `end`: base is end of file;
---
---In case of success, function `seek` returns the final file position, measured in bytes
---from the beginning of the file. If this function fails, it returns nil, plus an error string.
---The default value for `whence` is `"cur"`, and for `offset` is 0.
---Therefore, the call `zfile:seek()` returns the current file position, without changing
---it; the call `zfile:seek("set")` sets the position to the beginning of the file (and returns 0);
---and the call `zfile:seek("end")` sets the position to the end of the file, and returns its
---size.
---
---* Corresponding C source code: [luazip.c#L429-L447](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L429-L447)
---
---@param whence? 'set'|'cur'|'end'
---@param offset? integer
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function ZInteralFile:seek(whence, offset) end

---
---Close a file opened by `zfile:open`.
---
---* Corresponding C source code: [luazip.c#L295-L297](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L295-L297)
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function ZInteralFile:close() end

---
---Return an iterator function that returns a new line from the
-- file each time it is called.
---
---Therefore, the construction
---
---```lua
---for line in file:lines() do ... end
---```
---
---will iterate over all lines of the file.
---
---* Corresponding C source code: [luazip.c#L423-L427](https://github.com/mpeterv/luazip/blob/e424f667cc5c78dd19bb5eca5a86b3c8698e0ce5/src/luazip.c#L423-L427)
---
---@return fun(): string
---
---😱 [Types](https://github.com/LuaCATS/luazip/blob/main/library/zip.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luazip/pulls)
function ZInteralFile:lines() end

return zip
