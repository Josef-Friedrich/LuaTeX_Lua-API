---https://github.com/TeX-Live/luatex/blob/trunk/source/texk/web2c/luatexdir/luasocket/src/mbox.lua
---Changes to upstream: global mbox table

---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/luasocket

---
---https://github.com/lunarmodules/luasocket/blob/master/src/mbox.lua
mbox = {}

---
---@param message_s string
---
---@return string headers
---@return string body
function mbox.split_message(message_s) end

---
---@param headers_s string
---
---@return string[] headers
function mbox.split_headers(headers_s) end

---
---@param header_s string
---
---@return string name
---@return string value
function mbox.parse_header(header_s) end

---
---@param headers_s string
---
---@return table<string, string> headers
function mbox.parse_headers(headers_s) end

---
---@param from string
---
---@return string name
---@return string address
function mbox.parse_from(from) end

---
---@param mbox_s string
---
---@return string[] mbox
function mbox.split_mbox(mbox_s) end

---
---@class Message
---@field headers table<string, string>
---@field body string

---
---@param mbox_s string
---
---@return Message[] mbox
function mbox.parse(mbox_s) end

---
---@param message_s string
---
---@return Message message
function mbox.parse_message(message_s) end

return mbox
