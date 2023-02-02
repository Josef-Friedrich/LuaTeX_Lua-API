---@meta
---`luazip`, from the kepler project, http://www.keplerproject.org/luazip/.
---https://github.com/luaforge/luazip
---
---https://github.com/TeX-Live/luatex/tree/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/luazip
---
---Suppose we have the following file hierarchy:
---
---```
---/a
---    /b
---        c.zip
---/a2
---    b2.ext2
---/a3.ext3
---/luazip.zip
---```
---
---c.zip contains the file 'd.txt'
---b2.ext2 is a zip file containing the file 'c2/d2.txt'
---a3.ext3 is a zip file containing the file 'b3/c3/d3.txt'
---luazip.zip contains the files 'luazip.h', 'luazip.c', 'Makefile', 'README'
---
---Below is a small sample code displaying the basic use of the library.
---
---```lua
---require "zip"
---
---local zfile, err = zip.open('luazip.zip')
---
----- print the filenames of the files inside the zip
---for file in zfile:files() do
---	print(file.filename)
---end
---
----- open README and print it
---local f1, err = zfile:open('README')
---local s1 = f1:read("*a")
---print(s1)
---
---f1:close()
---zfile:close()
---
----- open d.txt inside c.zip
---local d, err = zip.openfile('a/b/c/d.txt')
---assert(d, err)
---d:close()
---
----- open d2.txt inside b2.ext2
---local d2, err = zip.openfile('a2/b2/c2/d2.txt', "ext2")
---assert(d2, err)
---d2:close()
---
----- open d3.txt inside a3.ext3
---local d3, err = zip.openfile('a3/b3/c3/d3.txt', {"ext2", "ext3"})
---assert(d3, err)
---d3:close()
---```
---
zip = {}

---
---https://github.com/TeX-Live/luatex/blob/16f2f7c88eeef85ce988cbe595481fa714f5dfc9/source/texk/web2c/luatexdir/luazip/src/luazip.c#L198-L206
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
---@param format1 '*a'|'*l'|'number'
---
---@return string|nil
function zfile:read(format1) end

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

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function zip.close() end

return zip
