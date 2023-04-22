#! luatex --luaonly

local encrypted = md5.crypt('message', '123', 'seed')
local message = md5.decrypt(encrypted, '123')
assert(message == 'message')
