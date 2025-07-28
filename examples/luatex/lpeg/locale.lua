#! luatex --luaonly

-- http://www.inf.puc-rio.br/~roberto/lpeg/
lpeg.locale(lpeg)
local space = lpeg.space ^ 0
local name = lpeg.C(lpeg.alpha ^ 1) * space
local sep = lpeg.S(",;") * space
local pair = lpeg.Cg(name * "=" * space * name) * sep ^ -1
local list = lpeg.Cf(lpeg.Ct("") * pair ^ 0, rawset)
local t = list:match("a=b, c = hi; next = pi")
assert(t.a == "b")
assert(t.c == "hi")
assert(t.next == "pi")

local locale = lpeg.locale()
assert(type(locale.digit) == "userdata")
