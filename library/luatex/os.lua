_N._4_2_6_extra_os_library_functions = "page 64"

---
---@meta
---
---# Extra `os` library functions
---
---The `os` library has a few extra functions and variables: `os.selfdir`, `os.exec`, `os.spawn`, `os.setenv`,
---`os.env`, `os.gettimeofday`, `os.times`, `os.tmpdir`, `os.type`, `os.name` and `os.uname`,
---that we will discuss here.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
os = {}

---
---A variable that holds the directory path of the
---actual executable.
---
---For example: `\directlua {tex.sprint(os.selfdir)`}.
---
---__Reference:__
---
---* Corresponding C source code: [luainit.c#L169-L186](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luainit.c#L169-L186)
---
---For example `/usr/local/texlive/bin/x86_64-linux`
---@string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
os.selfdir = ""

---
---A variation on `os.execute`.
---
---Here
---`commandline` can be either a single string or a single table.
---
---* If the argument is a table *LuaTeX* first checks if there is a value at
---  integer index zero. If there is, this is the command to be executed.
---  Otherwise, it will use the value at integer index one. If neither are
---  present, nothing at all happens.
---
---* The set of consecutive values starting at integer 1 in the table are the
---  arguments that are passed on to the command (the value at index 1 becomes
---  `arg[0]`). The command is searched for in the execution path, so
---  there is normally no need to pass on a fully qualified path name.
---
---* If the argument is a string, then it is automatically converted into a
---  table by splitting on whitespace. In this case, it is impossible for the
---  command and first argument to differ from each other.
---
---* In the string argument format, whitespace can be protected by putting
---  (part of) an argument inside single or double quotes. One layer of quotes
---  is interpreted by *LuaTeX*, and all occurrences of `\"`, `\'`
---  or `\\` within the quoted text are unescaped. In the table format,
---  there is no string handling taking place.
---
---This function normally does not return control back to the *Lua* script: the
---command will replace the current process. However, it will return the two
---values `nil` and `error` if there was a problem while
---attempting to execute the command.
---
---On *MS Windows*, the current process is actually kept in memory until after the
---execution of the command has finished. This prevents crashes in situations
---where *TeXLua* scripts are run inside integrated *TeX* environments.
---
---The original reason for this command is that it cleans out the current
---process before starting the new one, making it especially useful for use in
---*TeX*LUA.
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L429-L501](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L429-L501)
---
---@see os.execute
---
---@param commandline string|table
---
---@return integer|nil exit_status
---@return string|nil error
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.exec(commandline) end

---
---A returning version of `os.exec`,
---with otherwise identical calling conventions.
---
---If the command ran ok, then the return value is the exit status of the
---command. Otherwise, it will return the two values `nil` and `error`.
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L510-L596](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L510-L596)
---
---@see os.execute
---
---@param commandline string|table
---
---@return integer|nil exit_status
---@return string|nil error
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.spawn(commandline) end

---
---Set a variable in the environment.
---
---Passing
---`nil` instead of a value string will remove the variable.
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L600-L627](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L600-L627)
---
---@param key string
---@param value string|nil
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.setenv(key, value) end

---
---A hash table containing a dump of the variables and
---values in the process environment at the start of the run.
---
---It is writeable,
---but the actual environment is `not` updated automatically.
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L630-L661](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L630-L661)
---
---```lua
---{
---  HOME = "/home/user",
---  HOSTNAME = "myhost",
---  INFOPATH = "/usr/local/texlive/texmf-dist/doc/info",
---  LANG = "en_US.UTF-8",
---  LANGUAGE = "en_US:en",
---  OS = "Linux",
---  PAPERSIZE = "a4",
---  PATH = "/bin:/sbin",
---  TERM = "xterm-256color",
---  USER = "user",
---  USERNAME = "user",
---  ...
---}
---```
---@type table<string, string>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
os.env = {}

---
---Suspend execution for second intervals.
---
---__Example:__
---
---```lua
---local start_time = os.gettimeofday()
---os.sleep(1)
---local end_time = os.gettimeofday()
---assert(end_time - start_time > 1)
---
---os.sleep(1) -- Sleep 1 second
---os.sleep(1, 10) -- Sleep 1 decisecond
---os.sleep(1, 100) -- Sleep 1 centisecond
---os.sleep(1, 1000) -- Sleep 1 millisecond<
---```
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L663-L673](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L663-L673)
---* Corresponding Lualibs source code: [lualibs-os.lua#L580-L587](https://github.com/latex3/lualibs/blob/26fe094de645fdee79f65d9fc93040a53cb97272/lualibs-os.lua#L580-L587)
---
---@param interval number # By default seconds.
---@param unit? number # Sleep `interval / unit` seconds.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/lualibs/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.sleep(interval, unit) end

---
---Return the current “UNIX time”, but as a
---float.
---
---This function is not available on the *SunOS* platforms, so do not use
---this function for portable documents.
---
---__Example:__
---
---```lua
---local time = os.gettimeofday()
---assert(time > 1682153121.3217, time)
---```
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L905-L927](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L905-L927)
---
---@return number # for example `1673390071.0893`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.gettimeofday() end

---
---@class Times
---@field cstime number # system time of children
---@field cutime number # user time of children
---@field stime number # system time
---@field utime number # user time

---
---Return the current process times according to the
---UNIX C library function “times”.
---
---This function is not available on
---the MS Windows and *SunOS* platforms, so do not use this function for
---portable documents.
---
---```lua
---{
---  cstime = 0.0,
---  cutime = 0.0,
---  stime = 0.01,
---  utime = 0.12
---}
---```
---
---__Example:__
---
---```lua
---local times = os.times()
---assert(type(times.cstime) == 'number')
---assert(type(times.cutime) == 'number')
---assert(type(times.stime) == 'number')
---assert(type(times.utime) == 'number')
---```
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L872-L894](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L872-L894)
---
---@return Times
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.times() end

---
---Create a directory in the “current directory”
---with the name `luatex.XXXXXX` where the `X`-es are replaced by a
---unique string.
---
---The function also returns this string, so you can `lfs.chdir()` into it, or `nil` if it failed to create the directory.
---The user is responsible for cleaning up at the end of the run, it does not
---happen automatically.
---
---__Example:__
---
---```lua
---lfs.chdir('/tmp')
---local dir = os.tmpdir()
---assert(type(dir) == 'string')
---assert(lfs.isdir('/tmp/' .. dir))
---
---dir = os.tmpdir('tmp.XXXXXX')
---assert(type(dir) == 'string')
---assert(lfs.isdir('/tmp/' .. dir))
---
---dir = os.tmpdir('tmp.X')
---assert(dir == nil)
---```
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-lua.tex#L531-L538](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-lua.tex#L531-L538)
---* Corresponding C source code: [loslibext.c#L971-L997](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L971-L997)
---
---@param path_template? string # for example `luatex.XXXXXX`
---
---@return string|nil
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.tmpdir(path_template) end

---
---A string that gives a global indication of the class of
---operating system.
---
---The possible values are currently `windows`, `unix`, and `msdos` (you are unlikely to find this value “in the
---wild”).
---
---__Example:__
---
---```lua
---assert(os.type == 'unix')
---```
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L40-L91](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L40-L91)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
os.type = ""

---
---A string that gives a more precise indication of the
---operating system.
---
---These possible values are not yet fixed, and for `os.type` values `windows` and `msdos`, the `os.name`
---values are simply `windows` and `msdos`
---
---The list for the type `unix` is more precise: `linux`, `freebsd`, `kfreebsd`, `cygwin`, `openbsd`, `solaris`, `sunos` (pre-solaris), `hpux`, `irix`, `macosx`, `gnu` (hurd), `bsd` (unknown, but BSD-like), `sysv` (unknown, but SYSV-like), `generic` (unknown).
---
---__Example:__
---
---```lua
---assert(os.name == 'linux')
---```
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L40-L91](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L40-L91)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
os.name = ""

---
---@class Uname
---@field sysname string # for example `x86_64`
---@field machine string # for example `zotac`
---@field release string # for example `5.15.0-57-generic`
---@field version string # for example `#63-Ubuntu SMP Thu Nov 24 13:43:17 UTC 2022`
---@field nodename string # for example `mypc`

---
---Return a table with specific operating system
---information acquired at runtime.
---
---The keys in the returned table are all
---string values, and their names are: `sysname`, `machine`, `release`, `version`, and `nodename`.
---
---__Example:__
---
---```lua
---local uname = os.uname()
---assert(type(uname.machine) == 'string')
---assert(type(uname.nodename) == 'string')
---assert(type(uname.release) == 'string')
---assert(type(uname.sysname) == 'string')
---assert(type(uname.version) == 'string')
---```
---
---__Reference:__
---
---* Corresponding C source code: [loslibext.c#L849-L868](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/loslibext.c#L849-L868)
---
---```lua
---{
---  machine = "x86_64",
---  nodename = "mypc",
---  release = "5.15.0-57-generic",
---  sysname = "Linux",
---  version = "#63-Ubuntu SMP Thu Nov 24 13:43:17 UTC 2022"
---}
---```
---
---@return Uname
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/os.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function os.uname() end
