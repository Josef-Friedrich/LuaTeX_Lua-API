---@meta

---https://github.com/latex3/lualibs/blob/main/lualibs-io.lua
io = {}

function io.ask(question, default, options) end
function io.bytes(f, n) end
function io.characters(f, n) end
function io.copydata(source, target, action) end
function io.exists(filename) end
function io.lines(name, how) end
function io.loadchunk(filename, n) end
function io.loaddata(filename, textmode) end
function io.loadlines(filename, n) end
function io.noflines(f) end
function io.open(name, how) end
function io.readall(f) end
function io.readnumber(f, n, m) end
function io.readstring(f, n, m) end
function io.savedata(filename, data, joiner, append) end
function io.size(filename) end
