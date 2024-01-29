_N._4_3_lua_modules = "page 67"

---
---https://github.com/TeX-Live/luatex/blob/trunk/source/texk/web2c/luatexdir/luasocket/src/socket.lua
---Changes to upstream: global socket table
---
---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/luasocket

---
---https://lunarmodules.github.io/luasocket/socket.html
---
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
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
---@class Socket
socket = {}

---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
socket.headers = {}

---
---The `socket.headers.canonic` table
---is used by the HTTP and SMTP modules to translate from
---lowercase field names back into their canonic
---capitalization. When a lowercase field name exists as a key
---in this table, the associated value is substituted in
---whenever the field name is sent out.
---```
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
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
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
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
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
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
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
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
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function socket.connect6(address, port, locaddr, locport, family) end

---
---This constant is set to `true` if the library was compiled
---with debug support.
---
---@type boolean
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
socket._DEBUG = true

---
---Default datagram size used by calls to
---`receive`and
---`receivefrom`.
---(Unless changed in compile time, the value is 8192.)
---
---@type integer
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
socket._DATAGRAMSIZE = 8192

---
---Return the UNIX time in seconds.
---
---You should subtract the values returned by this function
---to get meaningful values.
---
---__Example:__
---
---```lua
---t = socket.gettime()
----- do stuff
---print(socket.gettime() - t .. " seconds elapsed")
---```
---
---__Reference:__
---
---* Corresponding C source code: [timeout.c#L190-L194](https://github.com/lunarmodules/luasocket/blob/8c2ff7217e2a205eb107a6f48b04ff1b2b3090a1/src/timeout.c#L190-L194)
---
---@return number time # for example `1683526723.1653`
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
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
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
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
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function socket.protect(func) end

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
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function socket.select(recvt, sendt, timeout) end

---
---The maximum number of sockets that the select function can handle.
---
---@type integer
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
socket._SETSIZE = 0

---
---Creates an
---LTN12
---sink from a stream socket object.
---
---`Mode` defines the behavior of the sink. The following
---options are available:
---
---* `"http-chunked"`: sends data through socket after applying the
---chunked transfer coding, closing the socket when done;
---* `"close-when-done"`: sends all received data through the
---socket, closing the socket when done;
---* `"keep-open"`: sends all received data through the
---socket, leaving it open when done.
---
---`Socket` is the stream socket object used to send the data.
---
---The function returns a sink with the appropriate behavior.
---
---@param mode 'http-chunked'|'close-when-done'|'keep-open'
---@param socket any
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function socket.sink(mode, socket) end

---
---Drops a number of arguments and returns the remaining.
---
---`D` is the number of arguments to drop. `Ret1` to
---`retN` are the arguments.
---
---The function returns `retd+1` to `retN`.
---
---Note: This function is useful to avoid creation of dummy variables:
---
---```
----- get the status code and separator from SMTP server reply
---local code, sep = socket.skip(2, string.find(line, "^(%d%d%d)(.?)"))
---```
---
---@param d integer
---@param ... any
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function socket.skip(d, ...) end

---
---Freeze the program execution during a given amount of time.
---
---__Reference:__
---
---* Corresponding C source code: [timeout.c#L196-L226](https://github.com/lunarmodules/luasocket/blob/8c2ff7217e2a205eb107a6f48b04ff1b2b3090a1/src/timeout.c#L196-L226)
---
---@param time integer # `time` is the number of seconds to sleep for. If `time` is negative, the function returns immediately.
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function socket.sleep(time) end

---
---Creates an
---LTN12
---source from a stream socket object.
---
---`Mode` defines the behavior of the source. The following
---options are available:
---
---* `"http-chunked"`: receives data from socket and removes the
---chunked transfer codingbefore returning the data;
---* `"by-length"`: receives a fixed number of bytes from the
---socket. This mode requires the extra argument `length`;
---* `"until-closed"`: receives data from a socket until the other
---side closes the connection.
---
---`Socket` is the stream socket object used to receive the data.
---
---The function returns a source with the appropriate behavior.
---
---@param mode 'http-chunked'|'by-length'|'until-closed'
---@param socket any
---@param timeout integer
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function socket.source(mode, socket, timeout) end

---
---The OS value for an invalid socket. This can be used with
---`tcp:getfd`and `tcp:setfd`methods.
---@type any
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
socket._SOCKETINVALID = nil

---
---Throws an exception in case `ret1` is falsy, using
---`ret2` as the error message. The exception is supposed to be caught
---by a `protect`ed function only.
---
---`Ret1` to `retN` can be arbitrary
---arguments, but are usually the return values of a function call
---nested with `try`.
---
---The function returns `ret`1 to `ret`N if
---`ret`1 is not `nil` or `false`.
---Otherwise, it calls `error` passing `ret`2 wrapped
---in a table with metatable used by `protect`to
---distinguish exceptions from runtime errors.
---
---```lua
----- connects or throws an exception with the appropriate error message
---c = socket.try(socket.connect("localhost", 80))
---```
---
---@param ... any
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function socket.try(...) end

---
---This constant has a string describing the current LuaSocket version.
---@type string
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/socket.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
socket._VERSION = ""

---Creates and returns an TCP master object. A master object can be transformed into a server object with the method listen (after a call to bind) or into a client object with the method connect. The only other method supported by a master object is the close method.
---In case of success, a new master object is returned. In case of error, nil is returned, followed by an error message.
---Note: The choice between IPv4 and IPv6 happens during a call to bind or connect, depending on the address family obtained from the resolver.
---Note: Before the choice between IPv4 and IPv6 happens, the internal socket object is invalid and therefore setoption will fail.
---
---@return TCPSocket
function socket.tcp() end

---Creates and returns an IPv4 TCP master object. A master object can be transformed into a server object with the method listen (after a call to bind) or into a client object with the method connect. The only other method supported by a master object is the close method.
---In case of success, a new master object is returned. In case of error, nil is returned, followed by an error message.
---
---@return TCPSocket
function socket.tcp4() end

---Creates and returns an IPv6 TCP master object. A master object can be transformed into a server object with the method listen (after a call to bind) or into a client object with the method connect. The only other method supported by a master object is the close method.
---In case of success, a new master object is returned. In case of error, nil is returned, followed by an error message.
---Note: The TCP object returned will have the option "ipv6-v6only" set to true.
---
---@return TCPSocket
function socket.tcp6() end

--- @class TCPSocket
local tcp_socket = {}

---Attempts to connect a master object to a remote host, transforming it into a client object.
---Client objects support methods send, receive, getsockname, getpeername, settimeout, and close.
---
---Note: The function socket.connect is available and is a shortcut for the creation of client sockets.
---Note: Starting with LuaSocket 2.0, the settimeout method affects the behavior of connect, causing it to return with an error in case of a timeout. If that happens, you can still call socket.select with the socket in the sendt table. The socket will be writable when the connection is established.
---Note: Starting with LuaSocket 3.0, the host name resolution depends on whether the socket was created by socket.tcp, socket.tcp4 or socket.tcp6. Addresses from the appropriate family (or both) are tried in the order returned by the resolver until the first success or until the last failure. If the timeout was set to zero, only the first address is tried.
---
---@param address string # IP address or a host name
---@param port integer # TCP port, in the range [1..64K)
---@return nil | 1, nil | string # In case of error, the method returns nil followed by a string describing the error. In case of success, the method returns 1.
function tcp_socket:connect(address, port) end

---@alias PatternMode
---| '*a' # Reads from the socket until the connection is closed. No end-of-line translation is performed
---| '*l' # Reads a line of text from the socket. The line is terminated by a LF character (ASCII 10), optionally preceded by a CR character (ASCII 13). The CR and LF characters are not included in the returned line. In fact, all CR characters are ignored by the pattern. This is the default pattern;
---| number # Causes the method to read a specified number of bytes from the socket.

---Reads data from a client object, according to the specified read pattern.
---Patterns follow the Lua file I/O format,
---and the difference in performance between all patterns is negligible.
---
---@param pattern? PatternMode # read everything, one line or a specific number of bytes. Default to reading one line.
---@param prefix? string # prefix is an optional string to be concatenated to the beginning of any received data before return.
---@return nil | string, nil | string, nil | string # if successful, the method returns the received pattern. In case of error, the method returns nil followed by an error message, followed by a (possibly empty) string containing the partial that was received. The error message can be the string 'closed' in case the connection was closed before the transmission was completed or the string 'timeout' in case there was a timeout during the operation.
function tcp_socket:receive(pattern, prefix) end

---Sends data through client object.
---
---Note: Output is not buffered. For small strings, it is always better to concatenate them in Lua (with the '..' operator) and send the result in one call instead of calling the method several times.
---
---@param data string # data to be send on the client socket
---@param i? integer # behave like the standard string:sub(i) function
---@param j? integer # behave like the standard string:sub(i, j) function
---@return nil | number, nil | string # If successful, the method returns the index of the last byte within [i, j] that has been sent. Notice that, if i is 1 or absent, this is effectively the total number of bytes sent. In case of error, the method returns nil, followed by an error message, followed by the index of the last byte within [i, j] that has been sent. You might want to try again from the byte following that. The error message can be 'closed' in case the connection was closed before the transmission was completed or the string 'timeout' in case there was a timeout during the operation.
function tcp_socket:send(data, i, j) end

---Closes a TCP object.
---The internal socket used by the object is closed and the local address to which the object was bound is made available to other applications.
---No further operations (except for further calls to the close method) are allowed on a closed socket.
---
---Note: It is important to close all used sockets once they are not needed, since, in many systems,
---each socket uses a file descriptor, which are limited system resources.
---Garbage-collected objects are automatically closed before destruction, though.
function tcp_socket:close() end

return socket
