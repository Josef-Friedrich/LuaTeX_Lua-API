#! luatex --luaonly
local assert = require("utils").assert

-- http://www.inf.puc-rio.br/~roberto/lpeg/
lpeg.locale(lpeg)
local space = lpeg.space ^ 0
local name = lpeg.C(lpeg.alpha ^ 1) * space
local sep = lpeg.S(",;") * space
local pair = lpeg.Cg(name * "=" * space * name) * sep ^ -1
local list = lpeg.Cf(lpeg.Ct("") * pair ^ 0, rawset)
local t = list:match("a=b, c = hi; next = pi")
assert.equals(t.a, "b")
assert.equals(t.c, "hi")
assert.equals(t.next, "pi")

local locale = lpeg.locale()
assert.equals(type(locale.digit), "userdata")
