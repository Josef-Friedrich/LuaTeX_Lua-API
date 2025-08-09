-- A helper table to better navigate through the documentation using the
-- outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

_N._4_3_lua_modules = "page 67"

---
---https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/trunk/source/texk/web2c/luatexdir/luasocket/src/mbox.lua
---Changes to upstream: global mbox table

---
---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/luasocket

---
---https://github.com/lunarmodules/luasocket/blob/master/src/mbox.lua
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
mbox = {}

---
---@param message_s string
---
---@return string headers
---@return string body
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function mbox.split_message(message_s) end

---
---@param headers_s string
---
---@return string[] headers
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function mbox.split_headers(headers_s) end

---
---@param header_s string
---
---@return string name
---@return string value
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function mbox.parse_header(header_s) end

---
---@param headers_s string
---
---@return table<string, string> headers
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function mbox.parse_headers(headers_s) end

---
---@param from string
---
---@return string name
---@return string address
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function mbox.parse_from(from) end

---
---@param mbox_s string
---
---@return string[] mbox
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function mbox.split_mbox(mbox_s) end

---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
---@class Message
---@field headers table<string, string>
---@field body string

---
---@param mbox_s string
---
---@return Message[] mbox
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function mbox.parse(mbox_s) end

---
---@param message_s string
---
---@return Message message
---
---😱 [Types](https://github.com/LuaCATS/luasocket/blob/main/library/mbox.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/luasocket/pulls)
function mbox.parse_message(message_s) end
