---@meta

---http://www.inf.puc-rio.br/~roberto/lpeg/
---http://stevedonovan.github.io/lua-stdlibs/modules/lpeg.html

lpeg = {}

---@alias Pattern userdata

---@class Capture

---
---@param pattern Pattern
---@param subject string
---@param init? integer
---
---@return integer|Capture
function lpeg.match(pattern, subject, init) end

---
---
---@return nil|string
function lpeg.type(value) end

---@return string
function lpeg.version() end

---
---@param max integer
function lpeg.setmaxstack(max) end

---@param value Pattern|string|integer|boolean|table|function
---
---@return Pattern
function lpeg.P(value) end

---@param pattern Pattern
---
---@return integer|Capture
function lpeg.B(pattern) end

---@param ... string
---
---@return Pattern
function lpeg.R(...) end

---
---@param string string
---
---@return Pattern
function lpeg.S(string) end

---@param v string
---
---@return Pattern
function lpeg.V(v) end

function lpeg.locale() end

---@param patt Pattern
---
---@return string
function lpeg.C(patt) end

---@param n integer
---
---@return string
function lpeg.Carg(n) end
function lpeg.Cb() end
function lpeg.Cc() end
function lpeg.Cf() end

---@param patt Pattern
function lpeg.Cg(patt) end
function lpeg.Cmt() end
function lpeg.Cp() end
function lpeg.Cs() end
function lpeg.Ct() end

function lpeg.UP() end
function lpeg.UR() end
function lpeg.US() end
function lpeg.afterprefix() end
function lpeg.anywhere() end
function lpeg.append() end
function lpeg.balancer() end
function lpeg.beforesuffix() end
function lpeg.checkedsplit() end
function lpeg.containsws() end
function lpeg.counter() end
function lpeg.endstripper() end
function lpeg.finder() end
function lpeg.firstofsplit() end
function lpeg.frontstripper() end
function lpeg.instringchecker() end
function lpeg.is_lpeg() end
function lpeg.keeper() end
function lpeg.oneof() end
function lpeg.pcode() end
function lpeg.print() end
function lpeg.ptree() end
function lpeg.replacer() end
function lpeg.secondofsplit() end
function lpeg.setutfcasers() end
function lpeg.split() end
function lpeg.splitat() end
function lpeg.splitter() end
function lpeg.stripper() end
function lpeg.times() end
function lpeg.tsplitat() end
function lpeg.tsplitter() end
function lpeg.utfchartabletopattern() end
function lpeg.utfreplacer() end
