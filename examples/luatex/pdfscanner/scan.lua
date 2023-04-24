#! luatex --luaonly

---@type Operatorable
local operatortable = {}
local inspect = require('inspect')

local function p(value) print(inspect(value)) end
operatortable.Do = function(scanner, info)
    p(info)

    local resources = info.resources
    if resources then
        local val = scanner:pop()
        p(scanner:pop())
        local name = val[2]
        local xobject = resources.XObject
        print(info.space .. "Uses XObject " .. name)
        local resources = xobject.Resources
        if resources then
            local newinfo = {space = info.space .. "  ", resources = resources}
            pdfscanner.scan(val, operatortable, newinfo)
        end
    end
end

local function analyze(filename)
    local doc = pdfe.open(filename)
    p(doc.Catalog.Type)
    if doc then
        local pages = doc.Pages
        for i = 1, #pages do
            local page = pages[i]
            p(page.isCropped)
            local info = {space = "  ", resources = page.Resources}
            --print("Page " .. i)
            pdfscanner.scan(page.Contents, operatortable, info)
        end
    end
end

analyze("/usr/local/texlive/texmf-dist/doc/luatex/base/luatex.pdf")
