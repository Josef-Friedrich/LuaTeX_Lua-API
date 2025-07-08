---@meta

---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/gzip.luas
gzip = {}

---
---Open a file name using `gzopen`.
---
---Behaviour is identical to the description
---given in the `zlib` library.
---
---The `mode` parameter is as in fopen (`rb` or `wb`) but can also include a compression level (`wb9`) or a strategy: 'f' for filtered data as in `wb6f`, `h` for Huffman-only compression as in `wb1h`, `R` for run-length encoding as in `wb1R`, or `F` for fixed code compression as in `wb9F`. (See the description of deflateInit2 for more information about the strategy parameter.) `T` will request transparent writing or appending with no compression and not using the gzip format.
---
---`a` can be used instead of `w` to request that the gzip stream that will be written be appended to the file. `+` will result in an error, since reading and writing to the same gzip file is not supported. The addition of `x` when writing will create the file exclusively, which fails if the file already exists. On systems that support it, the addition of `e` when reading or writing will set the flag to close the file on an `execve()` call.
---
---It returns a new file handle, or, in case of errors, `nil` plus an error
---message
---
---* zlib manual [manual.html](https://zlib.net/manual.html)
---
---__Example:__
---
---```lua
---local g_file = gzip.open('test.gz', 'wb9')
---assert(g_file)
---for i = 1, 10 do
---  g_file:write('This is line ' .. i, '\n')
---end
---g_file:close()
---```
---
---* Corresponding C source code: [lgzip.c#L132-L138](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lgzip.c#L132-L138)
---
---@param filename string
---@param mode? string
---
---@return GFile|nil
---@return nil|string err
function gzip.open(filename, mode) end

---
---Same behaviour as io.lines in the `io` standard library provided by lua
---with the aditional feature of working with gzip files. If a normal text
---file is read it will read it normaly (normal gzopen behaviour).
---
---__Example:__
---
---```lua
---for line in gzip.lines('test.gz') do
---  print(line)
---end
---```
---
---* Corresponding C source code: [lgzip.c#L159-L166](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lgzip.c#L159-L166)
---
---@see io.lines
---
---@param filename string
---
---@return fun(): string
function gzip.lines(filename) end

---
---Close the file.
---
---__Example:__
---
---```lua
---local g_file = gzip.open('test.gz', 'rb')
---assert(g_file)
---local success = gzip.close(g_file)
---assert(success == true)
----- gzip.close(g_file) -> attempt to use a closed file
---```
---
---* Corresponding C source code: [lgzip.c#L107-L109](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lgzip.c#L107-L109)
---
---@see GFile.close
---
---@param file GFile
---
---@return true success
function gzip.close(file) end

---
---@class GFile
local GFile = {}

---
---This function takes no parameters and flushes all output to working file.
---The same as calling 'gzflush(file, Z_FINISH)' so writing to the file will
---most likely not work as expected. This is subject to change in the future
---if there is a strong reason for it to happen.
---
---* Corresponding C source code: [lgzip.c#L327-L329](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lgzip.c#L327-L329)
function GFile:flush() end

---
---Reads the file file, according to the given formats, which specify what
---to read. For each format, the function returns a string with the characters
---read, or nil if it cannot read data with the specified format. When called
---without formats, it uses a default format that reads the entire next line
---(see below).
---
---The available formats are
---
---`*a`   reads the whole file, starting at the current position. On end of
---file, it returns the empty string.
---`*l`   reads the next line (skipping the end of line), returning nil on
---end of file. This is the default format.
---number reads a string with up to that number of characters, returning
---nil on end of file. If number is zero, it reads nothing and
---returns an empty string, or nil on end of file.
---
---Unlink io.read, the `*n` format will not be available.
---
---* Corresponding C source code: [lgzip.c#L263-L265](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lgzip.c#L263-L265)
---
function GFile:read(format1, ...) end

---
---Returns an iterator function that, each time it is called, returns a new
---line from the file. Therefore, the construction
---for line in file:lines() do ... end
---will iterate over all lines of the file. (Unlike gzip.lines, this function
---does not close the file when the loop ends.)
---
---* Corresponding C source code: [lgzip.c#L152-L156](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lgzip.c#L152-L156)
---
function GFile:lines() end

---
---Sets and gets the file position, measured from the beginning of the file,
---to the position given by offset plus a base specified by the string whence,
---as follows:
---
---`set` base is position 0 (beginning of the file);
---`cur` base is current position;
---
---In case of success, function seek returns the final file position, measured in bytes from the beginning of ---the file. If this function fails, it returns nil, plus a string describing the error.
---The default value for whence is `cur`, and for offset is 0. Therefore, the call file:seek() returns the ---current file position, without changing it; the call file:seek("set") sets the position to the beginning of ---the file (and returns 0); and the call file:seek("end") sets the position to the end of the file, and ---returns its size.
---
---This function is subject to limitations imposed by `gzseek` function from
---`zlib` library, such as the inability to use `end` as the base for seeking
---and the inability to seek backwards when writing.
---
---* Corresponding C source code: [lgzip.c#L310-L324](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lgzip.c#L310-L324)
---
function GFile:seek(whence, offset) end

---
---Write the value of each of its arguments to the filehandle file.
---
---The
---arguments must be strings or numbers. To write other values, use tostring
---or string.format before write
---
---__Example:__
---
---```lua
---local g_file = gzip.open('test.gz', 'wb9')
---assert(g_file)
---for i = 1, 10 do
---  g_file:write('This is line ' .. i, '\n')
--end
---g_file:close()
---```
---
---* Corresponding C source code: [lgzip.c#L305-L307](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luazlib/lgzip.c#L305-L307)
function GFile:write(value1, ...) end

---
---Close the file.
---
---__Example:__
---
---```lua
---local g_file = gzip.open('test.gz', 'wb9')
---assert(g_file)
---for i = 1, 10 do
---  g_file:write('This is line ' .. i, '\n')
---end
---g_file:close()
---```
function GFile:close() end
