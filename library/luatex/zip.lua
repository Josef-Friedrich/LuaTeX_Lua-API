---https://github.com/TeX-Live/luatex/tree/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/luazip
---Changes to upstream: global zip table

---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/luazip

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
zip = {}

---
---@return nil|"closed zip file"|"zip file"
function zip.type() end

---
---This function opens a zip file and returns a new zip file handle. In case of
---error it returns nil and an error message. Unlike `io.open`, there is no
---`mode` parameter, as the only supported mode is "read".
---
---@param filename string
---
---@return Zfile
function zip.open(filename) end

---
---This function opens a file and returns a file handle. In case of
---error it returns nil and an error message. Unlike `io.open`, there is no
---`mode` parameter, as the only supported mode is "read".
---
---This function implements a virtual file system based on optionally compressed files.
---Instead of simply looking for a file at a given path, this function goes recursively up
---through all path separators ("/") looking for zip files there. If it finds a zip file,
---this function use the remaining path to open the requested file.
---The optional parameter extensionsallows the use of file extensions other than .zip
---during the lookup. It can be a string corresponding to the extension or an indexed table
---with the lookup extensions sequence.
---
---@param filename string
---
---@return Zfile
function zip.openfile(filename) end

---
---@class Zfile
zfile = {}

---
---This function closes a zfile opened by `zip.open`
function zfile:close() end

---
---Returns an iterator function that returns a new table containing the
---following information each time it is called:
---
---* `filename`: the full path of a file
---* `compressed_size`: the compressed size of the file in bytes
---* `uncompressed_size`: the uncompressed size of the file in bytes
function zfile:files() end

---
---This function opens a file that is stored inside the zip file opened by `zip.open`.
---The filename may contain the full path of the file contained inside the zip. The
---directory separator must be '/'.
---Unlike `f:open`, there is no `mode` parameter, as the only
---supported mode is "read".
---
---@param filename string
function zfile:open(filename) end

---
---Reads a `file` according to the given formats, which specify what to read.
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
---@param ... '*a'|'*l'|integer
---
---@return string|nil
function zfile:read(...) end

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
function zfile:seek(whence, offset) end

---
---This function closes a file opened by `zfile:open`.
function zfile:close() end

---
---Returns an iterator function that returns a new line from the
-- file each time it is called.
---Therefore, the construction
---
---```lua
---for line in file:lines() do ... end
---```
---
---will iterate over all lines of the file.
function zfile:lines() end

return zip
