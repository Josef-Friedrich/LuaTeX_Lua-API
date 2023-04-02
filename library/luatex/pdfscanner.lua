---@meta

---
---The `pdfscanner` library allows interpretation of *PDF* content streams and
---`/ToUnicode` (cmap) streams. You can get those streams from the `pdfe` library.
pdfscanner = {}

---
---The first argument should be a *Lua* string or a stream or array onject coming
---from the `pdfe` library. The second argument, `operatortable`, should
---be a *Lua* table where the keys are *PDF* operator name strings and the values
---are *Lua* functions (defined by you) that are used to process those operators.
---The functions are called whenever the scanner finds one of these *PDF* operators
---in the content stream(s). The functions are called with two arguments: the `scanner` object itself, and the `info` table that was passed are the third
---argument to `pdfscanner.scan`.
---
---Internally, `pdfscanner.scan` loops over the *PDF* operators in the
---stream(s), collecting operands on an internal stack until it finds a *PDF*
---operator. If that *PDF* operator's name exists in `operatortable`, then the
---associated function is executed. After the function has run (or when there is no
---function to execute) the internal operand stack is cleared in preparation for the
---next operator, and processing continues.
---
---The `scanner` argument to the processing functions is needed because it
---offers various methods to get the actual operands from the internal operand
---stack.
---
---```lua
---local operatortable = { }
---
---operatortable.Do = function(scanner,info)
---    local resources = info.resources
---    if resources then
---        local val     = scanner:pop()
---        local name    = val[2]
---        local xobject = resources.XObject
---        print(info.space .. "Uses XObject " .. name)
---        local resources = xobject.Resources
---        if resources then local newinfo =  { space     = info.space .. "  ", resources = resources, } pdfscanner.scan(entry, operatortable, newinfo)
---        end
---    end
---end
---
---local function Analyze(filename)
---    local doc = pdfe.open(filename)
---    if doc then
---        local pages = doc.Pages
---        for i=1,#pages do local page = pages[i] local info = { space     = "  " , resources = page.Resources, } print("Page " .. i)
---         -- pdfscanner.scan(page.Contents,operatortable,info) pdfscanner.scan(page.Contents(),operatortable,info)
---        end
---    end
---end
---
---Analyze("foo.pdf")
---```
---* Corresponding C source code: [lpdfscannerlib.c#L680-L828](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfscannerlib.c#L680-L828)
---
---@param pdf string|PdfeStream|PdfeArray
---@param operatortable Operatorable
---@param info table
function pdfscanner.scan(pdf, operatortable, info) end

---
---@class Scanner
local Scanner = {}

function Scanner:pop () end
---return only the value of a real or integer
function Scanner:popnumber () end
---return only the value of a name
function Scanner:popname () end
---return only the value of a string
function Scanner:popstring () end
---return only the value of a array
function Scanner:poparray () end
---return only the value of a dict
function Scanner:popdictionary () end
---return only the value of a boolean
function Scanner:popboolean () end
---abort further processing of this scan() call
function Scanner:done () end

---
---@alias Operatorable table<string, fun(scanner: Scanner, info: table)>
