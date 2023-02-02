---@meta
---`luasocket`, by Diego Nehab http://w3.impa.br/diego/software/luasocket/. The `.lua` support
---modules from `luasocket` are also preloaded inside the executable,
---there are no external file dependencies.
---https://github.com/lunarmodules/luasocket
---https://lunarmodules.github.io/luasocket/socket.html
---https://github.com/TeX-Live/luatex/blob/trunk/source/texk/web2c/luatexdir/luasocket/src/socket.lua
---The socket namespace
---
---The `socket` namespace contains the core functionality of LuaSocket.
---
---To obtain the `socket` namespace, run:
---
---```lua
----- loads the socket module
---local socket = require("socket")
---```
---@class Socket
socket = {}

socket.headers = {}

---
---The `socket.headers.canonic` table
---is used by the HTTP and SMTP modules to translate from
---lowercase field names back into their canonic
---capitalization. When a lowercase field name exists as a key
---in this table, the associated value is substituted in
---whenever the field name is sent out.
---```
socket.headers.canonic = {}

---
---This function is a shortcut that creates and returns a TCP server object
---bound to a local `address` and `port`, ready to
---accept client connections. Optionally,
---user can also specify the `backlog` argument to the
---`listen` method (defaults to 32).
---
---Note: The server object returned will have the option `reuseaddr`
---set to `true`.
---
---@param address string
---@param port integer
---@param backlog? any
function socket.bind(address, port, backlog) end

---
---This function is a shortcut that creates and returns a TCP client object
---connected to a remote `address` at a given `port`. Optionally,
---the user can also specify the local address and port to bind
---(`locaddr` and `locport`), or restrict the socket family
---to "`inet`" or "`inet6`".
---
---Without specifying `family` to `connect`, whether a tcp or tcp6
---connection is created depends on your system configuration. Two variations
---of connect are defined as simple helper functions that restrict the
---`family`, `socket.connect4` and `socket.connect6`.
---
---@param address string
---@param port integer
---@param locaddr? string
---@param locport? integer
---@param family? 'inet'|'inet6'
function socket.connect(address, port, locaddr, locport, family) end

---
---This function is a shortcut that creates and returns a TCP client object
---connected to a remote `address` at a given `port`. Optionally,
---the user can also specify the local address and port to bind
---(`locaddr` and `locport`), or restrict the socket family
---to "`inet`" or "`inet6`".
---
---Without specifying `family` to `connect`, whether a tcp or tcp6
---connection is created depends on your system configuration. Two variations
---of connect are defined as simple helper functions that restrict the
---`family`, `socket.connect4` and `socket.connect6`.
---
---@param address string
---@param port integer
---@param locaddr? string
---@param locport? integer
---@param family? 'inet'|'inet6'
function socket.connect4(address, port, locaddr, locport, family) end

---
---This function is a shortcut that creates and returns a TCP client object
---connected to a remote `address` at a given `port`. Optionally,
---the user can also specify the local address and port to bind
---(`locaddr` and `locport`), or restrict the socket family
---to "`inet`" or "`inet6`".
---
---Without specifying `family` to `connect`, whether a tcp or tcp6
---connection is created depends on your system configuration. Two variations
---of connect are defined as simple helper functions that restrict the
---`family`, `socket.connect4` and `socket.connect6`.
---
---@param address string
---@param port integer
---@param locaddr? string
---@param locport? integer
---@param family? 'inet'|'inet6'
function socket.connect6(address, port, locaddr, locport, family) end

---
---This constant is set to `true` if the library was compiled
---with debug support.
---
---@type boolean
socket._DEBUG = true

---
---Default datagram size used by calls to
---`receive`and
---`receivefrom`.
---(Unless changed in compile time, the value is 8192.)
---
---@type integer
socket._DATAGRAMSIZE = 8192

---
---Returns the UNIX time in seconds. You should subtract the values returned by this function
---to get meaningful values.
---
---```lua
---t = socket.gettime()
----- do stuff
---print(socket.gettime() - t .. " seconds elapsed")
---```
function socket.gettime() end

---
---Creates and returns a clean
---`try`
---function that allows for cleanup before the exception
---is  raised.
---
---Note: This idea saved a lotof work with the
---implementation of protocols in LuaSocket:
---
---```lua
---foo = socket.protect(function()
---    -- connect somewhere
---    local c = socket.try(socket.connect("somewhere", 42))
---    -- create a try function that closes 'c' on error
---    local try = socket.newtry(function() c:close() end)
---    -- do everything reassured c will be closed
---    try(c:send("hello there?\r\n"))
---    local answer = try(c:receive())
---    ...
---    try(c:send("good bye\r\n"))
---    c:close()
---end)
---```
---
---@param finalizer function # -`Finalizer` is a function that will be called before `try` throws the exception.
---
---@return function # The function returns your customized `try` function.
function socket.newtry(finalizer) end

---
---Converts a function that throws exceptions into a safe function. This
---function only catches exceptions thrown by the `try`
---and `newtry`functions. It does not catch normal
---Lua errors.
---
---@param func function # `func` is a function that calls `try` (or `assert`, or `error`) to throw exceptions.
---
---@return function # Returns an equivalent function that instead of throwing exceptions in case of a failed `try`call, returns `nil` followed by an error message.
function socket.protect(func) end

---

---
---Waits for a number of sockets to change status.
---
--- `Recvt` and `sendt` can also
---be empty tables or `nil`. Non-socket values (or values with
---non-numeric indices) in the arrays will be silently ignored.
---
---The function returns a list with the sockets ready for
---reading, a list with the sockets ready for writing and an error message.
---The error message is "`timeout`" if a timeout
---condition was met, "`select failed`" if the call
---to `select` failed, and
---`nil` otherwise. The returned tables are
---doubly keyed both by integers and also by the sockets
---themselves, to simplify the test if a specific socket has
---changed status.
---
---Note:`select` can monitor a limited number
---of sockets, as defined by the constant
---`socket._SETSIZE`. This
---number may be as high as 1024 or as low as 64 by default,
---depending on the system. It is usually possible to change this
---at compile time. Invoking `select` with a larger
---number of sockets will raise an error.
---
---Important note: a known bug in WinSock causes `select` to fail
---on non-blocking TCP sockets. The function may return a socket as
---writable even though the socket is notready for sending.
---
---Another important note: calling select with a server socket in the receive parameter before a call to accept does notguarantee
---`accept`will return immediately.
---Use the `settimeout`
---method or `accept` might block forever.
---
---Yet another note: If you close a socket and pass
---it to `select`, it will be ignored.
---
---Using select with non-socket objects: Any object that implements `getfd` and `dirty` can be used with `select`, allowing objects from other libraries to be used within a `socket.select` driven loop.
---
---@param recvt table|nil # `recvt` is an array with the sockets to test for characters available for reading.
---@param sendt table|nil # Sockets in the `sendt` array are watched to see if it is OK to immediately write on them.
---@param timeout? integer # `timeout` is the
---maximum amount of time (in seconds) to wait for a change in status.  A
---`nil`, negative or omitted `timeout` value allows the
---function to block indefinitely.
function socket.select(recvt, sendt, timeout) end

---
------------------------------------------------------------------------
---Undocumented functions listed in alphabetical order
---
---Document them by sliding them up and place them in the order of the
---official documentation
------------------------------------------------------------------------

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.try() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.__unload() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.choose() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.sink() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.skip() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.sleep() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.source() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.tcp() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.tcp4() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.tcp6() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.udp() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.udp4() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function socket.udp6() end

return socket
