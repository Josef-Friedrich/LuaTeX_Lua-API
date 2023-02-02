---@meta

---
---https://github.com/latex3/lualibs/blob/main/lualibs-os.lua

os = {}

function os.setenv(k, v) end
function os.getenv(k) end

function os.converttime(t, default) end
function os.date(fmt) end
function os.exit(c) end
function os.fulltime(t, default) end
function os.gettimeofday() end
function os.isleapyear(year) end
function os.launch(str) end
function os.localtime(t, default) end
function os.nofdays(year, month, day) end
function os.pipeto(command) end
function os.resultof(command) end
function os.setexitcode(code) end
function os.timezone(difference) end
function os.validdate(year, month, day) end
function os.weekday(day, month, year) end
function os.where(filename) end
function os.which(filename) end
