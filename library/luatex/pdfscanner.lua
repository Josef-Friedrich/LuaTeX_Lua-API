---@meta

pdfscanner = {}

---
---* Corresponding C source code: [lpdfscannerlib.c#L680-L828](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfscannerlib.c#L680-L828)
---
---
---@param pdf string|PdfeStream|PdfeArray
---@param operatortable Operatorable
---@param info table
function pdfscanner.scan(pdf, operatortable, info) end

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

---@alias Operatorable table<string, fun(scanner: Scanner, info: table)>
